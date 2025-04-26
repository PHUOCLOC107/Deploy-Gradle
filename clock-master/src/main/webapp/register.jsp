<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
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
    <form action="register" method="post">
        <a href="index" class="back-button"><div class=" back-container back-container2"><i class="fas fa-arrow-left"></i></div></a>
        <h2>Đăng Ký</h2>

        <!-- Thêm thông báo lỗi -->
        <c:if test="${param.error == 1}">
            <div class="error-message" style="color: #CA1F28; font-size: 18px; margin-bottom: 20px" >Tên đăng nhập đã tồn tại!</div>
        </c:if>

        <div class="username-container">
            <input type="text" id="fullname" name="fullname" placeholder="Họ và tên" required autofocus>
        </div>
        <div class="username-container">
            <input type="email" id="email" name="email" placeholder="Email" required autofocus>
        </div>
        <div class="username-container">
            <input type="text" id="username" name="username" placeholder="Tên đăng nhập" required autofocus>
        </div>
        <div class="password-container">
            <input type="password" id="password" name="password" placeholder="Mật khẩu" required>
        </div>
        <div class="remember-container">
            <input type="checkbox" id="remember" name="remember" required>
            <label for="remember">Tôi đã đọc và đồng ý với tất cả điều khoản</label>
        </div>
        <button type="submit">Đăng ký</button>
        <div class="login-more">
            <a href="">Điều khoản</a>
            <a href="login.jsp">Đăng nhập</a>
        </div>
    </form>
</div>

<%--<script src="assets/script/register.js"></script>--%>
</body>
</html>