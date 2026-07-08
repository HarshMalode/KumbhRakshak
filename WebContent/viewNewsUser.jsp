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
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Manage News</title>

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

/* CONTENT */
#content{margin-left:260px;padding:30px;}

/* NEWS GRID */
.news-grid{
    display:grid;
    grid-template-columns:repeat(auto-fill,minmax(300px,1fr));
    gap:25px;
}

/* CARD */
.news-card{
    background:#fff;border-radius:14px;overflow:hidden;
    box-shadow:0 10px 25px rgba(0,0,0,0.08);
    transition:.3s;
}
.news-card:hover{
    transform:translateY(-6px);
    box-shadow:0 18px 40px rgba(0,0,0,0.12);
}
.news-card img{width:100%;height:200px;object-fit:cover;}
.news-card-body{padding:18px 20px;}
.news-card h5{font-size:18px;font-weight:600;margin-bottom:5px;}
.news-meta{font-size:13px;color:#777;margin-bottom:10px;}
.news-card p{font-size:14px;color:#555;max-height:80px;overflow:hidden;}

.news-actions{
    display:flex;justify-content:space-between;margin-top:15px;
}
.news-actions a{
    font-size:13px;padding:6px 14px;border-radius:6px;
    text-decoration:none;color:#fff;
}
.btn-edit{background:#f59e0b;}
.btn-delete{background:#dc2626;}

.news-card img {
    cursor: zoom-in;
}
/* ===== Image Modal Customization ===== */
#imageModal .modal-dialog {
    max-width: 800px;          /* modal width */
    width: 90%;
}

#imageModal .modal-content {
    height: 80vh;              /* modal height */
    border-radius: 12px;
}

#imageModal .modal-body {
    overflow: auto;            /* enable scroll */
    padding: 15px;
}

#imageModal img {
    max-width: 100%;
    height: auto;
    display: block;
    margin: auto;
}
.badge{
    background:red;
    color:white;
    font-size:11px;
    padding:3px 6px;
    border-radius:50%;
    margin-left:8px;
}
/* ==================================
   FINAL IPHONE VIEW – MANAGE NEWS
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
   IPHONE NEWS LAYOUT
   ========================= */
@media (max-width: 480px) {

    html, body {
        overflow-x: hidden;
    }

    #content {
        padding: 12px;
    }

    /* GRID → SINGLE COLUMN */
    .news-grid {
        grid-template-columns: 1fr;
        gap: 16px;
    }

    /* Card */
    .news-card {
        border-radius: 16px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.1);
    }

    .news-card img {
        height: 180px;
        object-fit: cover;
    }

    .news-card-body {
        padding: 14px 16px;
    }

    .news-card h5 {
        font-size: 16px;
        line-height: 1.3;
    }

    .news-meta {
        font-size: 12px;
        margin-bottom: 8px;
    }

    .news-card p {
        font-size: 13px;
        max-height: none;
    }

    /* ACTIONS STACKED */
    .news-actions {
        flex-direction: column;
        gap: 10px;
        margin-top: 14px;
    }

    .news-actions a {
        width: 100%;
        text-align: center;
        padding: 10px;
        font-size: 14px;
        border-radius: 10px;
    }

    /* Modal image full screen friendly */
    #imageModal .modal-dialog {
        max-width: 95%;
        margin: auto;
    }

    #imageModal .modal-content {
        height: auto;
        max-height: 90vh;
    }
}

/* Small phones (iPhone SE) */
@media (max-width: 360px) {

    .news-card img {
        height: 160px;
    }

    .news-card h5 {
        font-size: 15px;
    }

    .news-card p {
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
       <li><a href="userAddMissingPerson.jsp"><i class="fas fa-users"></i> Add Missing People</a></li>
             <li><a href="userViewMissingPeople.jsp"><i class="fas fa-eye"></i> View Missing People</a></li>
             <li><a href="userViewLocations.jsp"><i class="fas fa-eye"></i> View Location  <% if(unreadCount > 0) { %>
            <span class="badge"><%= unreadCount %></span>
        <% } %></a></li>
            <li class="active">
                <a href="viewNewsUser.jsp">
                    <i class="fas fa-eye"></i> View News
                </a>
            </li>

            <li><a href="userCrowdView.jsp"><i class="fas fa-users"></i> <span>Crowd Density</span></a></li>

            <li><a href="myProfile.jsp"><i class="fas fa-user-secret"></i> <span>My Profile</span></a></li>
             <li><a href="userLogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

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
    <div class="news-grid">
        <%
        Connection con = DbClass.getConnect();
        ResultSet rs = con.createStatement().executeQuery("SELECT * FROM city_news ORDER BY publish_date DESC");
        while(rs.next()){
        %>
        <div class="news-card">
            <img src="city_news/<%=rs.getString("image")%>"
     alt="news"
     style="cursor:pointer"
     onclick="openImageModal(this.src)">
            <div class="news-card-body">
                <h5><%=rs.getString("title")%></h5>
                <div class="news-meta"><%=rs.getString("city")%> | <%=rs.getDate("publish_date")%></div>
                <p><%=rs.getString("description")%></p>
                
            </div>
        </div>
        <% } %>
    </div>
</div>
<!-- Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1">
  <div class="modal-dialog modal-dialog-centered modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">News Image</h5>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>
      <div class="modal-body">
    <img id="modalImage" src="" alt="Preview">
</div>

    </div>
  </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>


<script>
function openImageModal(src) {
    document.getElementById("modalImage").src = src;
    $('#imageModal').modal('show');
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
