package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;

@WebServlet("/DeleteLocation")
public class DeleteLocation extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection conn = DbClass.getConnect();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM locations WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("viewLocations.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
