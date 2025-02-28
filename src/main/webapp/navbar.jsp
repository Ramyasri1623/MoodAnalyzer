<%@ page import="Models.User" %>
<%
    User user = (User) session.getAttribute("user");
%>
<nav>
    <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="mood_check.jsp">Check Mood</a></li>
        
        <% if (user != null) { %>
            <li><a href="mood_result.jsp">Mood History</a></li>
            <li><a href="logout.jsp">Logout</a></li>  <!-- Logout option appears only when logged in -->
        <% } else { %>
            <li><a href="login.jsp">Login</a></li>
        <% } %>
    </ul>
</nav>
