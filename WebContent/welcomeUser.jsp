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
<title>User Dashboard</title>

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
    font-weight: 600;4
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

/* Content */
#content {
    margin-left: 260px;
    padding: 30px;
}

/* Dashboard cards */
.dashboard-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
    gap: 25px;
    margin-bottom: 30px;
}

.dashboard-card {
    background: #ffffff;
    border-radius: 14px;
    padding: 25px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
    transition: 0.3s;
}

.dashboard-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 15px 35px rgba(0,0,0,0.12);
}

.dashboard-card i {
    font-size: 28px;
    color: #2563eb;
    margin-bottom: 12px;
}

.dashboard-card h5 {
    font-size: 18px;
    font-weight: 600;
}

.dashboard-card p {
    font-size: 14px;
    color: #666;
}

/* Hero section */
.hero {
    background: linear-gradient(135deg, #2563eb, #1e40af);
    border-radius: 18px;
    padding: 50px;
    color: #fff;
    box-shadow: 0 20px 40px rgba(37,99,235,0.35);
}

.hero h2 {
    font-size: 36px;
    font-weight: 600;
}

.hero p {
    font-size: 16px;
    max-width: 600px;
    opacity: 0.9;
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
   IPHONE RESPONSIVE DASHBOARD
   ========================= */

/* Tablets & below */
@media (max-width: 992px) {

    /* Hide sidebar */
    #sidebar {
        transform: translateX(-100%);
        position: fixed;
        z-index: 2000;
    }

    /* Remove left spacing */
    .navbar-custom,
    #content {
        margin-left: 0;
    }
}

/* iPhone & small devices */
@media (max-width: 480px) {

    body {
        overflow-x: hidden;
    }

    /* Navbar */
    .navbar-custom {
        height: 56px;
        padding: 0 15px;
    }

    .navbar-custom h4 {
        font-size: 16px;
    }

    .navbar-right {
        font-size: 13px;
    }

    /* Content padding */
    #content {
        padding: 18px 12px;
    }

    /* Dashboard cards */
    .dashboard-grid {
        grid-template-columns: 1fr; /* single column */
        gap: 16px;
    }

    .dashboard-card {
        padding: 18px;
        border-radius: 12px;
    }

    .dashboard-card i {
        font-size: 24px;
    }

    .dashboard-card h5 {
        font-size: 16px;
    }

    .dashboard-card p {
        font-size: 13px;
        line-height: 1.4;
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
       KumbhRakshak
        <span>User Panel</span>
    </div>
    <ul>
       <li class="active"><a href="welcomeUser.jsp"><i class="fas fa-th-large"></i> <span>Dashboard</span></a></li>
       <li><a href="userAddMissingPerson.jsp"><i class="fas fa-users"></i> Add Missing People</a></li>
             <li><a href="userViewMissingPeople.jsp"><i class="fas fa-eye"></i> View Missing People</a></li>
             <li><a href="userViewLocations.jsp"><i class="fas fa-eye"></i> View Location  <% if(unreadCount > 0) { %>
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

    <div class="dashboard-grid">
        <div class="dashboard-card">
            <i class="fas fa-users"></i>
            <h5>Crowd Monitoring</h5>
            <p>View and analyze real-time crowd density.</p>
        </div>

        <div class="dashboard-card">
            <i class="fas fa-building"></i>
            <h5>Police Camps</h5>
            <p>Manage and monitor police camp locations.</p>
        </div>

        <div class="dashboard-card">
            <i class="fas fa-newspaper"></i>
            <h5>News & Alerts</h5>
            <p>Publish official updates and alerts.</p>
        </div>

        <div class="dashboard-card">
            <i class="fas fa-user-secret"></i>
            <h5>Missing Persons</h5>
            <p>Track and identify missing individuals.</p>
        </div>
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
