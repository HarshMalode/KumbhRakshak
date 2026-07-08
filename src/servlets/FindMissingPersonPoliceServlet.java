package servlets;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FindMissingPersonPoliceServlet
 */
@WebServlet("/FindMissingPersonPoliceServlet")
public class FindMissingPersonPoliceServlet extends HttpServlet {
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
