package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBConnection.DbClass;

@WebServlet("/DeletePoliceHelpline")
public class DeletePoliceHelpline extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection conn = DbClass.getConnect();
            PreparedStatement ps = conn.prepareStatement("DELETE FROM police_helpline WHERE id=?");
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect(request.getContextPath() + "/viewPoliceHelpline.jsp");


        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
