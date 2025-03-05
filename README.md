# **MoodAnalyzer**

## **About**  
**MoodAnalyzer** is a **JDBC + Servlet + JSP + MySQL** based project that allows users to analyze their mood based on a set of questions. After submission, users receive their **mood result**, and previous day trends are displayed as a graph for better insight into mood patterns over time.

## **Features**  
✅ **User Login:** Users can log in to access mood tracking.  
✅ **Mood Assessment:** Answer a set of predefined questions.  
✅ **Mood Result Display:** Generates a mood analysis based on responses.  
✅ **Trend Analysis:** Graphical representation of previous mood trends.  
✅ **Database Integration:** Stores user responses and mood history.  

## **Tech Stack**  
- **Frontend:** JSP, HTML, CSS, JavaScript  
- **Backend:** Java Servlets, JDBC  
- **Database:** MySQL  
- **Charting Library:** (e.g., Chart.js or Google Charts for graphs)  
- **Server:** Apache Tomcat  

## **Installation & Setup**  
### **Step 1: Clone the Repository**  
```bash
 git clone <repository-url>
```

### **Step 2: Import into IDE**  
- Open **Eclipse/IntelliJ** and import the project.

### **Step 3: Set Up Database**  
1. Open MySQL and create a database:
   ```sql
   CREATE DATABASE mood_analyzer;
   ```
2. Import the provided **SQL file** (if available) or manually create tables.

### **Step 4: Configure Database Connection**  
- Update `dbconfig.properties` or servlet database connection settings with MySQL credentials.

### **Step 5: Run the Application**  
- Deploy the project on **Tomcat Server** and access it via:
  ```
  http://localhost:8080/MoodAnalyzer
  ```

## **Screenshots**  
![image alt](https://github.com/Ramyasri1623/MoodAnalyzer/blob/6f566fc0d384d84af44406de2e8abd68d73bd150/homepage.png)


![image alt](https://github.com/Ramyasri1623/MoodAnalyzer/blob/6f566fc0d384d84af44406de2e8abd68d73bd150/loginpage.png)


![image alt](https://github.com/Ramyasri1623/MoodAnalyzer/blob/6f566fc0d384d84af44406de2e8abd68d73bd150/registerpage.png)


![image alt](https://github.com/Ramyasri1623/MoodAnalyzer/blob/6f566fc0d384d84af44406de2e8abd68d73bd150/questionspage.png
)



![image alt](https://github.com/Ramyasri1623/MoodAnalyzer/blob/6f566fc0d384d84af44406de2e8abd68d73bd150/analysispage.png
)

<br><br>
![image alt](https://github.com/Ramyasri1623/MoodAnalyzer/blob/6f566fc0d384d84af44406de2e8abd68d73bd150/page2.png)

## **Contributing**  
Contributions are welcome! If you'd like to enhance the project, feel free to fork and submit a pull request.  



