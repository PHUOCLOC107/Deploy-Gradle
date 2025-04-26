<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý khách hàng</title>
    <link href="./assets/img/logo.jpg" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <%--    <link href="assets/css/style.css" rel="stylesheet">--%>
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
    /* Các phần tử form */
    #customerForm input,
    #updateCustomerForm input {
        width: 100%;
        padding: 8px; /* Giảm padding */
        margin: 8px 0; /* Giảm margin */
        border: 1px solid #ccc;
        border-radius: 6px; /* Giảm bo tròn */
        font-size: 14px; /* Giảm kích thước chữ */
        box-sizing: border-box;
    }

    #customerForm label,
    #updateCustomerForm label {
        font-size: 16px; /* Giảm kích thước chữ nhãn */
        margin-bottom: 6px; /* Giảm khoảng cách */
        display: block;
    }

    /* Cải thiện giao diện nút trong form */
    #customerForm button,
    #updateCustomerForm button {
        background-color: #CA1F28;
        color: white;
        padding: 10px 20px; /* Giảm padding */
        border: none;
        border-radius: 6px; /* Giảm bo tròn */
        cursor: pointer;
        font-size: 16px; /* Giảm kích thước chữ nút */
        margin-top: 10px; /* Giảm khoảng cách giữa các nút */
    }

    #customerForm button[type="button"],
    #updateCustomerForm button[type="button"] {
        background-color: #bbb;
        color: #333;
        margin-top: 8px; /* Giảm margin */
    }

    #customerForm button:hover,
    #updateCustomerForm button:hover {
        background-color: #c70000;
    }

    #customerForm button[type="button"]:hover,
    #updateCustomerForm button[type="button"]:hover {
        background-color: #999;
    }

    /* Cải thiện giao diện bảng */
    .customer-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 15px; /* Giảm khoảng cách bảng */
    }

    .customer-table th,
    .customer-table td {
        padding: 10px; /* Giảm padding */
        text-align: left;
        border: 1px solid #ddd;
        font-size: 1.4rem; /* Giảm kích thước chữ */
        background-color: #fff;
    }

    .customer-table th {
        background-color: #f2f2f2;
    }

    .customer-table tr:hover {
        background-color: #f9f9f9;
    }

    .customer-table button {
        background-color: #007bff;
        color: white;
        padding: 6px 12px; /* Giảm padding */
        border: none;
        cursor: pointer;
        border-radius: 4px; /* Giảm bo tròn */
    }

    .customer-table button:hover {
        background-color: #0056b3;
    }

    /* Các nút thêm, cập nhật, hủy cùng nằm 1 hàng */
    .form-buttons {
        display: flex;
        justify-content: flex-start; /* Căn trái các nút */
        gap: 10px; /* Khoảng cách giữa các nút */
        margin-top: 10px;
    }

    /* Nút thêm khách hàng */
    .add-customer-btn,
    #customerForm button[type="button"],
    #updateCustomerForm button[type="button"] {
        font-size: 1.6rem; /* Giảm kích thước chữ */
        padding: 10px 20px; /* Giảm padding */
        border-radius: 6px; /* Giảm bo tròn */
        width: auto;
        cursor: pointer;
        margin: 0; /* Loại bỏ margin cho các nút trong cùng 1 hàng */
    }

    .add-customer-btn {
        background-color: #CA1F28;
        color: white;

    }

    #customerForm button[type="button"] {
        background-color: #ddd;
        color: #333;
    }

    .add-customer-btn:hover,
    #customerForm button[type="button"]:hover {
        background-color: #c70000;
    }

    #customerForm button[type="button"]:hover {
        background-color: #bbb;
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
                <li><a href="GeneralController"><i class="fas fa-tachometer-alt"></i> Tổng quát</a></li>
                <li><a href="manage-category"><i class="fa-solid fa-layer-group"></i> Quản lý danh mục</a></li>
                <li><a href="manage-products"><i class="fa-solid fa-bag-shopping"></i> Quản lý sản phẩm</a></li>
                <li><a href="manage-order"><i class="fas fa-box"></i> Quản lý đơn hàng</a></li>
                <li><a class="active" href="manager_customer"><i class="fas fa-users"></i> Quản lý khách hàng</a></li>
                <li><a href="logs"><i class="fas fa-users"></i> Logs</a></li>
                <li><a href="#" id="logoutLink"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
            </ul>
        </div>
    </div>

    <div class="admin-content">
        <div class="admin-content-top">
            <h1 style="color: #CA1F28; font-weight: 500">Xin chào Admin, Watch - 63</h1>
            <a href="index.jsp"> <img src="assets/img/icon.png"></a>
        </div>
        <div class="admin-content-main">
            <div class="admin-tools">
                <button style="margin-bottom: 10px" id="addCustomerBtn" class="add-customer-btn"><i class="fas fa-user-plus"></i> Thêm khách hàng</button>
            </div>

            <form action="${pageContext.request.contextPath}/searchCustomer" method="get" style="margin-bottom: 20px;">
                <input type="text" name="keyword" placeholder="Tìm kiếm khách hàng..." value="${param.keyword}" style="padding: 10px; width: 300px;font-size: 18px; border-radius: 5px">
                <button type="submit" style="padding: 10px 20px; background-color: #CA1F28; color: white; border: none; cursor: pointer; border-radius: 5px;font-size: 18px">
                    Tìm kiếm
                </button>
            </form>

            <c:if test="${not empty message}">
                <div class="alert" style="color: #4CAF50; font-size: 18px; font-weight: 600">
                        ${message}
                </div>
            </c:if>

            <!-- Kiểm tra nếu có thông báo lỗi -->
            <c:if test="${not empty error}">
                <div class="error-message">
                    <p style="color: #CA1F28; font-size: 18px; font-weight: 600">${error}</p>
                </div>
            </c:if>

            <!-- Form thêm khách hàng -->
            <div id="customerForm" style="display:none; ">
                <h3 style="font-size: 22px">Thêm khách hàng</h3>
                <form action="manager_customer" method="post" style=" width: 550px">
                    <input type="hidden" name="action" value="add">
                    <label for="name">Tên khách hàng:</label>
                    <input type="text" name="fullname" id="name" required><br><br>

                    <label for="email">Email:</label>
                    <input type="email" name="email" id="email" required><br><br>

                    <label for="phone">Số điện thoại:</label>
                    <input type="number" name="phone" id="phone" required><br><br>


                    <label for="address">Địa chỉ:</label>
                    <input type="text" name="address" id="address" required><br><br>

                    <button type="submit" class="add-customer-btn">Thêm</button>
                    <button type="button" onclick="cancelForm()">Hủy</button>
                </form>
            </div>

            <!-- Form cập nhật khách hàng -->
            <div id="updateCustomerForm" style="display:none;">
                <h3 style="font-size: 22px">Cập nhật khách hàng</h3>
                <form action="updateCustomer" method="post" style=" width: 550px">
                    <input type="hidden" name="action" value="update">
                    <input type="hidden" name="customerId" id="updateCustomerId">

                    <label for="updateName">Tên khách hàng:</label>
                    <input type="text" name="fullname" id="updateName" required><br><br>

                    <label for="updateEmail">Email:</label>
                    <input type="email" name="email" id="updateEmail" required><br><br>

                    <label for="updatePhone">Số điện thoại:</label>
                    <input type="number" name="phone" id="updatePhone" required><br><br>

                    <label for="updateAddress">Địa chỉ:</label>
                    <input type="text" name="address" id="updateAddress" required><br><br>

                    <label for="updateAddress">Phân quyền:</label>
                    <input type="text" name="role" id="updateRole" required><br><br>

                    <button type="submit" class="add-customer-btn">Cập nhật</button>
                    <button type="button" onclick="cancelUpdateForm()">Hủy</button>
                </form>
            </div>



            <!-- Bảng khách hàng -->
            <table class="customer-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Tên khách hàng</th>
                    <th>Email</th>
                    <th>Số điện thoại</th>
                    <th>Địa chỉ</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <!-- Lặp qua danh sách khách hàng -->
                <c:forEach var="customer" items="${customers}">
                    <tr>
                        <td>${customer.id}</td>
                        <td>${customer.fullname}</td>
                        <td>${customer.email}</td>
                        <td>${customer.phone}</td>
                        <td>${customer.address}</td>
                        <td>

                            <button style="background-color: #4CAF50" type="button" onclick="showUpdateForm('${customer.id}', '${customer.fullname}', '${customer.email}', '${customer.phone}', '${customer.address}')" >
                                Cập nhật
                            </button>

                            <button> <a style="text-decoration: none; color: white" href="${pageContext.request.contextPath}/viewMessages?email=${customer.email}">Xem tin nhắn</a></button>

                            <!-- Nút khóa/mở tài khoản -->
                            <form action="manager_customer" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="${customer.status == 1 ? 'lock' : 'unlock'}">
                                <input type="hidden" name="id" value="${customer.id}">
                                <button type="submit">
                                        ${customer.status == 1 ? 'Khóa tài khoản' : 'Mở tài khoản'}
                                </button>
                            </form>

                            <form action="manager_customer" method="post" style="display:inline;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${customer.id}">
                                <button style="background-color: #CA1F28" type="submit" onclick="return confirm('Bạn có chắc chắn muốn xóa không?')">Xóa</button>
                            </form>


                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>

        </div>
    </div>
