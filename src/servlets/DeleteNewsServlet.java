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

/**
 * Servlet implementation class DeleteNewsServlet
 */
@WebServlet("/DeleteNewsServlet")
public class DeleteNewsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            Connection con = DbClass.getConnect();
            PreparedStatement ps = con.prepareStatement("DELETE FROM city_news WHERE id=?");
            ps.setInt(1, Integer.parseInt(req.getParameter("id")));
            ps.executeUpdate();
        } catch(Exception e){e.printStackTrace();}
        resp.sendRedirect("viewNewsAdmin.jsp");
    }
}
