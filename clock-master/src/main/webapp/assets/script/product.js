// const productsPerPage = 12;
// const totalPages = Math.ceil(products.length / productsPerPage);
// let currentPage = 1;
//
// // Hàm chuyển đổi giá từ chuỗi có ký tự đặc biệt thành số nguyên
// const parsePrice = (priceStr) => parseInt(priceStr.replace(/[^\d]/g, ""), 10);
//
// // Hàm hiển thị các sản phẩm trên trang
// function displayProducts(page) {
//     const start = (page - 1) * productsPerPage;
//     const end = start + productsPerPage;
//     const productsToShow = products.slice(start, end);
//
//     const productContainer = document.getElementById("product_main");
//     productContainer.innerHTML = ""; // Xóa sản phẩm cũ
//
//     productsToShow.forEach(product => {
//         const mainProductClock = document.createElement("div");
//         mainProductClock.className = "main-product-clock";
//
//         const proContainer = document.createElement("div");
//         proContainer.className = "product_container";
//
//         const pro = document.createElement("div");
//         pro.className = "product";
//
//         const des = document.createElement("div");
//         des.className = "description";
//
//         const img = document.createElement("img");
//         img.src = product.image;
//
//         if (product.discount) {
//             const discountBadge = document.createElement("span");
//             discountBadge.className = "discount-badge";
//             discountBadge.textContent = `-${product.discount}%`;
//             mainProductClock.appendChild(discountBadge);
//         }
//
//         if (product.isNew) {
//             const newBadge = document.createElement("span");
//             newBadge.className = "new-badge";
//             newBadge.textContent = "New";
//             mainProductClock.appendChild(newBadge);
//         }
//
//         const name = document.createElement("span");
//         name.textContent = product.name;
//         name.title = product.name;
//
//         const priceContainer = document.createElement("div");
//         priceContainer.className = "price-container";
//
//         // Kiểm tra nếu sản phẩm có giảm giá
//         if (product.discount) {
//             // Tính giá cũ và làm tròn đến số nguyên gần nhất
//             const originalPrice = Math.round(parsePrice(product.price) / (1 - product.discount / 100));
//             const discountedPrice = product.price; // Giá sau giảm
//
//             // Hiển thị giá cũ (gạch chân) với định dạng đúng
//             const oldPrice = document.createElement("del");
//             oldPrice.textContent = formatPrice(originalPrice); // Định dạng giá cũ
//             oldPrice.classList.add("old-price");  // Thêm class cho giá cũ
//
//             const newPrice = document.createElement("h2");
//             newPrice.textContent = formatPrice(parsePrice(discountedPrice)); // Định dạng giá mới
//             newPrice.classList.add("new-price");  // Thêm class cho giá mới
//
//             priceContainer.appendChild(oldPrice);
//             priceContainer.appendChild(newPrice);
//         } else {
//             const newPrice = document.createElement("h2");
//             newPrice.textContent = formatPrice(parsePrice(product.price)); // Định dạng giá mới
//             priceContainer.appendChild(newPrice);
//         }
//
//         const addToCart = document.createElement("a");
//         addToCart.href = "#";
//         addToCart.innerHTML = '<i class="fa-solid fa-cart-plus cart"></i>';
//         addToCart.onclick = () => addToCartHandler(product);
//
//         // Gắn các phần tử vào productCard
//         des.appendChild(img);
//         des.appendChild(name);
//         des.appendChild(priceContainer);
//         pro.appendChild(des);
//         pro.appendChild(addToCart);
//         proContainer.appendChild(pro);
//         mainProductClock.appendChild(proContainer);
//         productContainer.appendChild(mainProductClock);
//     });
// }
//
// // Thêm sự kiện thay đổi cho select box sắp xếp
// document.getElementById("sort").addEventListener("change", function () {
//     const sortOption = this.value;
//     sortProducts(sortOption);
//     displayProducts(currentPage);
//
// });
//
// // Hàm sắp xếp sản phẩm theo lựa chọn
// function sortProducts(option) {
//     switch (option) {
//         case "sort-new":
//             products.sort((a, b) => new Date(b.date) - new Date(a.date));
//             break;
//         case "sort-popular":
//             products.sort((a, b) => b.popularity - a.popularity);
//             break;
//         case "sort-lowToHigh":
//             products.sort((a, b) => parsePrice(a.price) - parsePrice(b.price));
//             break;
//         case "sort-highToLow":
//             products.sort((a, b) => parsePrice(b.price) - parsePrice(a.price));
//             break;
//         default:
//             location.reload();
//             break;
//     }
// }
//
// // Hàm format giá với dấu chấm (.) cho phân cách nghìn và thêm ký tự "đ" vào cuối
// function formatPrice(price) {
//     return price.toLocaleString('vi-VN') + ' ₫'; // Thêm ký tự "đ" sau khi định dạng giá
// }
//
// function addToCartHandler(product) {
//     cartManager.addItem(product);
//     displayCartCount(); // Cập nhật số lượng sản phẩm trong giỏ
// }
//
// function setupPagination() {
//     const paginationContainer = document.getElementById("pagination");
//     paginationContainer.innerHTML = ""; // Xóa các nút phân trang cũ
//
//     for (let i = 1; i <= totalPages; i++) {
//         const button = document.createElement("button");
//         button.textContent = i;
//         button.className = i === currentPage ? "active" : "";
//         button.addEventListener("click", () => {
//             currentPage = i;
//             displayProducts(currentPage);
//             setupPagination();
//             const h1Element = document.querySelector("h1"); // Cuộn đến thẻ h1
//             h1Element.scrollIntoView({ behavior: 'smooth', block: 'start' });
//         });
//
//         paginationContainer.appendChild(button);
//     }
// }
//
// // Hiển thị trang đầu tiên và tạo các nút phân trang
// displayProducts(currentPage);
// setupPagination();

document.addEventListener("DOMContentLoaded", function () {
    const priceContainers = document.querySelectorAll(".price-container");

    priceContainers.forEach(container => {
        const price = parseInt(container.getAttribute("data-price"));
        const discount = parseInt(container.getAttribute("data-discount"));

        const oldPriceElement = container.querySelector(".old-price");
        const newPriceElement = container.querySelector(".new-price");

        const discounted = discount > 0 ? price * (1 - discount / 100) : price;

        if (discount > 0) {
            oldPriceElement.textContent = formatCurrency(price);
        } else {
            oldPriceElement.style.display = "none";
        }

        newPriceElement.textContent = formatCurrency(discounted);
    });
});

// Hàm định dạng giá
function formatCurrency(price) {
    return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(price);
}

