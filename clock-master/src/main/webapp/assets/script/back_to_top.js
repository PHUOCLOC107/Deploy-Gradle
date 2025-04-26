// Lấy đối tượng nút quay lại đầu trang
let backToTopButton = document.getElementById("backToTop");

// Khi cuộn trang, hiển thị hoặc ẩn nút quay lại đầu trang
window.onscroll = function () {
    if (document.body.scrollTop > 100 || document.documentElement.scrollTop > 100) {
        backToTopButton.style.display = "block"; // Hiển thị nút
    } else {
        backToTopButton.style.display = "none"; // Ẩn nút
    }
};

// Khi người dùng bấm vào nút quay lại đầu trang, cuộn lên đầu trang
backToTopButton.onclick = function () {
    window.scrollTo({ top: 0, behavior: 'smooth' });
    return false; // Ngừng hành động mặc định của liên kết
};