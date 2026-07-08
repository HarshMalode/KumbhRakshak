package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;

@WebServlet("/UpdateLocation")
@MultipartConfig
public class UpdateLocation extends HttpServlet {

    private String getFileName(Part part) {
        if (part == null) return null;
        String header = part.getHeader("content-disposition");
        for (String cd : header.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String desc = request.getParameter("description");
            String latitude = request.getParameter("latitude");
            String longitude = request.getParameter("longitude");

            String oldImage = request.getParameter("old_image");

            Part filePart = request.getPart("image_file");
            String newFileName = getFileName(filePart);

            String finalImagePath = oldImage; // keep old unless replaced

            /* -----------------------------------------
               FIXED UPLOAD PATH (CORRECT LOCATION)
               -----------------------------------------
            */
            if (newFileName != null && !newFileName.isEmpty()) {

                // Correct WebContent/uploads path
                String uploadPath = request.getServletContext().getRealPath("/uploads");

                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) uploadDir.mkdirs(); // create folders if missing

                String fileName = System.currentTimeMillis() + "_" + newFileName;

                filePart.write(uploadPath + File.separator + fileName);

                // Path stored inside DB (relative path)
                finalImagePath = "uploads/" + fileName;
            }

            // UPDATE DATABASE
            Connection conn = DbClass.getConnect();

            PreparedStatement ps = conn.prepareStatement(
                "UPDATE locations SET name=?, description=?, image_url=?, latitude=?, longitude=? WHERE id=?"
            );

            ps.setString(1, name);
            ps.setString(2, desc);
            ps.setString(3, finalImagePath);
            ps.setString(4, latitude);
            ps.setString(5, longitude);
            ps.setInt(6, id);

            ps.executeUpdate();

            response.sendRedirect("viewLocations.jsp");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
