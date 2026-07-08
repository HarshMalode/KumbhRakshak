package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ImageDisplayServlet
 */
@WebServlet("/ImageDisplay")
public class ImageDisplayServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String folder = req.getParameter("folder");
        String file = req.getParameter("file");

        String path = "C:/PoliceUploads/missingpeopleimg/" + folder + "/" + file;

        File image = new File(path);
        if (!image.exists()) {
            resp.getWriter().println("Image not found!");
            return;
        }

        resp.setContentType("image/jpeg");
        FileInputStream fis = new FileInputStream(image);
        OutputStream os = resp.getOutputStream();

        byte[] buffer = new byte[4096];
        int bytesRead;
        while ((bytesRead = fis.read(buffer)) != -1) {
            os.write(buffer, 0, bytesRead);
        }

        fis.close();
        os.close();
    }
}


