<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đồng hồ quà tặng</title>
    <link href="./assets/img/icon.png" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link crossorigin href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="header">
        <div class="header__logo">
            <a href=""><img alt="" src="./assets/img/logo3.png"></a>
        </div>
        <div class="header__navbar">
            <ul>
                <li><a href="index">TRANG CHỦ</a></li>
                <li><a href="about">GIỚI THIỆU</a></li>
                <li>
                    <a class="active" href="product">SẢN PHẨM</a>
                    <ul class="sub">
                        <li onclick="window.location.href=this.querySelector('a').href;"><a
                                href="new-product">MỚI</a></li>
                        <li onclick="window.location.href=this.querySelector('a').href;"><a href="hot-product">BÁN
                            CHẠY</a></li>
                        <li onclick="window.location.href=this.querySelector('a').href;"><a href="sale-product">SALE</a>
                        </li>
                        <li onclick="window.location.href=this.querySelector('a').href;"><a href="picture-clock">ĐỒNG
                            HỒ TRANH</a></li>
                        <li onclick="window.location.href=this.querySelector('a').href;"><a href="peacock-clock">ĐỒNG
                            HỒ CON CÔNG</a></li>
                        <li onclick="window.location.href=this.querySelector('a').href;"><a href="gift-clock">ĐỒNG
                            HỒ QUÀ TẶNG</a></li>
                    </ul>
                </li>
                <li><a href="contact">LIÊN HỆ</a></li>
            </ul>
        </div>
        <div class="header__search">
            <form action="product" method="get"
                  style="display: flex; align-items: center;justify-content: center; width: 280px;">
                <button type="submit" class="header__search-icon"
                        style="background: none; border: 1px solid black; cursor: pointer; width: 55px; height: 45px; margin-bottom: 40px">
                    <i class="fa-solid fa-magnifying-glass" style="color: #CA1F28"></i>
                </button>
                <input id="search-bar" name="search" placeholder="Tìm kiếm..." type="text"
                       value="${param.search != null ? param.search : ''}">
            </form>
        </div>
        <div class="header__cta">
            <a href="">
                <div class="header__cta-cart">
                    <div class="header__cta-cart-totalproduct">
                        <span id="cart-count">${sessionScope.cart != null ? sessionScope.cart.totalQuantity: 0}</span>
                    </div>
                    <a href="ShowCart"><i class="fa-solid fa-shopping-cart"></i></a>
                </div>
            </a>
            <!-- Các nút Đăng nhập, Đăng ký, Tài khoản và Đăng xuất -->
            <c:choose>
                <c:when test="${not empty sessionScope.auth}">
                    <!-- Nếu đã đăng nhập, hiển thị nút Tài khoản và Đăng xuất -->
                    <a class="header__cta-login" href="account.jsp" id="account-button" style="display: block;">
                        <div class="header__cta-login">
                            <i class="fa-solid fa-user account-icon"></i>
                            <h6>Tài khoản</h6>
                        </div>
                    </a>
                    <a class="header__cta-login" href="logout" id="logout-button" style="display: block;">
                        <div class="header__cta-login">
                            <i class="fa-solid fa-sign-out-alt account-icon"></i>
                            <h6>Đăng xuất</h6>
                        </div>
                    </a>
                </c:when>
                <c:otherwise>

                    <a class="header__cta-login" href="login.jsp" id="login-button"
                       style="display: block;  margin-right: 5px;">
                        <div class="header__cta-login">
                            <i class="fa-solid fa-user"></i>
                            <h6>Đăng nhập</h6>
                        </div>
                    </a>
                    <a class="header__cta-login" href="register.jsp" id="login-button" style="display: block;">
                        <div class="header__cta-login">
                            <i class="fa-solid fa-user"></i>
                            <h6>Đăng ký</h6>
                        </div>
                    </a>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!--Background-->
    <div class="background2"></div>

    <div class="main container-in">
        <!--   Products   -->
        <h1>Đồng hồ quà tặng</h1>
        <p id="search-result-count" style="display: none;">Có <span id="search-count">0</span> sản phẩm được tìm thấy
        </p>
        <form action="" method="GET" class="sort-form">
            <label for="sort">Sắp xếp theo:</label>
            <select id="sort" name="sort-by" onchange="this.form.submit()">
                <option value="sort-default" ${sortBy == 'sort-default' ? 'selected' : ''}>Mặc định</option>
                <option value="sort-new" ${sortBy == 'sort-new' ? 'selected' : ''}>Mới nhất</option>
                <option value="sort-popular" ${sortBy == 'sort-popular' ? 'selected' : ''}>Độ phổ biến</option>
                <option value="sort-lowToHigh" ${sortBy == 'sort-lowToHigh' ? 'selected' : ''}>Giá thấp đến cao</option>
                <option value="sort-highToLow" ${sortBy == 'sort-highToLow' ? 'selected' : ''}>Giá cao đến thấp</option>
            </select>
        </form>


        <div id="product_main">
            <c:forEach var="product" items="${product}">
                <div class="main-product-clock">
                    <div class="badge-container">
                        <c:if test="${product.discountPercent > 0}">
                            <span class="discount-badge">-${product.discountPercent}%</span>
                        </c:if>

                        <c:if test="${product.isNew}">
                            <span class="new-badge">NEW</span>
                        </c:if>
                    </div>
                    <div class="product_container">
                        <div class="product">
                            <a class="product_detail" href="product-detail?pid=${product.id}">
                                <div class="description">
                                    <img loading="lazy" src="${product.image}" alt="${product.name}">
                                    <span title="${product.name}">${product.name}</span>
                                    <div class="price-container" data-price="${product.price}"
                                         data-discount="${product.discountPercent}">
                                        <del class="old-price"></del>
                                        <h2 class="new-price"></h2>
                                    </div>
                                    <a href="add-cart?pid=${product.id}" class="add-to-cart"><i class="fa-solid fa-cart-plus cart"></i></a>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="pagination">
            <c:if test="${currentPage > 1}">
                <!-- Bao gồm sort-by trong URL khi chuyển sang trang trước -->
                <a href="?page=${currentPage - 1}&sort-by=${sortBy}" class="pagination-prev">Trước</a>
            </c:if>

            <c:forEach begin="1" end="${totalPages}" var="page">
                <!-- Bao gồm sort-by trong URL khi chuyển sang trang khác -->
                <a href="?page=${page}&sort-by=${sortBy}" class="${page == currentPage ? 'active' : ''}">${page}</a>
            </c:forEach>

            <c:if test="${currentPage < totalPages}">
                <!-- Bao gồm sort-by trong URL khi chuyển sang trang sau -->
                <a href="?page=${currentPage + 1}&sort-by=${sortBy}" class="pagination-next">Sau</a>
            </c:if>
        </div>


    </div>


    <!-- Hộp thoại chat -->
    <div class="chat-container">
        <div class="chat-button" id="chatButton" onclick="toggleChat()">
            <span id="chatIcon">💬</span>
        </div>
        <div class="chat-box" id="chatBox">
            <div class="chat-header">
                <img alt="" src="https://media.shopdongho.com/2023/09/chat-support-icon.svg">
                <h4>Hỗ trợ trực tuyến</h4>
            </div>
            <div class="chat-content">
                <a href="">
                    <div class="chat-content-icons">
                        <img alt="" src="https://media.shopdongho.com/2023/03/68OaMdCz-socials-call-icon.svg">
                        <p class="greentext">0346.775.812</p>
                    </div>
                </a>
                <a href="">
                    <div class="chat-content-icons">
                        <img alt="" src="https://media.shopdongho.com/2023/03/YIo6s9FW-socials-messenger-icon.svg">
                        <p>Messenger Chat</p>
                    </div>
                </a>
                <a href="https://zalo.me/g/erqzqr097">
                    <div class="chat-content-icons">
                        <img alt="" src="https://media.shopdongho.com/2023/03/mEWLxvCZ-socials-zalo-icon.svg">
                        <p>Zalo Chat</p>
                    </div>
                </a>
                <a href="">
                    <div class="chat-content-icons">
                        <img alt="" src="https://media.shopdongho.com/2023/08/logo-vector-icon.svg">
                        <p>Hệ Thống Cửa Hàng</p>
                    </div>
                </a>
            </div>
        </div>
    </div>

    <!-- Nút quay lại đầu trang -->
    <a href="#" id="backToTop" class="back-to-top">
        <i class="fa-solid fa-chevron-up"></i>
    </a>

    <!--  Footer -->
    <div class="footer">
        <div class="footer-in">
            <div class="footer-in-col">
                <div class="footer-in-col-1">
                    <div class="icons-col-1">
                        <i class="fa-solid fa-location-dot"></i>
                    </div>
                    <p>
                        Showroom: Số 54/274 Nguyễn Lân,<br> Trường Chinh, Hà Nội
                    </p>
                </div>
                <div class="footer-in-col-1">
                    <div class="icons-col-1">
                        <i class="fa-solid fa-phone"></i>
                    </div>
                    <p>
                        Điện thoại: <span><a href="">0374.517349</a> </span>-<span> <a
                            href="">0374.517349</a></span><br>
                        -<span> <a href="">0374.517349</a></span>
                    </p>
                </div>
                <div class="footer-in-col-1">
                    <div class="icons-col-1">
                        <i class="fa-solid fa-envelope"></i>
                    </div>
                    <p>
                        Email: <a href="">nhom63@gmail.com.vn</a>
                    </p>
                </div>
                <div class="footer-in-col-1">
                    <div class="icons-col-1">
                        <i class="fa-solid fa-clock"></i>
                    </div>
                    <p>
                        Giờ mở cửa: 07:00 - 21:00h hàng ngày
                    </p>
                </div>
            </div>
            <div class="footer-in-col">
                <p class="footer-large-text">
                    HƯỚNG DẪN KHÁCH HÀNG
                </p>
                <p>
                    <a href="">Hướng dẫn mua hàng tại cửa hàng</a>
                </p>
                <p>
                    <a href="">Hướng dẫn mua hàng Online</a>
                </p>
                <p>
                    <a href="">Chính sách kiểm hàng</a>
                </p>
                <p>
                    <a href="">Chính sách xử lý khiếu nại</a>
                </p>
                <div class="icons-check">
                    <img alt="" src="https://tuongxinh.com.vn/wp-content/uploads/2024/06/logoSaleNoti.png">
                </div>
            </div>
            <div class="footer-in-col">
                <p class="footer-large-text">
                    CHÍNH SÁCH ƯU ĐÃI
                </p>
                <p>
                    <a href="">Chính sách vận chuyển</a>
                </p>
                <p>
                    <a href="">Chính sách đổi trả và hoàn tiền</a>
                </p>
                <p>
                    <a href="">Chính sách thanh toán</a>
                </p>
                <p>
                    <a href="">Chính sách bảo mật thông tin</a>
                </p>
                <div class="icons-pay">
                    <img alt="" src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/footer_trustbadge.png">
                </div>
            </div>
            <div class="footer-in-col">
                <p class="footer-large-text">ĐĂNG KÝ TƯ VẤN</p>
                <div class="footer-in-col-input">
                    <input placeholder="Nhập số điện thoại" type="text">
                    <button>Gửi</button>
                </div>
                <div class="icons-contact">
                    <a href=""><img alt="" src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/facebook-1.png"></a>
                    <a href=""><img alt="" src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/zalo.png"></a>
                    <a href=""><img
                            alt=""
                            src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/logo-youtube-tuong-xinh.png"></a>
                    <a href=""><img alt="" src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/tiktok.png"></a>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-copyright">
        <p>
            &copy; 2024 WATCH63. DESIGN BY WATCH 63
        </p>
    </div>

</div>

<script src="assets/script/chatbox.js"></script>
<script src="assets/script/product.js"></script>
<script src="assets/script/logout.js"></script>
<script src="assets/script/cart.js"></script>
<script src="assets/script/search.js"></script>
<script src="assets/script/back_to_top.js"></script>
</body>
</html>