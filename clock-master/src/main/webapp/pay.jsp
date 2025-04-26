<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.clock.utils.CurrencyFormatter" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán</title>
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
            <li><a href="index">TRANG CHỦ</a></li>
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
                    style="background: none; border: 1px solid black; cursor: pointer; width: 55px; height: 45px">
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

<div class="pay-container">
    <h2 id="pay-header">GIÁ TẠM TÍNH CHƯA BAO GỒM PHÍ SHIP</h2>
    <div class="pay-container-in">
        <div class="pay-info">
            <h1>THÔNG TIN THANH TOÁN</h1>
            <form action="pay" method="post">
                <div class="form-group">
                    <label for="fullname">Họ và tên*</label>
                    <input type="text" id="fullname" name="fullname" placeholder="Nhập họ và tên của bạn"
                           value="${sessionScope.auth != null ? sessionScope.auth.fullname: ""}" required>
                </div>
                <div class="form-group">
                    <label for="phone">Số Điện Thoại*</label>
                    <input type="tel" id="phone" name="phone" placeholder="Nhập số điện thoại liên hệ"
                           value="${sessionScope.auth != null ? sessionScope.auth.phone: ""}" required>
                </div>
                <div class="form-group">
                    <label for="province">Tỉnh/Thành Phố*</label>
                    <select id="province" name="province" onchange="updateDistricts()" required>
                        <option value="">Chọn tỉnh thành</option>
                        <option value="Hà Nội">Hà Nội</option>
                        <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                        <option value="An Giang">An Giang</option>
                        <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                        <option value="Bắc Giang">Bắc Giang</option>
                        <option value="Bắc Kạn">Bắc Kạn</option>
                        <option value="Bạc Liêu">Bạc Liêu</option>
                        <option value="Bắc Ninh">Bắc Ninh</option>
                        <option value="Bến Tre">Bến Tre</option>
                        <option value="Bình Dương">Bình Dương</option>
                        <option value="Bình Định">Bình Định</option>
                        <option value="Bình Phước">Bình Phước</option>
                        <option value="Bình Thuận">Bình Thuận</option>
                        <option value="Cà Mau">Cà Mau</option>
                        <option value="Cần Thơ">Cần Thơ</option>
                        <option value="Cao Bằng">Cao Bằng</option>
                        <option value="Đắk Lắk">Đắk Lắk</option>
                        <option value="Đắk Nông">Đắk Nông</option>
                        <option value="Điện Biên">Điện Biên</option>
                        <option value="Đồng Nai">Đồng Nai</option>
                        <option value="Đồng Tháp">Đồng Tháp</option>
                        <option value="Gia Lai">Gia Lai</option>
                        <option value="Hà Giang">Hà Giang</option>
                        <option value="Hà Nam">Hà Nam</option>
                        <option value="Hải Dương">Hải Dương</option>
                        <option value="Hải Phòng">Hải Phòng</option>
                        <option value="Hậu Giang">Hậu Giang</option>
                        <option value="Hòa Bình">Hòa Bình</option>
                        <option value="Hưng Yên">Hưng Yên</option>
                        <option value="Khánh Hòa">Khánh Hòa</option>
                        <option value="Kiên Giang">Kiên Giang</option>
                        <option value="Kon Tum">Kon Tum</option>
                        <option value="Lai Châu">Lai Châu</option>
                        <option value="Lâm Đồng">Lâm Đồng</option>
                        <option value="Lạng Sơn">Lạng Sơn</option>
                        <option value="Lào Cai">Lào Cai</option>
                        <option value="Long An">Long An</option>
                        <option value="Nam Định">Nam Định</option>
                        <option value="Nghệ An">Nghệ An</option>
                        <option value="Ninh Bình">Ninh Bình</option>
                        <option value="Ninh Thuận">Ninh Thuận</option>
                        <option value="Phú Thọ">Phú Thọ</option>
                        <option value="Phú Yên">Phú Yên</option>
                        <option value="Quảng Bình">Quảng Bình</option>
                        <option value="Quảng Nam">Quảng Nam</option>
                        <option value="Quảng Ngãi">Quảng Ngãi</option>
                        <option value="Quảng Ninh">Quảng Ninh</option>
                        <option value="Quảng Trị">Quảng Trị</option>
                        <option value="Sóc Trăng">Sóc Trăng</option>
                        <option value="Sơn La">Sơn La</option>
                        <option value="Tây Ninh">Tây Ninh</option>
                        <option value="Thái Bình">Thái Bình</option>
                        <option value="Thái Nguyên">Thái Nguyên</option>
                        <option value="Thanh Hóa">Thanh Hóa</option>
                        <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                        <option value="Tiền Giang">Tiền Giang</option>
                        <option value="TP Hồ Chí Minh">TP Hồ Chí Minh</option>
                        <option value="Trà Vinh">Trà Vinh</option>
                        <option value="Tuyên Quang">Tuyên Quang</option>
                        <option value="Vĩnh Long">Vĩnh Long</option>
                        <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                        <option value="Yên Bái">Yên Bái</option>
                        <option value="Hòa Bình">Hòa Bình</option>
                        <option value="Hải Phòng">Hải Phòng</option>
                        <option value="Thái Nguyên">Thái Nguyên</option>
                        <option value="Phú Thọ">Phú Thọ</option>
                        <option value="Bình Phước">Bình Phước</option>
                        <!-- Thêm tất cả các tỉnh thành ở đây -->
                    </select>
                </div>

                <div class="form-group">
                    <label for="district">Quận/Huyện*</label>
                    <select id="district" name="district" required>
                        <option value="">Chọn quận/huyện</option>
                        <!-- Các huyện sẽ được cập nhật khi chọn tỉnh thành -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="address">Địa Chỉ*</label>
                    <input type="text" id="address" name="address" placeholder="Nhập địa chỉ của bạn"
                           value="${sessionScope.auth != null ? sessionScope.auth.address: ""}" required>
                </div>

                <h1 id = "note-header">Ghi chú đơn hàng (tùy chọn)</h1>
                <div class="form-group">
                <textarea name="note" id="note" cols="85" rows="8"
                          placeholder="Ghi chú về đơn hàng, ví dụ: thời gian hay chỉ dẫn địa chỉ giao hàng chi tiết hơn."></textarea>
                </div>
                <button type="submit" class="pay-button" id="paymentButton">ĐẶT HÀNG</button>
            </form>
        </div>
        <div class="pay-order">
            <h1>ĐƠN HÀNG CỦA BẠN</h1>
            <table id="pay-order-table">
                <thead>
                <tr>
                    <th>SẢN PHẨM</th>
                    <th>TẠM TÍNH</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${sessionScope.cart.list}" var="cp">
                    <tr>
                        <td class="name">
                                ${cp.name} <span><br>x${cp.quantity}</span>
                        </td>
                        <td class="price">
                                ${cp.formattedTotalPrice}
                        </td>
                    </tr>
                </c:forEach>

                <!-- Dòng tạm tính -->
                <tr class="temp-row">
                    <td>TẠM TÍNH</td>
                    <td class="total-price">
                        ${CurrencyFormatter.formatCurrency(sessionScope.cart.total)}
                    </td>
                </tr>

                <!-- Dòng tổng tiền -->
                <tr class="total-row">
                    <td>TỔNG</td>
                    <td class="total-price">
                        ${CurrencyFormatter.formatCurrency(sessionScope.cart.total)}
                    </td>
                </tr>
                </tbody>
            </table>

            <p id="pay-text">Trả tiền mặt khi giao hàng</p>
            <p>Sau khi nhận được đơn hàng của bạn, chúng tôi sẽ liên hệ giao hàng theo thông tin bạn để lại. Bạn chỉ
                thanh toán khi đã nhận được hàng.</p>
            <p>Dữ liệu cá nhân của bạn sẽ được sử dụng để xử lý đơn đặt hàng của bạn, hỗ trợ trải nghiệm của bạn trên
                trang web này và cho các mục đích khác được mô tả trong
                <a href="">[Chính sách bảo mật]</a> của chúng tôi.</p>

        </div>
    </div>
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
                <a href=""><img src="https://tuongxinh.com.vn/wp-content/uploads/2023/09/logo-youtube-tuong-xinh.png" alt=""></a>
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
<script src="assets/script/chatbox.js"></script>
<script src="assets/script/back_to_top.js"></script>
<script>
    const districtsData = {
        "Hà Nội": [
            "Ba Đình", "Hoàn Kiếm", "Tây Hồ", "Long Biên", "Cầu Giấy", "Đống Đa", "Hai Bà Trưng", "Hoàng Mai", "Thanh Xuân"
        ],
        "Hồ Chí Minh": [
            "Quận 1", "Quận 2", "Quận 3", "Quận 4", "Quận 5", "Quận 6", "Quận 7", "Quận 8", "Quận 9", "Quận 10"
        ],
        "An Giang": [
            "Châu Đốc", "Long Xuyên", "Tân Châu", "Châu Thành", "An Phú", "Phú Tân", "Tịnh Biên", "Tri Tôn"
        ],
        "Bà Rịa - Vũng Tàu": [
            "Vũng Tàu", "Bà Rịa", "Long Điền", "Tân Thành", "Châu Đức", "Xuyên Mộc", "Đất Đỏ"
        ],
        "Bắc Giang": [
            "Bắc Giang", "Lạng Giang", "Yên Dũng", "Tân Yên", "Việt Yên", "Hiệp Hòa", "Lục Ngạn", "Lục Nam", "Sơn Động", "Yên Thế"
        ],
        "Bắc Kạn": [
            "Bắc Kạn", "Ba Bể", "Bạch Thông", "Chợ Đồn", "Chợ Mới", "Na Rì", "Ngân Sơn", "Pác Nặm"
        ],
        "Bạc Liêu": [
            "Bạc Liêu", "Hòa Bình", "Vĩnh Lợi", "Phước Long", "Giới Toại", "Hồng Dân", "Đông Hải", "Giồng Riềng"
        ],
        "Bắc Ninh": [
            "Bắc Ninh", "Từ Sơn", "Yên Phong", "Thuận Thành", "Gia Bình", "Quế Võ", "Tiên Du", "Lương Tài"
        ],
        "Bến Tre": [
            "Bến Tre", "Châu Thành", "Chợ Lách", "Giồng Trôm", "Mỏ Cày Bắc", "Mỏ Cày Nam", "Ba Tri", "Thạnh Phú", "Dai Loc"
        ],
        "Bình Dương": [
            "Thủ Dầu Một", "Bến Cát", "Dĩ An", "Thuận An", "Tân Uyên", "Bàu Bàng", "Phú Giáo", "Dầu Tiếng"
        ],
        "Bình Định": [
            "Quy Nhơn", "An Nhơn", "Hoài Nhơn", "Tuy Phước", "Vân Canh", "Phù Cát", "Phù Mỹ", "Hoài Ân", "An Lão", "Đức Phong"
        ],
        "Bình Phước": [
            "Đồng Xoài", "Bình Long", "Phước Long", "Chơn Thành", "Bù Đăng", "Bù Đốp", "Lộc Ninh", "Hớn Quản", "Đắk Oai", "Bù Gia Mập"
        ],
        "Bình Thuận": [
            "Phan Thiết", "La Gi", "Bắc Bình", "Hàm Thuận Bắc", "Hàm Thuận Nam", "Tánh Linh", "Đức Linh", "Phú Quý", "Dương Đông", "Tuy Phong"
        ],
        "Cà Mau": [
            "Cà Mau", "Năm Căn", "Phú Tân", "U Minh", "Thới Bình", "Trần Văn Thời", "Cái Nước", "Đầm Dơi", "Ngọc Hiển", "Kênh Vĩnh Tế"
        ],
        "Cần Thơ": [
            "Cần Thơ", "Bình Thủy", "Cái Răng", "Ninh Kiều", "Ô Môn", "Thốt Nốt", "Vĩnh Thạnh", "Phong Điền", "Cờ Đỏ", "Kiên Bình"
        ],
        "Cao Bằng": [
            "Cao Bằng", "Bảo Lạc", "Bảo Lâm", "Hòa An", "Nguyên Bình", "Phục Hòa", "Thạch An", "Quảng Uyên", "Trà Lĩnh", "Thọ Xuân"
        ],
        "Đắk Lắk": [
            "Buôn Ma Thuột", "Cư M'gar", "Ea Kar", "Ea Súp", "Krông Ana", "Krông Búk", "Krông Pắc", "Lắk", "M'Drắk", "Buôn Đôn"
        ],
        "Đắk Nông": [
            "Gia Nghĩa", "Cư Jút", "Đắk Glong", "Đắk Mil", "Đắk R'lấp", "Krông Nô", "Tuy Đức"
        ],
        "Điện Biên": [
            "Điện Biên Phủ", "Mường Lay", "Mường Chà", "Tủa Chùa", "Điện Biên Đông", "Mường Ảng", "Tuần Giáo", "Điện Biên"
        ],
        "Đồng Nai": [
            "Biên Hòa", "Long Khánh", "Nhơn Trạch", "Vĩnh Cửu", "Định Quán", "Thống Nhất", "Cẩm Mỹ", "Trảng Bom", "Tân Phú", "Xuân Lộc"
        ],
        "Đồng Tháp": [
            "Cao Lãnh", "Sa Đéc", "Hồng Ngự", "Tân Hồng", "Tam Nông", "Lấp Vò", "Thanh Bình", "Châu Thành", "Cái Bè"
        ],
        "Gia Lai": [
            "Pleiku", "An Khê", "Ayun Pa", "Chư Păh", "Chư Prông", "Chư Sê", "Ia Grai", "Ia Pa", "Kbang", "Krông Pa"
        ],
        "Hà Giang": [
            "Hà Giang", "Quản Bạ", "Yên Minh", "Vị Xuyên", "Bắc Mê", "Mèo Vạc", "Đồng Văn", "Hoàng Su Phì", "Xín Mần"
        ],
        "Hà Nam": [
            "Phủ Lý", "Duy Tiên", "Kim Bảng", "Lý Nhân", "Thanh Liêm", "Bình Lục"
        ],
        "Hải Dương": [
            "Hải Dương", "Chí Linh", "Kim Thành", "Kinh Môn", "Nam Sách", "Ninh Giang", "Tứ Kỳ", "Thanh Miện", "Cẩm Giàng"
        ],
        "Hải Phòng": [
            "Hải Phòng", "Quận Lê Chân", "Dương Kinh", "Kiến An", "Hồng Bàng", "Ngo Quyen", "An Dương", "Bạch Đằng", "Lạch Tray"
        ],
        "Hậu Giang": [
            "Vị Thanh", "Long Mỹ", "Châu Thành", "Phụng Hiệp", "Vị Thuỷ", "Ngã Bảy", "Châu Thành A", "Nga Hộ"
        ],
        "Quảng Ngãi": [
            "Quảng Ngãi", "Ba Tơ", "Bình Sơn", "Đức Phổ", "Mộ Đức", "Minh Long", "Nghĩa Hành", "Sơn Tịnh", "Tư Nghĩa", "Trà Bồng", "Trà Phú", "Lý Sơn"
        ]
    };

    // Cập nhật danh sách huyện/quận khi chọn tỉnh thành
    function updateDistricts() {
        const province = document.getElementById("province").value;
        const districtSelect = document.getElementById("district");
        // Làm sạch danh sách huyện
        districtSelect.innerHTML = "<option value=''>Chọn quận/huyện</option>";
        // Nếu tỉnh thành đã được chọn
        if (province && districtsData[province]) {
            // Thêm các huyện vào danh sách
            districtsData[province].forEach(district => {
                const option = document.createElement("option");
                option.value = district;
                option.textContent = district;
                districtSelect.appendChild(option);
            });
        }
    }
</script>
</body>
</html>