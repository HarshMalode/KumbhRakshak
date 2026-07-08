<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBConnection.DbClass" %>
<%@page  contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>View Missing People</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/fontawesome-all.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
* { box-sizing: border-box; }

body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(120deg, #eef2ff, #f8fafc);
}

/* ===== MASTER SIDEBAR (UNCHANGED) ===== */
#sidebar {
    width: 260px;
    height: 100vh;
    position: fixed;
    top: 0;
    left: 0;
    background: linear-gradient(180deg, #1e3a8a, #0f172a);
    color: #fff;
    padding-top: 20px;
}

.sidebar-header {
    text-align: center;
    font-size: 22px;
    font-weight: 600;
    padding: 15px 0;
}

.sidebar-header span {
    font-size: 12px;
    display: block;
    opacity: 0.7;
}

#sidebar ul {
    list-style: none;
    padding: 0;
    margin-top: 20px;
}

#sidebar ul li {
    padding: 14px 25px;
}

#sidebar ul li a {
    color: #dbeafe;
    text-decoration: none;
    font-size: 15px;
    display: flex;
    gap: 12px;
}

#sidebar ul li:hover {
    background: rgba(255,255,255,0.1);
}
/* Active menu item */
#sidebar ul li.active,
#sidebar ul li.active:hover {
    background: rgba(255,255,255,0.15);
}

#sidebar ul li.active a {
    color: #ffffff;
    font-weight: 600;
}

/* ===== MASTER NAVBAR (UNCHANGED) ===== */
/* ===== NAVBAR ===== */
.navbar-custom {
    margin-left: 260px;
    height: 65px;
    background: rgba(255,255,255,0.9);
    backdrop-filter: blur(8px);
    border-bottom: 1px solid #e5e7eb;
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 25px;
}

.navbar-custom h4 {
    margin: 0;
    font-size: 20px;
    font-weight: 600;
}

.navbar-right {
    font-size: 14px;
    color: #444;
}
/* ===== CONTENT ===== */
#content {
    margin-left: 260px;
    padding: 30px;
}

.content-box {
    background: #ffffff;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

/* Table */
/* ===== Improved Table Styling ===== */

.table-scroll {
    overflow-x: auto;
    border-radius: 10px;
}

/* Table */
#displaytable {
    border-collapse: collapse;
    width: 100%;
    min-width: 1600px;   /* important for many columns */
    font-size: 13px;
}

/* Header */
#displaytable thead th {
    position: sticky;
    top: 0;
    background: #1e3a8a;
    color: #ffffff;
    padding: 10px 12px;
    text-align: center;
    font-weight: 600;
    white-space: nowrap;
    border-bottom: 2px solid #e5e7eb;
}

/* Body cells */
#displaytable tbody td {
    padding: 10px 12px;
    text-align: center;
    vertical-align: middle;
    border-bottom: 1px solid #e5e7eb;
    white-space: nowrap;
}

/* Zebra rows */
#displaytable tbody tr:nth-child(even) {
    background: #f8fafc;
}

/* Hover */
#displaytable tbody tr:hover {
    background: #eef2ff;
}

/* Images */
#displaytable img {
    border-radius: 6px;
    object-fit: cover;
}

/* Photo column */
#displaytable td:first-child img {
    width: 55px;
    height: 55px;
}

/* ID proof */
#displaytable td:nth-child(2) img {
    width: 75px;
    height: 55px;
}

/* Action link */
#displaytable .action a {
    color: #dc2626;
    font-weight: 600;
    text-decoration: none;
}

#displaytable .action a:hover {
    text-decoration: underline;
}
/* ==================================
   IPHONE VIEW – MISSING PEOPLE TABLE
   ================================== */

/* Mobile sidebar handling (same as others) */
.menu-toggle { display: none; }

.sidebar-overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.45);
    z-index: 1500;
    display: none;
}
.sidebar-overlay.active { display: block; }

@media (max-width: 992px) {

    #sidebar {
        transform: translateX(-100%);
        transition: transform 0.3s ease;
        z-index: 2000;
    }

    #sidebar.active { transform: translateX(0); }

    .navbar-custom,
    #content {
        margin-left: 0;
    }

    .menu-toggle {
        display: block;
        font-size: 22px;
        cursor: pointer;
    }
}



