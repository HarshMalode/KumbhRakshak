<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>Welcome | KumbhRakshak</title>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/fontawesome-all.css">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Great+Vibes&family=Sekuya&display=swap" rel="stylesheet">


<style>
.main-box {
    margin: 0 auto;
}
.main-box {
    margin-top: 150px;   /* natural top spacing */
}
.great-vibes-regular {
  font-family: "Great Vibes", cursive;
  font-weight: 400;
  font-style: normal;
}

.sekuya-regular {
  font-family: "Sekuya", system-ui;
  font-weight: 400;
  font-style: normal;
}
 
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    min-height: 100vh;
    background:
      linear-gradient(rgba(10,20,40,0.6), rgba(10,20,40,0.75)),
      url("<%=request.getContextPath()%>/images/kumbh.png");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;   /* ✅ IMPORTANT */
    background-attachment: fixed;   /* ✅ IMPORTANT */
}



.main-box {
    max-width: 1100px;
    width: 100%;
    text-align: center;
    padding: 30px;
}

.title {
    font-size: 60px;
    font-weight: 400;
    color: #ffffff;
    margin-bottom: 5px;
    letter-spacing: 1px;
     font-family: "Sekuya", system-ui;
}

.subtitle {
    font-size: 16px;
    color: #ffffff;
    margin-bottom: 50px;
}

.cards {
    display: flex;
    gap: 30px;
    justify-content: center;
    flex-wrap: wrap;
}

.login-card {
    background: #ffffff;
    border-radius: 14px;
    padding: 35px 25px;
    width: 280px;
    text-align: center;
    color: inherit;
    text-decoration: none;
    box-shadow: 0 8px 25px rgba(0,0,0,0.12);
    transition: all 0.25s ease;
    border-top: 5px solid transparent;
}

.login-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 14px 35px rgba(0,0,0,0.18);
}

.login-card i {
    font-size: 46px;
    margin-bottom: 18px;
}

