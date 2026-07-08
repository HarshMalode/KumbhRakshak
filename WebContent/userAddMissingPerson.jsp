<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="DBConnection.DbClass"%>
<%
int unreadCount = 0;
try {
    Connection conn = DbClass.getConnect();
    PreparedStatement ps = conn.prepareStatement(
        "SELECT COUNT(*) FROM notifications WHERE type='NEW_LOCATION' AND is_read=FALSE"
    );
    ResultSet rs = ps.executeQuery();
    if(rs.next()) {
        unreadCount = rs.getInt(1);
    }
} catch(Exception e) {
    e.printStackTrace();
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Missing People</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/fontawesome-all.css">
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

/* Form */
.form-box {
    background: #ffffff;
    padding: 35px 40px;
    border-radius: 14px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
    max-width: 1200px;
    margin: auto;
}

.form-title {
    font-size: 24px;
    font-weight: 600;
    margin-bottom: 25px;
    color: #1e2a47;
}

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    font-weight: 600;
    color: #1e2a47;
    margin-bottom: 6px;
}

.form-control {
    border-radius: 8px;
    font-size: 14px;
    padding: 10px 12px;
}

.btn-primary {
    padding: 10px 30px;
    font-size: 15px;
    border-radius: 8px;
}
.form-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 18px 30px;
}

/* Make full-width fields */
.form-group.full {
    grid-column: span 2;
}

/* Inputs consistency */
.form-control,
.form-group input[type="file"] {
    width: 100%;
}
/* Submit button */
.form-actions {
    grid-column: span 2;
    text-align: center;
    margin-top: 25px;
}

.form-actions button {
    background: #2563eb;
    border: none;
    color: #fff;
    padding: 12px 40px;
    font-size: 15px;
    border-radius: 8px;
}

.form-actions button:hover {
    background: #1e40af;
}
.badge{
    background:red;
    color:white;
    font-size:11px;
    padding:3px 6px;
    border-radius:50%;
    margin-left:8px;
}

/* =========================
   MOBILE SIDEBAR + HAMBURGER
   ========================= */

.menu-toggle {
    font-size: 22px;
    cursor: pointer;
    display: none;
    color: #1e293b;
}

/* Overlay */
.sidebar-overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.45);
    z-index: 1500;
    display: none;
}

/* Mobile behavior */
@media (max-width: 992px) {

    .menu-toggle {
        display: block;
    }

    #sidebar {
        transform: translateX(-100%);
        transition: transform 0.3s ease;
        z-index: 2000;
    }

    #sidebar.active {
        transform: translateX(0);
    }

    .sidebar-overlay.active {
        display: block;
    }
}
/* =========================
   IPHONE VIEW – ADD MISSING PEOPLE FORM
   ========================= */
@media (max-width: 480px) {

    /* Remove desktop left gap */
    #content {
        margin-left: 0;
        padding: 25px 12px 24px; /* navbar-safe spacing */
    }

    /* Form container */
    .form-box {
        padding: 20px 16px;
        border-radius: 14px;
    }

    .form-title {
        font-size: 18px;
        text-align: center;
        margin-bottom: 18px;
    }

    /* 🔑 Convert grid to single column */
    .form-grid {
        grid-template-columns: 1fr;
        gap: 14px;
    }

    /* Full-width fields */
    .form-group,
    .form-group.full {
        grid-column: span 1;
    }

    /* Inputs */
    .form-control,
    input[type="file"] {
        width: 100%;
        font-size: 14px;
    }

    .form-group label {
        font-size: 13px;
    }

    /* Submit button */
    .form-actions {
        grid-column: span 1;
        text-align: center;
        margin-top: 18px;
    }

    .form-actions button {
        width: 100%;
        padding: 12px;
        font-size: 15px;
        border-radius: 10px;
    }
}

/* EXTRA SMALL (iPhone SE) */
@media (max-width: 360px) {

    #content {
        padding: 30px 10px 16px;
    }

    .form-box {
        padding: 16px 14px;
    }

    .form-title {
        font-size: 17px;
    }
}

