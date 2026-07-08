package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;

@WebServlet("/AddLocation")
@MultipartConfig
public class AddLocation extends HttpServlet {

    private String getFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String cd : header.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1)
                        .trim().replace("\"", "");
            }
        }
        return null;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String name = request.getParameter("name");
            String desc = request.getParameter("description");
            String lat = request.getParameter("latitude");
            String lng = request.getParameter("longitude");

            Part filePart = request.getPart("image_file");

            String originalName = getFileName(filePart);
            String fileName = System.currentTimeMillis() + "_" + originalName;

            // ✅ FIXED ABSOLUTE PATH
            String uploadPath =
                "C:/Users/hp/workspace/KumbhRakshak/WebContent/locations";

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // save file
            filePart.write(uploadPath + File.separator + fileName);

            // ✅ STORE RELATIVE PATH IN DB
            String imagePath = "locations/" + fileName;

            Connection conn = DbClass.getConnect();

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO locations VALUES (?,?,?,?,?,?)",
                Statement.RETURN_GENERATED_KEYS
            );

            ps.setInt(1, 0); // auto increment
            ps.setString(2, name);
            ps.setString(3, desc);
            ps.setString(4, imagePath);
            ps.setString(5, lat);
            ps.setString(6, lng);

            ps.executeUpdate();

            // ✅ NOW this will work
            ResultSet rs = ps.getGeneratedKeys();
            int locationId = 0;

            if (rs.next()) {
                locationId = rs.getInt(1);
            }

            // insert notification
            PreparedStatement notifyPs = conn.prepareStatement(
                "INSERT INTO notifications(type, reference_id) VALUES (?,?)"
            );
            notifyPs.setString(1, "NEW_LOCATION");
            notifyPs.setInt(2, locationId);
            notifyPs.executeUpdate();



            response.sendRedirect("viewLocations.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}



