// Lấy dữ liệu khách hàng từ localStorage (nếu có)
let customers = JSON.parse(localStorage.getItem('customers')) || [];

// Lấy phần tử DOM
const addCustomerBtn = document.getElementById('addCustomerBtn');
const customerForm = document.getElementById('customerForm');
const customerTableBody = document.getElementById('customerTableBody');

// Hiển thị form khi nhấn nút "Thêm khách hàng"
addCustomerBtn.addEventListener('click', () => {
    customerForm.style.display = 'block';
    addCustomerBtn.style.display = 'none';
});

// Hủy form thêm khách hàng
function cancelForm() {
    customerForm.style.display = 'none';
    addCustomerBtn.style.display = 'block';
}

// Thêm khách hàng mới
document.getElementById('addCustomerForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    const phone = document.getElementById('phone').value;
    const address = document.getElementById('address').value;

    const newCustomer = {
        id: customers.length + 1,
        name: name,
        email: email,
        phone: phone,
        address: address
    };

    // Thêm khách hàng vào mảng
    customers.push(newCustomer);

    // Lưu dữ liệu vào localStorage
    localStorage.setItem('customers', JSON.stringify(customers));

    // Hiển thị lại danh sách khách hàng
    displayCustomers();

    // Xóa dữ liệu trong các ô input
    document.getElementById('name').value = '';
    document.getElementById('email').value = '';
    document.getElementById('phone').value = '';
    document.getElementById('address').value = '';

    cancelForm();
});

// Hiển thị danh sách khách hàng
function displayCustomers() {
    customerTableBody.innerHTML = '';
    customers.forEach((customer) => {
        const row = document.createElement('tr');

        row.innerHTML = `
            <td>${customer.id}</td>
            <td>${customer.name}</td>
            <td>${customer.email}</td>
            <td>${customer.phone}</td>
            <td>${customer.address}</td>
            <td>
                <button class="edit-btn" onclick="editCustomer(${customer.id})"><i class="fas fa-edit"></i> Sửa</button>
                <button class="delete-btn" onclick="deleteCustomer(${customer.id})"><i class="fas fa-trash"></i> Xóa</button>
            </td>
        `;
        customerTableBody.appendChild(row);
    });
}

// Sửa thông tin khách hàng
function editCustomer(id) {
    const customer = customers.find(c => c.id === id);
    document.getElementById('name').value = customer.name;
    document.getElementById('email').value = customer.email;
    document.getElementById('phone').value = customer.phone;
    document.getElementById('address').value = customer.address;

    customerForm.style.display = 'block';
    addCustomerBtn.style.display = 'none';

    // Xóa khách hàng cũ và thêm vào như một khách hàng mới
    customers = customers.filter(c => c.id !== id);

    // Lưu lại mảng khách hàng đã thay đổi vào localStorage
    localStorage.setItem('customers', JSON.stringify(customers));

    displayCustomers();
}

// Xóa khách hàng
function deleteCustomer(id) {
    if (confirm('Bạn có chắc chắn muốn xóa khách hàng này?')) {
        customers = customers.filter(c => c.id !== id);

        // Cập nhật lại localStorage
        localStorage.setItem('customers', JSON.stringify(customers));

        displayCustomers();
    }
}

// Hiển thị danh sách khách hàng khi tải trang
displayCustomers();
