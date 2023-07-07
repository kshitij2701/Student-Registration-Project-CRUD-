<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Form</title>
</head>
<body>

<%

String name = request.getParameter("name");
String F_name = request.getParameter("fname"); 
String m_name = request.getParameter("mname");
String email = request.getParameter("email");
String mobno = request.getParameter("mno");
String gender = request.getParameter("gender");
String address = request.getParameter("address");
out.print("Name is : "+name+"<br/> Father name is :"+F_name+"</br> Mother name is : "+m_name+"</br> Email is : "+email+"</br> Mobile number is : "+mobno+"</br> Gender is : "+gender+"</br> Address is : "+address+"</br>");

%>

</body>

</html>