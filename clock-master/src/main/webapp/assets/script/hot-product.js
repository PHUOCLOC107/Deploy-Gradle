const products = [
    {
        name: "Đồng hồ pha lê để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT01",
        price: "850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4822361888385_a1846144eb9401a4122c9f0593330304-min-1-1024x1024.jpg",
        discount: 50,
        date: "2023-05-18",
        popularity: 82
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA311",
        price: "1.200.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/12/z4964146930694_ace6ab4173607851b3a45896aa9e78af.jpg",
        discount: 34,
        date: "2023-05-11",
        popularity: 88
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA319",
        price: "1.280.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/435001539_336559559040277_8385888671226252026_n.jpg",
        isNew: true,
        date: "2023-05-22",
        popularity: 45
    },
    {
        name: " Đồng hồ treo tường nghệ thuật DH0138",
        price: "680.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2016/05/DH0138.jpg",
        date: "2023-05-18",
        popularity: 80
    },
    {
        name: " ĐỒNG HỒ TREO TƯỜNG NGHỆ THUẬT DHA11",
        price: "1.250.000 ₫ ",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/dong-ho-con-cong-doi-trang-tri-phong-khach-001-1377-0.jpg ",
        discount: 30,
        date: "2023-04-14",
        popularity: 81
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA317",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/431675174_338217022020814_3265962644664062728_n.jpg",
        discount: 34,
        date: "2023-05-15",
        popularity: 79
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA318",
        price: "1.020.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/435091275_1570300473541145_8221736996437100679_n.jpg",
        date: "2023-01-18",
        popularity: 57
    },
    {
        name: "Đồng hồ nghệ thuật trang trí nội thất DHA319",
        price: "1.280.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2024/04/435001539_336559559040277_8385888671226252026_n.jpg",
        discount: 33,
        date: "2023-05-21",
        popularity: 90
    },
]

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
        addToCart.href = "#";
        addToCart.innerHTML = '<i class="fa-solid fa-cart-plus cart"></i>';
        addToCart.onclick = () => addToCartHandler(product);

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

// Hàm format giá với dấu chấm (.) cho phân cách nghìn và thêm ký tự "đ" vào cuối
function formatPrice(price) {
    return price.toLocaleString('vi-VN') + ' ₫'; // Thêm ký tự "đ" sau khi định dạng giá
}

function parsePrice(priceString) {
    return parseInt(priceString.replace(/[.,₫]/g, ""));
}

// Thêm sự kiện thay đổi cho select box sắp xếp
document.getElementById("sort").addEventListener("change", function () {
    const sortOption = this.value;
    sortProducts(sortOption);
    displayProducts(currentPage);

});

// Hàm sắp xếp sản phẩm theo lựa chọn
function sortProducts(option) {
    switch (option) {
        case "sort-new":
            products.sort((a, b) => new Date(b.date) - new Date(a.date));
            break;
        case "sort-popular":
            products.sort((a, b) => b.popularity - a.popularity);
            break;
        case "sort-lowToHigh":
            products.sort((a, b) => parsePrice(a.price) - parsePrice(b.price));
            break;
        case "sort-highToLow":
            products.sort((a, b) => parsePrice(b.price) - parsePrice(a.price));
            break;
        default:
            location.reload();
            break;
    }
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
            const h1Element = document.querySelector("h1"); //cuộn đến thẻ h1
            h1Element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        paginationContainer.appendChild(button);
    }
}

// Hiển thị trang đầu tiên và tạo các nút phân trang
displayProducts(currentPage);
setupPagination();
