package vn.edu.hcmuaf.fit.clock.model.admin;

import java.io.Serializable;

public class ProductImage implements Serializable {
    private int id;
    private int productId;
    private int imageUrl;

    public ProductImage() {
    }

    public ProductImage(int id, int productId, int imageUrl) {
        this.id = id;
        this.productId = productId;
        this.imageUrl = imageUrl;
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

    public int getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(int imageUrl) {
        this.imageUrl = imageUrl;
    }
}
