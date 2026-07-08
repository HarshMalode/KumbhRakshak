package servlets;
import java.io.*;
import java.io.FileOutputStream;
//import java.util.List;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
//import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
//import javax.servlet.http.*;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
import DBConnection.DbClass;
import servlets.Getvalues;
/**
 * Servlet implementation class Uploadimg
 */
@WebServlet("/Uploadimg")
@MultipartConfig(maxFileSize = 1024*1024*10,//10MB
fileSizeThreshold=1024*1024*2,	//2MB
maxRequestSize=1024*1024*50) //50MB

public class Uploadimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Uploadimg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int id2=Getvalues.getId();
		Part file=request.getPart("photo");
		String filename=getSubmittedFileName(file);
		System.out.println(filename);
		//Getvalue.setImgfilename(filename);
		String foldername=Getvalues.getName();
		System.out.println(foldername);
		String dpath="C:/Users/hp/workspace/KumbhRakshak/WebContent/missingpeopleimg/";
		String fpath=dpath+foldername;
		System.out.println(fpath);
		
		 File f1 = new File(fpath);  
		 boolean bool = f1.mkdir();  
	      if(bool){  
	         System.out.println("Folder is created successfully");  
	      }else{  
	         System.out.println("Error Found!");  
	      }  
		
		String path=fpath+"/"+filename;
		try{
			FileOutputStream fos=new FileOutputStream(path);
			InputStream is =file.getInputStream();
			byte[] data=new byte[is.available()];
			is.read(data);
			fos.write(data);
			fos.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		try{
			Connection conn=DbClass.getConnect();
			
			PreparedStatement ps1=conn.prepareStatement("update missingpeople set Image_Filename='"+filename+"' where id='"+id2+"'");
			//ps1.setString(1,filename);
			int n = ps1.executeUpdate();
			if(n>0)
			{
				request.getSession().setAttribute("msg", "Documents Inserted Successfully..!!");
				response.sendRedirect("uploadpic.jsp"); 
			}
			else
			{
				request.getSession().setAttribute("msg", "Documents Failed To Insert..!!");
				response.sendRedirect("uploadpic.jsp"); 
			}
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	
private String getSubmittedFileName(Part file) {
        
        for(String cd:file.getHeader("content-disposition").split(";"))
        {
        	if(cd.trim().startsWith("filename"))
        	{
        		String filename=cd.substring(cd.indexOf('=')+1).trim().replace("\"", "");
        				return filename.substring(filename.lastIndexOf('/')+1).substring(filename.lastIndexOf('\\')+1);
        	}
        }
        	return null;
        }
}


