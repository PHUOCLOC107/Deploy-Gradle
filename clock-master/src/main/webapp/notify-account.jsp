<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Kết quả kích hoạt tài khoản</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 40px;
    }
    .message {
      margin-bottom: 20px;
      padding: 15px;
      border-radius: 5px;
    }
    .success {
      background-color: #e0f8e0;
      color: #2e7d32;
    }
    .error {
      background-color: #fce4e4;
      color: #c62828;
    }
    .back-btn {
      padding: 10px 20px;
      background-color: #1976d2;
      color: white;
      text-decoration: none;
      border-radius: 5px;
    }
    .back-btn:hover {
      background-color: #1565c0;
    }
  </style>
</head>
<body>
<h2>Kết quả kích hoạt tài khoản</h2>

<c:if test="${not empty message}">
  <div class="message success">✅ ${message}</div>
</c:if>

<c:if test="${not empty error}">
  <div class="message error">❌ ${error}</div>
</c:if>

<a href="login.jsp" class="back-btn">← Quay về trang đăng nhập</a>
</body>
</html>

</html>
