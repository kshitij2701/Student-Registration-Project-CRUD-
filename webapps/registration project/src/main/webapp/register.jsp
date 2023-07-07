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
	String f_Name = request.getParameter("First_Name");
	String l_Name = request.getParameter("Last_Name");
	String birth_day = request.getParameter("Birthday_day");
	String birth_month = request.getParameter("Birthday_Month");
	String birth_yr = request.getParameter("Birthday_Year");
	String email_id = request.getParameter("Email_Id");
	String mob_no= request.getParameter("Mobile_Number");
	String address= request.getParameter("Address");
	String city= request.getParameter("City");
	String pin_code= request.getParameter("Pin_Code");
	String state= request.getParameter("State");
	String country= request.getParameter("Country");
	String gender= request.getParameter("Gender");
	String x_board= request.getParameter("ClassX_Board");
	String x_per= request.getParameter("ClassX_Percentage");
	String x_yop= request.getParameter("ClassX_YrOfPassing");
	String xii_board= request.getParameter("ClassXII_Board");
	String xii_per= request.getParameter("ClassXII_Percentage");
	String xii_yop= request.getParameter("ClassXII_YrOfPassing");
	String grad_board= request.getParameter("Graduation_Board");
	String grad_per= request.getParameter("Graduation_Percentage");
	String grad_yop= request.getParameter("Graduation_YrOfPassing");
	String hob_1= request.getParameter("Hobby_Drawing");
	String hob_2= request.getParameter("Hobby_Singing");
	String hob_3= request.getParameter("Hobby_Dancing");
	String hob_4= request.getParameter("Hobby_Cooking");
	String course= request.getParameter("Course");


	ResultSet rs = null;
	Connection con = null;
	PreparedStatement ps = null;

	String query = "insert into register values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	try {
		
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/std_data", "root", "qwer123#");
	    ps = con.prepareStatement(query);
	
	    ps.setString(1, f_Name);
	    ps.setString(2, l_Name);
	    ps.setString(3, birth_yr + "-" + birth_month + "-" + birth_day); 
	    ps.setString(4, email_id);
	    ps.setString(5, mob_no);
	    ps.setString(6, address);
	    ps.setString(7, city);
	    ps.setString(8, pin_code);
	    ps.setString(9, state);
	    ps.setString(10, country);
	    ps.setString(11, gender);
	    ps.setString(12, x_board);
	    ps.setString(13, x_per);
	    ps.setString(14, x_yop);
	    ps.setString(15, xii_board);
	    ps.setString(16, xii_per);
	    ps.setString(17, xii_yop);
	    ps.setString(18, grad_board);
	    ps.setString(19, grad_per);
	    ps.setString(20, grad_yop);
	    ps.setString(21, (hob_1 == null ? "" : hob_1) + " " +
	            (hob_2 == null ? "" : hob_2) + " " +
	            (hob_3 == null ? "" : hob_3) + " " +
	            (hob_4 == null ? "" : hob_4));
	    ps.setString(22, course);
	    
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