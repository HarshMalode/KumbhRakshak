package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBConnection.DbClass;

@WebServlet("/FindMissingPersonServlet")
public class FindMissingPersonServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        File temp = File.createTempFile("frame", ".jpg");

        try (InputStream in = req.getInputStream();
             FileOutputStream fos = new FileOutputStream(temp)) {

            byte[] buffer = new byte[4096];
            int bytesRead;
            while ((bytesRead = in.read(buffer)) != -1) {
                fos.write(buffer, 0, bytesRead);
            }
        }

        Process p = Runtime.getRuntime().exec("python recognize.py " + temp.getAbsolutePath());

        BufferedReader br = new BufferedReader(new InputStreamReader(p.getInputStream()));
        String json = br.readLine();

        if (json == null || json.trim().isEmpty()) {
            json = "{\"found\":false}";
        }

        resp.setContentType("application/json");
        resp.getWriter().print(json);
        resp.getWriter().flush();
    }
}


