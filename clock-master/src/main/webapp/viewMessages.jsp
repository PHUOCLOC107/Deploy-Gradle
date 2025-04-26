<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Messages</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<style>
    html {
        font-size: 62.5%;
        line-height: 1.6rem;
        font-family: Arial, Helvetica, sans-serif;
        box-sizing: border-box;
        overflow-x: hidden;
    }

    #admin {
        display: flex;
    }

    .admin-sidebar {
        background-color: #e6e8e9;
        width: 20%;
        height: 100vh;
        position: fixed;
        top: 0;
        left: 0;
        overflow-y: auto;
        box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
        z-index: 1000;
    }
    #addCustomerBtn {
        font-size: 1.8rem; /* Tăng kích thước chữ */
        padding: 12px 24px; /* Điều chỉnh padding nếu cần */
        border-radius: 8px; /* Tăng độ bo tròn cho nút */
    }

    .admin-sidebar img {
        display: block;
        margin-left: auto;
        margin-right: auto;
        width: 150px;
    }

    .admin-sidebar-nav ul li {
        list-style-type: none;
        line-height: 40px;
        text-align: left;
        margin-right: 40px;
        position: relative;
    }

    .admin-sidebar-logo {
        padding-bottom: 20px;
        border-bottom: 2px solid #7f8c8d;
    }

    .admin-sidebar-nav i {
        width: 30px;
    }

    .admin-sidebar-nav a {
        color: #000;
        text-decoration: none;
        font-size: 20px;
    }

    .admin-sidebar-nav li a:hover,
    .admin-sidebar-nav li a.active {
        color: #CA1F28;
        cursor: pointer;
    }

    .admin-sidebar-nav li a.active::after,
    .admin-sidebar-nav li a:hover::after {
        content: "";
        width: 100%;
        background: #CA1F28;
        height: 1px;
        bottom: 3px;
        left: 0;
        position: absolute;
    }

    .admin-content {
        padding: 0 30px 30px;
        width: 80%;
        margin-left: 20%;
    }

    .admin-content-top {
        display: flex;
        justify-content: space-between;
        height: 60px;
        background-color: #e6e8e9;
        margin-bottom: 34px;
    }

    .admin-content-top h1 {
        padding-left: 10px;
        line-height: 30px;
        text-transform: uppercase;
        color: #CA1F28;
    }

    .admin-content-top img {
        width: 50px;
        border-radius: 50%;
        margin: 6px;
    }
    .admin-content h2 {
        color: #CA1F28;
        text-transform: uppercase;
        font-size: 3rem; /* Tăng kích thước chữ */
        margin-bottom: 20px;
        font-weight: bold;
        text-align: center; /* Căn giữa tiêu đề */
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    table th, table td {
        padding: 15px;
        text-align: left;
        border: 1px solid #ddd;
        font-size: 1.8rem; /* Tăng kích thước chữ cho ô bảng */
    }

    table th {
        background-color: #f4f4f4;
        color: #333;
        font-weight: bold;
    }

    table td {
        font-size: 1.6rem; /* Tăng kích thước chữ cho dữ liệu trong bảng */
        color: #555;
    }

    table tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tr:hover {
        background-color: #f1f1f1;
        cursor: pointer;
    }

    p {
        font-size: 2rem; /* Tăng kích thước chữ cho thông báo */
        color: #333;
        font-weight: 500;
        text-align: center; /* Căn giữa thông báo */
        margin-top: 20px;
    }
    .active{
        color:#CA1F28;
    }

</style>
<body>
<div id="admin">
    <div class="admin-sidebar">
        <div class="admin-sidebar-logo">
            <a href="index.html"> <img src="assets/img/logo3.png"></a>
        </div>
        <div class="admin-sidebar-nav">
            <ul>
                <li><a  href="admin"><i class="fas fa-tachometer-alt"></i> Tổng quát</a></li>
                <li><a href="manage-category"><i class="fas fa-chart-line"></i> Quản lý danh mục</a></li>
                <li><a href="manage-products"><i class="fa-solid fa-bag-shopping"></i> Quản lý sản phẩm</a></li>
                <li><a href="manage-orders"><i class="fas fa-box"></i> Quản lý đơn hàng</a></li>
                <li><a class="active" href="${pageContext.request.contextPath}/manager_customer"><i class="fas fa-users"></i> Quản lý khách hàng</a></li>
                <li><a href="index"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
            </ul>
        </div>
    </div>

    <div class="admin-content">
        <h2>Tin nhắn của khách hàng</h2>
        <!-- Kiểm tra xem có tin nhắn nào không -->
        <c:if test="${not empty messages}">
            <table border="1">
                <thead>
                <tr>
                    <th>Họ tên</th>
                    <th>Email</th>
                    <th>Message</th>
                </tr>
                </thead>
                <tbody>
                <!-- Duyệt qua danh sách tin nhắn và hiển thị -->
                <c:forEach var="message" items="${messages}">
                    <tr>
                        <td>${message.fullname}</td>
                        <td>${message.email}</td>
                        <td>${message.message}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
        <!-- Nếu không có tin nhắn -->
        <c:if test="${empty messages}">
            <p>Khách hàng chưa để lại lời nhắn!</p>
        </c:if>
    </div>
</div>
</body>
</html>
