<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giới thiệu</title>
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
                <li><a class="active" href="about">GIỚI THIỆU</a></li>
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
            <div class="header__cta-cart">
                <div class="header__cta-cart-totalproduct">
                    <span id="cart-count">${sessionScope.cart != null ? sessionScope.cart.totalQuantity: 0}</span>
                </div>
                <a href="ShowCart"><i class="fa-solid fa-shopping-cart"></i></a>
            </div>
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

    <div class="wrapper">

        <div class="gt_title">
            <h1 class="double-word-underline">
                <span class="underline">Giới</span>
                <span class="underline">Thiệu</span>
            </h1>
        </div>

        <div class="line-with-icon">
            <span class="line"></span>
            <i class="fa-solid fa-circle"></i>
            <span class="line"></span>
        </div>


        <div class="content">
            <div class="gt_text">
                <h2>63-WATCH Kiến tạo không gian sống hoàn hảo</h2>
                <p class="gt_text_1"><span class="highlighted-text">63-WATCH </span> ra đời từ ý tưởng tạo nên sự khác
                    biệt cho không gian sống với mong muốn mang đến cho khách hàng những sản phẩm tốt nhất. Danh mục sản
                    phẩm đồng hồ treo tường của chúng tôi thường xuyên được cập nhật và đổi mới liên tục nhằm cung cấp
                    cho khách hàng những dòng sản phẩm thịnh hành bắt kịp xu hướng trên thị trường.</p>

                <h3>VỀ SẢN PHẨM</h3>
                <p>Đồng hồ treo tường là cách tuyệt vời để tạo điểm nhấn và thể hiện phong cách riêng. Tại <span
                        class="highlighted-text">63-WATCH</span>, bạn sẽ tìm thấy những mẫu mã đa dạng từ phong cảnh
                    thiên nhiên đến trừu tượng, từ màu sắc tươi sáng đến tĩnh lặng. Với đồng hồ treo tường hiện nay
                    không chỉ để xem giờ mà còn dùng để trang trí nội thất, mang lại sự tinh tế và sự sống không gian
                    xung quanh ngôi nhà bạn.</p>

            </div>
            <div class="gt_img">
                <img src="assets/img/GioiThieu/gt_background_4.jpg" alt="">
            </div>
        </div>
    </div>

    <div class="gt_section2">
        <div class="gt_text_img">
            <div class="gt_img_container">
                <img src="assets/img/GioiThieu/gt_background_3.jpg" alt="">
                <div class="gt_text_left">
                    <div class="gt_service">
                        <h2>DỊCH VỤ</h2>
                        <i class="fa-brands fa-servicestack"></i>
                    </div>

                    <p>Đến với <span class="highlighted-text">63-WATCH</span> khách hàng sẽ cảm nhận được sự thân thiện
                        gần gũi, tinh thần trách nhiệm cao, kiến thức chuyên sâu của nhân viên từ cửa hàng. Chúng tôi
                        luôn chú trọng đến cập nhật mẫu mã thiết kế mới, dịch vụ khách hàng, chế độ bảo hành, <span
                                class="highlighted-text">63-WATCH</span> luôn cố gắng để trở thành người bạn thân thiết
                        của khách hàng, lắng nghe những chia sẻ về sản phẩm để tiếp tục cho ra những sản phẩm tốt hơn
                        khiến người dùng hài lòng nhất.</p>
                </div>
                <div class="gt_text_right">
                    <div class="gt_service">
                        <h2>SỨ MỆNH</h2>
                        <i class="fa-solid fa-handshake"></i>
                    </div>

                    <p>Với sứ mệnh mang đến không gian sống đẹp đẽ, sang trọng, độc đáo theo yêu cầu của khách hàng. Tại
                        <span class="highlighted-text">63-WATCH</span> chúng tôi hiểu rằng làm mới không gian sống sẽ
                        giúp cho mọi người có những trải nghiệm mới và thoải mái trong mái ấm của mình. Chính vì vậy,
                        với tiêu chí <span class="highlighted-text">UY TÍN - CHẤT LƯỢNG - CHUYÊN NGHIỆP</span> chúng tôi
                        sẽ không ngừng nổ lực, cải thiện để mang đến những trải nghiệm tuyệt vời đến quý khách hàng.</p>

                </div>
            </div>
        </div>
    </div>

    <div class="gt_section3">
        <div class="gt_btn">
            <div class="btn hotline">
                <i class="fa-solid fa-phone-volume"></i>
                <div class="text-container">
                    <h3>HOTLINE</h3>
                    <p>+84 123 456 789</p>
                </div>
            </div>

            <div class="btn repair">
                <i class="fa-solid fa-screwdriver-wrench"></i>
                <div class="text-container">
                    <h3>BẢO HÀNH</h3>
                    <p>Bảo hành chính hãng 24 tháng</p>
                </div>
            </div>

            <div class="btn advise">
                <i class="fa-solid fa-comment-dots"></i>
                <div class="text-container">
                    <h3>HỔ TRỢ</h3>
                    <p>Tư vấn hỗ trợ nhanh nhất</p>
                </div>
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
</div>


<script src="assets/script/chatbox.js"></script>
<script src="assets/script/logout.js"></script>
<script src="assets/script/cart.js"></script>
<script src="assets/script/search-all.js"></script>
<script src="assets/script/back_to_top.js"></script>

</body>
</html>