/* Extra small phones */
@media (max-width: 360px) {

    #displaytable td::before {
        min-width: 100px;
        font-size: 12px;
    }

    #displaytable td {
        font-size: 12px;
    }
}
/* =========================
   FIXED MOBILE CARD TABLE
   ========================= */
@media (max-width: 480px) {

    /* Hide table header */
    #displaytable thead {
        display: none;
    }

    #displaytable,
    #displaytable tbody,
    #displaytable tr {
        display: block;
        width: 100%;
    }

    /* Each row = card */
    #displaytable tr {
        background: #ffffff;
        margin-bottom: 16px;
        border-radius: 14px;
        padding: 14px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.1);
    }

    /* Cell layout FIX */
    #displaytable td {
        display: block;
        padding: 8px 4px;
        border: none;
        font-size: 13px;
        text-align: left;
    }

    /* Label */
    #displaytable td::before {
        content: attr(data-label);
        display: block;
        font-weight: 600;
        color: #1e3a8a;
        font-size: 12px;
        margin-bottom: 4px;
    }

    /* Images */
    #displaytable img {
        max-width: 80px;
        height: auto;
        border-radius: 8px;
        margin-top: 4px;
    }

    /* Action button */
    #displaytable td.action {
        margin-top: 12px;
    }

    #displaytable td.action a {
        display: inline-block;
        background: #dc2626;
        color: #fff;
        padding: 8px 14px;
        border-radius: 8px;
        font-size: 14px;
        text-decoration: none;
    }
}

/* =========================
   MOBILE TABLE HARD FIX
   ========================= */
@media (max-width: 480px) {

    /* REMOVE DESKTOP WIDTH FOR MOBILE */
    #displaytable {
        min-width: 100% !important;
        width: 100% !important;
    }

    /* IMPORTANT: allow vertical cards */
    .table-scroll {
        overflow-x: hidden !important;
    }

    /* Safety: ensure rows render */
    #displaytable tr {
        display: block;
        width: 100%;
    }
}
/* =========================
   FIX MOBILE SIDEBAR SCROLL
   ========================= */
@media (max-width: 992px) {

    #sidebar {
        height: 100dvh;           /* correct mobile height */
        overflow-y: auto;        /* allow scrolling */
        -webkit-overflow-scrolling: touch;
    }

    body {
        overflow-x: hidden;
    }
}
</style>
</head>

<body>

<nav id="sidebar">
    <div class="sidebar-header">
       KumbhaRakshak
        <span>Admin Panel</span>
    </div>
    <ul>
        <li><a href="welcomeAdmin.jsp"><i class="fas fa-th-large"></i> Dashboard</a></li>
        <li><a href="addPoliceHelpline.jsp"><i class="fas fa-plus-circle"></i> Add Police Camps</a></li>
        <li><a href="viewPoliceHelpline.jsp"><i class="fas fa-eye"></i> View Police Camps</a></li>
         <li><a href="addLocation.jsp"><i class="fas fa-plus-circle"></i> Add Location</a></li>
        <li><a href="viewLocations.jsp"><i class="fas fa-eye"></i> View Location</a></li>
        <li><a href="addNews.jsp"><i class="fas fa-plus-circle"></i> Add News</a></li>
        <li><a href="viewNewsAdmin.jsp"><i class="fas fa-eye"></i> View News</a></li>
        <li class="active"><a href="viewmissingpeopleadmin.jsp"><i class="fas fa-eye"></i>Missing People</a></li>
        <li><a href="findLogAdmin.jsp"><i class="fas fa-users"></i>View Logs</a></li>
        <li><a href="adminCrowdView.jsp"><i class="fas fa-newspaper"></i>Crowd Density</a></li>
        <li><a href="Adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

<div class="sidebar-overlay"></div>
<div class="navbar-custom">
    <div class="d-flex align-items-center gap-3">
        <!-- Hamburger (mobile only) -->
        <i class="fas fa-bars menu-toggle"></i>
        
    </div>

    <div class="navbar-right">
        <i class="fas fa-user-circle"></i> Admin
    </div>
</div>

