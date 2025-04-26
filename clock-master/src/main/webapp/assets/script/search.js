document.getElementById('search-bar').addEventListener('input', function(event) {
    const searchQuery = event.target.value.toLowerCase(); // Chuyển đổi thành chữ thường để tìm kiếm không phân biệt hoa thường
    const filteredProducts = products.filter(product => {
        return product.name.toLowerCase().includes(searchQuery); // Kiểm tra tên sản phẩm có chứa từ khóa tìm kiếm
    });

    // Hiển thị các sản phẩm tìm thấy
    displayProducts(1, filteredProducts);
    setupPagination(filteredProducts);

    // Nếu có kết quả tìm kiếm, hiển thị phần thông báo số lượng sản phẩm
    const searchResultCount = document.getElementById('search-result-count');
    if (filteredProducts.length > 0) {
        searchResultCount.style.display = 'block';  // Hiển thị
        document.getElementById('search-count').textContent = filteredProducts.length;
    } else {
        searchResultCount.style.display = 'none';  // Ẩn
    }


    // Cập nhật hiển thị sản phẩm (có thể bạn cần cập nhật giao diện sản phẩm tại đây)
    updateProductDisplay(filteredProducts);
});
//Xử lý khi ấn vào sắp xếp thì sẽ ẩn phần hiển thị số lượng sản phẩm
document.getElementById('sort').addEventListener('change', function() {
    // Ẩn phần tử có id "search-result-count"
    document.getElementById('search-result-count').style.display = 'none';
});

// Xử lý khi ô tìm kiếm bị xóa (chuỗi tìm kiếm trống)
document.getElementById('search-bar').addEventListener('input', function(event) {
    const searchQuery = event.target.value.toLowerCase();

    if (searchQuery === "") {
        // Khi không có từ khóa tìm kiếm, quay về hiển thị tất cả sản phẩm và phân trang ban đầu
        displayProducts(1, products);
        setupPagination(products);

        // Ẩn thông báo tìm kiếm
        const searchResultCount = document.getElementById('search-result-count');
        searchResultCount.style.display = 'none';
    }
});

function displayProducts(page, productsToDisplay = products) {
    const productsPerPage = 12;
    const totalPages = Math.ceil(productsToDisplay.length / productsPerPage);
    const start = (page - 1) * productsPerPage;
    const end = start + productsPerPage;
    const productsToShow = productsToDisplay.slice(start, end);

    const productContainer = document.getElementById("product_main");
    const sortForm = document.querySelector(".sort-form");
    productContainer.innerHTML = ""; // Xóa sản phẩm cũ

    // Kiểm tra nếu không có sản phẩm nào
    if (productsToShow.length === 0) {
        const noResultsMessage = document.createElement("div");
        noResultsMessage.className = "no-results";
        noResultsMessage.textContent = "Không tìm thấy sản phẩm";
        productContainer.appendChild(noResultsMessage);

        // Ẩn form sắp xếp
        sortForm.style.display = "none";
        return;  // Dừng lại không cần hiển thị thêm gì nữa
    } else {
        // Hiển thị lại form sắp xếp nếu có sản phẩm
        sortForm.style.display = "block";
    }

    productsToShow.forEach(product => {
        const mainProductClock = document.createElement("div");
        mainProductClock.className = "main-product-clock";

        const proContainer = document.createElement("div");
        proContainer.className = "product_container";

        const pro = document.createElement("div");
        pro.className = "product";

        const des = document.createElement("div");
        des.className = "description";

        const img = document.createElement("img");
        img.src = product.image;

        if (product.discount) {
            const discountBadge = document.createElement("span");
            discountBadge.className = "discount-badge";
            discountBadge.textContent = `-${product.discount}%`;
            mainProductClock.appendChild(discountBadge);
        }

        const name = document.createElement("span");
        name.textContent = product.name;
        name.title = product.name;

        if (product.isNew) {
            const newBadge = document.createElement("span");
            newBadge.className = "new-badge";
            newBadge.textContent = "New";
            mainProductClock.appendChild(newBadge);
        }

        const priceContainer = document.createElement("div");
        priceContainer.className = "price-container";

        if (product.discount) {
            const originalPrice = Math.round(parsePrice(product.price) / (1 - product.discount / 100));
            const oldPrice = document.createElement("del");
            oldPrice.textContent = formatPrice(originalPrice);
            oldPrice.classList.add("old-price");

            const newPrice = document.createElement("h2");
            newPrice.textContent = product.price;
            newPrice.classList.add("new-price");

            priceContainer.appendChild(oldPrice);
            priceContainer.appendChild(newPrice);
        } else {
            const newPrice = document.createElement("h2");
            newPrice.textContent = product.price;
            priceContainer.appendChild(newPrice);
        }


        const addToCart = document.createElement("a");
        addToCart.href = "#";
        addToCart.innerHTML = '<i class="fa-solid fa-cart-plus cart"></i>';
        addToCart.onclick = () => addToCartHandler(product);

        // Gắn các phần tử vào productCard
        des.appendChild(img);
        des.appendChild(name);
        des.appendChild(priceContainer);
        pro.appendChild(des);
        pro.appendChild(addToCart);
        proContainer.appendChild(pro);
        mainProductClock.appendChild(proContainer);
        productContainer.appendChild(mainProductClock);
    });
}

function setupPagination(filteredProducts) {
    const paginationContainer = document.getElementById("pagination");
    paginationContainer.innerHTML = ""; // Xóa các nút phân trang cũ

    const productsPerPage = 12;
    const totalPages = Math.ceil(filteredProducts.length / productsPerPage);

    for (let i = 1; i <= totalPages; i++) {
        const button = document.createElement("button");
        button.textContent = i;
        button.className = i === currentPage ? "active" : "";
        button.addEventListener("click", () => {
            currentPage = i;
            displayProducts(currentPage, filteredProducts);
            setupPagination(filteredProducts);
            const h1Element = document.querySelector("h1"); //cuộn đến thẻ h1
            h1Element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        paginationContainer.appendChild(button);
    }
}
// Gọi hàm lần đầu tiên để hiển thị sản phẩm
displayProducts(1);
setupPagination(products);