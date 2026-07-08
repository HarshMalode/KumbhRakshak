<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         import="java.sql.*, DBConnection.DbClass" %>

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

<%
if (session.getAttribute("user_id") == null) {
    response.sendRedirect("userLogin.jsp");
    return;
}

int userId = (Integer) session.getAttribute("user_id");


String name="", email="", phone="", city="";

try {
    Connection con = DbClass.getConnect();
    PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE id=?");
    ps.setInt(1, userId);
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
        name = rs.getString("name");
        email = rs.getString("email");
        phone = rs.getString("phone");
        city = rs.getString("city");
    }
} catch(Exception e) { e.printStackTrace(); }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Profile</title>

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
#content{margin-left:260px;padding:110px 30px 40px;display:flex;justify-content:center;}

.card-box{
    background:#fff;border-radius:16px;
    padding:35px 40px;
    box-shadow:0 12px 30px rgba(0,0,0,0.1);
    width:100%;max-width:520px;
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
   IPHONE – NAVBAR FIX
   ========================= */
@media (max-width: 768px) {

    .navbar-custom {
        margin-left: 0;
        width: 100%;
        padding: 0 14px;
    }

    .navbar-custom .d-flex {
        flex: 1;
    }

    .navbar-right {
        font-size: 13px;
        white-space: nowrap;
    }
}
/* =========================
   IPHONE – CONTENT FIX
   ========================= */
@media (max-width: 768px) {

    #content {
        margin-left: 0;
        padding: 30px 14px 24px; /* navbar-safe spacing */
    }

    .card-box {
        padding: 22px 18px;
        border-radius: 14px;
    }
}
@media (max-width: 480px) {

    .card-box h4 {
        font-size: 18px;
    }

    .card-box label {
        font-size: 13px;
    }

    .form-control {
        font-size: 14px;
        padding: 10px 12px;
    }

    button.btn {
        padding: 12px;
        font-size: 15px;
        border-radius: 10px;
    }
}

</style>
</head>

<body>
<%
String updated = request.getParameter("updated");
String error = request.getParameter("error");
%>

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
            <li>
                <a href="viewNewsUser.jsp">
                    <i class="fas fa-eye"></i> View News
                </a>
            </li>

            <li><a href="userCrowdView.jsp"><i class="fas fa-users"></i> <span>Crowd Density</span></a></li>

            <li class="active"><a href="myProfile.jsp"><i class="fas fa-user-secret"></i> <span>My Profile</span></a></li>
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

<% if ("true".equals(updated)) { %>
    <div class="alert alert-success text-center mx-auto mb-3">
        <i class="fas fa-check-circle"></i> Profile updated successfully!
    </div>
<% } %>

<% if ("true".equals(error)) { %>
    <div class="alert alert-danger text-center mx-auto mb-3">
        <i class="fas fa-times-circle"></i> Something went wrong. Please try again.
    </div>
<% } %>

<div id="content">
    <div class="card-box">

        <h4 class="text-center mb-4">My Profile</h4>

        <form action="<%=request.getContextPath()%>/UpdateProfileServlet" method="post">

            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control" value="<%=name%>" required>
            </div>

            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" value="<%=email%>" required>
            </div>

            <div class="mb-3">
                <label>Phone</label>
                <input type="text" name="phone" class="form-control" value="<%=phone%>">
            </div>

            <div class="mb-4">
                <label>City</label>
                <input type="text" name="city" class="form-control" value="<%=city%>">
            </div>

            <button class="btn btn-primary w-100">Update Profile</button>

        </form>
    </div>
</div>
<script>
setTimeout(() => {
    const alert = document.querySelector('.alert');
    if(alert) alert.style.display = 'none';
}, 3000);
</script>
<script>
if (window.history.replaceState) {
    window.history.replaceState(null, null, window.location.pathname);
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
