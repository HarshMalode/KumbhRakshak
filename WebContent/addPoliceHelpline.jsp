<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Police Helpline</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/fontawesome-all.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

<style>
* { box-sizing: border-box; }
*, *::before, *::after {
    box-sizing: border-box;
}

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

/* Form Card */
.form-card {
    background: #ffffff;
    border-radius: 16px;
    padding: 35px 40px;
    box-shadow: 0 12px 30px rgba(0,0,0,0.1);
}

.page-title {
    font-size: 26px;
    font-weight: 600;
    margin-bottom: 25px;
}

.form-row {
    display: flex;
    gap: 20px;
    margin-bottom: 20px;
}

.form-row .form-group {
    flex: 1;
}

.form-group label {
    font-weight: 500;
    font-size: 14px;
    margin-bottom: 6px;
}

.form-control {
    border-radius: 8px;
    font-size: 14px;
}

.btn-primary {
    padding: 12px 30px;
    font-size: 15px;
    border-radius: 8px;
}


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
   MOBILE FULL-HEIGHT FORM FIX
   ========================= */

@media (max-width: 480px) {

    html, body {
        height: 100%;
    }

    /* Content should fill screen */
    #content {
        min-height: calc(100vh - 56px); /* navbar height */
        display: flex;
        flex-direction: column;
        padding: 12px;
    }

    /* Form card fills available height */
    .form-card {
        flex: 1;
        padding: 18px 16px;
        border-radius: 12px;
        display: flex;
        flex-direction: column;
    }

    /* Make form scrollable if content is large */
    .form-card form {
        flex: 1;
        overflow-y: auto;
    }

    /* Stack form fields vertically */
    .form-row {
        flex-direction: column;
        gap: 14px;
        margin-bottom: 14px;
    }

    .form-group label {
        font-size: 13px;
    }

    .form-control,
    textarea {
        font-size: 14px;
        padding: 10px;
    }

    /* Button stays visible */
    .text-center {
        margin-top: 16px;
        padding-bottom: 10px;
    }

    .btn-primary {
        width: 100%;
        padding: 12px;
        font-size: 15px;
    }
}

/* EXTRA SMALL (300px – iPhone SE) */
@media (max-width: 360px) {

    .page-title {
        font-size: 18px;
        margin-bottom: 15px;
    }

    .form-card {
        padding: 14px 12px;
    }
}
/* =========================
   FORM BORDER OVERFLOW FIX
   ========================= */

@media (max-width: 480px) {

    .form-card {
        width: 100%;
        max-width: 100%;
        overflow: hidden; /* 🔑 prevents spill */
    }

    .form-row {
        width: 100%;
        margin: 0;
        padding: 0;
    }

    .form-group {
        width: 100%;
        margin: 0;
    }

    .form-control,
    textarea {
        width: 100%;
        max-width: 100%;
    }

    label {
        padding-left: 2px; /* prevents clipped text */
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
        <li class="active"><a href="addPoliceHelpline.jsp"><i class="fas fa-plus-circle"></i> Add Police Camps</a></li>
        <li><a href="viewPoliceHelpline.jsp"><i class="fas fa-eye"></i> View Police Camps</a></li>
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
    <div class="form-card">
        <div class="page-title">Add Police Helpline</div>

        <form action="AddPoliceHelpline" method="post">

            <div class="form-row">
                <div class="form-group">
                    <label>Police Station Name</label>
                    <input type="text" name="station_name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Officer In Charge</label>
                    <input type="text" name="officer_name" class="form-control" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Helpline Number</label>
                    <input type="text" name="helpline_no" maxlength="10" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Emergency Number</label>
                    <input type="text" name="emergency_no" maxlength="10" class="form-control" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Email Address</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Location</label>
                    <input type="text" name="location" class="form-control" required>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>State</label>
                    <input type="text" name="state" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>City</label>
                    <input type="text" name="city" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Pincode</label>
                    <input type="text" name="pincode" maxlength="6" class="form-control" required>
                </div>
            </div>

            <div class="form-group mb-4">
                <label>Full Address</label>
                <textarea name="address" rows="2" class="form-control" required></textarea>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Save Details</button>
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
