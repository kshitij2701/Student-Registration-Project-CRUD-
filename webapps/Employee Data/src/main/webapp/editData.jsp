<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update DATA</title>
</head>
<body>
<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String email = request.getParameter("email");
	String country= request.getParameter("country");
	
	
	Connection con = null;
	PreparedStatement ps = null;
	int rowsAffected = 0;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "qwer123#");
		String updateQuery = "UPDATE user905 SET name=?, password=?, country=? WHERE email=?";

		ps = con.prepareStatement(updateQuery);

		ps.setString(1, name);
	    ps.setString(2, password); 
	    ps.setString(3, country);
		ps.setString(4, email);
	    
	    int i = ps.executeUpdate();
	    if(i>0){
	        out.print("<div style='text-align:center;'><h1 style='color:green;'>Data Successfully Updated</h1>");
	        out.print("<div style='text-align:center; margin-top:20px;'>");
	        out.print("<a href='display.jsp' style='display:inline-block; background-color:blue; color:white; padding:10px 20px; text-decoration:none; border-radius:5px;'>View updated data</a>");
	        out.print("</div>");
	    }else{
        out.print("<div style='text-align:center;'><h1 style='color:red;'>Data Not Updated</h1></div>");
        
	    }
	    }catch(Exception e){
	    	out.print(e);
	    }

%>
    
</body>
</html>