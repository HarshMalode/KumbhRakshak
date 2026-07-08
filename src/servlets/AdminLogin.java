package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminLogin
 */
@WebServlet("/AdminLogin")
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		PrintWriter pw=response.getWriter();
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
		if(email.equals("admin@gmail.com") && pass.equals("admin"))
		{
			response.setContentType("text/html");
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Login Successful');");
			pw.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("welcomeAdmin.jsp");
			rd.include(request, response);
		}
		else
		{

			response.setContentType("text/html");
			pw.println("<script type=\"text/javascript\">");
			pw.println("alert('Wrong email or password');");
			pw.println("</script>");
			RequestDispatcher rd=request.getRequestDispatcher("Adminlogin.jsp");
			rd.include(request, response);
			
	    }
	}

}
