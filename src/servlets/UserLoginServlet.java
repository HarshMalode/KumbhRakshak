package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;
import DBConnection.GetSet;

@WebServlet("/UserLoginServlet")
public class UserLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        

        try {
            Connection con = DbClass.getConnect();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?"
            );
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

            	GetSet.setEmail(email);
                System.out.println(email);
                HttpSession session = req.getSession(true);
                session.setAttribute("user_id", rs.getInt("id"));   // ✅ FIXED
                session.setAttribute("user_name", rs.getString("name"));
                session.setAttribute("role", "USER");
                session.setAttribute("email", email);

                resp.sendRedirect("welcomeUser.jsp");

            } else {
                resp.sendRedirect("welcomeUser.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("welcomeUser.jsp?error=1");
        }
    }
}
