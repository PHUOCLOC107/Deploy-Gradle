<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.clock.utils.CurrencyFormatter" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tài khoản</title>
    <link href="./assets/img/icon.png" rel="icon" type="image/x-icon">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com" rel="preconnect">
    <link crossorigin href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;900&display=swap" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
</head>
<body>

<!-- Header -->
<div class="header">
    <div class="header__logo">
        <a href=""><img alt="" src="./assets/img/logo3.png"></a>
    </div>
    <div class="header__navbar">
        <ul>
            <li><a class="" href="index">TRANG CHỦ</a></li>
            <li><a href="about">GIỚI THIỆU</a></li>
            <li>
                <a href="product">SẢN PHẨM</a>
                <ul class="sub">
                    <li onclick="window.location.href=this.querySelector('a').href;">
                        <a href="new-product">MỚI</a></li>
                    <li onclick="window.location.href=this.querySelector('a').href;">
                        <a href="hot-product">BÁN CHẠY</a></li>
                    <li onclick="window.location.href=this.querySelector('a').href;">
                        <a href="sale-product">SALE</a>
                    </li>
                    <c:forEach var="category" items="${listCate}">
                        <li onclick="window.location.href=this.querySelector('a').href;">
                            <a href="product?category=${category.name}">${category.name}</a>
                        </li>
                    </c:forEach>
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

<!--  Account info -->
<div class="account-inf-container">

    <div class="account-inf">
        <h2>Thông tin tài khoản</h2>
        <h6>Tên: <span>${sessionScope.auth.fullname}</span></h6>
        <h6>Số điện thoại: <span>${sessionScope.auth.phone}</span></h6>
        <h6>Email: <span>${sessionScope.auth.email}</span></h6>
        <h6>Địa chỉ: <span>${sessionScope.auth.address}</span></h6>

        <button id="changePass"><i class="fa-solid fa-repeat"></i>Đổi mật khẩu</button>

        <!-- Modal đổi mật khẩu -->
        <div id="changePasswordModal" class="modal" style="display: none;">
            <div class="modal-content">
                <span class="close" onclick="closeChangePasswordModal()">&times;</span>
                <h3>Đổi mật khẩu</h3>

                <!-- Hiển thị thông báo nếu có -->
                <c:if test="${not empty message}">
                    <div class="success-message" style="color:  #12bd0b; font-size: 17px">${message}</div>
                </c:if>
                <c:if test="${not empty error}">
                    <div class="error-message" style="color:#CA1F28; font-size: 17px">${error}</div>
                </c:if>

                <form id="changePasswordForm" action="changepassword" method="post">
                    <div class="form-row2">
                        <label for="oldPassword">Mật khẩu cũ:</label>
                        <input type="password" id="oldPassword" name="oldPassword" placeholder="Nhập mật khẩu cũ"
                               required>
                    </div>
                    <div class="form-row2">
                        <label for="newPassword">Mật khẩu mới:</label>
                        <input type="password" id="newPassword" name="newPassword" placeholder="Nhập mật khẩu mới"
                               required>
                    </div>
                    <div class="form-row2">
                        <label for="confirmPassword">Xác nhận mật khẩu mới:</label>
                        <input type="password" id="confirmPassword" name="confirmPassword"
                               placeholder="Xác nhận mật khẩu mới" required>
                    </div>
                    <button type="submit">Lưu thay đổi</button>
                </form>
                <p><a href="forgotpassword.jsp">Quên mật khẩu?</a></p>
            </div>
        </div>

        <h2 id="update-header">Cập nhật thông tin</h2>
        <form id="updateAccountForm" action="update_infor" method="POST">
            <div class="form-row">
                <label for="updateFullName">Tên</label>
                <input type="text" id="updateFullName" name="fullName" placeholder="Cập nhật tên của bạn"
                       value="${sessionScope.user.fullName}">
            </div>
            <div class="form-row">
                <label for="updatePhone">Số điện thoại:</label>
                <input type="tel" id="updatePhone" name="phone" placeholder="Cập nhật số điện thoại"
                       value="${sessionScope.user.phone}">
            </div>
            <div class="form-row">
                <label for="updateEmail">Email:</label>
                <input type="text" id="updateEmail" name="email" placeholder="Cập nhật email của bạn"
                       value="${sessionScope.user.pemail}">
            </div>
            <div class="form-row">
                <label for="updateAddress">Địa chỉ:</label>
                <input type="text" id="updateAddress" name="address" placeholder="Cập nhật địa chỉ"
                       value="${sessionScope.user.address}">
            </div>
            <button style="margin-left: 180px" type="submit">Lưu thay đổi</button>
        </form>
        <a href="showHistory" id="his-btn"><div id="his-text">XEM LỊCH SỬ MUA HÀNG</div></a>
    </div>
    <c:choose>
        <c:when test="${not empty orders}">
            <div class="order-history">
                <h3>Lịch sử mua hàng</h3>
                <c:forEach var="order" items="${orders}">
                    <div class="order">
                        <h4>Đơn hàng #${order.id} - ${order.status}</h4>
                        <p>Ngày đặt: ${order.createdAt}</p>
                        <table>
                            <thead>
                            <tr>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Tổng giá</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${order.items}">
                                <tr>
                                    <td>${item.productName}</td>
                                    <td>${item.quantity}</td>
                                    <td>${CurrencyFormatter.formatCurrency(item.price)}</td>
                                    <td>${CurrencyFormatter.formatCurrency(item.totalPrice)}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <p><strong>Tổng tiền đơn hàng: ${CurrencyFormatter.formatCurrency(order.totalPrice)}</strong></p>
                    </div>
                </c:forEach>
            </div>
        </c:when>
    </c:choose>
