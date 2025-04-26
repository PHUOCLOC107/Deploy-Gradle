package vn.edu.hcmuaf.fit.clock.model;

public class OrderItem {
    private String productName;
    private int quantity;
    private int price;
    private int totalPrice;

    // Constructor
    public OrderItem() {
    }

    // Getters và Setters
    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
        // Cập nhật totalPrice khi thay đổi quantity
        updateTotalPrice();
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
        // Cập nhật totalPrice khi thay đổi price
        updateTotalPrice();
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    // Phương thức tính lại totalPrice (giá * số lượng)
    private void updateTotalPrice() {
        this.totalPrice = this.price * this.quantity;
    }

    // Setter cho totalPrice (có thể không cần thiết nữa, nhưng để giữ tính tương thích với các lớp khác)
    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }
}
