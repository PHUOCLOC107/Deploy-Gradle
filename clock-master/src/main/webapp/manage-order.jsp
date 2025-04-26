<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý đơn hàng</title>
    <link href="./assets/img/logo.jpg" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<style>
    /* General Styles */
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }

    .admin-content {
        padding: 20px;
    }

    .admin-content-top {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .admin-content-top h1 {
        font-size: 20px;
        font-weight: 500;
        color: #333;
    }

    .search-filter-container {
        display: flex;
        width: 100%;
        justify-content: space-between;
        gap: 20px;
        margin-bottom: 20px;
    }

    .search-form, .filter-form {
        display: flex;
        width: 48%;
        align-items: center;
        border: none;
        background-color: white;
        box-shadow: none;
    }

    .search-form input[type="text"], .filter-form select {
        padding: 10px;
        font-size: 14px;
        height: 40px;
        width: 70%;
        margin-right: 10px;
        border-radius: 10px;
        border: 1px solid black;
    }

    .search-form button, .filter-form button {
        padding: 2px;
        font-size: 14px;
        background-color: #CA1F28;
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        width: 100px; /* hoặc bao nhiêu tùy bạn */
        box-sizing: border-box;
    }

    .search-form button:hover, .filter-form button:hover {
        background-color: #9b1722;
    }

    /* Table Styles */
    /* Table Styles - Chỉ dành cho bảng đơn hàng */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: #fff;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    table thead {
        background-color: #CA1F28;
        color: white;
    }

    table th, table td {
        padding: 14px 16px;
        text-align: left;
        font-size: 15px;
        border-bottom: 1px solid #ddd;
    }

    table th {
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    table tbody tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    table tbody tr:hover {
        background-color: #f1f1f1;
        transition: background-color 0.3s ease;
    }

    .update-status-form {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        align-items: center;
    }

    .update-status-form select {
        padding: 6px 10px;
        border-radius: 5px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .update-status-form button {
        padding: 6px ;
        width: 100px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        font-size: 14px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .update-status-form button:hover {
        background-color: #2f6530;
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
                <li><a href="GeneralController"><i class="fas fa-tachometer-alt"></i> Tổng quát</a></li>
                <li><a href="manage-category"><i class="fa-solid fa-layer-group"></i> Quản lý danh mục</a></li>
                <li><a href="manage-products"><i class="fa-solid fa-bag-shopping"></i> Quản lý sản phẩm</a></li>
                <li><a class="active" href="manage-order"><i class="fas fa-box"></i> Quản lý đơn hàng</a></li>
                <li><a href="manager_customer"><i class="fas fa-users"></i> Quản lý khách hàng</a></li>
                <li><a href="logs"><i class="fas fa-users"></i> Logs</a></li>
                <li><a href="#" id="logoutLink"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
            </ul>
        </div>
    </div>

    <div class="admin-content">
        <div class="admin-content-top">
            <h1 style="color: #CA1F28; font-weight: 600 ">Xin chào Admin, Watch - 63</h1>
            <a href="index"> <img src="assets/img/icon.png"></a>
        </div>
        <div class="admin-content-main">
            <div class="order-management">
                <h1>Quản lý đơn hàng</h1>

                <div class="search-filter-container">
                    <form action="manage-order" method="get" class="search-form">
                        <input type="text" name="search" placeholder="Search Orders">
                        <button type="submit">Search</button>
                    </form>

                    <form action="manage-order" method="get" class="filter-form">
                        <select name="status">
                            <option value="">All</option>
                            <option value="Đang xử lý">Đang xử lý</option>
                            <option value="Đã giao">Đã giao</option>
                            <option value="Đã hủy">Đã hủy</option>
                        </select>
                        <button type="submit">Filter</button>
                    </form>
                </div>

                <c:if test="${not empty message}">
                    <p style="color: #4CAF50; font-size: 20px; font-weight: 600; text-align: center; margin-top: 10px">${message}</p>
                </c:if>

                <!-- Hiển thị danh sách đơn hàng -->
                <table>
                    <thead>
                    <tr>
                        <th>Stt</th>
                        <th>Mã khách hàng</th>
                        <th>Tên khách hàng</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Thành tiền</th>
                        <th>Trạng thái</th>
                        <th>Phương thức thanh toán</th>
                        <th>Vận chuyển</th>
                        <th>Cập nhật đơn hàng</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <td>${order.orderId}</td>
                            <td>${order.userId}</td>
                            <td>${order.customerName}</td>
                            <td>${order.productName}</td>
                            <td>${order.quantity}</td>
                            <td>${order.totalPrice}</td>
                            <td>${order.paymentMethod}</td>
                            <td>${order.shippingMethod}</td>
                            <td>${order.status}</td>
                            <td>
                                <form action="manage-order" method="post" class="update-status-form">
                                    <input type="hidden" name="orderId" value="${order.orderId}">
                                    <select name="status" class="status-select">
                                        <option value="Đang xử lý" ${order.status == 'Đang xử lý' ? 'selected' : ''}>Đang xử lý</option>
                                        <option value="Đã giao" ${order.status == 'Đã giao' ? 'selected' : ''}>Đã giao</option>
                                        <option value="Đã hủy" ${order.status == 'Đã hủy' ? 'selected' : ''}>Đã hủy</option>
                                    </select>
                                    <button type="submit" class="update-button">Cập nhật</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script>
    const logoutLink = document.getElementById('logoutLink');
    function handleLogout() {
        window.location.href = 'login.jsp';
    }

    logoutLink.addEventListener('click', function (event) {
        event.preventDefault();
        handleLogout();
    });
</script>
</body>
</html>
