<%@page import="java.sql.*"%>
<%@page import="DBConnection.DbClass"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Logs</title>

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

/* ===== MASTER SIDEBAR ===== */
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

.page-title {
    font-size: 26px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #1e3a8a;
}

.card-box {
    background: #ffffff;
    padding: 25px;
    border-radius: 14px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.08);
}

.search-box {
    width: 320px;
    margin-bottom: 15px;
}

thead {
    background: #1e3a8a;
    color: #ffffff;
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
   IPHONE VIEW – LOGS TABLE
   ========================= */
@media (max-width: 480px) {

    /* Remove sidebar gap */
    #content,
    .navbar-custom {
        margin-left: 0;
    }

    /* Search box full width */
    .search-box {
        width: 100%;
    }

    /* Hide table header */
    #displaytable thead {
        display: none;
    }

    /* Convert table to blocks */
    #displaytable,
    #displaytable tbody,
    #displaytable tr {
        display: block;
        width: 100%;
    }

    /* Card style rows */
    #displaytable tr {
        background: #ffffff;
        margin-bottom: 14px;
        padding: 14px;
        border-radius: 14px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.1);
    }

    /* Cells */
    #displaytable td {
        display: block;
        border: none;
        text-align: left;
        padding: 6px 4px;
        font-size: 14px;
    }

    /* Labels */
    #displaytable td::before {
        content: attr(data-label);
        display: block;
        font-weight: 600;
        font-size: 12px;
        color: #1e3a8a;
        margin-bottom: 2px;
    }

    /* Remove table borders */
    #displaytable {
        border: none;
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

<!-- ===== SIDEBAR ===== -->
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
        <li class="active"><a href="findLogAdmin.jsp"><i class="fas fa-users"></i>View Logs</a></li>
        <li><a href="adminCrowdView.jsp"><i class="fas fa-newspaper"></i>Crowd Density</a></li>
        <li><a href="Adminlogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

<!-- ===== NAVBAR ===== -->
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

<!-- ===== CONTENT ===== -->
<div id="content">

    <div class="page-title">Detection Logs</div>

    <input type="text" id="myInput" class="form-control search-box"
           placeholder="Search by Location..." onkeyup="searchTable()">

    <div class="card-box">
        <div class="table-responsive">
            <table id="displaytable" class="table table-bordered table-hover text-center">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Location</th>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Time</th>
                    </tr>
                </thead>
                <tbody>
                 <%
                    Connection conn = DbClass.getConnect();
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM findlog");
                    ResultSet rs = ps.executeQuery();

                    while(rs.next()){
                %>
                    <tr>
    <td data-label="Name"><%= rs.getString(2) %></td>
    <td data-label="Location"><%= rs.getString(3) %></td>
    <td data-label="Type"><%= rs.getString(4) %></td>
    <td data-label="Date"><%= rs.getString(5) %></td>
    <td data-label="Time"><%= rs.getString(6) %></td>
</tr>

                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
function searchTable() {
    let input = document.getElementById("myInput").value.toUpperCase();
    let rows = document.getElementById("displaytable").getElementsByTagName("tr");

    for (let i = 1; i < rows.length; i++) {
        let td = rows[i].getElementsByTagName("td")[1];
        rows[i].style.display =
            td && td.innerHTML.toUpperCase().includes(input) ? "" : "none";
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
