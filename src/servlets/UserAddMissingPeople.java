package servlets;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import DBConnection.DbClass;
import DBConnection.GetSet;
import servlets.Getvalues;

@WebServlet("/UserAddMissingPeople")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 10,
    fileSizeThreshold = 1024 * 1024 * 2,
    maxRequestSize = 1024 * 1024 * 50
)
public class UserAddMissingPeople extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = 0;
        String img = " ";
        String doc = " ";
        String email = GetSet.getEmail();
        System.out.println("email" +email);
        String fna = request.getParameter("fname");
        String lna = request.getParameter("lname");
        String dadna = request.getParameter("faname");
        String momna = request.getParameter("Momname");
        String relative = request.getParameter("relname");
        String Age = request.getParameter("age");
        String Gender = request.getParameter("gender");
        String eyecol = request.getParameter("eyecol");
        String haircol = request.getParameter("hcol");
        String height = request.getParameter("ht");
        String weight = request.getParameter("wt");
        String bloodgr = request.getParameter("bgrp");
        String birthmark = request.getParameter("birthmrk");
        String phone = request.getParameter("phno");
        String address = request.getParameter("add");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String national = request.getParameter("nation");
        String occupation = request.getParameter("occup");
        String lastseen = request.getParameter("lastloc");
        String missdate = request.getParameter("dom");

        Part photoPart = request.getPart("photo");
        Part docPart = request.getPart("docu");

        try {
            Connection conn = DbClass.getConnect();

            PreparedStatement check = conn.prepareStatement(
                "SELECT id FROM missingpeople WHERE First_Name=? AND Last_Name=?");
            check.setString(1, fna);
            check.setString(2, lna);
            ResultSet r = check.executeQuery();

            if (r.next()) {
                request.getSession().setAttribute("msg", "Duplicate Person Name, Record Already Exist..!!");
                response.sendRedirect("userAddMissingPerson.jsp");
                return;
            }

            PreparedStatement ps = conn.prepareStatement(
            	    "INSERT INTO missingpeople (" +
            	    "added_by_email, First_Name, Last_Name, Father_Full_Name, Mother_Full_Name, Relative_Full_Name, " +
            	    "Age, Gender, Eye_Colour, Hair_Colour, Height_IN_CM, Weight_IN_KG, Blood_Group, " +
            	    "Birth_Mark, Phone_Number, Address, City, State, Nationality, Occupation, " +
            	    "Last_Seen_Location, Date_Of_Missing, Image_Filename, file_name" +
            	    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
            	    Statement.RETURN_GENERATED_KEYS
            	);


            ps.setString(1, email); // â­� IMPORTANT
            ps.setString(2, fna);
            ps.setString(3, lna);
            ps.setString(4, dadna);
            ps.setString(5, momna);
            ps.setString(6, relative);
            ps.setObject(7, parseIntOrNull(Age), Types.INTEGER);
            ps.setString(8, Gender);
            ps.setString(9, eyecol);
            ps.setString(10, haircol);
            ps.setObject(11, parseIntOrNull(height), Types.INTEGER);
            ps.setObject(12, parseIntOrNull(weight), Types.INTEGER);
            ps.setString(13, bloodgr);
            ps.setString(14, birthmark);
            ps.setString(15, phone);
            ps.setString(16, address);
            ps.setString(17, city);
            ps.setString(18, state);
            ps.setString(19, national);
            ps.setString(20, occupation);
            ps.setString(21, lastseen);
            ps.setString(22, missdate);
            ps.setString(23, img);
            ps.setString(24, doc); // file_name

            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            if (keys.next()) {
                id = keys.getInt(1);
            }

            Getvalues.setId(id);
            Getvalues.setName(fna + " " + lna);

            /* ===== Upload Image ===== */
            if (photoPart != null && photoPart.getSize() > 0) {
                String photoName = id + "_" + getFileName(photoPart);
                String folder = "C:/Users/hp/workspace/KumbhRakshak/WebContent/missingpeopleimg/" + Getvalues.getName();
                new File(folder).mkdirs();
                photoPart.write(folder + "/" + photoName);

                PreparedStatement ups = conn.prepareStatement(
                    "UPDATE missingpeople SET Image_Filename=? WHERE id=?");
                ups.setString(1, photoName);
                ups.setInt(2, id);
                ups.executeUpdate();
            }


            /* ===== Upload Document ===== */
            if (docPart != null && docPart.getSize() > 0) {
                String docName = id + "_" + getFileName(docPart);
                String path = "C:/Users/hp/workspace/KumbhRakshak/WebContent/missingpeopledocs/" + docName;
                docPart.write(path);

                PreparedStatement ups = conn.prepareStatement(
                    "UPDATE missingpeople SET file_name=? WHERE id=?");
                ups.setString(1, docName);
                ups.setInt(2, id);
                ups.executeUpdate();
            }


            request.getSession().setAttribute("msg", "Record Inserted Successfully..!!");
            response.sendRedirect("userAddMissingPerson.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("msg", "Something went wrong..!!");
            response.sendRedirect("userAddMissingPerson.jsp");
        }
    }

    private String getFileName(Part part) {
        for (String cd : part.getHeader("content-disposition").split(";")) {
            if (cd.trim().startsWith("filename")) {
                return cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
    
    private Integer parseIntOrNull(String value) {
        if (value == null || value.trim().isEmpty()) {
            return null;
        }
        return Integer.parseInt(value);
    }
}