</div>

<script>
    // Lấy phần tử form
    var customerForm = document.getElementById('customerForm');
    var updateCustomerForm = document.getElementById('updateCustomerForm');  // form cập nhật
    var addCustomerBtn = document.getElementById('addCustomerBtn');

    // Thêm sự kiện bấm nút "Thêm khách hàng"
    addCustomerBtn.onclick = function() {
        customerForm.style.display = 'block';
        updateCustomerForm.style.display = 'none';  // Ẩn form cập nhật khi thêm khách hàng
    };

    // Hàm hiển thị form cập nhật và điền dữ liệu
    function showUpdateForm(customerId, fullname, email, phone, address) {
        updateCustomerForm.style.display = 'block';
        customerForm.style.display = 'none';  // Ẩn form thêm khách hàng khi cập nhật

        // Điền thông tin khách hàng vào các trường input
        document.getElementById('updateCustomerId').value = customerId;
        document.getElementById('updateName').value = fullname;
        document.getElementById('updateEmail').value = email;
        document.getElementById('updatePhone').value = phone;
        document.getElementById('updateAddress').value = address;
    }

    // Hàm hủy form thêm khách hàng
    function cancelForm() {
        customerForm.style.display = 'none';
    }

    // Hàm hủy form cập nhật
    function cancelUpdateForm() {
        updateCustomerForm.style.display = 'none';
    }
</script>
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

<%--<script src="assets/script/manage_customer.js"></script>--%>
</body>
</html>
