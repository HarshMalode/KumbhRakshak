package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DBConnection.DbClass;

@WebServlet("/AddPoliceHelpline")
public class AddPoliceHelpline extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter pw = response.getWriter();

        try {
            Connection conn = DbClass.getConnect();

            String checkSql = "SELECT helpline_no FROM police_helpline WHERE helpline_no=?";
            PreparedStatement psCheck = conn.prepareStatement(checkSql);
            psCheck.setString(1, request.getParameter("helpline_no"));
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                pw.println("<script>alert('Helpline number already exists');</script>");
                RequestDispatcher rd = request.getRequestDispatcher("/addPoliceHelpline.jsp");
                rd.include(request, response);
                return;
            }

            String insertSql =
                "INSERT INTO police_helpline (station_name, officer_name, helpline_no, emergency_no, email, password, address, location, state, city, pincode) " +
                "VALUES (?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = conn.prepareStatement(insertSql);

            ps.setString(1, request.getParameter("station_name"));
            ps.setString(2, request.getParameter("officer_name"));
            ps.setString(3, request.getParameter("helpline_no"));
            ps.setString(4, request.getParameter("emergency_no"));
            ps.setString(5, request.getParameter("email"));
            ps.setString(6, request.getParameter("password"));
            ps.setString(7, request.getParameter("address"));
            ps.setString(8, request.getParameter("location"));
            ps.setString(9, request.getParameter("state"));
            ps.setString(10, request.getParameter("city"));
            ps.setString(11, request.getParameter("pincode"));

            int i = ps.executeUpdate();

            if (i > 0) {
                pw.println("<script>alert('Saved Successfully');</script>");
            } else {
                pw.println("<script>alert('Insert Failed');</script>");
            }

            RequestDispatcher rd = request.getRequestDispatcher("/addPoliceHelpline.jsp");
            rd.include(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            pw.println(e);
        }
    }
}

