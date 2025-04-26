package vn.edu.hcmuaf.fit.clock.model.admin;

import java.io.Serializable;
import java.sql.Timestamp;

public class Products implements Serializable {
    private int id;
    private String name;
    private int price;
    private int discountPercent;
    private int refundPolicyId;
    private int shippingInfoId;
    private String productType;
    private String description;
    private String videoUrl;
    private int categoryId;
    private String image;
    private int sold;
    private int stock;
    private Timestamp createdAt;
    private Timestamp updatedAt;

    public Products() {
    }

    public Products(int id, String name, int price, int discountPercent, int refundPolicyId, int shippingInfoId, String productType, String description, String videoUrl, int categoryId, String image, int sold, int stock) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discountPercent = discountPercent;
        this.refundPolicyId = refundPolicyId;
        this.shippingInfoId = shippingInfoId;
        this.productType = productType;
        this.description = description;
        this.videoUrl = videoUrl;
        this.categoryId = categoryId;
        this.image = image;
        this.sold = sold;
        this.stock = stock;
    }

    public Products(int id, String name, int price, int discountPercent, int refundPolicyId, int shippingInfoId, String productType, String description, String videoUrl, int categoryId, String image, int sold, int stock, Timestamp createdAt, Timestamp updatedAt) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discountPercent = discountPercent;
        this.refundPolicyId = refundPolicyId;
        this.shippingInfoId = shippingInfoId;
        this.productType = productType;
        this.description = description;
        this.videoUrl = videoUrl;
        this.categoryId = categoryId;
        this.image = image;
        this.sold = sold;
        this.stock = stock;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
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

    public int getRefundPolicyId() {
        return refundPolicyId;
    }

    public void setRefundPolicyId(int refundPolicyId) {
        this.refundPolicyId = refundPolicyId;
    }

    public int getShippingInfoId() {
        return shippingInfoId;
    }

    public void setShippingInfoId(int shippingInfoId) {
        this.shippingInfoId = shippingInfoId;
    }

    public String getProductType() {
        return productType;
    }

    public void setProductType(String productType) {
        this.productType = productType;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getSold() {
        return sold;
    }

    public void setSold(int sold) {
        this.sold = sold;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }
}