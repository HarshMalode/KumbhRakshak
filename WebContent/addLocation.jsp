<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Location</title>

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
/* ==================================
   FINAL CLEAN MOBILE FORM (ADD LOCATION)
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

/* Sidebar + navbar mobile */
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

    .form-card {
        background: #ffffff;
        border-radius: 14px;
        padding: 18px 16px;
        box-shadow: 0 8px 22px rgba(0,0,0,0.08);
    }

    .page-title {
        font-size: 20px;
        text-align: center;
        margin-bottom: 18px;
        font-weight: 600;
    }

    /* ONE FIELD PER ROW */
    .form-row {
        flex-direction: column;
        gap: 14px;
        margin-bottom: 14px;
    }

    .form-group {
        width: 100%;
    }

    .form-group label {
        font-size: 13px;
        font-weight: 600;
        color: #1e3a8a;
    }

    .form-control,
    textarea {
        width: 100%;
        font-size: 14px;
        padding: 10px;
        border-radius: 10px;
    }

    textarea {
        resize: none;
    }

    /* File input fix for iOS */
    input[type="file"] {
        padding: 8px;
    }

    /* Full width button */
    .btn-primary {
        width: 100%;
        padding: 12px;
        font-size: 15px;
        border-radius: 10px;
    }
}

/* Small phones (iPhone SE) */
@media (max-width: 360px) {

    .page-title {
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

<script>
function extractLatLng() {
    const url = document.getElementById("map_url").value;
    const regex = /@(-?\d+\.\d+),(-?\d+\.\d+)/;
    const match = url.match(regex);

    if (match) {
        document.getElementById("latitude").value = match[1];
        document.getElementById("longitude").value = match[2];
    } else {
        alert("Invalid Google Maps URL. Please paste a link containing coordinates.");
    }
}
</script>
</head>

<body>

<!-- Sidebar -->
<nav id="sidebar">
    <div class="sidebar-header">
       KumbhaRakshak
        <span>Admin Panel</span>
    </div>
    <ul>
        <li><a href="welcomeAdmin.jsp"><i class="fas fa-th-large"></i> Dashboard</a></li>
        <li><a href="addPoliceHelpline.jsp"><i class="fas fa-plus-circle"></i> Add Police Camps</a></li>
        <li><a href="viewPoliceHelpline.jsp"><i class="fas fa-eye"></i> View Police Camps</a></li>
        <li class="active"><a href="addLocation.jsp"><i class="fas fa-plus-circle"></i> Add Location</a></li>
        <li><a href="viewLocations.jsp"><i class="fas fa-eye"></i> View Location</a></li>
        <li><a href="addNews.jsp"><i class="fas fa-plus-circle"></i> Add News</a></li>
        <li><a href="viewNewsAdmin.jsp"><i class="fas fa-eye"></i> View News</a></li>
        <li><a href="viewmissingpeopleadmin.jsp"><i class="fas fa-eye"></i> Missing People</a></li>
        <li><a href="findLogAdmin.jsp"><i class="fas fa-users"></i> View Logs</a></li>
        <li><a href="adminCrowdView.jsp"><i class="fas fa-newspaper"></i>Crowd Density</a></li>
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

<!-- Content -->
<div id="content">
    <div class="form-card">
        <div class="page-title">Add Location</div>

        <form action="AddLocation" method="post" enctype="multipart/form-data">

            <div class="form-row">
                <div class="form-group">
                    <label>Location Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="form-group">
                    <label>Upload Image</label>
                    <input type="file" name="image_file" class="form-control" required>
                </div>
            </div>

            <div class="form-group mb-3">
                <label>Description</label>
                <textarea name="description" rows="2" class="form-control" required></textarea>
            </div>

            <div class="form-group mb-3">
                <label>Paste Google Maps Link</label>
                <input type="text" id="map_url" class="form-control"
                       placeholder="https://www.google.com/maps/.../@22.7196,75.8577,18z"
                       onblur="extractLatLng()" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label>Latitude</label>
                    <input type="text" id="latitude" name="latitude" class="form-control" readonly required>
                </div>
                <div class="form-group">
                    <label>Longitude</label>
                    <input type="text" id="longitude" name="longitude" class="form-control" readonly required>
                </div>
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary">Save Location</button>
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
