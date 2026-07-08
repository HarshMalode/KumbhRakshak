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
 * Servlet implementation class CrowdReadServlet
 */
@WebServlet("/CrowdReadServlet")
public class CrowdReadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String location = req.getParameter("location");
        int count = 0;
        String density = "--";

        try {
            Connection con = DbClass.getConnect();
            java.sql.PreparedStatement ps = con.prepareStatement(
                "SELECT people_count,density FROM crowd_status WHERE location=?"
            );
            ps.setString(1, location);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
                density = rs.getString(2);
            }
        } catch(Exception e){}

        resp.setContentType("application/json");
        resp.getWriter().write("{\"count\":\""+count+"\",\"density\":\""+density+"\"}");
    }
}
