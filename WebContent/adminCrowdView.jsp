<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="DBConnection.DbClass"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Crowd Status</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/fontawesome-all.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">

<style>
* { box-sizing: border-box; }

body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(120deg, #eef2ff, #f8fafc);
}

/* Sidebar */
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
    letter-spacing: 1px;
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
    align-items: center;
    gap: 12px;
    transition: 0.25s;
}

#sidebar ul li:hover {
    background: rgba(255,255,255,0.1);
}

#sidebar ul li a:hover {
    color: #fff;
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
/* Navbar */
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

/* CONTENT */
#content{margin-left:260px;padding:110px 30px 40px;display:flex;justify-content:center;}

.card-box{
    background:#fff;border-radius:16px;
    padding:35px 40px;
    box-shadow:0 12px 30px rgba(0,0,0,0.1);
    width:100%;max-width:900px;
}

.result-box{
    margin-top:30px;padding:20px;
    background:#eef2ff;
    border-left:6px solid #1e3a8a;
    border-radius:10px;text-align:center;
}

/* ==================================
   FINAL IPHONE VIEW – ADD NEWS
   ================================== */

/* Hide hamburger on desktop */
.menu-toggle {
    display: none;
}

/* Overlay */
.sidebar-overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.45);
    z-index: 1500;
    display: none;
}
.sidebar-overlay.active {
    display: block;
}

/* Sidebar + navbar (mobile) */
@media (max-width: 992px) {

    #sidebar {
        transform: translateX(-100%);
        transition: transform 0.3s ease;
        z-index: 2000;
    }

    #sidebar.active {
        transform: translateX(0);
    }

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

/* =========================
   IPHONE VIEW – CROWD STATUS
   ========================= */
@media (max-width: 480px) {

    /* Remove desktop spacing */
    #content {
        margin-left: 0;
        padding: 80px 12px 20px;   /* reduced top padding */
    }

    /* Card */
    .card-box {
        padding: 20px 16px;
        border-radius: 14px;
    }

    /* Search input */
    .card-box input[type="text"] {
        width: 100% !important;
        font-size: 14px;
    }

    .card-box button {
        width: 100%;
        padding: 12px;
        font-size: 15px;
    }

    /* Result box */
    .result-box {
        padding: 16px;
        text-align: left;
    }

    .result-box h4 {
        font-size: 16px;
        margin-bottom: 6px;
    }

    .result-box h5 {
        font-size: 14px;
        margin-bottom: 4px;
    }

    .result-box small {
        font-size: 12px;
        display: block;
        margin-top: 6px;
    }
}

/* EXTRA SMALL (iPhone SE) */
@media (max-width: 360px) {

    #content {
        padding: 70px 10px 16px;
    }

    .card-box {
        padding: 16px 14px;
    }

    .result-box h4 {
        font-size: 15px;
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
        <li><a href="viewmissingpeopleadmin.jsp"><i class="fas fa-eye"></i>Missing People</a></li>
        <li><a href="findLogAdmin.jsp"><i class="fas fa-users"></i>View Logs</a></li>
        <li class="active"><a href="adminCrowdView.jsp"><i class="fas fa-newspaper"></i>Crowd Density</a></li>
        <li><a href="Adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

<div class="sidebar-overlay"></div>

<!-- Navbar -->
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
    <div class="card-box">

        <form method="get" class="text-center">
            <input type="text" name="location" placeholder="Enter Location"
       class="form-control" required>

            <button class="btn btn-primary mt-3 px-4">Search</button>
        </form>

        <%
        String loc = request.getParameter("location");
        if (loc != null) {
            Connection con = DbClass.getConnect();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM crowd_status WHERE location=?"
            );
            ps.setString(1, loc);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
        %>
        <div class="result-box mt-4">
            <h4>Location: <%= rs.getString("location") %></h4>
            <h5>People: <%= rs.getInt("people_count") %></h5>
            <h5>Density: <%= rs.getString("density") %></h5>
            <small>Last updated: <%= rs.getTimestamp("last_updated") %></small>
        </div>
        <%
            } else {
        %>
        <div class="alert alert-warning mt-4 text-center">No data for this location.</div>
        <%
            }
        }
        %>

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
