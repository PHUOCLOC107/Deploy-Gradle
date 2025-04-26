<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Minh OTP</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            max-width: 500px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .otp-inputs {
            display: flex;
            justify-content: space-between;
        }
        .otp-inputs input {
            width: 50px;
            height: 50px;
            font-size: 24px;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btn {
            width: 100%;
            padding: 12px;
            background-color: #CA1F28;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 30px;
        }
        .btn:hover {
            background-color: #b60611;
        }
        .error-message {
            color: red;
            text-align: center;
        }
    </style>
    <script>
        // Hàm di chuyển focus đến ô tiếp theo sau khi nhập một số
        function moveFocus(event, nextInputId, prevInputId) {
            const currentInput = event.target;
            // Nếu người dùng nhập một số hợp lệ
            if (currentInput.value.length === 1 && !isNaN(currentInput.value)) {
                if (nextInputId) {
                    document.getElementById(nextInputId).focus();
                }
            }
            // Nếu người dùng nhấn phím Backspace và ô hiện tại rỗng, chuyển về ô trước
            if (event.keyCode === 8 && currentInput.value === "") {
                if (prevInputId) {
                    document.getElementById(prevInputId).focus();
                }
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Xác Minh Mã OTP</h2>
    <form action="verify" method="POST" onsubmit="mergeOtpValues()">
        <!-- Các ô nhập OTP -->
        <div class="otp-inputs">
            <input type="hidden" name="email" value="${sessionScope.email}" />
            <input type="text" name="otp1" id="otp1" maxlength="1" required oninput="moveFocus(event, 'otp2', '')" pattern="[0-9]{1}">
            <input type="text" name="otp2" id="otp2" maxlength="1" required oninput="moveFocus(event, 'otp3', 'otp1')" pattern="[0-9]{1}">
            <input type="text" name="otp3" id="otp3" maxlength="1" required oninput="moveFocus(event, 'otp4', 'otp2')" pattern="[0-9]{1}">
            <input type="text" name="otp4" id="otp4" maxlength="1" required oninput="moveFocus(event, 'otp5', 'otp3')" pattern="[0-9]{1}">
            <input type="text" name="otp5" id="otp5" maxlength="1" required oninput="moveFocus(event, 'otp6', 'otp4')" pattern="[0-9]{1}">
            <input type="text" name="otp6" id="otp6" maxlength="1" required oninput="moveFocus(event, '', 'otp5')" pattern="[0-9]{1}">
        </div>

        <!-- OTP hợp nhất -->
        <input type="hidden" name="otp" id="mergedOtp">

        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>
        <button type="submit" class="btn">Xác Minh OTP</button>
    </form>
</div>

</body>
<script>
    function mergeOtpValues() {
        let otp = '';
        for (let i = 1; i <= 6; i++) {
            const value = document.getElementById('otp' + i).value;
            if (value) {
                otp += value;
            }
        }
        document.getElementById('mergedOtp').value = otp;
    }
</script>

</html>
