<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.clock.utils.CurrencyFormatter" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Đặt hàng thành công</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      line-height: 1.6;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }
    .container {
      width: 80%;
      margin: 0 auto;
      padding: 30px;
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #4CAF50;
      text-align: center;
    }
    .order-details {
      margin: 20px 0;
      border-top: 2px solid #4CAF50;
      padding-top: 20px;
    }
    .order-details p {
      font-size: 16px;
    }
    .btn {
      display: inline-block;
      background-color: #4CAF50;
      color: #fff;
      padding: 10px 20px;
      border-radius: 5px;
      text-decoration: none;
      font-size: 16px;
      text-align: center;
    }
    .btn:hover {
      background-color: #45a049;
    }
    .message {
      font-size: 18px;
      color: green;
      margin-bottom: 20px;
      text-align: center;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Đặt hàng thành công!</h1>

  <div class="message">
    <p>${successMessage}</p>
  </div>

  <div class="order-details">
    <h3>Thông tin đơn hàng của bạn:</h3>
    <p><strong>Mã đơn hàng:</strong> ${orderId}</p>
    <p><strong>Họ và tên:</strong> ${fullname}</p>
    <p><strong>Số điện thoại:</strong> ${phone}</p>
    <p><strong>Địa chỉ giao hàng:</strong> ${address}, ${district}, ${province}</p>
    <p><strong>Ghi chú:</strong> ${note}</p>
    <p><strong>Tổng giá trị đơn hàng:</strong> ${CurrencyFormatter.formatCurrency(totalPrice)}</p>
  </div>

  <div class="order-details">
    <h3>Chi tiết các sản phẩm:</h3>
    <table width="100%" border="1" cellpadding="10" cellspacing="0" style="border-collapse: collapse;">
      <thead>
      <tr>
        <th>Tên sản phẩm</th>
        <th>Số lượng</th>
        <th>Giá</th>
        <th>Tổng giá</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="item" items="${orderItems}">
        <tr>
          <td>${item.name}</td>
          <td>${item.quantity}</td>
          <td>${item.getFormattedDiscountedPrice()}</td>
          <td>${item.getFormattedTotalPrice()}</td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

  <div style="text-align: center; margin-top: 20px;">
    <a href="index" class="btn">Quay lại trang chủ</a>
  </div>
</div>

</body>
</html>
