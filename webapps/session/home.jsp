<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>
<body>
<center>
    <%
        // Check if the session exists and the attribute is set
        HttpSession sessionObj = request.getSession(false);
        if (sessionObj != null && sessionObj.getAttribute("username") != null) {
            String username = (String) sessionObj.getAttribute("username");
            out.println("<h1>Welcome " + username + "!</h1>");
        } else {
            // If the session is not valid, redirect to the login page
            response.sendRedirect("login.jsp");
        }
    %>
    <form action="LogoutServlet">
        <button type="submit" style="background-color: #f44336; color: white; padding: 12px 24px; border: none; border-radius: 4px; cursor: pointer;">Logout</button>
    </form>
</center>

</body>
</html>
