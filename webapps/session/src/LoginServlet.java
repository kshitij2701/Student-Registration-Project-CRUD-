import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.annotation.WebServlet;



@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the username and password from the request
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Check if the credentials are valid
        if (username.equals("admin") && password.equals("password")) {

            // Create a session and set an attribute
            HttpSession session = request.getSession();
            session.setAttribute("username", username);

            // Create a cookie for the username
            Cookie cookie = new Cookie("username", username);
            cookie.setMaxAge(60 * 60 * 24); // set the cookie to last for 1 day
            response.addCookie(cookie);

            // Redirect to the home page
            response.sendRedirect("home.jsp");
        } else {
            // If the credentials are invalid, show an error message
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Invalid username or password');</script>");
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.include(request, response);
        }
    }
}
