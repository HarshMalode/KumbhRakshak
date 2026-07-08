package servlets;

import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DBConnection.DbClass;
import servlets.Getvalues;
/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/FileDownloadServlet")
public class FileDownloadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        try {
            int id = Integer.parseInt(request.getParameter("id"));

            Connection conn = DbClass.getConnect();
            PreparedStatement ps = conn.prepareStatement(
                "SELECT file_name, file_data FROM missingpeople WHERE id = ?"
            );
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                String fileName = rs.getString("file_name");
                byte[] data = rs.getBytes("file_data");

                if (fileName == null || data == null || data.length == 0) {
                    response.getWriter().println("No ID proof uploaded.");
                    return;
                }

                // Auto-detect MIME type
                String mimeType = getServletContext().getMimeType(fileName);
                if (mimeType == null) mimeType = "application/octet-stream";

                response.setContentType(mimeType);
                response.setHeader("Content-Disposition", 
                    "attachment; filename=\"" + fileName + "\"");
                response.setContentLength(data.length);

                OutputStream os = response.getOutputStream();
                os.write(data);
                os.flush();
                os.close();
            } else {
                response.getWriter().println("File not found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error downloading file.");
        }
    }
}
