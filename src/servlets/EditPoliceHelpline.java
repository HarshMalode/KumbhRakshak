package servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;

@WebServlet("/EditPoliceHelpline")
public class EditPoliceHelpline extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection conn = DbClass.getConnect();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM police_helpline WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            request.setAttribute("data", rs);
            RequestDispatcher rd = request.getRequestDispatcher("editPoliceHelpline.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
