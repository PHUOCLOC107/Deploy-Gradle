const products = [
    {
        name: "Đồng hồ treo tường nghệ thuật DHA11",
        price: "1.450.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/dong-ho-con-cong-doi-trang-tri-phong-khach-001-1377-0.jpg",
        discount: 14,
        date: "2023-10-03",
        popularity: 79
    },
    {
        name: "Đồng hồ treo tường phòng khách DH911",
        price: "1.050.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2018/08/Dh-911-2.jpg",
        discount: 19,
        date: "2023-10-02",
        popularity: 78
    },
    {
        name: "Đồng hồ chim công nghệ thuật DHA110",
        price: "1.650.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/05/dong-ho-treo-tuong-doi-cong.jpg",
        discount: 16,
        date: "2023-09-03",
        popularity: 70
    },
    {
        name: "Đồng hồ chim công nghệ thuật sang trọng DHA203",
        price: "1.850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874481385329_9c7fdef1842985cb5a74fca7f0b21767.jpg",
        discount: 11,
        date: "2023-10-13",
        popularity: 81
    },
    {
        name: "Đồng hồ chim công nghệ thuật sang trọng DHA205",
        price: "1.850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874481877518_2a8961a9480104132fd70750d6471c24.jpg",
        discount: 20,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Đồng hồ chim công nghệ thuật sang trọng DHA212",
        price: "1.250.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3874487541207_10d9fc53b291b98cde0cab89a8393a1d.jpg",
        date: "2023-11-03",
        popularity: 60
    },
    {
        name: "Đồng hồ treo tường chim công nghệ thuật DHA306",
        price: "1.480.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2023/10/z4801533074298_0bacba4eb2c5be80982bbc1569095fe3-1-480x480.jpg",
        date: "2023-10-03",
        popularity: 83
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA158",
        price: "1.480.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113288034_7d95a16dab10dfe187f5ccd64c6145e6-min.jpg",
        discount: 18,
        date: "2023-10-12",
        popularity: 56
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA159",
        price: "1.850.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113308211_eae1b3929946d235ffc94913347ec329-min.jpg",
        discount: 11,
        date: "2023-10-23",
        popularity: 88
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA160",
        price: "1.450.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113317483_e028d87c63fea3fbf7694f7fd123d795-min.jpg",
        discount: 19,
        date: "2023-10-07",
        popularity: 72
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA161",
        price: "1.500.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462113310501_f0231ecd6f7a533f49dca23a10deb37e-min.jpg",
        discount: 19,
        date: "2023-10-19",
        popularity: 74
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA162",
        price: "1.800.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462112740175_959f0be5ad4f223a2caef61279f51ba9-min.jpg",
        discount: 10,
        date: "2023-10-17",
        popularity: 78
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA163",
        price: "1.480.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z5375766772099_8852fd611055b63f7952826ff7d65b07.jpg",
        discount: 18,
        date: "2023-10-22",
        popularity: 48
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA165",
        price: "1.090.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3462111787420_c0fb7556297d97f0d157ec54f10939df-min.jpg",
        discount: 22,
        date: "2023-12-03",
        popularity: 49
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA181",
        price: "1.250.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/z3536120733820_11aef53541ffe4ad7019e38c34a5a5ac.jpg",
        discount: 10,
        date: "2023-10-18",
        popularity: 47
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA182",
        price: "1.750.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/07/Untitled-2.jpg",
        discount: 6,
        date: "2023-10-21",
        popularity: 51
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất DHA183",
        price: "1.500.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/07/z3536124251732_03ff8c457d56949f5f2e0f1ae179a876.jpg",
        discount: 17,
        date: "2023-10-30",
        popularity: 90
    },
    {
        name: "Đồng hồ chim công cao cấp trang trí nội thất sang trọng DHA175",
        price: "1.250.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/06/1-2.jpg",
        discount: 22,
        date: "2023-10-27",
        popularity: 100
    },
    {
        name: "Đồng hồ trang trí nội thất phòng khách DHA103",
        price: "1.100.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/03/Dha-103-3.jpg",
        discount: 20,
        date: "2023-10-03",
        popularity: 77
    },
    {
        name: "Đồng hồ chim công nghệ thuật DHA105",
        price: "1.180.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2473743777269_4fe76ef81b318538b5ae6d717849c2af-min.jpg",
        date: "2023-10-23",
        popularity: 76
    },
    {
        name: "Đồng hồ chim công nghệ thuật DHA106",
        price: "1.100.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2489573804844_07315879eccffd4c9bcd4c884cc7160b-min.jpg",
        date: "2023-08-03",
        popularity: 75
    },
    {
        name: "Đồng hồ chim công nghệ thuật DHA107",
        price: "1.050.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/05/z2489577471676_71cf0b83a7cc9c81778ca5649d1a8917-min.jpg",
        date: "2023-07-03",
        popularity: 79
    },
    {
        name: "Đồng hồ chim công nghệ thuật DHA108",
        price: "1.250.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/05/dha108.jpg",
        date: "2023-12-13",
        popularity: 79
    },
    {
        name: "Đồng hồ chim công nghệ thuật DHA109",
        price: "1.390.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2021/05/78a0c23efec60b9852d7.jpg",
        date: "2023-06-03",
        popularity: 56
    },
    {
        name: "Đồng hồ nghệ thuật đôi chim công uyên ương DHA34",
        price: "1.550.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2022/11/z3519549177740_a68304d8bdce0e17990d5036b183a820.jpg",
        discount: 11,
        date: "2023-05-13",
        popularity: 79
    },
    {
        name: "Đồng hồ treo tường chim công DHA53",
        price: "890.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2020/06/046c4509c41939476008.jpg",
        date: "2023-10-03",
        popularity: 75
    },
    {
        name: "Đồng hồ treo tường chim công uyên ương DHA99",
        price: "1.530.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2020/12/z2216902905662_52c2f07a966724d6ea7164f1c8e46206-min.jpg",
        discount: 10,
        date: "2023-10-03",
        popularity: 60
    },
    {
        name: "Đồng hồ treo tường nghệ thuật chim công DH0152",
        price: "1.020.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2020/07/z1984819253800_c799b096e031c89f553044df295cf0a4.jpg",
        discount: 7,
        date: "2023-10-03",
        popularity: 90
    },
    {
        name: "Đồng hồ treo tường nghệ thuật chim công DH0181",
        price: "950.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2018/01/dong-ho-treo-tuong-nghe-thuat-cong-hoang-DH0181-1-1.jpg",
        discount: 18,
        date: "2023-11-03",
        popularity: 43
    },
    {
        name: "Đồng hồ treo tường nghệ thuật chim công DH131",
        price: "1.050.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2020/02/đồng-hồ-nghệ-thuật-chim-công-dh131.jpg",
        discount: 16,
        date: "2023-10-23",
        popularity: 38
    },
    {
        name: "Đồng hồ treo tường nghệ thuật chim công DHA01",
        price: "1.300.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/O1CN01tkdAxh1b9JsfI1d6R_3043023422.jpg",
        discount: 19,
        date: "2023-10-15",
        popularity: 86
    },
    {
        name: "Đồng hồ treo tường nghệ thuật chim công DHA02",
        price: "990.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/10834260600_682455381.jpg",
        date: "2023-10-23",
        popularity: 79
    },
    {
        name: "Đồng hồ treo tường nghệ thuật chim công DHA80",
        price: "1.090.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2020/11/z2187105053148_d9e8e8fdf24b646ebdc70512fcc4b76a-min.jpg",
        discount: 10,
        date: "2023-10-03",
        popularity: 79
    },
    {
        name: "Đồng hồ treo tường nghệ thuật DH0151",
        price: "1.100.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/e29231ae5e42a71cfe53.jpg",
        discount: 11,
        date: "2023-10-03",
        popularity: 79
    },
    {
        name: "Đồng hồ treo tường nghệ thuật DH1014",
        price: "1.150.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/02/143da1b638ffdea187ee.jpg",
        date: "2023-10-03",
        popularity: 79
    },
    {
        name: "Đồng hồ treo tường nghệ thuật DHA10",
        price: "1.020.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2019/05/doi-chim-cong-noi-2.jpg",
        date: "2023-10-03",
        popularity: 79
    },
    {
        name: "Đồng hồ treo tường phòng khách DH964",
        price: "990.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2018/09/8858815897_682455381.jpg",
        discount: 14,
        date: "2023-03-03",
        popularity: 57
    },
    {
        name: "Đồng hồ treo tường sang trọng DH923",
        price: "1.900.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2018/08/a3e04f1c022ba4abfcc0384ae2886cda.jpg",
        discount: 27,
        date: "2023-10-09",
        popularity: 61
    },
    {
        name: "Đồng hồ treo tường sang trọng DH924",
        price: "1.900.000 ₫",
        image: "https://tuongxinh.com.vn/wp-content/uploads/2018/08/Đồng-hồ-treo-tường-chim-công-cao-cấp-sang-trọng.jpg",
        discount: 27,
        date: "2023-10-17",
        popularity: 69
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

function parsePrice(priceString) {
    return parseInt(priceString.replace(/[.,₫]/g, ""));
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
