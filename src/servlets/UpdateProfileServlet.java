package servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DBConnection.DbClass;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            resp.sendRedirect("userLogin.jsp");
            return;
        }

        int userId = (Integer) session.getAttribute("user_id");

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");

        try {
            Connection con = DbClass.getConnect();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE users SET name=?, email=?, phone=?, city=? WHERE id=?"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, city);
            ps.setInt(5, userId);
            ps.executeUpdate();

            resp.sendRedirect("myProfile.jsp?updated=true");  // âœ… success

        } catch(Exception e) {
            e.printStackTrace();
            resp.sendRedirect("myProfile.jsp?error=true");    // â�Œ error
        }
    }
}

