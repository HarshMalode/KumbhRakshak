package servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 

import DBConnection.DbClass;
import DBConnection.GetSet;

@WebServlet("/BranchLogin")
public class BranchLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BranchLogin() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // no change
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        try {
            Connection conn = DbClass.getConnect();
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery(
                "select * from police_helpline where email='" + email + "' and password='" + pass + "'"
            );

            if (rs.next()) {

                int policeId = rs.getInt("id");
                String policeName = rs.getString("station_name");
                GetSet.setEmail(email);
                System.out.println(email);

                HttpSession session = request.getSession(true);
                session.setAttribute("police_id", policeId);
                session.setAttribute("police_name", policeName);
                session.setAttribute("role", "POLICE");
                session.setAttribute("email", email);

                System.out.println("Police logged in with ID = " + policeId);

                response.sendRedirect("welcomeBranch.jsp");
                return;

            } else {
                response.sendRedirect("Branchlogin.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
