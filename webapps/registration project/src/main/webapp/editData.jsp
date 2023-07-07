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
	String f_Name = request.getParameter("f_name");
	String l_Name = request.getParameter("l_name");
	String dob = request.getParameter("DOB");
	String email_id = request.getParameter("email_id");
	String mob_no= request.getParameter("mob_no");
	String address= request.getParameter("address");
	String city= request.getParameter("city");
	String pincode= request.getParameter("pincode");
	String state= request.getParameter("state");
	String country= request.getParameter("country");
	String gender= request.getParameter("gender");
	String x_board= request.getParameter("x_board");
	String x_per= request.getParameter("x_per");
	String x_yop= request.getParameter("x_yop");
	String xii_board= request.getParameter("xii_board");
	String xii_per= request.getParameter("xii_per");
	String xii_yop= request.getParameter("xii_yop");
	String grad_board= request.getParameter("b_tech_institute");
	String grad_per= request.getParameter("b_tech_per");
	String grad_yop= request.getParameter("b_tech_yop");
	String hobby= request.getParameter("hobby");
	String course= request.getParameter("course");
	
	Connection con = null;
	PreparedStatement ps = null;
	int rowsAffected = 0;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/std_data", "root", "qwer123#");
		String updateQuery = "UPDATE register SET f_name=?, l_name=?, dob=?, mob_no=?, address=?, city=?, pincode=?, state=?, country=?, gender=?, xth_board=?, xth_per=?, xth_yop=?, xiith_board=?, xiith_per=?, xiith_yop=?, b_tech_institute=?, b_tech_per=?, b_tech_yop=?, hobbies=?, course=? WHERE Email_Id=?";

		ps = con.prepareStatement(updateQuery);

		ps.setString(1, f_Name);
	    ps.setString(2, l_Name);
	    ps.setString(3, dob); 
	    ps.setString(4, mob_no);
	    ps.setString(5, address);
	    ps.setString(6, city);
	    ps.setString(7, pincode);
	    ps.setString(8, state);
	    ps.setString(9, country);
	    ps.setString(10, gender);
	    ps.setString(11, x_board);
	    ps.setString(12, x_per);
	    ps.setString(13, x_yop);
	    ps.setString(14, xii_board);
	    ps.setString(15, xii_per);
	    ps.setString(16, xii_yop);
	    ps.setString(17, grad_board);
	    ps.setString(18, grad_per);
	    ps.setString(19, grad_yop);
	    ps.setString(20, hobby);
	    ps.setString(21, course);
	    ps.setString(22, email_id);
	    
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