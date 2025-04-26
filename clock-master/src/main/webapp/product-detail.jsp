<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>
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
                    <a href="product">SẢN PHẨM</a>
                    <ul class="sub">
                        <li onclick="window.location.href=this.querySelector('a').href;">
                            <a href="new-product">Mới</a></li>
                        <li onclick="window.location.href=this.querySelector('a').href;">
                            <a href="hot-product">Bán chạy</a></li>
                        <li onclick="window.location.href=this.querySelector('a').href;">
                            <a href="sale-product">Sale</a>
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

    <!--Main - Product_Detail-->
    <div class="main_product_detai">
        <div class="return_menu">
            <a href="index.jsp">Trang chủ ></a>
            <a href="product">Sản phẩm ></a>
            <a href="#">${productDetail.name}</a>
        </div>

        <div class="center_pro_detail">
            <div class="img_pro_detail">
                <div class="img_max_pro">
                    <span class="arrow left" onclick="prevImage()">&#10094;</span>
                    <img src="${productDetail.image}" alt="">
                    <span class="arrow right" onclick="nextImage()">&#10095;</span>
                </div>

                <div class="img_min_pro">
                    <c:forEach var="image" items="${productImages}">
                        <img src="${image.imageUrl}" alt="">
                    </c:forEach>
                </div>
            </div>

            <div class="infor_pro_detail">
                <h1 class="name_pro_detail">${productDetail.name}</h1>
                <div class="price_pro">
                    <c:if test="${productDetail.discountPercent > 0}">
                        <span><del class="old-price">${formattedPrice}</del></span>
                        <span><h2 class="new-price">${formattedDiscountedPrice}</h2></span>
                    </c:if>
                    <c:if test="${productDetail.discountPercent == 0}">
                        <span><h2 class="new-price">${formattedPrice}</h2></span>
                    </c:if>
                </div>

                <div class="refund_pro">
                    <p>Chính sách hoàn trả: </p>
                    <div class="refund_icon">
                        <i class="fa-solid fa-repeat"></i>
                        <span>${productDetail.refundPolicy}</span>
                    </div>
                </div>

                <div class="transport_pro">
                    <p>Vận chuyển: </p>
                    <div class="transport_icon">
                        <i class="fa-solid fa-truck"></i>
                        <span>${productDetail.shippingInfo}</span>
                    </div>
                </div>

                <div class="type_pro">
                    <p>Loại hàng:</p>
                    <div class="type">
                        <c:choose>
                            <c:when test="${productDetail.productType == 'Cao cấp'}">
                                <div class="premium_pro"><span>Cao cấp</span></div>
                                <div class="normal_pro"><span>Bình thường</span></div>
                            </c:when>
                            <c:when test="${productDetail.productType == 'Bình thường'}">
                                <div class="normal_pro"><span>Cao cấp</span></div>
                                <div class="premium_pro"><span>Bình thường</span></div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>


                <div class="sl_product_detail">
                    <span class="sl">Số lượng:</span>
                    <div class="sl_pro">
                        <button class="decrease" onclick="changeQuantity(-1)">-</button>
                        <span id="quantity">1</span>
                        <button class="increase" onclick="changeQuantity(1)">+</button>
                    </div>
                    <div class="stock_pro_detail">
                        <span class="stock">Kho: <span id="num_stock">${productDetail.stock}</span></span>
                    </div>
                </div>

                <div class="buy_pro_detail">
                    <a href="#" onclick="addToCart(${productDetail.id})" style="text-decoration: none; color: #000000">
                        <div class="shopingcart_pro">
                            <i class="fa-solid fa-cart-shopping"></i>
                            <p>Thêm vào giỏ hàng</p>
                        </div>
                    </a>
                    <a href="#" onclick="buyNow(${productDetail.id})" style="text-decoration: none; color: #000000">
                        <div class="buy_pro">
                            <p>MUA NGAY</p>
                        </div>
                    </a>
                </div>
                <div class="infor_refund_guarantee">
                    <div class="col_refund">
                        <div class="col_refund_icon">
                            <i class="fa-solid fa-truck"></i>
                        </div>
                        <div class="col_refund_text">
                            <p class="bold_refund">MIỄN PHÍ VẬN CHUYỂN VỚI ĐƠN HÀNG TỪ <span class="highlighted-text">1.000.000đ</span>
                            </p>
                            <p>Giao hàng SIÊU TỐC trong vòng 24h - SHOP COD miễn phí</p>
                        </div>
                    </div>

                    <div class="col_refund">
                        <div class="col_refund_icon">
                            <i class="fa-solid fa-shield"></i>
                        </div>
                        <div class="col_refund_text">
                            <p class="bold_refund">BẢO HÀNH <span class="highlighted-text">24 THÁNG </span>DO LỖI NHÀ
                                SẢN XUẤT</p>
                            <p>Tăng Thêm Thời Gian Bảo Hành Lên Đến 2 Năm</p>
                        </div>
                    </div>

                    <div class="col_refund">
                        <div class="col_refund_icon">
                            <i class="fa-solid fa-award"></i>
                        </div>
                        <div class="col_refund_text">
                            <p class="bold_refund">CAM KẾT <span class="highlighted-text">100% </span>CHÍNH HÃNG</p>
                            <p>Hoàn Lại Tiền Gấp 10 Lần Nếu Phát Hiện Hàng Giả - Hàng Nhái</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="tech_infor">
            <hr class="line_tech">
            <h1 class="tech_head">Thông số kỹ thuật</h1>
            <table>
                <tr>
                    <td><span class="border_tech">Thương hiệu: </span></td>
                    <td>${productDetail.brand}</td>
                    <td><span class="border_tech">Mã sản phẩm:</span></td>
                    <td>${productDetail.productCode}</td>
                </tr>
                <tr>
                    <td><span class="border_tech">Chiều cao:</span></td>
                    <td>${productDetail.height}</td>
                    <td><span class="border_tech">Chiều rộng:</span></td>
                    <td>${productDetail.width}</td>
                </tr>
                <tr>
                    <td><span class="border_tech">Mặt đồng hồ:</span></td>
                    <td>${productDetail.dialDiameter}</td>
                    <td><span class="border_tech">Động cơ:</span></td>
                    <td>${productDetail.engine}</td>
                </tr>
                <tr>
                    <td><span class="border_tech">Chất liệu:</span></td>
                    <td>${productDetail.material}</td>
                    <td><span class="border_tech">Màu sản phẩm:</span></td>
                    <td>${productDetail.color}</td>
                </tr>
                <tr>
                    <td><span class="border_tech">Phong cách:</span></td>
                    <td>${productDetail.style}</td>
                    <td><span class="border_tech">Năng lượng:</span></td>
                    <td>${productDetail.power}</td>
                </tr>
            </table>

            <hr class="line_tech">
            <h1 class="tech_head">Thông tin sản phẩm</h1>
            <div class="text_infor_pd">
                <p class="pd_text">${productDetail.description}</p>
                <div class="video_pro">
                    <iframe width="700" height="400" src="${productDetail.videoUrl}"
                            title="YouTube video player" frameborder="0" allowfullscreen></iframe>
                </div>

            </div>
            <hr class="line_tech">
            <h1 class="tech_head">Phân biệt hàng thật - giả</h1>
            <div class="img_check_pro">
                <img src="assets/img/pd/pd_01.png" alt="">
                <img src="assets/img/pd/pd_02.png" alt="">
            </div>

            <hr class="line_tech">
            <h1 class="tech_head">Sản phẩm tương tự</h1>
            <div id="product_main">
                <c:forEach var="product" items="${similarProducts}">
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
                                        <div class="price-container" data-price="${product.price}" data-discount="${product.discountPercent}">
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
<script>
    function addToCart(productId) {
        var quantity = document.getElementById('quantity').innerText;
        var url = "add-cart?pid=" + productId + "&quantity=" + quantity;
        // Chuyển hướng đến URL với tham số dynamic
        window.location.href = url;
    }

    function buyNow(productId) {
        // Lấy số lượng từ phần tử quantity
        var quantity = document.getElementById('quantity').innerText;
        // Thêm sản phẩm vào giỏ hàng
        var url = "add-cart?pid=" + productId + "&quantity=" + quantity;
        window.location.href = url;
        // Sau khi thêm vào giỏ hàng, chuyển hướng đến trang giỏ hàng
        window.location.reload();
        window.location.href = "cart.jsp";
    }
</script>
<script src="assets/script/chatbox.js"></script>
<script src="assets/script/product.js"></script>
<script src="assets/script/logout.js"></script>
<script src="assets/script/product_detail.js"></script>
<script src="assets/script/cart.js"></script>
<script src="assets/script/search-all.js"></script>
<script src="assets/script/back_to_top.js"></script>
</body>
</html>