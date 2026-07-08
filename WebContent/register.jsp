<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Registration | Crowd Prediction</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">

    <link rel="stylesheet" href="css/font-awesome.css">
    <link href="https://fonts.googleapis.com/css2?family=Sekuya&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
    * { box-sizing: border-box; }

    body {
        margin: 0;
         font-family: 'Poppins', sans-serif;
        min-height: 100vh;
        padding: 20px;
        background:
          linear-gradient(rgba(10,20,40,0.65), rgba(10,20,40,0.8)),
          url("<%=request.getContextPath()%>/images/crowd1.png");
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .register-container {
        background: #ffffff;
        padding: 50px 36px 40px;
        border-radius: 18px;
        width: 100%;
        max-width: 450px;
        overflow: hidden;
        box-shadow: 0 15px 40px rgba(0,0,0,0.35);
        text-align: center;
        animation: fadeIn 0.6s ease;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(12px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .register-title {
        font-size: 30px;
        font-weight: 600;
        margin-bottom: 10px;
        color: #1e2a47;
    }

    .register-sub {
        font-size: 14px;
        color: #666;
        margin-bottom: 28px;
    }

    .field-group {
        position: relative;
        margin-bottom: 20px;
    }

    .field-group input {
        width: 100%;
        padding: 13px 14px;
        border-radius: 10px;
        border: 1px solid #ddd;
        font-size: 14px;
        outline: none;
        transition: 0.2s;
        
    }

     .field-group input:focus {
        border-color: #0d6efd;
       box-shadow: 0 0 0 2px rgba(13,110,253,0.15);
    }

    .register-btn {
        width: 100%;
        padding: 13px;
        border: none;
        border-radius: 10px;
        background: linear-gradient(135deg, #0d6efd, #084298);
        color: #fff;
        font-size: 15px;
        cursor: pointer;
        transition: 0.3s;
    }

    .register-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(253,126,20,0.35);
    }

    .error-msg {
        margin-bottom: 15px;
        font-size: 13px;
        color: #0d6efd;
    }

    .link-area {
        margin-top: 20px;
        font-size: 13px;
    }

    .link-area a {
        color: #0d6efd;
        text-decoration: none;
    }

    .link-area a:hover {
        text-decoration: underline;
    }
    
    /* =========================
   IPHONE VIEW – USER REGISTER
   ========================= */
@media (max-width: 430px) {

    body {
        padding: 12px;
        align-items: center;
        justify-content: center;
    }

    .register-container {
        padding: 28px 22px 24px;
        max-width: 340px;
        border-radius: 14px;
    }

    .register-title {
        font-size: 22px;
        margin-bottom: 6px;
    }

    .register-sub {
        font-size: 12px;
        margin-bottom: 20px;
    }

    .field-group {
        margin-bottom: 14px;
    }

    .field-group input {
        font-size: 14px;
        padding: 11px 12px;
        border-radius: 8px;
    }

    .register-btn {
        padding: 11px;
        font-size: 14px;
        border-radius: 8px;
        margin-top: 6px;
    }

    .error-msg {
        font-size: 12px;
        margin-bottom: 12px;
    }

    .link-area {
        font-size: 12px;
        margin-top: 16px;
    }
}

/* EXTRA SMALL (iPhone SE / 360px) */
@media (max-width: 360px) {

    .register-container {
        padding: 24px 18px 20px;
    }

    .register-title {
        font-size: 20px;
    }

    .register-sub {
        font-size: 11px;
    }
}
    
    </style>
</head>

<body>

<div class="register-container">
    <div class="register-title">User Registration</div>
    <div class="register-sub">Create your account to continue</div>

    <%
    String error = request.getParameter("error");
    if ("duplicate".equals(error)) {
    %>
        <div class="error-msg">Email or Mobile number already exists!</div>
    <%
    } else if ("server".equals(error)) {
    %>
        <div class="error-msg">Something went wrong. Try again.</div>
    <%
    }
    %>

    <form action="UserRegisterServlet" method="post">
        <div class="field-group">
            <input type="text" name="name" placeholder="Full Name" required>
        </div>

        <div class="field-group">
            <input type="email" name="email" placeholder="Email ID" required>
        </div>

        <div class="field-group">
            <input type="text" name="phone" placeholder="Mobile Number" maxlength="10" required>
        </div>

        <div class="field-group">
            <input type="text" name="city" placeholder="City" required>
        </div>

        <div class="field-group">
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <button type="submit" class="register-btn">Register</button>
    </form>

    <div class="link-area">
        <a href="userLogin.jsp">Already have an account? Login</a><br>
        <a href="welcome.jsp">Back to Home</a>
    </div>
</div>

</body>
</html>
