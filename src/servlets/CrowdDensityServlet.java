package servlets;

import java.io.*;
import java.sql.Connection;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.mysql.jdbc.PreparedStatement;

import DBConnection.DbClass;

@WebServlet("/CrowdDensityServlet")
@MultipartConfig
public class CrowdDensityServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String location = request.getParameter("location");

        int peopleCount = (int)(Math.random() * 20 + 5);

        String density;
        if (peopleCount < 5) density = "LOW";
        else if (peopleCount < 15) density = "MEDIUM";
        else density = "HIGH";

        try {
            Connection con = DbClass.getConnect();

            java.sql.PreparedStatement ps = con.prepareStatement(
                "INSERT INTO crowd_status(location, people_count, density) VALUES (?, ?, ?) " +
                "ON DUPLICATE KEY UPDATE people_count=?, density=?, last_updated=NOW()"
            );

            ps.setString(1, location);
            ps.setInt(2, peopleCount);
            ps.setString(3, density);
            ps.setInt(4, peopleCount);
            ps.setString(5, density);

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        response.getWriter().write(
            "{\"count\":\"" + peopleCount + "\",\"density\":\"" + density + "\"}"
        );
    }
}

