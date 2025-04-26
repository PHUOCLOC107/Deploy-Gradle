<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lý sản phẩm</title>
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
            <a href="index"> <img src="assets/img/logo3.png"></a>
        </div>
        <div class="admin-sidebar-nav">
            <ul>
                <li><a href="GeneralController"><i class="fas fa-tachometer-alt"></i> Tổng quát</a></li>
                <li><a href="manage-category"><i class="fa-solid fa-layer-group"></i> Quản lý danh mục</a></li>
                <li><a class="active" href="manage-products"><i class="fa-solid fa-bag-shopping"></i> Quản
                    lý sản phẩm</a></li>
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
            <a href="index"> <img src="assets/img/icon.png"></a>
        </div>
        <div class="admin-content-main">
            <!-- Product Management Section -->
            <div class="product-management">
                <h2>Quản lý sản phẩm</h2>
                <div class="chuc-nang">
                    <button onclick="toggleForm('add')"><i class="fa-solid fa-plus"></i></button>
                    <form action="manage-products" method="get">
                        <input type="hidden" name="action" value="search">
                        <input id="searchInput" name="keyword" placeholder="Tìm kiếm sản phẩm theo tên hoặc id...."
                               type="text">
                        <button style="background-color: #4CAF50" type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>
                </div>
                <div id="overlay"></div>
                <div id="product-form-container" style="display: none;">
                    <form id="product-form" action="save-product" method="post">
                        <input type="hidden" name="id" id="product-id">
                        <h2 id="form-title">Thêm sản phẩm</h2>
                        <label for="name">Tên sản phẩm:</label>
                        <input type="text" id="name" name="name" required>

                        <label for="price">Giá:</label>
                        <input type="number" id="price" name="price" required>

                        <label for="discountPercent">Giảm giá (%):</label>
                        <input type="number" id="discountPercent" name="discountPercent" required>

                        <label for="productType">Loại sản phẩm:</label>
                        <select id="productType" name="productType">
                            <option value="Cao cấp">Cao cấp</option>
                            <option value="Bình thường">Bình thường</option>
                        </select>
                        <label for="category">Danh mục:</label>
                        <select id="category" name="categoryId">
                            <c:forEach var="category" items="${sessionScope.categories}">
                                <option value="${category.id}">${category.name}</option>
                            </c:forEach>
                        </select>

                        <label for="videoUrl">Link video:</label>
                        <input type="text" id="videoUrl" name="videoUrl">

                        <label for="mainImage">Link ảnh chính:</label>
                        <input type="text" id="mainImage" name="mainImage">

                        <label for="stock">Số lượng:</label>
                        <input type="number" id="stock" name="stock" required>

                        <label for="description">Mô tả:</label>
                        <textarea id="description" name="description"></textarea>

                        <h3>Hình ảnh chi tiết</h3>
                        <input type="text" name="images[]" placeholder="Link ảnh chi tiết 1" required>
                        <input type="text" name="images[]" placeholder="Link ảnh chi tiết 2" required>
                        <input type="text" name="images[]" placeholder="Link ảnh chi tiết 3" required>
                        <input type="text" name="images[]" placeholder="Link ảnh chi tiết 4" required>
                        <input type="text" name="images[]" placeholder="Link ảnh chi tiết 5" required>

                        <h3>Thông số kỹ thuật</h3>
                        <label for="brand">Hãng:</label>
                        <input type="text" id="brand" name="brand">

                        <label for="productCode">Mã sản phẩm:</label>
                        <input type="text" id="productCode" name="productCode">

                        <label for="height">Chiều cao:</label>
                        <input type="text" id="height" name="height">

                        <label for="width">Chiều rộng:</label>
                        <input type="text" id="width" name="width">

                        <label for="dialDiameter">Đường kính mặt:</label>
                        <input type="text" id="dialDiameter" name="dialDiameter">

                        <label for="engine">Loại động cơ:</label>
                        <input type="text" id="engine" name="engine">

                        <label for="material">Chất liệu:</label>
                        <input type="text" id="material" name="material">

                        <label for="color">Màu sắc:</label>
                        <input type="text" id="color" name="color">

                        <label for="style">Phong cách:</label>
                        <input type="text" id="style" name="style">

                        <label for="power">Nguồn:</label>
                        <input type="text" id="power" name="power">

                        <button type="submit">Lưu</button>
                        <button type="button" id="cancelBtn">Hủy</button>
                    </form>
                </div>

                <table id="productTable">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Ảnh sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Giá</th>
                        <th>Danh mục</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="product" items="${products}">
                        <tr>
                            <td>${product.id}</td>
                            <td><img src="${product.image}" alt="Product Image" width="100"></td>
                            <td style="line-height: 26px">${product.name}</td>
                            <td>${product.price}</td>
                            <td>${product.categoryId}</td>
                            <td class="btn-action" style="display: flex">
                                <button style="background-color: #4CAF50; margin-right: 10px" class="editBtn" data-id="${product.id}">Sửa</button>
                                <button class="deleteBtn" data-id="${product.id}">Xóa</button>
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
    document.getElementById('btn-add-product').addEventListener('click', () => {
        document.getElementById('product-form-container').style.display = 'block';
        document.getElementById('overlay').style.display = 'block';
    });

    document.getElementById('cancelBtn').addEventListener('click', () => {
        document.getElementById('product-form-container').style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
    });

    document.getElementById('overlay').addEventListener('click', () => {
        document.getElementById('product-form-container').style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
    });

</script>

<script>
    function searchProduct() {
        const keyword = document.getElementById("searchInput").value;
        fetch("search-product?keyword=" + keyword)
            .then(response => response.text())
            .then(html => document.querySelector("tbody").innerHTML = html);
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