<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mood Tracker</title>
    <link rel="stylesheet" href="styles.css">
    <style>
       body {
    display: flex;
    justify-content: center;  /* Centers content horizontally */
    align-items: center;      /* Centers content vertically */
    min-height: 100vh;        /* Full viewport height */
    margin: 0;
    background: #f4f4f4;      /* Light background */
}

.container {
    background: white;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
    width: 90%;
    max-width: 500px;
    text-align: center;       /* Ensures everything inside is centered */
}

h2 {
    color: #333;
    margin-bottom: 20px;
    padding-top: 10px;
}

.question {
    margin-bottom: 15px;
    text-align: center;  /* Center the questions */
    padding: 10px;
}

.question p {
    font-weight: bold;
    margin-bottom: 8px;
    white-space: normal;
}

label {
    display: block;
    padding: 8px;
    cursor: pointer;
    border-radius: 5px;
    transition: background 0.3s;
}

button {
    background: #007BFF;
    color: white;
    border: none;
    padding: 10px 15px;
    font-size: 16px;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;
}

button:hover {
    background: #0056b3;
}
       
    </style>
</head>
<body>

    <div class="container">
        <h2>Mood Assessment</h2>
        <form action="MoodServlet" method="post">
            
            <div class="question">
                <p>1. How do you feel today?</p>
                <label><input type="radio" name="q1" value="1" required> Very Sad 😢</label>
                <label><input type="radio" name="q1" value="2"> Sad 😞</label>
                <label><input type="radio" name="q1" value="3"> Neutral 😐</label>
                <label><input type="radio" name="q1" value="4"> Happy 😊</label>
                <label><input type="radio" name="q1" value="5"> Very Happy 😃</label>
            </div>

            <div class="question">
                <p>2. Did you get enough sleep last night?</p>
                <label><input type="radio" name="q2" value="1" required> Not at all 😴</label>
                <label><input type="radio" name="q2" value="2"> A little 🥱</label>
                <label><input type="radio" name="q2" value="3"> Average 😐</label>
                <label><input type="radio" name="q2" value="4"> Well-rested 🙂</label>
                <label><input type="radio" name="q2" value="5"> Fully energized 😃</label>
            </div>

            <div class="question">
                <p>3. How is your stress level?</p>
                <label><input type="radio" name="q3" value="1" required> Extremely high 😖</label>
                <label><input type="radio" name="q3" value="2"> High 😟</label>
                <label><input type="radio" name="q3" value="3"> Moderate 😐</label>
                <label><input type="radio" name="q3" value="4"> Low 😊</label>
                <label><input type="radio" name="q3" value="5"> No stress at all 😌</label>
            </div>

            <div class="question">
                <p>4. Have you had any social interactions today?</p>
                <label><input type="radio" name="q4" value="1" required> No, I feel lonely 😞</label>
                <label><input type="radio" name="q4" value="2"> A little talk 🗣</label>
                <label><input type="radio" name="q4" value="3"> Some interactions 🙂</label>
                <label><input type="radio" name="q4" value="4"> Good amount of socializing 😃</label>
                <label><input type="radio" name="q4" value="5"> Very social & happy 🎉</label>
            </div>

            <div class="question">
                <p>5. How is your energy level today?</p>
                <label><input type="radio" name="q5" value="1" required> Extremely low 😵‍💫</label>
                <label><input type="radio" name="q5" value="2"> Low 🥱</label>
                <label><input type="radio" name="q5" value="3"> Moderate 🙂</label>
                <label><input type="radio" name="q5" value="4"> High 😊</label>
                <label><input type="radio" name="q5" value="5"> Very high 😃</label>
            </div>

            <button type="submit">Submit Mood</button>
        </form>
    </div>

</body>
</html>
