const products = [
    {
        name: "Đồng hồ pha lê để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT01",
        price: "850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4822361888385_a1846144eb9401a4122c9f0593330304-min-1-1024x1024.jpg",
        discount: 50,
        popularity: 1200,
        date: "2024-11-01"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA311",
        price: "1.200.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/12/z4964146930694_ace6ab4173607851b3a45896aa9e78af.jpg",
        discount: 34,
        popularity: 950,
        date: "2024-11-03"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA316",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/431447615_708728268112596_5572117827573194601_n.jpg",
        discount: 23,
        popularity: 800,
        date: "2024-11-05"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA317",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/431675174_338217022020814_3265962644664062728_n.jpg",
        discount: 25,
        popularity: 1100,
        date: "2024-11-07"
    },
    {
        name: " ĐỒNG HỒ TREO TƯỜNG NGHỆ THUẬT DHA11",
        price: "1.250.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/dong-ho-con-cong-doi-trang-tri-phong-khach-001-1377-0.jpg ",
        discount: 30,
        popularity: 650,
        date: "2024-11-09"
    },
    {
        name: " Đồng hồ treo tường phòng khách DH911",
        price: "850.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2018/08/Dh-911-2.jpg ",
        discount: 10,
        popularity: 720,
        date: "2024-11-10"
    },
    {
        name: "Đồng hồ decor thuận buồm xuôi gió DHA331",
        price: "980.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/10/dha331-3.jpg",
        discount: 20,
        popularity: 900,
        date: "2024-11-11"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA317",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/431675174_338217022020814_3265962644664062728_n.jpg",
        discount: 34,
        popularity: 1000,
        date: "2024-11-12"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA319",
        price: "1.280.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/435001539_336559559040277_8385888671226252026_n.jpg",
        discount: 33,
        popularity: 870,
        date: "2024-11-13"
    },
    {
        name: " Đồng hồ treo tường nghệ thuật DH0138",
        price: "680.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2016/05/DH0138.jpg",
        discount: 20,
        popularity: 780,
        date: "2024-11-14"
    },
    {
        name: "Đồng hồ pha lê để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT01",
        price: "850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4822361888385_a1846144eb9401a4122c9f0593330304-min-1-1024x1024.jpg",
        discount: 50,
        popularity: 1200,
        date: "2024-11-01"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA311",
        price: "1.200.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/12/z4964146930694_ace6ab4173607851b3a45896aa9e78af.jpg",
        discount: 34,
        popularity: 950,
        date: "2024-11-03"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA316",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/431447615_708728268112596_5572117827573194601_n.jpg",
        discount: 23,
        popularity: 800,
        date: "2024-11-05"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA317",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/431675174_338217022020814_3265962644664062728_n.jpg",
        discount: 25,
        popularity: 1100,
        date: "2024-11-07"
    },
    {
        name: " ĐỒNG HỒ TREO TƯỜNG NGHỆ THUẬT DHA11",
        price: "1.250.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/dong-ho-con-cong-doi-trang-tri-phong-khach-001-1377-0.jpg ",
        discount: 30,
        popularity: 650,
        date: "2024-11-09"
    },
    {
        name: " Đồng hồ treo tường phòng khách DH911",
        price: "850.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2018/08/Dh-911-2.jpg ",
        discount: 10,
        popularity: 720,
        date: "2024-11-10"
    },
    {
        name: "Đồng hồ decor thuận buồm xuôi gió DHA331",
        price: "980.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/10/dha331-3.jpg",
        discount: 20,
        popularity: 900,
        date: "2024-11-11"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA317",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/431675174_338217022020814_3265962644664062728_n.jpg",
        discount: 34,
        popularity: 1000,
        date: "2024-11-12"
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA319",
        price: "1.280.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/435001539_336559559040277_8385888671226252026_n.jpg",
        discount: 33,
        popularity: 870,
        date: "2024-11-13"
    },
    {
        name: " Đồng hồ treo tường nghệ thuật DH0138",
        price: "680.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2016/05/DH0138.jpg",
        discount: 20,
        popularity: 780,
        date: "2024-11-14"
    },
    {
        name: "Đồng hồ pha lê để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT01",
        price: "850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4822361888385_a1846144eb9401a4122c9f0593330304-min-1-1024x1024.jpg",
        discount: 50,
        popularity: 1200,
        date: "2024-11-01"
    }
];

