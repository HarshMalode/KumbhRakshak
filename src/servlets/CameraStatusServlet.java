package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import DBConnection.DbClass;

/**
 * Servlet implementation class CameraStatusServlet
 */
@WebServlet("/CameraStatusServlet")
public class CameraStatusServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String location = req.getParameter("location");
        boolean active = false;

        try {
            Connection con = DbClass.getConnect();
            java.sql.PreparedStatement ps = con.prepareStatement(
                "SELECT is_active FROM camera_status WHERE location=?"
            );
            ps.setString(1, location);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) active = rs.getBoolean(1);
        } catch(Exception e){}

        resp.setContentType("application/json");
        resp.getWriter().write("{\"active\":"+active+"}");
    }
}


