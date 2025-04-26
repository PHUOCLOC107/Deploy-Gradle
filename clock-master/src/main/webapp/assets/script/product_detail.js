
// Thay đổi số lượng
function changeQuantity(amount) {
    var quantity = document.getElementById("quantity");
    var currentQuantity = parseInt(quantity.textContent);
    var newQuantity = currentQuantity + amount;

    if (newQuantity <= 0) {
        newQuantity = 1; // Đảm bảo số lượng không âm
    }
    quantity.textContent = newQuantity;
}

// Chọn phần tử ảnh lớn và các hình ảnh nhỏ
const largeImage = document.querySelector('.img_max_pro img');
const thumbnails = document.querySelectorAll('.img_min_pro img');

// Thêm sự kiện cho mỗi hình ảnh nhỏ
thumbnails.forEach((thumbnail, index) => {
    thumbnail.addEventListener('click', function () {
        // Cập nhật ảnh lớn với nguồn của ảnh nhỏ được chọn
        largeImage.src = thumbnail.src;

        // Thêm lớp active cho ảnh nhỏ được chọn và loại bỏ khỏi ảnh khác
        thumbnails.forEach(img => img.classList.remove('active'));
        thumbnail.classList.add('active');
    });
});

// Danh sách các nguồn hình ảnh
const images = [
    "https://shouse.vn/wp-content/uploads/2019/11/dong-ho-con-cong-1-1.jpg",
    "https://shouse.vn/wp-content/uploads/2019/11/dong-ho-con-chim-cong-3.jpg",
    "https://tapdoannangluongxanh.vn/wp-content/uploads/2021/03/denled_do-trang-tri-phong-ngu-cho-nu-e1616255056258.jpg",
    "assets/img/pd/pd_04.png",
    "assets/img/pd/pd_03.png"
];

let currentIndex = 0; // Hình ảnh hiện tại

// Cập nhật hình ảnh lớn và hình thu nhỏ đang chọn
function updateSlider() {
    largeImage.src = images[currentIndex];
    thumbnails.forEach((thumb, index) => {
        thumb.classList.toggle('active', index === currentIndex);
    });
}

// Chuyển sang hình ảnh trước
function prevImage() {
    currentIndex = (currentIndex === 0) ? images.length - 1 : currentIndex - 1;
    updateSlider();
}

// Chuyển sang hình ảnh tiếp theo
function nextImage() {
    currentIndex = (currentIndex === images.length - 1) ? 0 : currentIndex + 1;
    updateSlider();
}

//sản phẩm sẽ thêm vào giỏ hàng
const product = {
    name: "Đồng hồ nghệ thuật Chim Công Vàng A25",
    price: "1.050.000 ₫",
    image: "https://shouse.vn/wp-content/uploads/2019/11/dong-ho-con-cong-1-1.jpg",
    isNew: true,
    date: "2023-08-21",
    popularity: 90
};

var isAdded = false;
// Thêm sự kiện cho nút thêm vào giỏ hàng
const addToCartButton = document.querySelector('.shopingcart_pro');
if (addToCartButton) {
    addToCartButton.addEventListener('click', function () {

        // Lấy số lượng hiện tại từ giao diện (element có id="quantity")
        const quantity = parseInt(document.getElementById("quantity").textContent);
        for (var i = 1; i <= quantity; i++) {
            // Thêm sản phẩm vào giỏ hàng
            cartManager.addItem(product);
        }

        // Cập nhật lại số lượng sản phẩm trong giỏ hàng
        displayCartCount();
        displayCartTotal();

        // Khôi phục lại số lượng hiển thị về 1 sau khi thêm vào giỏ hàng
        document.getElementById("quantity").textContent = 1;
        isAdded = true;
    });
}

const buyButton = document.querySelector('.buy_pro');
if (buyButton) {
    buyButton.addEventListener('click', function () {
        if(!isAdded) {
            // Lấy số lượng hiện tại từ giao diện (element có id="quantity")
            const quantity = parseInt(document.getElementById("quantity").textContent);
            for (var i = 1; i <= quantity; i++) {
                // Thêm sản phẩm vào giỏ hàng
                cartManager.addItem(product);
            }

            // Cập nhật lại số lượng sản phẩm trong giỏ hàng
            displayCartCount();
            displayCartTotal();

            // Khôi phục lại số lượng hiển thị về 1 sau khi thêm vào giỏ hàng
            document.getElementById("quantity").textContent = 1;
            location.href = 'pay.html';
        }
        else {
            location.href = 'pay.html';
        }
    });

}




