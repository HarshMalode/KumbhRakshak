<%@ page import="java.sql.*, DBConnection.DbClass" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>View Locations</title>

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

/* ===== SIDEBAR ===== */
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

/* ===== CARD ===== */
.form-card {
    background: #ffffff;
    border-radius: 16px;
    padding: 30px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.1);
}

.page-title {
    font-size: 26px;
    font-weight: 600;
}

/* ===== GRID ===== */
.media-grid {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-top: 25px;
}

.media-item {
    background: #ffffff;
    border-radius: 14px;
    overflow: hidden;
    box-shadow: 0 8px 18px rgba(0,0,0,0.08);
    position: relative;
    transition: all 0.3s ease;
}
.media-item:hover {
    transform: translateY(-6px);
    box-shadow: 0 16px 35px rgba(37, 99, 235, 0.25);
}

.media-item img {
    width: 100%;
    height: 220px;
    object-fit: cover;
}

.media-title {
    padding: 10px;
    font-size: 14px;
    font-weight: 500;
    text-align: center;
}

/* ===== ACTIONS ===== */
.media-actions {
    position: absolute;
    top: 12px;
    right: 12px;
    display: flex;
    gap: 8px;

    opacity: 0;
    transform: translateY(-10px);
    pointer-events: none;
    transition: all 0.25s ease;
}
.media-item:hover .media-actions {
    opacity: 1;
    transform: translateY(0);
    pointer-events: auto;
}

.media-actions a {
    background: #ffffff;
    border-radius: 50%;
    width: 34px;
    height: 34px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #1e3a8a;
    font-size: 14px;
    box-shadow: 0 6px 14px rgba(0,0,0,0.15);
    transition: all 0.2s ease;
}

.media-actions a:hover {
    background: #2563eb;
    color: #ffffff;
    transform: scale(1.08);
}
/* ==================================
   FINAL IPHONE VIEW – LOCATIONS PAGE
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
   IPHONE LAYOUT
   ========================= */
@media (max-width: 480px) {

    html, body {
        overflow-x: hidden;
    }

    #content {
        padding: 12px;
    }

    .form-card {
        padding: 16px;
        border-radius: 14px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.08);
    }

    /* Header section */
    .form-card > .d-flex {
        flex-direction: column;
        align-items: stretch;
        gap: 12px;
    }

    .page-title {
        font-size: 20px;
        text-align: center;
    }

    .btn-primary.btn-sm {
        width: 100%;
    }

    /* Search input */
    #locationSearch {
        margin-top: 10px;
    }

    /* GRID → SINGLE COLUMN */
    .media-grid {
        grid-template-columns: 1fr;
        gap: 16px;
    }

    /* Card */
    .media-item {
        border-radius: 16px;
        overflow: hidden;
        box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    }

    .media-item img {
        height: 180px;
    }

    .media-title {
        font-size: 15px;
        font-weight: 600;
        padding: 12px;
        text-align: left;
    }

    /* Actions always visible on mobile */
    .media-actions {
        position: static;
        opacity: 1;
        transform: none;
        pointer-events: auto;
        justify-content: flex-end;
        padding: 10px 12px 12px;
    }

    .media-actions a {
        width: 38px;
        height: 38px;
        font-size: 15px;
    }
}

/* Small phones (iPhone SE) */
@media (max-width: 360px) {

    .media-item img {
        height: 160px;
    }

    .media-title {
        font-size: 14px;
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
        KumbhRakshak
        <span>Branch Panel</span>
    </div>
    <ul>
        <li><a href="welcomeBranch.jsp"><i class="fas fa-th-large"></i> Dashboard</a></li>
        <li><a href="addMissingPeople.jsp"><i class="fas fa-users"></i> Add Missing People</a></li>
        <li><a href="viewmissingpeople.jsp"><i class="fas fa-eye"></i> View Missing People</a></li>
        <li class="active"><a href="policeViewLocations.jsp"><i class="fas fa-map-marker-alt"></i> View Location</a></li>
        <li><a href="viewNewsPolice.jsp"><i class="fas fa-newspaper"></i> View News</a></li>
        <li><a href="findLogBranch.jsp"><i class="fas fa-list"></i> View Logs</a></li>
        <li><a href="policeCrowdView.jsp"><i class="fas fa-chart-area"></i> Crowd Density</a></li>
        <li><a href="Branchlogin.jsp"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
    </ul>
</nav>

<!-- ===== NAVBAR ===== -->
<div class="sidebar-overlay"></div>

<!-- Navbar -->
<div class="navbar-custom">
    <div class="d-flex align-items-center gap-3">
        <!-- Hamburger (mobile only) -->
        <i class="fas fa-bars menu-toggle"></i>
        
    </div>

    <div class="navbar-right">
        <i class="fas fa-user-circle"></i> Branch
    </div>
</div>


<!-- ===== CONTENT ===== -->
<div id="content">
    <div class="form-card">

        <div class="d-flex justify-content-between align-items-center">
            <div class="page-title">Locations</div>
        </div>
 <input type="text"
       id="locationSearch"
       class="form-control mt-3"
       placeholder="Search location..."
       onkeyup="filterLocations()"
       style="max-width: 100%;">
        
        <div class="media-grid">

            <%
                Connection conn = DbClass.getConnect();
                Statement st = conn.createStatement();
                ResultSet rs = st.executeQuery("SELECT * FROM locations");
                while(rs.next()) {
            %>

            <div class="media-item">
                <img src="<%=request.getContextPath()%>/<%=rs.getString("image_url")%>">

                <div class="media-title"><%= rs.getString("name") %></div>

                <div class="media-actions">
                    <a href="https://www.google.com/maps?q=<%=rs.getString("latitude")%>,<%=rs.getString("longitude")%>" target="_blank">
                        <i class="fas fa-map-marker-alt"></i>
                    </a>
                </div>
            </div>

            <% } %>

        </div>
    </div>
</div>
<script>
function filterLocations() {
    var input = document.getElementById("locationSearch");
    var filter = input.value.toUpperCase();
    var items = document.getElementsByClassName("media-item");

    for (var i = 0; i < items.length; i++) {
        var title = items[i].getElementsByClassName("media-title")[0];
        if (title) {
            items[i].style.display =
                title.innerText.toUpperCase().indexOf(filter) > -1
                ? ""
                : "none";
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
