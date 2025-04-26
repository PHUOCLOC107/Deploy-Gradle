<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="vn.edu.hcmuaf.fit.clock.utils.CurrencyFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đồng hồ 63 - Admin</title>
    <link href="./assets/img/logo.jpg" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<div id="admin">
    <div class="admin-sidebar">
        <div class="admin-sidebar-logo">
            <a href="GeneralController"> <img src="assets/img/logo3.png"></a>
        </div>
        <div class="admin-sidebar-nav">
            <ul>
                <li><a class="active" href="GeneralController"><i class="fas fa-tachometer-alt"></i> Tổng quát</a></li>
                <li><a href="manage-category"><i class="fa-solid fa-layer-group"></i> Quản lý danh mục</a></li>
                <li><a href="manage-products"><i class="fa-solid fa-bag-shopping"></i> Quản lý sản phẩm</a></li>
                <li><a href="manage-order"><i class="fas fa-box"></i> Quản lý đơn hàng</a></li>
                <li><a href="manager_customer"><i class="fas fa-users"></i> Quản lý khách hàng</a></li>
                <li><a href="logs"><i class="fas fa-users"></i> Logs</a></li>
                <li><a href="#" id="logoutLink"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
            </ul>
        </div>
    </div>

    <div class="admin-content">
        <div class="admin-content-top">
            <h1>Xin chào Admin, Watch - 63</h1>
            <a href="GeneralController"> <img src="assets/img/icon.png"></a>
        </div>
        <div class="admin-content-main">
            <!-- Dashboard Section -->
            <div class="dashboard">

                <!-- Stats Overview -->
                <div class="stats-overview">
                    <div class="stats-card">
                        <i class="fas fa-box"></i>
                        <div class="stats-card-content">
                            <h3>Tổng đơn hàng</h3>
                            <p>${totalOrders}</p>
                        </div>
                    </div>
                    <div class="stats-card">
                        <i class="fas fa-users"></i>
                        <div class="stats-card-content">
                            <h3>Tổng khách hàng</h3>
                            <p>${totalCustomers}</p>
                        </div>
                    </div>
                    <div class="stats-card">
                        <i class="fas fa-chart-line"></i>
                        <div class="stats-card-content">
                            <h3>Tổng doanh thu</h3>
                            <p>${CurrencyFormatter.formatCurrency(totalRevenue)}</p>
                        </div>
                    </div>
                    <div class="stats-card">
                        <i class="fa-solid fa-bag-shopping"></i>
                        <div class="stats-card-content">
                            <h3>Tổng đơn chưa xử lý</h3>
                            <p>${pendingOrders}</p>
                        </div>
                    </div>
                </div>

                <!-- Latest Orders -->
                <div class="latest-orders">
                    <h3>Đơn hàng mới</h3>
                    <!-- Filter for today and this month -->
                    <form action="GeneralController" method="post" class="filters">
                        <select name="filter" class="filter-select">
                            <option value="all">Tất cả</option>
                            <option value="today">Hôm nay</option>
                            <option value="month">Tháng này</option>
                        </select>
                        <button type="submit" class="apply-filter-btn">Áp dụng</button>
                    </form>

                    <table class="orders-table">
                        <thead>
                        <tr>
                            <th>Mã đơn hàng</th>
                            <th>Mã khách hàng</th>
                            <th>Tổng tiền</th>
                            <th>Trạng thái</th>
                            <th>Ngày đặt</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="order" items="${ordersFiltered}">
                            <tr>
                                <td>${order.id}</td>
                                <td>${order.userId}</td>
                                <td>${CurrencyFormatter.formatCurrency(order.totalPrice)}</td>
                                <td>${order.status}</td>
                                <td>${order.createdAt}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>

                <!-- Customer Overview -->
                <div class="customer-overview">
                    <h3>Khách hàng mới</h3>

                    <!-- Filter for today and this month -->
                    <form action="GeneralController" method="post" class="filters">
                        <select name="filter" class="filter-select">
                            <option value="all">Tất cả</option>
                            <option value="today">Hôm nay</option>
                            <option value="month">Tháng này</option>
                        </select>
                        <button type="submit" class="apply-filter-btn">Áp dụng</button>
                    </form>

                    <table class="customer-table">
                        <thead>
                        <tr>
                            <th>Mã khách hàng</th>
                            <th>Tên khách hàng</th>
                            <th>Email</th>
                            <th>Trạng thái</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${usersFiltered}">
                            <tr>
                                <td>${user.id}</td>
                                <td>${user.fullname}</td>
                                <td>${user.email}</td>
                                <td>${user.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
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