const productsPerPage = 12;
const totalPages = Math.ceil(products.length / productsPerPage);
let currentPage = 1;

// Hàm chuyển đổi giá từ chuỗi có ký tự đặc biệt thành số nguyên
const parsePrice = (priceStr) => parseInt(priceStr.replace(/[^\d]/g, ""), 10);

// Hàm hiển thị các sản phẩm trên trang
function displayProducts(page) {
    const start = (page - 1) * productsPerPage;
    const end = start + productsPerPage;
    const productsToShow = products.slice(start, end);

    const productContainer = document.getElementById("product_main");
    productContainer.innerHTML = ""; // Xóa sản phẩm cũ

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

        const priceContainer = document.createElement("div");
        priceContainer.className = "price-container";

        if (product.discount) {
            const originalPrice = Math.round(parsePrice(product.price) / (1 - product.discount / 100));
            const discountedPrice = product.price;

            const oldPrice = document.createElement("del");
            oldPrice.textContent = formatPrice(originalPrice);
            oldPrice.classList.add("old-price");

            const newPrice = document.createElement("h2");
            newPrice.textContent = formatPrice(parsePrice(discountedPrice));
            newPrice.classList.add("new-price");

            priceContainer.appendChild(oldPrice);
            priceContainer.appendChild(newPrice);
        } else {
            const newPrice = document.createElement("h2");
            newPrice.textContent = formatPrice(parsePrice(product.price));
            priceContainer.appendChild(newPrice);
        }

        const addToCart = document.createElement("a");
        addToCart.href = "#";
        addToCart.innerHTML = '<i class="fa-solid fa-cart-plus cart"></i>';
        addToCart.onclick = () => addToCartHandler(product);

        // Xóa đoạn mã liên quan đến ngày nhập và độ phổ biến

        des.appendChild(img);
        des.appendChild(name);
        des.appendChild(priceContainer);
        des.appendChild(addToCart);
        pro.appendChild(des);
        proContainer.appendChild(pro);
        mainProductClock.appendChild(proContainer);
        productContainer.appendChild(mainProductClock);
    });
}

// Hàm sắp xếp sản phẩm
function sortProducts(option) {
    switch (option) {
        case 'sort-new':
            products.sort((a, b) => new Date(b.date) - new Date(a.date)); // Sắp xếp theo ngày (mới nhất)
            break;
        case 'sort-popular':
            products.sort((a, b) => b.popularity - a.popularity); // Sắp xếp theo độ phổ biến (cao đến thấp)
            break;
        case 'sort-lowToHigh':
            products.sort((a, b) => parsePrice(a.price) - parsePrice(b.price)); // Sắp xếp theo giá (thấp đến cao)
            break;
        case 'sort-highToLow':
            products.sort((a, b) => parsePrice(b.price) - parsePrice(a.price)); // Sắp xếp theo giá (cao xuống thấp)
            break;
        default:
            location.reload();
            break;
    }
    displayProducts(currentPage); // Cập nhật lại hiển thị sản phẩm
}

// Hàm xử lý khi người dùng thay đổi lựa chọn sắp xếp
const sortSelect = document.getElementById("sort");
sortSelect.addEventListener("change", function () {
    const sortOption = this.value;
    sortProducts(sortOption);

});

// Hàm format giá với dấu chấm (.) cho phân cách nghìn và thêm ký tự "đ" vào cuối
function formatPrice(price) {
    return price.toLocaleString('vi-VN') + ' ₫'; // Thêm ký tự "đ" sau khi định dạng giá
}

function addToCartHandler(product) {
    cartManager.addItem(product);
    displayCartCount(); // Cập nhật số lượng sản phẩm trong giỏ
}

function setupPagination() {
    const paginationContainer = document.getElementById("pagination");
    paginationContainer.innerHTML = ""; // Xóa các nút phân trang cũ

    for (let i = 1; i <= totalPages; i++) {
        const button = document.createElement("button");
        button.textContent = i;
        button.className = i === currentPage ? "active" : "";
        button.addEventListener("click", () => {
            currentPage = i;
            displayProducts(currentPage);
            setupPagination();
            const h1Element = document.querySelector("h1"); // Cuộn đến thẻ h1
            h1Element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        paginationContainer.appendChild(button);
    }
}

// Hiển thị trang đầu tiên và tạo các nút phân trang
displayProducts(currentPage);
setupPagination();
