<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Data</title>
</head>
<body>
    <%
    
        String emailId = request.getParameter("d");
    
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement ps = null;
		
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/std_data", "root", "qwer123#");
        String sql = "DELETE FROM register WHERE email_id = ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, emailId);
        int rowsAffected = stmt.executeUpdate();
        
        if (rowsAffected > 0){
        	out.print("<div style='text-align:center;'><h1 style='color:green;'>Data Successfully Deleted</h1>");
	        out.print("<div style='text-align:center; margin-top:20px;'>");
	        out.print("<a href='display.jsp' style='display:inline-block; background-color:blue; color:white; padding:10px 20px; text-decoration:none; border-radius:5px;'>View DataBase</a>");
	        out.print("</div>");
        	} else {
            out.print("<h1>Error: Record Not Found.</h1>");
        }
        
        stmt.close();
        con.close();
    %>
</body>
</html>
