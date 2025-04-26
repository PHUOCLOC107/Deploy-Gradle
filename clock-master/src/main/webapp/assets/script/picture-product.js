const products = [
    {
        name: "Tranh tráng gương 3D hươu tuần lộc hiện đại decor trang trí nhà cửa TG3199",
        price: "750.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/11/maket-2-min.png",
        isNew: true,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Tranh đồng hồ mã đáo thành công PT0105",
        price: "750.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2016/08/1-min.jpg",
        isNew: true,
        date: "2023-10-02",
        popularity: 76
    },
    {
        name: "Tranh đồng hồ nghệ thuật trang trí phòng ăn TG2149",
        price: "750.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/O1CN01Mx3SMd1aQROJHGDct_1780653324.jpg",
        discount: 11,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2121",
        price: "680.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/3-1.jpg",
        date: "2023-10-13",
        popularity: 68
    },
    {
        name: "Tranh đồng hồ trang trí Hoa Sen HL1939",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/04/33-min.jpg",
        date: "2023-10-23",
        popularity: 57
    },
    {
        name: "Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2120",
        price: "680.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/2-1.jpg",
        discount: 19,
        date: "2023-11-03",
        popularity: 87
    },
    {
        name: "Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2122",
        price: "680.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/4.jpg",
        isNew: true,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Tranh đồng hồ hoa nghệ thuật trang trí phòng ăn TG2124",
        price: "680.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/Untitled-1.jpg",
        discount: 10,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Tranh tráng gương đồng hồ Chiếc Lá Nghệ Thuật TG1609",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-12-1024x1024.jpg",
        isNew: true,
        date: "2023-12-03",
        popularity: 45
    },
    {
        name: "Tranh tráng gương đồng hồ Chiếc Lá Nghệ Thuật TG1610",
        price: "550.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-17-1024x1024.jpg",
        date: "2023-11-03",
        popularity: 73
    },
    {
        name: "Tranh tráng gương đồng hồ Cửu Ngư Nghệ Thuật TG1596",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-4-1024x1024.jpg",
        date: "2023-10-14",
        popularity: 77
    },
    {
        name: "Tranh tráng gương đồng hồ Cửu Ngư Nghệ Thuật TG1597",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-5-1024x1024.jpg",
        isNew: true,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Tranh tráng gương đồng hồ Cửu Ngư Nghệ Thuật TG1598",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-6-1024x1024.jpg",
        isNew: true,
        date: "2023-09-03",
        popularity: 90
    },
    {
        name: "Tranh tráng gương đồng hồ Cửu Ngư Quần Hội TG1593",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-1-1-1024x1024.jpg",
        date: "2023-07-03",
        popularity: 54
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D hiện đại TG1590",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/1-min-1024x1024.jpg",
        date: "2023-08-03",
        popularity: 70
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D hiện đại TG1592",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-3-1024x1024.jpg",
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1604",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-10-1024x1024.jpg",
        isNew: true,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1605",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-14-1024x1024.jpg",
        date: "2023-10-03",
        discount: 20,
        popularity: 77
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1607",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-16-1024x1024.jpg",
        date: "2023-07-03",
        popularity: 90
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D Hiện Đại TG1608",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-18-1024x1024.jpg",
        date: "2023-10-19",
        popularity: 37
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D nghệ thuật TG1599",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-7-1024x1024.jpg",
        date: "2023-06-13",
        popularity: 65
    },
    {
        name: "Tranh tráng gương đồng hồ Hươu 3D nghệ thuật TG1600",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-8-1024x1024.jpg",
        date: "2023-06-15",
        popularity: 66
    },
    {
        name: "Tranh tráng gương đồng hồ Phong Cảnh 3D nghệ thuật TG1601",
        price: "390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/05/tranh-trang-guong-dong-ho-9-1024x1024.jpg",
        date: "2023-06-24",
        popularity: 98
    },
    {
        name: "Đồng hồ tranh tráng gương phong cảnh nghệ thuật DG65",
        price: "530.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/04/z3344382267121_9ce379820c1eaef91df0ecd8313a389a-min.jpg",
        date: "2023-06-30",
        popularity: 75
    },
    {
        name: "Tranh đồng hồ thiên nhiên hoa lá HL837",
        price: "550.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/04/hl837maket-480x480.jpg",
        date: "2023-06-03",
        popularity: 83
    },
    {
        name: "Tranh đồng hồ treo tường thuận buồm xuôi gió PT0123",
        price: "550.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2016/06/tranh-treo-tuong-thuan-buom-xuoi-gio-480x480.jpg",
        date: "2023-06-16",
        popularity: 62
    },
    {
        name: "Đồng hồ tranh tráng gương Hươu nghệ thuật độc đáo DG01",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/03/1-min.jpg",
        date: "2023-07-13",
        popularity: 59
    },
    {
        name: "Đồng hồ tranh Thuận Buồm Xuôi Gió hiện đại sang trọng DG175",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3864069190083_de792016ee82caef7523c2bc34d9601b-1.jpg",
        date: "2023-07-13",
        popularity: 55
    },
    {
        name: "Đồng hồ tranh tráng gương Mã Đáo Thành Công DG176",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/11/1-2.jpg",
        date: "2024-07-13",
        popularity: 59
    },
    {
        name: "Đồng hồ tranh cô gái nghệ thuật DG94",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-5-min.jpg",
        date: "2024-07-23",
        popularity: 75
    },
    {
        name: "Đồng hồ tranh cô gái nghệ thuật DG95",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-6-min.jpg",
        date: "2024-08-13",
        popularity: 54
    },
    {
        name: "Đồng hồ tranh cô gái nghệ thuật DG96",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-7-min.jpg",
        date: "2024-09-13",
        popularity: 97
    },
    {
        name: "Đồng hồ tranh cô gái nghệ thuật DG97",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-8-min.jpg",
        date: "2024-02-13",
        popularity: 59
    },
    {
        name: "Đồng hồ tranh cô gái nghệ thuật DG98",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-9-min.jpg",
        date: "2024-05-23",
        popularity: 46
    },
    {
        name: "Đồng hồ tranh cô gái nghệ thuật DG99",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-10-min.jpg",
        date: "2024-05-23",
        popularity: 43
    },
    {
        name: "Đồng hồ tranh Hươu phong cảnh nghệ thuật DG92",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-3-min.jpg",
        date: "2024-01-23",
        popularity: 80
    },
    {
        name: "Đồng hồ tranh phong cảnh nghệ thuật DG101",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-11-min.jpg",
        date: "2024-05-23",
        popularity: 46
    },
    {
        name: "Đồng hồ tranh phong cảnh nghệ thuật DG102",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/05/9-12-min.jpg",
        date: "2024-05-23",
        popularity: 46
    },
    {
        name: "Đồng hồ tranh cô gái sang trọng hiện đại DH1145",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/1-min-1-1024x1025.jpg",
        date: "2024-05-23",
        popularity: 46
    },
    {
        name: "Đồng hồ tranh phong cảnh đồng quê DH1140",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/2-2-min.jpg",
        date: "2024-04-23",
        popularity: 89
    },
    {
        name: "Đồng hồ tranh trang trí nội thất hiện đại DH1112",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/19-2-min.jpg",
        date: "2024-12-23",
        popularity: 90
    },
    {
        name: "Đồng hồ tranh trang trí nội thất hiện đại DH1143",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/2-min-1-1024x1025.jpg",
        date: "2024-05-23",
        popularity: 46
    },
    {
        name: "Đồng hồ tranh trang trí nội thất hiện đại DH1144",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/3-min-1024x1025.jpg",
        date: "2024-05-18",
        popularity: 86
    },
    {
        name: "Đồng hồ tranh trang trí nội thất hiện đại DH1146",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/4-min-1024x1025.jpg",
        date: "2024-05-23",
        popularity: 46
    },
    {
        name: "Đồng hồ tranh trang trí nội thất hiện đại DH1147",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/5-min-1024x1025.jpg",
        date: "2024-05-23",
        popularity: 46
    },
    {
        name: "Đồng hồ tranh trang trí nội thất hiện đại DH1148",
        price: "650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/10/6-min-1-1024x1025.jpg",
        date: "2024-08-23",
        popularity: 94
    },
    {
        name: "Đồng hồ tranh tráng gương cô gái nghệ thuật DG36",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01UuOJyt26vdtvdVbMJ_1134747724-min.jpg",
        date: "2024-05-23",
        popularity: 48
    },
    {
        name: "Đồng hồ tranh tráng gương cô gái nghệ thuật DG55",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01smYqCR1QhhzPvp0Eo_150592008.jpg_400x400-min.jpg",
        date: "2024-06-23",
        popularity: 78
    },
    {
        name: "Đồng hồ tranh tráng gương cô gái nghệ thuật DG56",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01sNtI6B1QhhzHfodhy_150592008-min.jpg",
        date: "2024-06-09",
        popularity: 79
    },
    {
        name: "Đồng hồ tranh tráng gương cô gái nghệ thuật DG57",
        price: "350.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/03/O1CN01sOigyy1QhhzMGbGh7_150592008-min.jpg",
        date: "2024-03-23",
        discount: 14,
        popularity: 56
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

// Hàm chuyển đổi giá từ chuỗi có ký tự đặc biệt thành số nguyên
const parsePrice = (priceStr) => parseInt(priceStr.replace(/[^\d]/g, ""), 10);

// Hàm format giá với dấu chấm (.) cho phân cách nghìn và thêm ký tự "đ" vào cuối
function formatPrice(price) {
    return price.toLocaleString('vi-VN') + ' ₫'; // Thêm ký tự "đ" sau khi định dạng giá
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
