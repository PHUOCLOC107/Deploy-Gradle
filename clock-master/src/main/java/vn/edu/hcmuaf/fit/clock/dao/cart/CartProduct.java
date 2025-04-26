package vn.edu.hcmuaf.fit.clock.dao.cart;


import vn.edu.hcmuaf.fit.clock.utils.CurrencyFormatter;

import java.io.Serializable;

public class CartProduct implements Serializable {
    private int id;
    private String name;
    private int price;
    private int discountPercent;
    private String image;
    private int quantity;

    public CartProduct() {
    }

    public CartProduct(int id, String name, int price, int discountPercent, String image, int quantity) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discountPercent = discountPercent;
        this.image = image;
        this.quantity = quantity;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getDiscountedPrice() {
        return price * (1 - discountPercent / 100.0);
    }

    public String getFormattedDiscountedPrice() {
        return CurrencyFormatter.formatCurrency(getDiscountedPrice());
    }

    public String getFormattedTotalPrice() {
        return CurrencyFormatter.formatCurrency(getDiscountedPrice() * quantity);
    }

}
