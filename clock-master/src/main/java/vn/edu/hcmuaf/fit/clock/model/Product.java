package vn.edu.hcmuaf.fit.clock.model;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

public class Product {
    private int id;
    private String name;
    private int price;
    private int discountPercent;
    private String image;
    private int categoryId;
    private LocalDateTime createdAt;
    private boolean isNew;
    private int sold;
    private int returnPolicyId;
    private int shippingPolicyId;
    private String type;
    private int stock;
    private String description;
    private String videoPath;

    public Product() {

    }

    public Product(int id, String name, int price, int discountPercent, String image, int categoryId, LocalDateTime createdAt,
                   boolean isNew, int sold, int returnPolicyId, int shippingPolicyId, String type, int stock, String description, String videoPath) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discountPercent = discountPercent;
        this.image = image;
        this.categoryId = categoryId;
        this.createdAt = createdAt;
        this.isNew = isNew;
        this.sold = sold;
        this.returnPolicyId = returnPolicyId;
        this.shippingPolicyId = shippingPolicyId;
        this.type = type;
        this.stock = stock;
        this.description = description;
        this.videoPath = videoPath;
    }

    // Getter và Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
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

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getShippingPolicyId() {
        return shippingPolicyId;
    }

    public void setShippingPolicyId(int shippingPolicyId) {
        this.shippingPolicyId = shippingPolicyId;
    }

    public int getReturnPolicyId() {
        return returnPolicyId;
    }

    public void setReturnPolicyId(int returnPolicyId) {
        this.returnPolicyId = returnPolicyId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public boolean isNew() {
        return isNew;
    }

    public void setNew(boolean aNew) {
        isNew = aNew;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }


    public int getDiscountedPrice() {
        if (discountPercent > 0) {
            return Math.round(price * (1 - discountPercent / 100.0f));
        }
        return price;
    }

    public boolean getIsNew() {
        long daysSinceCreated = ChronoUnit.DAYS.between(createdAt, LocalDateTime.now());
        return daysSinceCreated < 10;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", discountPercent=" + discountPercent +
                ", image='" + image + '\'' +
                ", categoryId=" + categoryId +
                ", createdAt=" + createdAt +
                ", isNew=" + isNew +
                ", sold=" + sold +
                ", returnPolicyId=" + returnPolicyId +
                ", shippingPolicyId=" + shippingPolicyId +
                ", type='" + type + '\'' +
                ", stock=" + stock +
                ", description='" + description + '\'' +
                ", videoPath='" + videoPath + '\'' +
                '}';
    }
}
