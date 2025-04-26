// Lấy tên người dùng đã đăng nhập từ localStorage
const loggedInUser = localStorage.getItem('loggedInUser');

// Lấy dữ liệu người dùng từ localStorage
const userData = JSON.parse(localStorage.getItem(loggedInUser));

// Hiển thị thông tin người dùng vào các phần tử HTML
document.getElementById('fullname').textContent = userData.fullname || "";
document.getElementById('phonenumber').textContent = userData.phonenumber || "";
document.getElementById('email').textContent = userData.email || "";
document.getElementById('address').textContent = userData.address || "";

// Xử lý cập nhật thông tin tài khoản
document.getElementById('updateAccountForm').addEventListener('submit', function (event) {
    event.preventDefault();

    // Lấy các giá trị người dùng nhập vào
    const updatedFullName = document.getElementById('updateFullName').value;
    const updatedPhone = document.getElementById('updatePhone').value;
    const updatedEmail = document.getElementById('updateEmail').value;
    const updatedAddress = document.getElementById('updateAddress').value;

    // Cập nhật thông tin trong localStorage
    userData.fullname = updatedFullName || userData.fullname;
    userData.phonenumber = updatedPhone || userData.phonenumber;
    userData.email = updatedEmail || userData.email;
    userData.address = updatedAddress || userData.address;

    // Lưu lại thông tin đã cập nhật vào localStorage
    localStorage.setItem(loggedInUser, JSON.stringify(userData));

    // Cập nhật lại thông tin trên giao diện (các thẻ <h6>)
    document.getElementById('fullname').textContent = userData.fullname;
    document.getElementById('phonenumber').textContent = userData.phonenumber;
    document.getElementById('email').textContent = userData.email;
    document.getElementById('address').textContent = userData.address;

    // Reset form update
    document.querySelector('#updateAccountForm').reset();
    // Thông báo thành công
    location.reload();
    alert("Thông tin tài khoản đã được cập nhật thành công.");
});

document.addEventListener("DOMContentLoaded", function() {
    // Hiển thị lịch sử mua hàng
    displayPurchaseHistory();
});

// Hàm hiển thị lịch sử mua hàng
function displayPurchaseHistory() {
    const historyContainer = document.getElementById('history-container');
    const purchaseHistory = JSON.parse(localStorage.getItem('purchaseHistory')) || [];

    historyContainer.innerHTML = `
        <h3 class="history-title">Lịch sử mua hàng</h3>
    `;

    if (purchaseHistory.length === 0) {
        const emptyTransaction = document.createElement("p");
        emptyTransaction.classList.add("mt-transaction");
        emptyTransaction.textContent = "Bạn chưa có giao dịch nào."; // Thêm nội dung hiển thị
        historyContainer.appendChild(emptyTransaction); // Thêm phần tử vào container
        return;
    }

    purchaseHistory.forEach((transaction, index) => {
        const transactionDiv = document.createElement("div");
        transactionDiv.classList.add("transaction");

        const date = document.createElement("p");
        date.classList.add("transaction-date");
        date.textContent = `Ngày: ${new Date(transaction.date).toLocaleString()}`;
        transactionDiv.appendChild(date);

        const itemsList = document.createElement("ul");
        itemsList.classList.add("transaction-items");
        transaction.items.forEach(item => {
            const itemLi = document.createElement("li");
            itemLi.classList.add("transaction-item");
            itemLi.textContent = `${item.name} - Số lượng: ${item.quantity} - Giá: ${item.price}`;
            itemsList.appendChild(itemLi);
        });
        transactionDiv.appendChild(itemsList);

        const buttonContainer = document.createElement("div");
        buttonContainer.classList.add("transaction-buttons");

        const reorderButton = document.createElement("button");
        reorderButton.textContent = "Mua lại";
        reorderButton.classList.add("reorder-button");
        reorderButton.onclick = () => reorderItems(transaction.items);
        buttonContainer.appendChild(reorderButton);

        const deleteButton = document.createElement("button");
        deleteButton.textContent = "Xóa";
        deleteButton.classList.add("delete-button");
        deleteButton.onclick = () => deleteTransaction(index);
        buttonContainer.appendChild(deleteButton);
        transactionDiv.appendChild(buttonContainer);
        historyContainer.appendChild(transactionDiv);
    });
}

// Hàm mua lại sản phẩm từ lịch sử
function reorderItems(items) {
    // Lấy giỏ hàng hiện tại từ localStorage hoặc khởi tạo mảng rỗng
    const cart = JSON.parse(localStorage.getItem('cart')) || [];

    items.forEach(item => {
        // Kiểm tra xem sản phẩm đã tồn tại trong giỏ hàng hay chưa
        const existingItem = cart.find(cartItem => cartItem.name === item.name);
        if (existingItem) {
            // Nếu sản phẩm đã tồn tại, tăng số lượng
            existingItem.quantity += item.quantity;
        } else {
            // Nếu sản phẩm chưa có, thêm sản phẩm mới vào giỏ
            cart.push({
                name: item.name,
                quantity: item.quantity,
                price: item.price,
                image: item.image // Đảm bảo hình ảnh được lưu vào giỏ
            });
        }
    });

    // Lưu giỏ hàng cập nhật vào localStorage
    localStorage.setItem('cart', JSON.stringify(cart));

    // Thông báo và tải lại trang
    alert("Đã thêm sản phẩm vào giỏ hàng!");
    location.reload();
    //location.href = 'pay.html';
}


// Hàm xóa từng mục lịch sử mua hàng
function deleteTransaction(index) {
    const purchaseHistory = JSON.parse(localStorage.getItem('purchaseHistory')) || [];
    const confirmation = confirm("Bạn có chắc chắn muốn xóa giao dịch này?");
    if (confirmation) {
        purchaseHistory.splice(index, 1); // Xóa giao dịch tại vị trí index
        localStorage.setItem('purchaseHistory', JSON.stringify(purchaseHistory)); // Cập nhật lại localStorage
        alert("Đã xóa giao dịch!");
        displayPurchaseHistory(); // Cập nhật lại giao diện
    }
}

document.getElementById('changePass').addEventListener('click', function() {
    document.getElementById('changePasswordModal').style.display = 'block';
});

// Event listener to handle password change form submission
document.getElementById('changePasswordForm').addEventListener('submit', function(event) {
    event.preventDefault();

    const oldPassword = document.getElementById('oldPassword').value;
    const newPassword = document.getElementById('newPassword').value;

    const username = localStorage.getItem('loggedInUser');
    const user = JSON.parse(localStorage.getItem(username));

    if (user && user.password === oldPassword && newPassword === oldPassword) {
        alert('Mật khẩu mới không được trùng mật khẩu cũ!');
    }
    else if (user && user.password === oldPassword) {
        user.password = newPassword;
        localStorage.setItem(username, JSON.stringify(user));
        alert('Mật khẩu đã được thay đổi thành công!');
        location.reload();
        document.getElementById('changePasswordModal').style.display = 'none';
    } else {
        document.getElementById('passwordError').style.display = 'block';
    }
});

function closeChangePasswordModal() {
    document.getElementById('changePasswordModal').style.display = 'none';
}

