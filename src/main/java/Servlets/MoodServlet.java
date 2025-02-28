package Servlets;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import DBconnection.DBConnection;
import Models.User;

@WebServlet("/MoodServlet")
public class MoodServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user == null) {
            response.sendRedirect("login.jsp?error=Please log in first");
            return;
        }

        int q1 = Integer.parseInt(request.getParameter("q1"));
        int q2 = Integer.parseInt(request.getParameter("q2"));
        int q3 = Integer.parseInt(request.getParameter("q3"));
        int q4 = Integer.parseInt(request.getParameter("q4"));
        int q5 = Integer.parseInt(request.getParameter("q5"));

        int totalScore = q1 + q2 + q3 + q4 + q5;
        String moodResult = analyzeMood(totalScore);

        try (Connection conn = DBConnection.getConnection()) {
            // Check if there's already a record for today
            PreparedStatement checkStmt = conn.prepareStatement(
                "SELECT id FROM mood_responses WHERE user_id = ? AND DATE(date) = CURDATE()"
            );
            checkStmt.setInt(1, user.getId());
            ResultSet rs = checkStmt.executeQuery();
            
            if (rs.next()) {
                // Update today's mood entry
                PreparedStatement updateStmt = conn.prepareStatement(
                    "UPDATE mood_responses SET mood_result = ?, response = ?, date = NOW() WHERE id = ?"
                );
                updateStmt.setString(1, moodResult);
                updateStmt.setString(2, "Q1: " + q1 + ", Q2: " + q2 + ", Q3: " + q3 + ", Q4: " + q4 + ", Q5: " + q5);
                updateStmt.setInt(3, rs.getInt("id"));
                updateStmt.executeUpdate();
            } else {
                // Insert a new mood entry
                PreparedStatement insertStmt = conn.prepareStatement(
                    "INSERT INTO mood_responses (user_id, response, mood_result, date) VALUES (?, ?, ?, NOW())"
                );
                insertStmt.setInt(1, user.getId());
                insertStmt.setString(2, "Q1: " + q1 + ", Q2: " + q2 + ", Q3: " + q3 + ", Q4: " + q4 + ", Q5: " + q5);
                insertStmt.setString(3, moodResult);
                insertStmt.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error handling mood response: " + e.getMessage());
        }

        // Retrieve past mood trends (one mood entry per day)
        List<String> moodHistory = new ArrayList<>();
        List<String> moodDates = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(
                 "SELECT mood_result, DATE_FORMAT(date, '%Y-%m-%d') AS formatted_date FROM mood_responses " +
                 "WHERE user_id = ? AND date IN (SELECT MAX(date) FROM mood_responses WHERE user_id = ? GROUP BY DATE(date)) " +
                 "ORDER BY date DESC LIMIT 7"
             )) {

            stmt.setInt(1, user.getId());
            stmt.setInt(2, user.getId());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                moodHistory.add(rs.getString("mood_result"));
                moodDates.add(rs.getString("formatted_date"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error retrieving past mood trends: " + e.getMessage());
        }

        // Store results in session
        session.setAttribute("moodResult", moodResult);
        session.setAttribute("moodHistory", moodHistory);
        session.setAttribute("moodDates", moodDates);

        response.sendRedirect("mood_result.jsp");
    }

    private String analyzeMood(int score) {
        if (score <= 7) return "Very Sad 😢";
        else if (score <= 12) return "Sad 😞";
        else if (score <= 17) return "Neutral 😐";
        else if (score <= 22) return "Happy 😊";
        else return "Very Happy 😃";
    }
}