</div>

<!-- Hộp thoại chat -->
<div class="chat-container">
    <div class="chat-button" id="chatButton" onclick="toggleChat()">
        <span id="chatIcon">💬</span>
    </div>
    <div class="chat-box" id="chatBox">
        <div class="chat-header">
            <img src="https://media.shopdongho.com/2023/09/chat-support-icon.svg" alt="">
            <h4>Hỗ trợ trực tuyến</h4>
        </div>
        <div class="chat-content">
            <a href="">
                <div class="chat-content-icons">
                    <img src="https://media.shopdongho.com/2023/03/68OaMdCz-socials-call-icon.svg" alt="">
                    <p class="greentext">0346.775.812</p>
                </div>
            </a>
            <a href="">
                <div class="chat-content-icons">
                    <img src="https://media.shopdongho.com/2023/03/YIo6s9FW-socials-messenger-icon.svg" alt="">
                    <p>Messenger Chat</p>
                </div>
            </a>
            <a href="https://zalo.me/g/erqzqr097">
                <div class="chat-content-icons">
                    <img src="https://media.shopdongho.com/2023/03/mEWLxvCZ-socials-zalo-icon.svg" alt="">
                    <p>Zalo Chat</p>
                </div>
            </a>
            <a href="">
                <div class="chat-content-icons">
                    <img src="https://media.shopdongho.com/2023/08/logo-vector-icon.svg" alt="">
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
<div class="footer account-footer">
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
                <img src="https://tuongxinh.com.vn/wp-content/uploads/2024/06/logoSaleNoti.png" alt="">
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
                <img src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/footer_trustbadge.png" alt="">
            </div>
        </div>
        <div class="footer-in-col">
            <p class="footer-large-text">ĐĂNG KÝ TƯ VẤN</p>
            <div class="footer-in-col-input">
                <input type="text" placeholder="Nhập số điện thoại">
                <button>Gửi</button>
            </div>
            <div class="icons-contact">
                <a href=""><img src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/facebook-1.png" alt=""></a>
                <a href=""><img src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/zalo.png" alt=""></a>
                <a href=""><img
                        src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/logo-youtube-tuong-xinh.png"
                        alt=""></a>
                <a href=""><img src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/tiktok.png" alt=""></a>
            </div>
        </div>
    </div>
</div>
<div class="footer-copyright">
    <p>
        &copy; 2024 WATCH63. DESIGN BY WATCH 63
    </p>
</div>
<script>
    // Hiển thị modal đổi mật khẩu
    document.getElementById("changePass").addEventListener("click", function () {
        document.getElementById("changePasswordModal").style.display = "block";
    });

    // Đóng modal đổi mật khẩu
    function closeChangePasswordModal() {
        document.getElementById("changePasswordModal").style.display = "none";
    }

    // Ẩn modal khi nhấn ra ngoài vùng nội dung
    window.onclick = function (event) {
        const modal = document.getElementById("changePasswordModal");
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };

</script>
<script src="assets/script/chatbox.js"></script>
<script src="assets/script/back_to_top.js"></script>
</body>
</html>
