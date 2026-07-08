<%@ page import="java.sql.*, DBConnection.DbClass" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Police Helpline</title>

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

/* Content */
#content {
    margin-left: 260px;
    padding: 30px;
}

/* Card */
.card-box {
    background: #ffffff;
    border-radius: 16px;
    padding: 25px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.1);
}

/* Table */
.table thead {
    background: #1e3a8a;
    color: #fff;
}

.table th, .table td {
    text-align: center;
    vertical-align: middle;
    font-size: 14px;
}

.table tbody tr:hover {
    background: #f0f4ff;
}

/* Buttons */
.btn-action {
    padding: 6px 14px;
    border-radius: 6px;
    font-size: 13px;
    color: #fff;
    text-decoration: none;
}

.btn-edit { background: #2563eb; }
.btn-delete { background: #dc3545; }

/* =========================
   IPHONE RESPONSIVE TABLE
   ========================= */

/* =========================
   CLEAN MOBILE TABLE UI
   ========================= */

@media (max-width: 480px) {

    html, body {
        overflow-x: hidden;
    }

    .navbar-custom,
    #content {
        margin-left: 0;
    }

    #content {
        padding: 12px;
    }

    .card-box {
        padding: 10px;
        background: transparent;
        box-shadow: none;
    }

    /* Hide table header */
    table thead {
        display: none;
    }

    table,
    tbody,
    tr {
        display: block;
        width: 100%;
    }

    /* Each row becomes a clean card */
    table tr {
        background: #ffffff;
        border-radius: 14px;
        padding: 14px 14px 10px;
        margin-bottom: 16px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.08);
    }

    table td {
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 8px 0;
        border: none;
        font-size: 14px;
    }

    /* Label (LEFT) */
    table td::before {
        content: attr(data-label);
        font-weight: 600;
        color: #1e3a8a;
        text-align: left;
    }

    /* Value (RIGHT) */
    table td {
        color: #111827;
    }

    /* Soft divider */
    table td:not(:last-child) {
        border-bottom: 1px solid #e5e7eb;
    }

    /* Actions row */
    table td:last-child {
        justify-content: flex-end;
        gap: 12px;
        padding-top: 12px;
        border-bottom: none;
    }

    .btn-action {
        font-size: 13px;
        padding: 6px 14px;
        border-radius: 8px;
    }
}

/* EXTRA SMALL (iPhone SE) */
@media (max-width: 360px) {

    table td {
        font-size: 13px;
    }

    table td::before {
        font-size: 13px;
    }
}




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
/* =========================
   MOBILE SIDEBAR FIX
   ========================= */

@media (max-width: 992px) {

    /* Hide sidebar by default */
    #sidebar {
        transform: translateX(-100%);
        transition: transform 0.3s ease;
        z-index: 2000;
    }

    /* Show when active */
    #sidebar.active {
        transform: translateX(0);
    }

    /* Remove desktop spacing */
    .navbar-custom,
    #content {
        margin-left: 0;
    }

    /* Show hamburger */
    .menu-toggle {
        display: block;
        font-size: 22px;
        cursor: pointer;
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
        <li class="active"><a href="viewPoliceHelpline.jsp"><i class="fas fa-eye"></i> View Police Camps</a></li>
         <li><a href="addLocation.jsp"><i class="fas fa-plus-circle"></i> Add Location</a></li>
        <li><a href="viewLocations.jsp"><i class="fas fa-eye"></i> View Location</a></li>
        <li><a href="addNews.jsp"><i class="fas fa-plus-circle"></i> Add News</a></li>
        <li><a href="viewNewsAdmin.jsp"><i class="fas fa-eye"></i> View News</a></li>
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
    <div class="card-box">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Station Name</th>
                        <th>Officer Name</th>
                        <th>Helpline No</th>
                        <th>Emergency No</th>
                        <th>Location</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Pincode</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    Connection conn = DbClass.getConnect();
                    PreparedStatement ps = conn.prepareStatement("SELECT * FROM police_helpline");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                %>
                    <tr>
                       <td data-label="ID"><%=rs.getInt("id")%></td>
<td data-label="Station Name"><%=rs.getString("station_name")%></td>
<td data-label="Officer Name"><%=rs.getString("officer_name")%></td>
<td data-label="Helpline No"><%=rs.getString("helpline_no")%></td>
<td data-label="Emergency No"><%=rs.getString("emergency_no")%></td>
<td data-label="Location"><%=rs.getString("location")%></td>
<td data-label="City"><%=rs.getString("city")%></td>
<td data-label="State"><%=rs.getString("state")%></td>
<td data-label="Pincode"><%=rs.getString("pincode")%></td>
<td data-label="Actions">
    <a class="btn-action btn-edit" href="EditPoliceHelpline?id=<%=rs.getInt("id")%>">Edit</a>
    <a class="btn-action btn-delete" href="DeletePoliceHelpline?id=<%=rs.getInt("id")%>">Delete</a>
</td>

                    </tr>
                <% } %>
                </tbody>
            </table>
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
