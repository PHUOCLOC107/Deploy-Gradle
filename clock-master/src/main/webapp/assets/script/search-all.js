document.getElementById("search-bar-all").addEventListener("keypress", function(event) {
    if (event.key === "Enter") {
        const query = event.target.value.trim();
        if (query) {
            localStorage.setItem("searchQuery", query); // Lưu từ khóa tìm kiếm vào localStorage
            window.location.href = "product.html"; // Chuyển đến trang sản phẩm
        }
    }
});