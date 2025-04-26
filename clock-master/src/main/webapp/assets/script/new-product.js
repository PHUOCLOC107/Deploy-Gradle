const products = [
    {
        name: "Đồng hồ decor thuận buồm xuôi gió DHA331",
        price: "980.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/10/dha331-3.jpg",
        isNew: true,
        date: "2024-10-01",
        popularity: 4.5
    },
    {
        name: "ĐỒNG HỒ TREO TƯỜNG CAO CẤP DH045",
        price: "1.050.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/08/dh045.jpg",
        isNew: true,
        date: "2024-08-15",
        popularity: 4.8
    },
    {
        name: "Đồng hồ phong cảnh cao cấp trang trí nội thất DHA329",
        price: "4.950.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/07/dha329.jpg",
        isNew: true,
        date: "2024-07-10",
        popularity: 4.7
    },
    {
        name: "Đồng hồ bông hoa cao cấp trang trí nội thất sang trọng DHA328",
        price: "4.600.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/06/dong-ho-cao-cap-1.jpg",
        isNew: true,
        date: "2024-06-20",
        popularity: 4.6
    },
    {
        name: "Đồng hồ tân cổ điển cao cấp trang trí nội thất sang trọng DHA327",
        price: "4.500.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/05/440234225_732379639107535_618995538063198143_n.jpg",
        isNew: true,
        date: "2024-05-15",
        popularity: 4.3
    },
    {
        name: "Đồng hồ tân cổ điển cao cấp trang trí nội thất sang trọng DHA326",
        price: "5.600.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/05/440213831_391695457185769_4267293833666092187_n.jpg",
        isNew: true,
        date: "2024-05-10",
        popularity: 4.2
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA323",
        price: "1.020.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/436986679_1503018203897646_3963765156766884089_n.jpg",
        isNew: true,
        date: "2024-04-20",
        popularity: 4.4
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA321",
        price: "1.050.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/435071208_1929730840780490_8946487394467687200_n.jpg",
        isNew: true,
        date: "2024-04-15",
        popularity: 4.6
    }
];


const productsPerPage = 12;
const totalPages = Math.ceil(products.length / productsPerPage);
let currentPage = 1;

function displayProducts(page) {
    const start = (page - 1) * productsPerPage;
    const end = start + productsPerPage;
    const productsToShow = products.slice(start, end);

    const productContainer = document.getElementById("product_main");
    productContainer.innerHTML = ""; //Xóa sản phẩm cũ

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

        if (product.isNew) {
            const newBadge = document.createElement("span");
            newBadge.className = "new-badge";
            newBadge.textContent = "New";
            mainProductClock.appendChild(newBadge);
        }

        const name = document.createElement("span");
        name.textContent = product.name;
        name.title = product.name;

        const price = document.createElement("h2");
        price.textContent = product.price;

        const addToCart = document.createElement("a");
        addToCart.innerHTML = '<i class="fa-solid fa-cart-plus cart"></i>';
        addToCart.onclick = (event) => {
            addToCartHandler(product);
        };

        // Gắn các phần tử vào productCard
        des.appendChild(img);
        des.appendChild(name);
        des.appendChild(price);
        pro.appendChild(des);
        pro.appendChild(addToCart);
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

function addToCartHandler(product) {
    cartManager.addItem(product);
    displayCartCount();
}

function parsePrice(priceString) {
    return parseInt(priceString.replace(/[.,₫]/g, ""));
}

// Hàm xử lý khi người dùng thay đổi lựa chọn sắp xếp
const sortSelect = document.getElementById("sort");
sortSelect.addEventListener("change", function () {
    const sortOption = this.value;
    sortProducts(sortOption);

});

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
            const h1Element = document.querySelector("h1"); //cuộn đến thẻ h1
            h1Element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        paginationContainer.appendChild(button);
    }
}

// Hiển thị trang đầu tiên và tạo các nút phân trang
displayProducts(currentPage);
setupPagination();
