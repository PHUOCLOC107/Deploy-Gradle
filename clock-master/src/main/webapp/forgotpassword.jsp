<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quên mật khẩu</title>
    <link href="./assets/img/icon.png" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="login-container forgotpass">
    <form action="forgotpassword" method="post">
        <a href="index.jsp" class="back-button">
            <div class="back-container">
                <i class="fas fa-arrow-left"></i>
            </div>
        </a>
        <h2>Quên Mật Khẩu?</h2>
        <h6>Nhập email đã liên kết với tài khoản của bạn để nhận mã khôi phục</h6>
        <div class="username-container">
            <input type="email" id="email" name="email" placeholder="Email" required autofocus>
        </div>

        <button type="submit">Gửi</button>
        <button type="button"><a href="login.jsp">Quay lại đăng nhập</a></button>

        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger">
                <p>${errorMessage}</p>
            </div>
        </c:if>


    </form>
</div>


</body>


</html>
