package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import DBConnection.DbClass;

@WebServlet("/UpdateNewsServlet")
@MultipartConfig
public class UpdateNewsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException, ServletException {

        int id = Integer.parseInt(req.getParameter("id"));
        String title = req.getParameter("title");
        String city = req.getParameter("city");
        String desc = req.getParameter("description");
        String date = req.getParameter("publish_date");
        String oldImage = req.getParameter("oldImage");

        Part imgPart = req.getPart("image");
        String imageName = oldImage;

        if (imgPart != null && imgPart.getSize() > 0) {
            String originalName = extractFileName(imgPart);
            imageName = System.currentTimeMillis() + "_" + originalName;

            String uploadPath = "C:/Users/hp/workspace/KumbhRakshak/WebContent/city_news";
            imgPart.write(uploadPath + "/" + imageName);

        }

        try {
            Connection con = DbClass.getConnect();
            PreparedStatement ps = con.prepareStatement(
                "UPDATE city_news SET title=?, description=?, city=?, image=?, publish_date=? WHERE id=?"
            );
            ps.setString(1, title);
            ps.setString(2, desc);
            ps.setString(3, city);
            ps.setString(4, imageName);
            ps.setString(5, date);
            ps.setInt(6, id);
            ps.executeUpdate();
        } catch(Exception e){ e.printStackTrace(); }

        resp.sendRedirect("viewNewsAdmin.jsp");
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        for (String cd : contentDisp.split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
