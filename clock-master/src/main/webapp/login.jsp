<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link href="./assets/img/icon.png" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link crossorigin href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="login-container">
    <form action="login" method="post">
        <a href="index" class="back-button"><div class="back-container"><i class="fas fa-arrow-left"></i></div></a>
        <h2>Đăng Nhập</h2>

        <!-- Hiển thị thông báo lỗi -->
        <c:if test="${not empty ERROR}">
            <div class="error-message" style="color: #CA1F28;font-weight: 600; font-size: 18px; margin-bottom: 10px;">
                    ${ERROR}
            </div>
        </c:if>

        <!-- Hiển thị thông báo tài khoản chưa được kích hoạt -->
        <c:if test="${not empty activationError}">
            <div class="error-message" style="color: #CA1F28; font-weight: 600; font-size: 18px; margin-bottom: 10px;">
                    ${activationError}
            </div>
        </c:if>

        <div class="username-container">
            <input type="text" id="username" name="username" placeholder="Tên đăng nhập" required autofocus>
        </div>
        <div class="password-container">
            <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
        </div>

        <div class="remember-container">
            <input type="checkbox" id="remember" name="remember">
            <label for="remember">Lưu mật khẩu</label>
        </div>
        <button type="submit">Đăng nhập</button>

        <div class="or">
            <p style="font-size: 18px; text-align: center">Hoặc</p>
        </div>

        <div class="login_face_gg">
            <a href="FacebookLoginServlet" class="login_face" style="text-decoration: none">
                <i class="fa-brands fa-facebook"></i>
                <p>Facebook</p>
            </a>
            <a href="GoogleLoginServlet" class="login_gg" style="text-decoration: none">
                <img src="https://cdn4.iconfinder.com/data/icons/logos-brands-7/512/google_logo-google_icongoogle-512.png" alt="" width="30px" height="30px">
                <p>Google</p>
            </a>
        </div>

        <div class="login-more">
            <a href="forgotpassword.jsp">Quên mật khẩu?</a>
            <a href="register.jsp">Đăng ký</a>
        </div>
    </form>
</div>
</body>
</html>
