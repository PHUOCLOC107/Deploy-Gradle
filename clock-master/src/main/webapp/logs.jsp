<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Log Hệ Thống</title>
    <link href="./assets/img/logo.jpg" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <style>
        table {
            width: 100%; border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ccc; padding: 8px; text-align: left;
        }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
<div id="admin">
    <div class="admin-sidebar">
        <div class="admin-sidebar-logo">
            <a href="index"> <img src="assets/img/logo3.png" alt="Logo"></a>
        </div>
        <div class="admin-sidebar-nav">
            <ul>
                <li><a href="GeneralController"><i class="fas fa-tachometer-alt"></i> Tổng quát</a></li>
                <li><a href="manage-category"><i class="fas fa-chart-line"></i> Quản lý danh mục</a></li>
                <li><a href="manage-products"><i class="fa-solid fa-bag-shopping"></i> Quản lý sản phẩm</a></li>
                <li><a href="manage-order"><i class="fas fa-box"></i> Quản lý đơn hàng</a></li>
                <li><a href="manager_customer"><i class="fas fa-users"></i> Quản lý khách hàng</a></li>
                <li><a class="active" href="logs"><i class="fas fa-users"></i> Logs</a></li>
                <li><a href="#" id="logoutLink"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
            </ul>
        </div>
    </div>

    <div class="admin-content">
        <div class="admin-content-top">
            <h1>Xin chào Admin, Watch - 63</h1>
            <a href="index.html"> <img src="assets/img/icon.png" alt="Logo"></a>
        </div>

        <div class="logs_management">
            <h2>Nhật ký hoạt động</h2>
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>User ID</th>
                    <th>Hành động</th>
                    <th>Mô tả</th>
                    <th>Thời gian</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="log" items="${logs}">
                    <tr>
                        <td>${log.id}</td>
                        <td>${log.userId}</td>
                        <td>${log.action}</td>
                        <td>${log.description}</td>
                        <td>${log.createdAt}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

    </div>
</div>

</body>
</html>