/* Extra small (300px – iPhone SE) */
@media (max-width: 360px) {

    .navbar-custom h4 {
        font-size: 15px;
    }

    .dashboard-card {
        padding: 15px;
    }

    .dashboard-card h5 {
        font-size: 15px;
    }

    .dashboard-card p {
        font-size: 12px;
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
/* =========================
   FIX NAVBAR MOBILE LAYOUT
   ========================= */
@media (max-width: 992px) {

    .navbar-custom {
        margin-left: 0;
        width: 100%;
        padding: 0 14px;
    }

    .navbar-custom .d-flex {
        flex: 1;
    }

    .navbar-right {
        white-space: nowrap;
        font-size: 13px;
    }
}

</style>
</head>

<body>


<nav id="sidebar">
    <div class="sidebar-header">
       KumbhRakshak
        <span>User Panel</span>
    </div>
    <ul>
       <li><a href="welcomeUser.jsp"><i class="fas fa-th-large"></i> <span>Dashboard</span></a></li>
       <li class="active"><a href="userAddMissingPerson.jsp"><i class="fas fa-users"></i> Add Missing People</a></li>
             <li><a href="userViewMissingPeople.jsp"><i class="fas fa-eye"></i> View Missing People</a></li>
             <li><a href="userViewLocations.jsp"><i class="fas fa-eye"></i> View Location <% if(unreadCount > 0) { %>
            <span class="badge"><%= unreadCount %></span>
        <% } %></a></li>
            <li>
                <a href="viewNewsUser.jsp">
                    <i class="fas fa-eye"></i> View News
                </a>
            </li>

            <li><a href="userCrowdView.jsp"><i class="fas fa-users"></i> <span>Crowd Density</span></a></li>

            <li><a href="myProfile.jsp"><i class="fas fa-user-secret"></i> <span>My Profile</span></a></li>
             <li><a href="userLogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

<!-- Overlay -->
<div class="sidebar-overlay"></div>
<div class="navbar-custom">
    <div class="d-flex align-items-center gap-3">
        <!-- Hamburger (mobile only) -->
        <i class="fas fa-bars menu-toggle"></i>
        
    </div>

    <div class="navbar-right">
        <i class="fas fa-user-circle"></i> User
    </div>
</div>


<div id="content">
    <div class="form-box">
        <div class="form-title">Add Missing Person Details</div>

      <form action="<%= request.getContextPath() %>/UserAddMissingPeople"
      method="post" enctype="multipart/form-data">


<div class="form-grid">

  <div class="form-group">
    <label>First Name <span style="color: red; font-size: 20px;">*</span></label>
    <input class="form-control" name="fname" required>
  </div>

  <div class="form-group">
    <label>Last Name <span style="color: red; font-size: 20px;">*</span></label>
    <input class="form-control" name="lname" required>
  </div>

  <div class="form-group">
    <label>Father's Name</label>
    <input class="form-control" name="faname" >
  </div>

  <div class="form-group">
    <label>Mother's Name</label>
    <input class="form-control" name="Momname" >
  </div>

  <div class="form-group">
    <label>Relative's Name</label>
    <input class="form-control" name="relname" >
  </div>

  <div class="form-group">
    <label>Age</label>
    <input class="form-control" name="age" >
  </div>

  <div class="form-group">
    <label>Gender</label>
    <input class="form-control" name="gender" >
  </div>

  <div class="form-group">
    <label>Eye Colour</label>
    <input class="form-control" name="eyecol" >
  </div>

  <div class="form-group">
    <label>Hair Colour</label>
    <input class="form-control" name="hcol" >
  </div>

  <div class="form-group">
    <label>Height</label>
    <input class="form-control" name="ht" >
  </div>

  <div class="form-group">
    <label>Weight</label>
    <input class="form-control" name="wt" >
  </div>

  <div class="form-group">
    <label>Blood Group</label>
    <input class="form-control" name="bgrp" >
  </div>

  <div class="form-group">
    <label>Birth Mark</label>
    <input class="form-control" name="birthmrk" >
  </div>

  <div class="form-group">
    <label>Phone</label>
    <input class="form-control" name="phno" >
  </div>

<div class="form-group full">
    <label>Address</label>
    <input class="form-control" name="add" >
  </div>
  <div class="form-group">
    <label>City</label>
    <input class="form-control" name="city" >
  </div>

  <div class="form-group">
    <label>State</label>
    <input class="form-control" name="state" >
  </div>

  <div class="form-group">
    <label>Nationality</label>
    <input class="form-control" name="nation" >
  </div>

  <div class="form-group">
    <label>Occupation</label>
    <input class="form-control" name="occup" >
  </div>

  <div class="form-group">
    <label>Last Seen Location</label>
    <input class="form-control" name="lastloc" >
  </div>

  <div class="form-group">
    <label>Date of Missing <span style="color: red; font-size: 20px;">*</span></label>
    <input class="form-control" type="date" name="dom" required>
  </div>

  <div class="form-group">
    <label>Upload Photo <span style="color: red; font-size: 20px;">*</span></label>
    <input type="file" name="photo" accept="image/*" required>
  </div>

  <div class="form-group">
    <label>Upload ID Proof <span style="color: red; font-size: 20px;">*</span></label>
    <input type="file" name="docu" accept=".pdf,.jpg,.png" required>
  </div>

  <div class="form-actions">
    <button type="submit">Add Details</button>
  </div>

</div>
</form>

    </div>
</div>
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
