<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<style>

.button {
  display: inline-block;
  padding: 9px 17px;
  background-color: #f44336;
  color: #fff;
  text-align: center;
  text-decoration: none;
  font-size: 14px;
  border-radius: 4px;
  border: none;
  cursor: pointer;
}

.button:hover {
  background-color: #d32f2f;
}

</style>
<meta charset="UTF-8">
<title>FORM DATABASE</title>
</head>
<body>



<%

ResultSet rs = null;
Connection con = null;
PreparedStatement ps = null;

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/std_data", "root", "qwer123#");
    
    String selectQuery = "SELECT * FROM student";
    ps = con.prepareStatement(selectQuery);
    rs = ps.executeQuery();
    
    out.println("<style>");
    out.println("table {");
    out.println("  border-collapse: collapse;");
    out.println("  width: 100%;");
    out.println("font-family: Arial, Helvetica, sans-serif;");
    out.println("}");
    out.println("th, td {");
    out.println("  text-align: left;");
    out.println("  padding: 10px;");
    out.println("}");
    out.println("th {");
    out.println("  background-color: #0077b6;");
    out.println("  color: #fff;");
    out.println("  text-transform: uppercase;");
    out.println("}");
    out.println("tr:nth-child(even) {");
    out.println("  background-color: #f2f2f2;");
    out.println("}");
    out.println("tr:hover {");
    out.println("  background-color: #e2e2e2;");
    out.println("}");
    out.println("td:first-child, th:first-child {");
    out.println("  border-left: none;");
    out.println("}");
    out.println("td:last-child, th:last-child {");
    out.println("  border-right: none;");
    out.println("}");
    out.println("</style>");
    
    out.println("<h2 align='center'>Registration Details</h2>");

	 if (!rs.isBeforeFirst()) {
	     out.println("<div style='text-align:center;'><h1 style='color:red;'>No Record Found</h1>");
	 } else {
	     out.println("<table>");
	     out.println("<tr><th>Name</th><th>Email-Id</th><th>Roll no</th><th>Physics</th><th>Chemistry</th><th>Maths</th><th>Edit</th><th>Delete</th></tr>");

	     while (rs.next()) {
	    	out.print("<tr>");
	    	out.print("<td>" + rs.getString("name") + "</td>");
	    	out.print("<td>" + rs.getString("email_id") + "</td>");
	    	out.print("<td>" + rs.getString("roll_no") + "</td>");
	    	out.print("<td>" + rs.getString("physics") + "</td>");
	    	out.print("<td>" + rs.getString("chemistry") + "</td>");
	    	out.print("<td>" + rs.getString("maths") + "</td>");
	    	out.print("<td><a href=\"updatePage.jsp?u=" + rs.getString("email_id") + "\" class=\"button\">Update</a></td>");
	    	out.print("<td><a href=\"deleteData.jsp?d=" + rs.getString("email_id") + "\" class=\"button\">Delete</a></td>");
	
	    	
	    	out.print("</tr>");
	    }
	    out.println("</table>");
    
 
	 }
	    
}catch(Exception e){
	out.print(e);
}
%>
</body>
</html>