.admin { color: #0d6efd; }
.branch { color: #0d6efd; }
.user { color: #0d6efd; }

.login-card.admin-card { border-top-color: #0d6efd; }
.login-card.branch-card { border-top-color: #0d6efd; }
.login-card.user-card { border-top-color: #0d6efd; }

.login-card h4 {
    font-size: 18px;
    font-weight: 600;
    margin-bottom: 8px;
    color: #1e2a47;
}

.login-card p {
    font-size: 14px;
    color: #666;
}

.footer-text {
    margin-top: 50px;
    font-size: 17px;
    color: #777;
}
/* =========================
   MOBILE RESPONSIVE FIXES
   Works till 300px width
   ========================= */

/* Tablets & small devices */
@media (max-width: 768px) {
    .title {
        font-size: 42px;
    }

    .subtitle {
        font-size: 15px;
        margin-bottom: 35px;
    }

    .cards {
        gap: 20px;
    }
}

/* Mobile phones */
@media (max-width: 480px) {
    body {
        padding: 10px;
    }

    .main-box {
        padding: 20px 10px;
    }

    .title {
        font-size: 32px;
    }

    .subtitle {
        font-size: 14px;
        margin-bottom: 30px;
    }

    .cards {
        flex-direction: column;
        align-items: center;
        gap: 18px;
    }

    .login-card {
        width: 100%;
        max-width: 320px;
        padding: 28px 20px;
    }

    .login-card i {
        font-size: 40px;
    }

    .login-card h4 {
        font-size: 16px;
    }

    .login-card p {
        font-size: 13px;
    }

    .footer-text {
        font-size: 14px;
        margin-top: 35px;
    }
}

/* Extra small devices (300px – 360px) */
@media (max-width: 360px) {
    .title {
        font-size: 26px;
    }

    .subtitle {
        font-size: 13px;
    }

    .login-card {
        padding: 24px 16px;
    }

    .login-card i {
        font-size: 36px;
    }

    .footer-text {
        font-size: 13px;
    }
}
/* =========================
   NO-SCROLL MOBILE VIEW
   ========================= */

@media (max-width: 430px) {
    @media (max-width: 430px) {

    html, body {
        min-height: 100%;
        overflow-y: auto;       /* ✅ allow vertical scroll */
        overflow-x: hidden;
        -webkit-overflow-scrolling: touch; /* smooth iOS scroll */
    }

    body {
        padding: 0;
    }

      .main-box {
        min-height: 100vh;
        padding: 16px 10px 30px; /* bottom padding for scroll */
        display: flex;
        flex-direction: column;
        justify-content: flex-start; /* 🔑 not center */
    }
}

    body {
        padding: 0;
    }

    .main-box {
        height: 100vh;
        padding: 16px 10px;
        display: flex;
        flex-direction: column;
        justify-content: center; /* vertical centering */
    }

    .title {
        font-size: 36px;
        margin-bottom: 2px;
    }

    .subtitle {
        font-size: 13px;
        margin-bottom: 20px;
    }

    .cards {
        flex-direction: column;
        gap: 12px;
    }

    .login-card {
        width: 100%;
        max-width: 280px;
        padding: 16px 14px;   /* 🔽 reduced height */
        margin: 0 auto;
    }

    .login-card i {
        font-size: 30px;
        margin-bottom: 10px;
    }

    .login-card h4 {
        font-size: 14px;
        margin-bottom: 4px;
    }

    .login-card p {
        font-size: 12px;
        line-height: 1.3;
    }

    .footer-text {
        font-size: 12px;
        margin-top: 14px;
    }
}

/* EXTRA SMALL (iPhone SE / 300px) */
@media (max-width: 360px) {
    .title {
        font-size: 34px;
    }

    .login-card {
        padding: 14px 12px;
    }

    .footer-text {
        margin-top: 10px;
    }
}

/* =========================
   FIX IPHONE CONTENT PUSH UP
   ========================= */
@media (max-width: 480px) {

    body {
        display: block;              /* 🔑 stop flex centering */
        min-height: 100%;
        overflow-y: auto;
        -webkit-overflow-scrolling: touch;
    }

    .main-box {
        min-height: auto;            /* 🔑 remove 100vh trap */
        padding: 80px 12px 40px;     /* 🔑 top + bottom space */
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start; /* 🔑 natural flow */
    }
}
/* =========================
   NO-SCROLL IPHONE FIX
   ========================= */
@media (max-width: 430px) {

    html, body {
        height: 100%;
        overflow: hidden; /* ❌ no scrolling */
    }

    body {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .main-box {
        height: 100vh;
        padding: 12px 10px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        gap: 10px;
    }

    /* Title */
    .title {
        font-size: 24px;
        margin-bottom: 2px;
    }

    .subtitle {
        font-size: 12px;
        margin-bottom: 12px;
    }

    /* Cards container */
    .cards {
        gap: 10px;
    }

    /* Cards */
    .login-card {
        max-width: 250px;
        padding: 14px 12px;
        border-radius: 12px;
    }

    /* Icons */
    .login-card i {
        font-size: 26px;
        margin-bottom: 6px;
    }

    /* Card text */
    .login-card h4 {
        font-size: 14px;
        margin-bottom: 3px;
    }

    .login-card p {
        font-size: 11px;
        line-height: 1.3;
    }

    /* Footer */
    .footer-text {
        font-size: 11px;
        margin-top: 10px;
    }
}
/* =========================
   MOBILE ONLY FIX (PHONES)
   DESKTOP / TABLET UNCHANGED
   ========================= */
@media (max-width: 600px) {

    /* Stop flex centering ONLY on mobile */
    body {
        display: block;
        overflow-x: hidden;
        overflow-y: auto;
        -webkit-overflow-scrolling: touch;
    }

    .main-box {
        padding: 24px 12px 20px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: flex-start;
    }

    /* Text scaling */
    .title {
        font-size: 28px;
        margin-bottom: 4px;
    }

    .subtitle {
        font-size: 13px;
        margin-bottom: 18px;
    }

    /* Cards */
    .cards {
        flex-direction: column;
        gap: 12px;
    }

    .login-card {
        width: 100%;
        max-width: 270px;
        padding: 14px 16px;
        border-radius: 14px;
    }

    .login-card i {
        font-size: 28px;
        margin-bottom: 8px;
    }

    .login-card h4 {
        font-size: 14px;
        margin-bottom: 4px;
    }

    .login-card p {
        font-size: 12px;
        line-height: 1.4;
    }

    .footer-text {
        font-size: 12px;
        margin-top: 16px;
        text-align: center;
    }
}

/* =========================
   MOBILE CENTER FIX (ONLY MOBILE)
   ========================= */
@media (max-width: 480px) {

    html, body {
        height: 100%;
        overflow: hidden;              /* no scroll */
    }

    body {
        display: flex;
        align-items: center;           /* vertical center */
        justify-content: center;       /* horizontal center */
        background-repeat: no-repeat;
        background-size: cover;
        background-position: center;
    }

    .main-box {
        padding: 16px 12px;
        max-width: 320px;
        width: 100%;
    }
}


</style>


</head>

<body>

<div class="main-box">

    <div class="title">KumbhaRakshak</div>
    <div class="subtitle">Intelligent monitoring for safer public spaces</div>

    <div class="cards">

        <a href="Adminlogin.jsp" class="login-card admin-card">
            <i class="fas fa-shield-alt admin"></i>
            <h4>Admin Login</h4>
            <p>System management, analytics and configuration</p>
        </a>

        <a href="Branchlogin.jsp" class="login-card branch-card">


            <i class="fas fa-building branch"></i>
            <h4>Branch Login</h4>
            <p>Police branch operations and incident handling</p>
        </a>

        <a href="userLogin.jsp" class="login-card user-card">
            <i class="fas fa-user user"></i>
            <h4>User Login</h4>
            <p>View crowd levels and safe visiting times for your safety</p>
        </a>

    </div>

    <div class="footer-text">
        © 2026 Crowd Monitoring System — All rights reserved
    </div>

</div>

</body>
</html>
