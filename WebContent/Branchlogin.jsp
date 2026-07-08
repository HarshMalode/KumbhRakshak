<!DOCTYPE html>
<html lang="en">
<head>
    <title>Branch Login | Crowd Prediction</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">

    <link rel="stylesheet" href="css/font-awesome.css">
    <link href="https://fonts.googleapis.com/css2?family=Sekuya&family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">

    <style>
    body {
        margin: 0;
        font-family: 'Poppins', sans-serif;
        min-height: 100vh;
        background:
          linear-gradient(rgba(10,20,40,0.6), rgba(10,20,40,0.75)),
          url("<%=request.getContextPath()%>/images/kumbh.png");
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .login-container {
        background: #ffffff;
        padding: 45px 40px;
        border-radius: 16px;
        width: 100%;
        max-width: 420px;
        box-shadow: 0 12px 35px rgba(0,0,0,0.25);
        text-align: center;
        animation: fadeIn 0.6s ease;
         padding-top: 50px;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(15px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .login-title {
        font-size: 28px;
        font-weight: 600;
        margin-bottom: 10px;
        color: #1e2a47;
         margin-top: 0;
    padding-top: 0;
    }

    .login-sub {
        font-size: 14px;
        color: #666;
        margin-bottom: 30px;
    }

    .field-group {
        position: relative;
        margin-bottom: 20px;
    }

    .field-group i {
        position: absolute;
        top: 50%;
        left: 14px;
        transform: translateY(-50%);
        color: #888;
    }

    .field-group input {	
        width: calc(100% - 2px);
        padding: 12px 12px 12px 42px;
        border-radius: 8px;
        border: 1px solid #ddd;
        font-size: 14px;
        outline: none;
        transition: 0.2s;
    }

    .field-group input:focus {
        border-color: #0d6efd;
        box-shadow: 0 0 0 2px rgba(13,110,253,0.15);
    }

    .show-pass {
        text-align: left;
        font-size: 13px;
        margin-bottom: 20px;
    }

    .show-pass input {
        margin-right: 6px;
    }

    .login-btn {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background: linear-gradient(135deg, #0d6efd, #084298);
        color: #fff;
        font-size: 15px;
        font-weight: 500;
        cursor: pointer;
        transition: 0.3s;
    }

    .login-btn:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 20px rgba(13,110,253,0.35);
    }

    .back-link {
        margin-top: 20px;
        display: block;
        font-size: 13px;
        color: #0d6efd;
        text-decoration: none;
    }

    .back-link:hover {
        text-decoration: underline;
    }
    * {
  box-sizing: border-box;
}

.login-container {
  overflow: hidden;
}
    /* =========================
   IPHONE VIEW – ADMIN LOGIN
   ========================= */
@media (max-width: 430px) {

    body {
        padding: 12px;
        align-items: center;
        justify-content: center;
    }

    .login-container {
        padding: 28px 22px;
        max-width: 340px;
        border-radius: 14px;
    }

    .login-title {
        font-size: 22px;
        margin-bottom: 6px;
    }

    .login-sub {
        font-size: 12px;
        margin-bottom: 20px;
    }

    .field-group {
        margin-bottom: 16px;
    }

    .field-group input {
        font-size: 14px;
        padding: 11px 12px 11px 40px;
    }

    .field-group i {
        left: 12px;
        font-size: 14px;
    }

    .show-pass {
        font-size: 12px;
        margin-bottom: 16px;
    }

    .login-btn {
        padding: 11px;
        font-size: 14px;
        border-radius: 8px;
    }

    .back-link {
        font-size: 12px;
        margin-top: 14px;
    }
}

/* EXTRA SMALL (iPhone SE / 360px) */
@media (max-width: 360px) {

    .login-container {
        padding: 24px 18px;
    }

    .login-title {
        font-size: 20px;
    }

    .login-sub {
        font-size: 11px;
    }
}
    
    
    </style>
</head>

<body>

<div class="login-container">
    <div class="login-title">Branch Login</div>
    <div class="login-sub">Enter your branch credentials to continue</div>

    <form action="BranchLogin" method="post">
        <div class="field-group">
            <i class="fa fa-envelope"></i>
            <input type="text" name="email" placeholder="Email ID" required>
        </div>

        <div class="field-group">
            <i class="fa fa-lock"></i>
            <input type="password" name="password" id="password" placeholder="Password" required>
        </div>

        <div class="show-pass">
            <label>
                <input type="checkbox" onclick="togglePassword()"> Show password
            </label>
        </div>

        <button type="submit" class="login-btn">Log In</button>

        <a href="welcome.jsp" class="back-link">Back to Home</a>
    </form>
</div>

<script>
function togglePassword() {
    var x = document.getElementById("password");
    x.type = x.type === "password" ? "text" : "password";
}
</script>

</body>
</html>
