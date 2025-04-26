package vn.edu.hcmuaf.fit.clock.model;

import java.io.Serializable;
import java.text.NumberFormat;
import java.util.Locale;

public class ProductDetail implements Serializable {
    private int id;
    private String name;
    private int price;
    private int discountPercent;
    private String productType;
    private String description;
    private String videoUrl;
    private String image;
    private int stock;
    private String refundPolicy;
    private String shippingInfo;
    private String brand;
    private String productCode;
    private String height;
    private String width;
    private String dialDiameter;
    private String engine;
    private String material;
    private String color;
    private String style;
    private String power;

    public ProductDetail() {
    }

    public ProductDetail(int id, String name, int price, int discountPercent, String productType, String description, String videoUrl, String image, int stock, String refundPolicy, String shippingInfo, String brand, String productCode, String height, String width, String dialDiameter, String engine, String material, String color, String style, String power) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.discountPercent = discountPercent;
        this.productType = productType;
        this.description = description;
        this.videoUrl = videoUrl;
        this.image = image;
        this.stock = stock;
        this.refundPolicy = refundPolicy;
        this.shippingInfo = shippingInfo;
        this.brand = brand;
        this.productCode = productCode;
        this.height = height;
        this.width = width;
        this.dialDiameter = dialDiameter;
        this.engine = engine;
        this.material = material;
        this.color = color;
        this.style = style;
        this.power = power;
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

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getRefundPolicy() {
        return refundPolicy;
    }

    public void setRefundPolicy(String refundPolicy) {
        this.refundPolicy = refundPolicy;
    }

    public String getShippingInfo() {
        return shippingInfo;
    }

    public void setShippingInfo(String shippingInfo) {
        this.shippingInfo = shippingInfo;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWidth() {
        return width;
    }

    public void setWidth(String width) {
        this.width = width;
    }

    public String getDialDiameter() {
        return dialDiameter;
    }

    public void setDialDiameter(String dialDiameter) {
        this.dialDiameter = dialDiameter;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public int getDiscountedPrice() {
        return (int) (price * (1 - discountPercent / 100.0));
    }


}