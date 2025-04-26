// class CartManager {
//     constructor() {
//         this.cart = JSON.parse(localStorage.getItem("cart")) || [];
//     }
//
//     // Thêm sản phẩm vào giỏ, nếu sản phẩm đã có thì cập nhật số lượng và giá
//     addItem(product) {
//         const existingProduct = this.cart.find(item => item.name === product.name && item.price === product.price);
//
//         if (existingProduct) {
//             // Nếu sản phẩm đã có trong giỏ, chỉ cập nhật số lượng và tính lại giá
//             existingProduct.quantity++;
//             existingProduct.totalPrice = existingProduct.quantity * parseFloat(existingProduct.price.replace('₫', '').replace(',', '').trim());
//         } else {
//             // Nếu sản phẩm chưa có trong giỏ, thêm mới
//             product.quantity = 1; // Đặt số lượng mặc định là 1
//             product.totalPrice = parseFloat(product.price.replace('₫', '').replace(/\./g, '').trim()); // Tính giá ban đầu
//             this.cart.push(product);
//         }
//         localStorage.setItem("cart", JSON.stringify(this.cart));
//
//         // Cập nhật lại UI giỏ hàng
//         displayCartCount();  // Cập nhật số lượng giỏ hàng
//         displayCartTotal();  // Cập nhật tổng tiền giỏ hàng
//     }
//
//     getItems() {
//         return this.cart;
//     }
//
//     getTotalItems() {
//         return this.cart.reduce((total, item) => total + item.quantity, 0);
//     }
//
//     // Xóa sản phẩm khỏi giỏ
//     removeItem(index) {
//         this.cart.splice(index, 1);
//         localStorage.setItem("cart", JSON.stringify(this.cart));
//         displayCartCount();  // Cập nhật lại số lượng giỏ hàng
//         displayCartTotal();  // Cập nhật tổng tiền giỏ hàng
//     }
//
//     // Cập nhật số lượng sản phẩm
//     updateQuantity(index, quantity) {
//         const item = this.cart[index];
//         item.quantity = quantity;
//         item.totalPrice = item.quantity * parseFloat(item.price.replace('₫', "").replace(',', '').trim());
//         localStorage.setItem("cart", JSON.stringify(this.cart));
//         displayCartCount();  // Cập nhật lại số lượng giỏ hàng
//         displayCartTotal();  // Cập nhật tổng tiền giỏ hàng
//     }
//
//     // Tổng tiền trong giỏ
//     getTotalPrice() {
//         return this.cart.reduce((total, item) => {
//             const price = parseFloat(item.price.replace(/\./g, ''));
//             return total + price * item.quantity;
//         }, 0);
//     }
// }
//
// // Khởi tạo CartManager để dùng trong các trang
// const cartManager = new CartManager();
//
// // Hiển thị số lượng sản phẩm trong giỏ hàng
// function displayCartCount() {
//     const cartCountElement = document.getElementById("cart-count");
//     if (cartCountElement) {
//         cartCountElement.textContent = cartManager.getTotalItems();
//     }
// }
//
// // Hàm tính tổng tiền tất cả sản phẩm
// function displayCartTotal() {
//     const cartTotalElement = document.getElementById("cart-total");
//     if (cartTotalElement) {
//         const totalPrice = cartManager.getTotalPrice();
//         cartTotalElement.textContent = totalPrice.toLocaleString() + " ₫"; // Hiển thị tổng tiền
//     }
// }
//
// // Gọi hàm này khi tải trang để cập nhật số lượng sản phẩm trong giỏ hàng
// document.addEventListener("DOMContentLoaded", () => {
//     displayCartCount();
//     displayCartTotal();
// });
