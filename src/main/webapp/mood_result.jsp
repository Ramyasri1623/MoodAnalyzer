<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="org.json.JSONArray" %>

<%
    String moodResult = (String) session.getAttribute("moodResult");
    List<String> moodHistory = (List<String>) session.getAttribute("moodHistory");
    List<String> moodDates = (List<String>) session.getAttribute("moodDates");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mood Analysis Result</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f4f4f4;
            margin: 20px;
        }
        .container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        h2 {
            color: #333;
        }
        .mood-result {
            font-size: 22px;
            font-weight: bold;
            color: blue;
        }
        .message {
            font-size: 18px;
            margin-top: 10px;
        }
        .chart-container {
            margin-top: 30px;
            padding: 20px;
            background: white;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
        .logout-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            color: white;
            background-color: #ff4d4d;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
            text-decoration: none;
        }
        .logout-button:hover {
            background-color: #cc0000;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Your Mood Analysis Result:</h2>
    <h3 class="mood-result"><%= moodResult %></h3>

    <% if (moodResult != null) { %>
        <p class="message">
            <% if (moodResult.contains("Very Sad")) { %>
                😢 It's okay to feel down. Try listening to some calming music or talking to a friend.
            <% } else if (moodResult.contains("Sad")) { %>
                😞 You might be feeling low. Maybe a walk outside could help.
            <% } else if (moodResult.contains("Neutral")) { %>
                😐 A balanced mood! Keep going.
            <% } else if (moodResult.contains("Happy")) { %>
                😊 Great! Stay positive and enjoy your day.
            <% } else { %>
                😃 You're in an amazing mood! Spread positivity.
            <% } %>
        </p>
    <% } %>
</div>

<div class="chart-container">
    <h2>Past Mood Trends</h2>
    <canvas id="moodChart"></canvas>
</div>

<script>
    var ctx = document.getElementById('moodChart').getContext('2d');

    var moodLabels = <%= moodDates != null ? new org.json.JSONArray(moodDates).toString() : "[]" %>;
    var moodData = <%= moodHistory != null ? new org.json.JSONArray(moodHistory).toString() : "[]" %>;

    var moodMapping = {
        "Very Sad 😢": 1,
        "Sad 😞": 2,
        "Neutral 😐": 3,
        "Happy 😊": 4,
        "Very Happy 😃": 5
    };

    var numericMoodData = moodData.map(mood => moodMapping[mood] || 3);

    var pointColors = numericMoodData.map(value => {
        if (value === 1) return "rgba(255, 0, 0, 1)";
        if (value === 2) return "rgba(255, 165, 0, 1)";
        if (value === 3) return "rgba(255, 206, 86, 1)";
        if (value === 4) return "rgba(0, 128, 0, 1)";
        return "rgba(0, 0, 255, 1)";
    });

    var gradient = ctx.createLinearGradient(0, 0, 0, 400);
    gradient.addColorStop(0, "rgba(75, 192, 192, 0.3)");
    gradient.addColorStop(1, "rgba(255, 255, 255, 0)");

    new Chart(ctx, {
        type: 'line',
        data: {
            labels: moodLabels,
            datasets: [{
                label: 'Mood Trend',
                data: numericMoodData,
                backgroundColor: gradient,
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 3,
                tension: 0.4,
                pointRadius: 6,
                pointBackgroundColor: pointColors,
                pointBorderColor: "#fff",
                pointBorderWidth: 2
            }]
        },
        options: {
            responsive: true,
            plugins: {
                tooltip: {
                    callbacks: {
                        label: function(tooltipItem) {
                            let moods = ["Very Sad 😢", "Sad 😞", "Neutral 😐", "Happy 😊", "Very Happy 😃"];
                            return moods[tooltipItem.raw - 1];
                        }
                    }
                }
            },
            scales: {
                y: {
                    min: 1,
                    max: 5,
                    ticks: {
                        stepSize: 1,
                        callback: function(value) {
                            return ["Very Sad 😢", "Sad 😞", "Neutral 😐", "Happy 😊", "Very Happy 😃"][value - 1];
                        }
                    }
                },
                x: {
                    ticks: {
                        autoSkip: false,
                        maxRotation: 45,
                        minRotation: 20
                    }
                }
            }
        }
    });
</script>
<a href="logout.jsp" class="logout-button">Logout</a>
</body>
</html>
