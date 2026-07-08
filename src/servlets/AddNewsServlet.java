package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;

@WebServlet("/AddNewsServlet")
@MultipartConfig
public class AddNewsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String title = req.getParameter("title");
        String city = req.getParameter("city");
        String desc = req.getParameter("description");
        String date = req.getParameter("publish_date");

        Part imagePart = req.getPart("image");
        String fileName = extractFileName(imagePart);

        String uploadPath = "C:/Users/hp/workspace/KumbhRakshak/WebContent/city_news";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdirs();

        imagePart.write(uploadPath + File.separator + fileName);


        try {
            Connection con = DbClass.getConnect();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO city_news(title,description,city,image,publish_date) VALUES(?,?,?,?,?)"
            );
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setString(3, city);
            ps.setString(4, fileName);
            ps.setString(5, date);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        resp.sendRedirect("viewNewsAdmin.jsp");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1)
                            .trim()
                            .replace("\"", "");
            }
        }
        return "unknown.jpg";
    }
}
