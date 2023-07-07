<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>


<style>
	body {
	  font-family: Arial, sans-serif;
	  background-color: #f0f0f0;
	}
	
	h3 {
	  text-align: center;
	}
	
	label {
	  display: inline-block;
	  margin-top: 10px;
	  width: 100px;
	}
	
	input[type=text], input[type=date], input[type=email], textarea {
	  width: 100%;
	  padding: 4px;
	  border: 1px solid #ccc;
	  border-radius: 4px;
	  box-sizing: border-box;
	}
	
	input[type=radio] {
	  margin-right: 5px;
	}
	
	input[type=submit] {
	  background-color: #4CAF50;
	  color: white;
	  padding: 12px 20px;
	  border: none;
	  border-radius: 4px;
	  cursor: pointer;
	  float: right;
	}
	
	input[type=submit]:hover {
	  background-color: #45a049;
	}
	
	.update-button {
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  margin-top: 20px;
	}
	
	form {
	  width: 60%;
	  margin: 0 auto;
	  background-color: white;
	  padding: 20px;
	  border-radius: 5px;
	  box-shadow: 0px 0px 5px #aaa;
	}
</style>

<meta charset="UTF-8">
<title>FORM DATABASE</title>
</head>
<body>

<%

    String s_id = request.getParameter("u");

	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "root", "qwer123#");
	String selectQuery = "SELECT * FROM user905 WHERE email = ?";
	ps = con.prepareStatement(selectQuery);
	ps.setString(1, s_id);
	rs = ps.executeQuery();
	
	if (rs.next()) {
	    %>
	    <div class="form-wrapper">
	    <h3 align='center'>Edit Details</h3> 
	    <form action="editData.jsp" method="post" >
	    
	
	        <label for="name">Name:</label>
	        <input type="text" id="name" name="name" value="<%= rs.getString("name") %>"><br>

            <label for="password">Password:</label>
	        <input type="text" id="password" name="password" value="<%= rs.getString("password") %>"><br>
	
	
	        <label for="email">Email:</label>
	        <input type="hidden" id="email" name="email" value="<%= rs.getString("email") %>" readonly><br>
	
	        <label for="country">Country:</label>
	        <input type="text" id="country" name="country" value="<%= rs.getString("country") %>"><br>
	
	        
			<div class="update-button">
	            <input type="submit" value="Update">
	        </div>
			
			
	   </form>       
	   </div>
<% 
    }else{
        out.print("<div style='text-align:center;'><h1 style='color:red;'>Data Not Found</h1></div>");
}

rs.close();
ps.close();
con.close();

%>

</body>
</html>