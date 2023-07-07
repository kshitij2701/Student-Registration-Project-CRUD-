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
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/std_data", "root", "qwer123#");
	String selectQuery = "SELECT * FROM register WHERE Email_Id = ?";
	ps = con.prepareStatement(selectQuery);
	ps.setString(1, s_id);
	rs = ps.executeQuery();
	
	if (rs.next()) {
	    %>
	    <div class="form-wrapper">
	    <h3 align='center'>Edit Registration Details</h3> 
	    <form action="editData.jsp" method="post" >
	    
	
	        <label for="f_name">First Name:</label>
	        <input type="text" id="f_name" name="f_name" value="<%= rs.getString("f_name") %>"><br>
	
	        <label for="l_name">Last Name:</label>
	        <input type="text" id="l_name" name="l_name" value="<%= rs.getString("l_name") %>"><br>
	
	        <label for="DOB">DOB:</label>
	        <input type="date" id="DOB" name="DOB" value="<%= rs.getDate("DOB") %>"><br>
	
	        <label for="email_id">Email-Id:</label>
	        <input type="hidden" id="email_id" name="email_id" value="<%= rs.getString("email_id") %>" readonly><br>
	
	        <label for="mob_no">Mob-No:</label>
	        <input type="text" id="mob_no" name="mob_no" value="<%= rs.getString("mob_no") %>"><br>
	
	        <label for="address">Address:</label>
	        <textarea id="address" name="address"><%= rs.getString("address") %></textarea><br>
	
	        <label for="city">City:</label>
	        <input type="text" id="city" name="city" value="<%= rs.getString("city") %>"><br>
	
	        <label for="pincode">Pin Code:</label>
	        <input type="text" id="pincode" name="pincode" value="<%= rs.getString("Pincode") %>"><br>
	
	        <label for="state">State:</label>
	        <input type="text" id="state" name="state" value="<%= rs.getString("state") %>"><br>
	
	        <label for="country">Country:</label>
	        <input type="text" id="country" name="country" value="<%= rs.getString("country") %>"><br>
	
	        <label for="gender">Gender:</label>
	        <input type="radio" id="male" name="gender" value="Male" <%= rs.getString("gender").equals("Male") ? "checked" : "" %>>
	        <label for="male">Male</label>
	        <input type="radio" id="female" name="gender" value="Female" <%= rs.getString("gender").equals("Female") ? "checked" : "" %>>
	        <label for="female">Female</label><br>
	        
	        <label for="x_board">Xth Board:</label>
	        <input type="text" id="x_board" name="x_board" value="<%= rs.getString("xth_board") %>"><br>
	        
	        <label for="x_per">Xth Percentage:</label>
	        <input type="text" id="x_per" name="x_per" value="<%= rs.getString("xth_per") %>"><br>
	        
	        <label for="x_yop">Xth Year Of Pass:</label>
	        <input type="text" id="x_yop" name="x_yop" value="<%= rs.getString("xth_yop") %>"><br>
	        
	        <label for="xii_board">XIIth Board:</label>
	        <input type="text" id="xii_board" name="xii_board" value="<%= rs.getString("xiith_board") %>"><br>
	        
	        <label for="xii_per">XIIth Percentage:</label>
	        <input type="text" id="xii_per" name="xii_per" value="<%= rs.getString("xiith_per") %>"><br>
	        
	        <label for="xii_yop">XIIth Year Of Pass:</label>
	        <input type="text" id="xii_yop" name="xii_yop" value="<%= rs.getString("xiith_yop") %>"><br>
	        
	        <label for="b_tech_institute">B_Tech_Institute:</label>
	        <input type="text" id="b_tech_institute" name="b_tech_institute" value="<%= rs.getString("b_tech_institute") %>"><br>
	        
	        <label for="b_tech_per">B.Tech Percentage :</label>
	        <input type="text" id="b_tech_per" name="b_tech_per" value="<%= rs.getString("b_tech_per") %>"><br>
	        
	        <label for="b_tech_yop">B.Tech Year Of Pass:</label>
	        <input type="text" id="b_tech_yop" name="b_tech_yop" value="<%= rs.getString("b_tech_yop") %>"><br>
	        
	        <label for="hobby">Hobbies:</label>
	        <input type="text" id="hobby" name="hobby" value="<%= rs.getString("hobbies") %>"><br>
	        
	        <label for="course">Course:</label>
	        <input type="text" id="course" name="course" value="<%= rs.getString("course") %>"><br>
				
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