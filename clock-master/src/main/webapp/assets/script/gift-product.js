const products = [
    {
        name: "Đồng hồ pha lê để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT01",
        price: "850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4822361888385_a1846144eb9401a4122c9f0593330304-min-1-1024x1024.jpg",
        discount: 22,
        date: "2024-05-18",
        popularity: 86
    },
    {
        name: "Đồng hồ gỗ để bàn quà tặng khách hàng, quà tặng doanh nghiệp QT68",
        price: "380.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/Dong-ho-de-ban-qua-tang-cong-ty-doanh-nghiep-khach-hang-480x480.jpg",
        isNew: true,
        date: "2024-05-19",
        popularity: 88
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG236",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833135940196_69cc5d47a521f7c5968b3f969ead38a1-480x480.jpg",
        isNew: true,
        date: "2024-03-18",
        popularity: 60
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG241",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833101000295_3f82c8b8a70b7c4d17320526dbfd8034-480x480.jpg",
        date: "2024-05-11",
        popularity: 45
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG35",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833171537898_c194c3148162d68314387b6f259c93b9-min-480x480.jpg",
        isNew: true,
        date: "2024-07-18",
        popularity: 78
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG65",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833158103208_ade094b66513b09916c109138cf31f99-480x480.jpg",
        date: "2024-11-18",
        popularity: 90
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG67",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833137905058_666b6954fd462dda5f3203f357d1ca5d-480x480.jpg",
        date: "2024-05-28",
        popularity: 54
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG82",
        price: "450.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833167428623_f18adb05ad8ca68b3f41a37b897daecb-min-480x480.jpg",
        date: "2024-05-14",
        popularity: 67
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG83",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833120397785_4fdf46a5793a8289bc56d889957ebd28-480x480.jpg",
        date: "2024-05-18",
        popularity: 86
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG84",
        price: "420.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833130561937_4778499556cb0e0359dcc84b42e4ca84-480x480.jpg",
        date: "2024-05-09",
        popularity: 89
    },
    {
        name: "Hộp đựng bút Mã Đáo Thành Công quà tặng khách hàng đối tác, quà tặng doanh nghiệp QT23",
        price: "880.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/12/1200k-480x480.jpg",
        discount: 27,
        date: "2023-05-18",
        popularity: 82
    },
    {
        name: "Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT13",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014101_c8ad4bc745a0206e0b00d9b8ec4627d3-480x480.jpg",
        date: "2023-04-18",
        popularity: 62
    },
    {
        name: "Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT16",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014251_940920a85d36aa57b21c7ba430ed4255-480x480.jpg",
        date: "2023-05-21",
        popularity: 32
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG01",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833178877485_28c4faac8b80229314b50c0f005a7dd7-min-480x480.jpg",
        date: "2023-05-18",
        popularity: 95
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG175",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833145490635_91a20b262c731cf360dbe61c6ce6b22f-480x480.jpg",
        date: "2023-05-07",
        popularity: 34
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG240",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833182349473_d3d0eebcb254f52579aebf811650c0d6-min-480x480.jpg",
        date: "2023-01-18",
        popularity: 28
    },
    {
        name: "Đồng hồ treo tường in logo thiết kế theo yêu cầu, quà tặng khách hàng doanh nghiệp DG68",
        price: "420.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4833143041298_ef584aab62e4cb3647aa9a0639e956a1-480x480.jpg",
        date: "2023-08-18",
        popularity: 85
    },
    {
        name: "Đồng hồ chim công nghệ thuật in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT20",
        price: "850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146438603_c1ffedbb9d58816c7a5af67d4591f438-480x480.jpg",
        date: "2023-05-01",
        popularity: 26
    },
    {
        name: "Đồng hồ nghệ thuật in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT21",
        price: "850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146438606_8a181cdb517184e5eccf4db64326f268-480x480.jpg",
        date: "2023-05-18",
        popularity: 66
    },
    {
        name: "Đồng hồ nghệ thuật in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT22",
        price: "750.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146441782_e6bd9e41afcdf9854aab05c916bdf4e6-480x480.jpg",
        date: "2024-05-16",
        popularity: 99
    },
    {
        name: "Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT14",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014205_6ab0cadeca8a5ac99e3353863f89ffac-480x480.jpg",
        date: "2023-06-19",
        popularity: 82
    },
    {
        name: "Đồng hồ tranh tết in logo công ty quà tặng khách hàng, quà tặng doanh nghiệp QT19",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/z4908146014301_9c187ae27d9e5df48e8c695defe9fd12-480x480.jpg",
        date: "2023-09-18",
        popularity: 47
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
            const h1Element = document.querySelector("h1"); //cuộn đến thẻ h1
            h1Element.scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        paginationContainer.appendChild(button);
    }
}

// Hiển thị trang đầu tiên và tạo các nút phân trang
displayProducts(currentPage);
setupPagination();



