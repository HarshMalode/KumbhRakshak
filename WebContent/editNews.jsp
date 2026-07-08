<%@ page import="java.sql.*,DBConnection.DbClass"%>
<%
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = DbClass.getConnect();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM city_news WHERE id=?");
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    rs.next();
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Edit News</title>

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
    font-weight: 600;4
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
    display: flex;
    justify-content: center;
}

/* CENTERED + WIDER BOX */
.content-box {
    background: #ffffff;
    padding: 35px 40px;
    border-radius: 14px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
    width: 100%;
    max-width: 950px; /* increased width */
}
/* ==================================
   FINAL IPHONE VIEW – EDIT NEWS
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
   IPHONE FORM LAYOUT
   ========================= */
@media (max-width: 480px) {

    html, body {
        height: 100%;
        overflow-x: hidden;
    }

    #content {
        padding: 12px;
    }

    .content-box {
        max-width: 100%;
        padding: 18px 16px;
        border-radius: 14px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.08);
    }

    h4 {
        font-size: 20px;
        text-align: center;
        margin-bottom: 18px;
        font-weight: 600;
    }

    /* Inputs */
    .form-control,
    textarea {
        font-size: 14px;
        padding: 10px;
        border-radius: 10px;
        width: 100%;
    }

    textarea {
        resize: none;
    }

    /* Image preview responsive */
    img {
        max-width: 100%;
        height: auto;
        border-radius: 10px;
    }

    /* File input spacing */
    input[type="file"] {
        padding: 8px;
    }

    /* Button full width */
    .btn-primary {
        width: 100%;
        padding: 12px;
        font-size: 15px;
        border-radius: 10px;
    }
}

/* Small phones (iPhone SE) */
@media (max-width: 360px) {

    h4 {
        font-size: 18px;
    }

    .form-control,
    textarea {
        font-size: 13px;
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
       Crowd Prediction
        <span>Admin Panel</span>
    </div>
    <ul>
        <li><a href="welcomeAdmin.jsp"><i class="fas fa-th-large"></i> Dashboard</a></li>
        <li><a href="addPoliceHelpline.jsp"><i class="fas fa-plus-circle"></i> Add Police Camps</a></li>
        <li><a href="viewPoliceHelpline.jsp"><i class="fas fa-eye"></i> View Police Camps</a></li>
         <li><a href="addLocation.jsp"><i class="fas fa-plus-circle"></i> Add Location</a></li>
        <li><a href="viewLocations.jsp"><i class="fas fa-eye"></i> View Location</a></li>
        <li><a href="addNews.jsp"><i class="fas fa-plus-circle"></i> Add News</a></li>
        <li class="active"><a href="viewNewsAdmin.jsp"><i class="fas fa-eye"></i> View News</a></li>
        <li><a href="viewmissingpeopleadmin.jsp"><i class="fas fa-eye"></i>Missing People</a></li>
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
        <h4 class="mb-4 text-center">Edit News</h4>

        <form action="UpdateNewsServlet" method="post" enctype="multipart/form-data">

            <input type="hidden" name="id" value="<%=id%>">
            <input type="hidden" name="oldImage" value="<%=rs.getString("image")%>">

            <div class="form-group mb-3">
                <label>Title</label>
                <input type="text" name="title" class="form-control" value="<%=rs.getString("title")%>" required>
            </div>

            <div class="form-group mb-3">
                <label>City</label>
                <input type="text" name="city" class="form-control" value="<%=rs.getString("city")%>" required>
            </div>

            <div class="form-group mb-3">
                <label>Publish Date</label>
                <input type="date" name="publish_date" class="form-control" value="<%=rs.getDate("publish_date")%>" required>
            </div>

            <div class="form-group mb-3">
                <label>Description</label>
                <textarea name="description" class="form-control" rows="4" required><%=rs.getString("description")%></textarea>
            </div>

            <div class="form-group mb-3">
                <label>Current Image</label><br>
                <img src="city_news/<%=rs.getString("image")%>" width="160" class="mb-2">
            </div>

            <div class="form-group mb-4">
                <label>Change Image (optional)</label>
                <input type="file" name="image" class="form-control">
            </div>

            <button class="btn btn-primary w-100">Update News</button>
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
