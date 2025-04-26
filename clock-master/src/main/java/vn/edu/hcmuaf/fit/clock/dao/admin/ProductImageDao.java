package vn.edu.hcmuaf.fit.clock.dao.admin;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.admin.ProductImage;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

import java.util.List;

public class ProductImageDao {

    public void addProductImages(int product_id, List<String> imageUrls) {
        Jdbi jdbi = JdbiConnect.get();
        jdbi.withHandle(handle -> {
                    for (String imageUrl : imageUrls) {
                        handle.createUpdate("INSERT INTO product_images (product_id, image_url) VALUES (?, ?)")
                                .bind(0, product_id)
                                .bind(1, imageUrl)
                                .execute();
                    }
                    return null;
                }
        );
    }
    // Lấy hình ảnh của sản phẩm
    public List<ProductImage> getProductImages(int productId) {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM product_images WHERE product_id = ?")
                .bind(0, productId)
                .mapToBean(ProductImage.class)
                .list()
        );
    }
}
