package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DBconnection.DBConnection;
import Models.Mood;

public class MoodDao {
	 public void saveMood(int userId, String mood) {
	        String query = "INSERT INTO mood_entries (user_id, mood) VALUES (?, ?)";
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(query)) {
	            stmt.setInt(1, userId);
	            stmt.setString(2, mood);
	            stmt.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }

	    public List<Mood> getMoodHistory(int userId) {
	        List<Mood> moodList = new ArrayList<>();
	        String query = "SELECT * FROM mood_entries WHERE user_id=? ORDER BY timestamp DESC";
	        try (Connection conn = DBConnection.getConnection();
	             PreparedStatement stmt = conn.prepareStatement(query)) {
	            stmt.setInt(1, userId);
	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	                moodList.add(new Mood(rs.getInt("id"), userId, rs.getString("mood"), rs.getTimestamp("timestamp")));
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return moodList;
	    }
}
