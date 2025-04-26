<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý danh mục</title>
    <link href="./assets/img/logo.jpg" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <style>
        #categoryForm {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: rgba(255, 255, 255, 1);
            z-index: 9999;
        }

        #categoryForm form {
            background-color: white;
            padding: 20px;
            width: 400px;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }


        #categoryForm input, #categoryForm button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        #categoryForm button {
            background-color: #4CAF50;
            color: white;
            cursor: pointer;
        }

        #categoryForm a {
            display: block;
            text-align: center;
            color: red;
            text-decoration: none;
        }

        #categoryForm a:hover {
            text-decoration: underline;
        }

        #overlay {
            display: none;
        }

        #overlay.show {
            display: block;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.7);
            z-index: 9998;
        }
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
            <a href="index.html"> <img src="assets/img/icon.png" alt="Logo"></a>
        </div>

        <div class="category-management">
            <h2>Quản lý danh mục</h2>

            <!-- Form thêm/cập nhật danh mục -->
            <div id="categoryForm">
                <form action="manage-category" method="post">
                    <h3 id="formTitle">Thêm danh mục</h3>
                    <input type="hidden" id="action" name="action" value="add">
                    <input type="hidden" id="categoryId" name="id">
                    <label for="categoryName">Tên danh mục:</label>
                    <input id="categoryName" name="name" type="text" required>
                    <button type="submit">Lưu</button>
                    <a href="javascript:void(0)" onclick="hideForm()">Hủy</a>
                </form>
            </div>

            <!-- Overlay -->
            <div id="overlay" onclick="hideForm()"></div>

            <div class="chuc-nang">
                <button onclick="toggleForm('add')"><i class="fa-solid fa-plus"></i></button>
                <form action="manage-category" method="get">
                    <input type="hidden" name="action" value="search">
                    <input id="searchInput" name="keyword" placeholder="Tìm kiếm danh mục theo tên hoặc id..."
                           type="text">
                    <button style="background-color: #4CAF50" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                </form>
            </div>

            <table id="categoryTable">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên danh mục</th>
                    <th>Hành động</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="category" items="${categories}">
                    <tr>
                        <td>${category.id}</td>
                        <td>${category.name}</td>
                        <td>
                            <!-- Nút sửa danh mục -->
                            <button style="background-color: #4CAF50"
                                    onclick="toggleForm('edit', ${category.id}, '${category.name}')">Sửa
                            </button>

                            <!-- Nút xóa danh mục -->
                            <form action="manage-category" method="post" style="display: inline-block;">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="${category.id}">
                                <button type="submit"
                                        onclick="return confirm('Bạn có chắc chắn muốn xóa danh mục này?');">Xóa
                                </button>
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
    function toggleForm(formType, id = null, name = '') {
        var form = document.getElementById("categoryForm");
        var overlay = document.getElementById("overlay");
        var formTitle = document.getElementById("formTitle");
        var actionField = document.getElementById("action");
        var idField = document.getElementById("categoryId");
        var nameField = document.getElementById("categoryName");

        if (formType === 'add') {
            formTitle.innerText = 'Thêm danh mục';
            actionField.value = 'add';
            idField.value = '';
            nameField.value = '';
        } else if (formType === 'edit') {
            formTitle.innerText = 'Cập nhật danh mục';
            actionField.value = 'edit';
            idField.value = id;
            nameField.value = name;
        }

        // Hiển thị form và overlay
        form.style.display = 'block';
        overlay.classList.add('show');
    }

    // Hàm ẩn form khi nhấn "Hủy"
    function hideForm() {
        var form = document.getElementById("categoryForm");
        var overlay = document.getElementById("overlay");
        form.style.display = 'none';
        overlay.classList.remove('show');
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
</body>
</html>
