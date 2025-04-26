<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đặt lại mật khẩu</title>
    <link href="./assets/img/icon.png" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="login-container resetpass">
    <form action="resetPassword" method="post">
        <a href="index.jsp" class="back-button">
            <div class="back-container">
                <i class="fas fa-arrow-left"></i>
            </div>
        </a>
        <h2>Đặt lại mật khẩu</h2>
        <h6>Nhập mật khẩu mới của bạn</h6>

        <div class="password-container">
            <input type="password" id="password" name="password" placeholder="Mật khẩu mới" required>
            <span id="password-error" class="error-message"></span>
        </div>

        <div class="password-container">
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Xác nhận mật khẩu" required>
            <span id="confirm-password-error" class="error-message"></span>
        </div>
        <!-- Hiển thị thông báo lỗi nếu có -->
        <c:if test="${not empty errorMessage}">
            <div class="alert alert-danger" style="color: #CA1F28; font-weight: 600; font-size: 18px">
                <p>${errorMessage}</p>
            </div>
        </c:if>

        <button type="submit">Đặt lại mật khẩu</button>
        <button type="button" onclick="window.location.href='login.jsp';">Quay lại đăng nhập</button>
    </form>
</div>

<script>
    // Kiểm tra mật khẩu và xác nhận mật khẩu khi người dùng nhập vào
    document.querySelector("form").onsubmit = function(event) {
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;

        let valid = true;

        // Kiểm tra mật khẩu có khớp không
        if (password !== confirmPassword) {
            document.getElementById("confirm-password-error").textContent = "Mật khẩu và xác nhận mật khẩu không khớp.";
            valid = false;
        } else {
            document.getElementById("confirm-password-error").textContent = "";
        }

        return valid;
    };
</script>
</body>
</html>
