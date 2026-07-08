package servlets;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;

@WebServlet("/UpdatePoliceHelpline")
public class UpdatePoliceHelpline extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection conn = DbClass.getConnect();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE police_helpline SET station_name=?, officer_name=?, helpline_no=?, emergency_no=?, email=?, address=?, state=?, city=?, pincode=? WHERE id=?"
            );

            ps.setString(1, request.getParameter("station_name"));
            ps.setString(2, request.getParameter("officer_name"));
            ps.setString(3, request.getParameter("helpline_no"));
            ps.setString(4, request.getParameter("emergency_no"));
            ps.setString(5, request.getParameter("email"));
            ps.setString(6, request.getParameter("address"));
            ps.setString(7, request.getParameter("state"));
            ps.setString(8, request.getParameter("city"));
            ps.setString(9, request.getParameter("pincode"));
            ps.setInt(10, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/viewPoliceHelpline.jsp");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
