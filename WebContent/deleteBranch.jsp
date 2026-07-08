<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBConnection.DbClass" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
<%
Statement statement = null;
ResultSet resultSet = null;
%>

<%
try{
Connection conn=DbClass.getConnect();
statement=conn.createStatement();
int id1=Integer.parseInt(request.getParameter("id"));
java.sql.PreparedStatement ps=conn.prepareStatement("delete from police where id=?");
ps.setInt(1,id1);
int i=ps.executeUpdate();

if(i==1)
{
	System.out.println("Record Deleted Successfully!!");
	response.sendRedirect("viewBranchDetails.jsp");
}

} catch (Exception e) {
e.printStackTrace();
}

%>
</body>
</html>