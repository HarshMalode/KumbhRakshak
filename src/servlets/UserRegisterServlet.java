package servlets;

import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DBConnection.DbClass;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");
        String password = req.getParameter("password");

        try {
            Connection con = DbClass.getConnect();

            // Check duplicate email or phone
            PreparedStatement check = con.prepareStatement(
                "SELECT id FROM users WHERE email=? OR phone=?"
            );
            check.setString(1, email);
            check.setString(2, phone);

            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                resp.sendRedirect("userRegister.jsp?error=duplicate");
                return;
            }

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users(name,email,phone,city,password) VALUES(?,?,?,?,?)"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, phone);
            ps.setString(4, city);
            ps.setString(5, password);

            ps.executeUpdate();
            resp.sendRedirect("userLogin.jsp?registered=success");

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("userRegister.jsp?error=server");
        }
    }
}
