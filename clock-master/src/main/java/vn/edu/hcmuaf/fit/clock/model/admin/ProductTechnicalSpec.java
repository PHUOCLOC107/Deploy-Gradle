package vn.edu.hcmuaf.fit.clock.model.admin;

public class ProductTechnicalSpec {
    private int id;
    private int productId;
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

    public ProductTechnicalSpec() {
    }

    public ProductTechnicalSpec(int id, int productId, String brand, String productCode, String height, String width, String dialDiameter, String engine, String material, String color, String style, String power) {
        this.id = id;
        this.productId = productId;
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

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
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
}