<div id="content">
    <div class="content-box">
        <h4 class="mb-4">View Missing People's Details</h4>

        <input class="form-control mb-3" id="myInput" onkeyup="myFunction()" placeholder="Search by First Name">

      <div class="table-scroll">
      <table id="displaytable">
        <thead>
          <tr>
            <th>Photo</th><th>ID Proof</th><th>First</th><th>Last</th><th>Father</th><th>Mother</th>
            <th>Relative</th><th>Age</th><th>Gender</th><th>Eye</th><th>Hair</th><th>Height</th>
            <th>Weight</th><th>Blood</th><th>Mark</th><th>Phone</th><th>Address</th><th>City</th>
            <th>State</th><th>Nation</th><th>Job</th><th>Last Seen</th><th>Missing Date</th><th>Action</th>
          </tr>
        </thead>
        <tbody>
        <%
          try{
            Connection conn = DbClass.getConnect();
            PreparedStatement ps = conn.prepareStatement("select * from missingpeople");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
            	String img1 = rs.getString("Image_Filename");
          	  String img2 = rs.getString("file_name");
          	  String fname = rs.getString("First_Name");
          	  String lname = rs.getString("Last_Name");
              String path = "missingpeopleimg/"+rs.getString(2)+" "+rs.getString(3)+"/";
        %>
          <tr>
            <td data-label="Photo"><img src="<%=request.getContextPath()%>/missingpeopleimg/<%=fname%> <%=lname%>/<%=img1%>" width="60" height="60"></td>
          <td data-label="ID Proof"><img src="<%=request.getContextPath()%>/missingpeopledocs/<%=img2%>" width="80" height="60"></td>
            <td data-label="First Name"><%=rs.getString(3)%></td>
<td data-label="Last Name"><%=rs.getString(4)%></td>
<td data-label="Father Name"><%=rs.getString(5)%></td>
<td data-label="Mother Name"><%=rs.getString(6)%></td>
<td data-label="Relative Name"><%=rs.getString(7)%></td>
<td data-label="Age"><%=rs.getString(8)%></td>
<td data-label="Gender"><%=rs.getString(9)%></td>
<td data-label="Eye Color"><%=rs.getString(10)%></td>
<td data-label="Hair Color"><%=rs.getString(11)%></td>
<td data-label="Height"><%=rs.getString(12)%></td>
<td data-label="Weight"><%=rs.getString(13)%></td>
<td data-label="Blood Group"><%=rs.getString(14)%></td>
<td data-label="Birth Mark"><%=rs.getString(15)%></td>
<td data-label="Phone"><%=rs.getString(16)%></td>
<td data-label="Address"><%=rs.getString(17)%></td>
<td data-label="City"><%=rs.getString(18)%></td>
<td data-label="State"><%=rs.getString(19)%></td>
<td data-label="Nationality"><%=rs.getString(20)%></td>
<td data-label="Occupation"><%=rs.getString(21)%></td>
<td data-label="Last Seen"><%=rs.getString(22)%></td>
<td data-label="Missing Date"><%=rs.getString(23)%></td>
            <td data-label="Action" class="action"><a href="deletemissingpeopleadmin.jsp?id=<%=rs.getInt("id")%>">Delete</a></td>
          </tr>
        <% }} catch(Exception e){ e.printStackTrace(); } %>
        </tbody>
      </table>
    </div>
    </div>
</div>

<script>
function myFunction() {
  var input = document.getElementById("myInput");
  var filter = input.value.toUpperCase();
  var table = document.getElementById("displaytable");
  var tr = table.getElementsByTagName("tr");

  for (var i = 1; i < tr.length; i++) {
    var td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      tr[i].style.display = td.innerText.toUpperCase().indexOf(filter) > -1 ? "" : "none";
    }
  }
}
</script>
<script>
    const menuToggle = document.querySelector('.menu-toggle');
    const sidebar = document.getElementById('sidebar');
    const overlay = document.querySelector('.sidebar-overlay');

    menuToggle.addEventListener('click', () => {
        sidebar.classList.toggle('active');
        overlay.classList.toggle('active');
    });

    overlay.addEventListener('click', () => {
        sidebar.classList.remove('active');
        overlay.classList.remove('active');
    });
</script>
</body>
</html>
