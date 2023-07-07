package servlet_1;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class RegistrationServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		PreparedStatement ps = null;
		Connection con = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql:localhost:3306/std_data", "root", "qwer123#");
			ps = con.prepareStatement("INSERT INTO users (name, password, email, phone) VALUES (?, ?, ?, ?)");
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);
			ps.setString(4, phone);
			ps.executeUpdate();

			// Display the user's details
			PrintWriter out = response.getWriter();
			out.println("<html><head><title>User Details</title></head><body>");
			out.println("<h1>User Details</h1>");
			out.println("<p>Name: " + name + "</p>");
			out.println("<p>Password: " + password + "</p>");
			out.println("<p>Email: " + email + "</p>");
			out.println("<p>Phone Number: " + phone + "</p>");
			out.println("</body></html>");

			ps.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

