<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
	<html>
	   <head>
	   <meta charset="UTF-8">
	   <title>STUDENT REGISTRATION FORM</title>
	   </head>
	   
	<body>

<%@ page import="java.sql.*"%>

  <%
	String name = request.getParameter("Name");
	String email_id = request.getParameter("Email");
	String roll_no= request.getParameter("RollNo");
	String physics= request.getParameter("Physics");
	String chemistry= request.getParameter("Chemistry");
	String maths= request.getParameter("Maths");
	


	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;

	String query = "insert into student values (?, ?, ?, ?, ?, ?)";
	
	try {
		
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/std_data", "root", "qwer123#");
	    ps = con.prepareStatement(query);
	
	    ps.setString(1, name); 
	    ps.setString(2, email_id);
	    ps.setString(3, roll_no);
	    ps.setString(4, physics);
	    ps.setString(5, chemistry);
	    ps.setString(6, maths);
	   
	    
	    int i = ps.executeUpdate();
	    if(i>0){
	        out.print("<div style='text-align:center;'><h1 style='color:green;'>Data Successfully Uploaded</h1>");
	        out.print("<div style='text-align:center; margin-top:20px;'>");
	        out.print("<a href='display.jsp' style='display:inline-block; background-color:blue; color:white; padding:10px 20px; text-decoration:none; border-radius:5px;'>View uploaded data</a>");
	        out.print("</div>");

	        

	    }else{
	        out.print("<div style='text-align:center;'><h1 style='color:red;'>Data Not Uploaded</h1></div>");
	    }

	}catch(Exception e){
		out.print(e);
	}
	
 %>
	
</body>
</html>