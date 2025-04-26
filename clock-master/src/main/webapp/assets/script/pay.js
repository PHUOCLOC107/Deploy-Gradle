document.addEventListener("DOMContentLoaded", function() {

    // Kiểm tra và điền thông tin người dùng khi đã đăng nhập
    const loggedInUser = localStorage.getItem('loggedInUser');
    const user = loggedInUser ? JSON.parse(localStorage.getItem(loggedInUser)) : null;
    if (user) {
        document.getElementById('fullname').value = user.fullname || '';
        document.getElementById('phone').value = user.phonenumber || '';
        document.getElementById('address').value = user.address || '';
        document.getElementById('province').value = user.province || '';
        document.getElementById('district').value = user.district || '';
    }

    // Hiển thị giỏ hàng cho thanh toán
    displayCartForPayment();

    // Xử lý sự kiện thanh toán
    const paymentButton = document.getElementById("paymentButton");
    if (paymentButton) {
        paymentButton.addEventListener("click", handlePayment);
    }
});

// Hàm xử lý thanh toán
function handlePayment() {
    const cartItems = cartManager.getItems();
    if (cartItems.length === 0) {
        alert("Giỏ hàng của bạn đang trống!");
        return;
    }

    const loggedInUser = localStorage.getItem('loggedInUser');
    let user = loggedInUser ? JSON.parse(localStorage.getItem(loggedInUser)) : null;

    // Cập nhật thông tin từ form nếu có thay đổi
    if (user) {
        user.fullname = document.getElementById('fullname').value || user.fullname;
        user.phonenumber = document.getElementById('phone').value || user.phonenumber;
        user.address = document.getElementById('address').value || user.address;
        user.province = document.getElementById('province').value || user.province;
        user.district = document.getElementById('district').value || user.district;
    } else {
        user = getTemporaryUser();
    }

    // Lưu lại thông tin cập nhật vào localStorage
    localStorage.setItem(loggedInUser, JSON.stringify(user));

    // Kiểm tra thông tin đã đầy đủ
    if (!user.fullname || !user.phonenumber || !user.address || !user.province || !user.district) {
        alert("Vui lòng điền đầy đủ thông tin (họ tên, số điện thoại, địa chỉ) trước khi đặt hàng!");
        return;
    }

    // Lưu lịch sử mua hàng
    if(loggedInUser){
        savePurchaseHistory(cartItems);
    }

    clearCart();
    alert("Cảm ơn bạn đã đặt hàng! Đơn hàng của bạn sẽ được giao trong thời gian sớm nhất.");
    displayCartCount();
    displayCartTotal();
}

// Hàm lưu lịch sử mua hàng
function savePurchaseHistory(cartItems) {
    // Lấy lịch sử mua hàng từ localStorage (nếu có)
    let purchaseHistory = JSON.parse(localStorage.getItem('purchaseHistory')) || [];

    // Tạo thông tin giao dịch mới
    const transaction = {
        date: new Date().toISOString(),
        items: cartItems.map(item => ({
            name: item.name,
            quantity: item.quantity,
            price: item.price,
            image: item.image
        }))
    };

    // Thêm giao dịch vào lịch sử
    purchaseHistory.push(transaction);

    // Lưu lại vào localStorage
    localStorage.setItem('purchaseHistory', JSON.stringify(purchaseHistory));
}

// Hàm lấy thông tin người dùng tạm thời
function getTemporaryUser() {
    const fullname = document.getElementById('fullname').value;
    const phone = document.getElementById('phone').value;
    const address = document.getElementById('address').value;
    const province = document.getElementById('province').value;
    const district = document.getElementById('district').value;
    return { fullname, phonenumber: phone, address, province, district };
}

// Hàm xóa giỏ hàng và cập nhật giao diện
function clearCart() {
    localStorage.removeItem('cart');
    cartManager.cart = [];
    const cartContainer = document.getElementById("pay-order-table").getElementsByTagName("tbody")[0];
    cartContainer.innerHTML = "<tr><td colspan='2'>Giỏ hàng của bạn đang trống. <a href='product.html'> Tiếp tục mua sắm</a> </td></tr>";
}

// Hàm hiển thị các sản phẩm trong giỏ hàng vào bảng thanh toán
function displayCartForPayment() {
    const cartItems = cartManager.getItems();
    const cartContainer = document.getElementById("pay-order-table").getElementsByTagName("tbody")[0];
    if (cartItems.length === 0) {
        cartContainer.innerHTML = "<tr><td colspan='2'>Giỏ hàng của bạn đang trống.</td></tr>";
        return;
    }

    cartContainer.innerHTML = "";
    let totalAmount = 0;

    cartItems.forEach(item => {
        const row = document.createElement("tr");

        const nameCell = document.createElement("td");
        nameCell.classList.add("name");
        nameCell.innerHTML = `${item.name} <span><br>x${item.quantity}</span>`;
        row.appendChild(nameCell);

        const priceCell = document.createElement("td");
        priceCell.classList.add("price");
        const calculatedTotalPrice = item.quantity * parseFloat(item.price.replace('₫', '').replace(/\./g, '').trim());
        priceCell.textContent = calculatedTotalPrice.toLocaleString() + " ₫";
        row.appendChild(priceCell);

        cartContainer.appendChild(row);
        totalAmount += calculatedTotalPrice;
    });

    appendTotalRow(cartContainer, totalAmount);
    updateCartHeader();
}

// Hàm thêm tổng tiền vào bảng thanh toán
function appendTotalRow(cartContainer, totalAmount) {
    const totalPriceRow = document.createElement("tr");
    totalPriceRow.classList.add("temp-row");

    const totalLabelCell = document.createElement("td");
    totalLabelCell.textContent = "TẠM TÍNH";
    totalPriceRow.appendChild(totalLabelCell);

    const totalAmountCell = document.createElement("td");
    totalAmountCell.classList.add("total-price");
    totalAmountCell.textContent = totalAmount.toLocaleString() + " ₫";
    totalPriceRow.appendChild(totalAmountCell);

    cartContainer.appendChild(totalPriceRow);

    const totalRow = document.createElement("tr");
    totalRow.classList.add("total-row");

    const totalLabelCellFinal = document.createElement("td");
    totalLabelCellFinal.textContent = "TỔNG";
    totalRow.appendChild(totalLabelCellFinal);

    const finalAmountCell = document.createElement("td");
    finalAmountCell.classList.add("total-price");
    finalAmountCell.textContent = totalAmount.toLocaleString() + " ₫";
    totalRow.appendChild(finalAmountCell);

    cartContainer.appendChild(totalRow);
}

// Hàm cập nhật số lượng sản phẩm trong giỏ hàng ở header
function updateCartHeader() {
    const cartCountElement = document.getElementById("cart-count");
    if (cartCountElement) {
        cartCountElement.textContent = cartManager.getTotalItems();
    }
}
