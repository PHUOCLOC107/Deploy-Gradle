package vn.edu.hcmuaf.fit.clock.dao.admin;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.admin.Products;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

import java.util.List;

public class AdminProductDao {

    public List<Products> getAllProducts() {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("select * from products")
                .mapToBean(Products.class)
                .list());
    }

    public int addProduct(Products products) {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle ->
                handle.createUpdate("INSERT INTO products (name, price, discount_percent,refund_policy_id," +
                                "shipping_info_id, product_type, description, video_url, category_id, image," +
                                "sold, stock) " +
                                "VALUES (?, ?, ?, 1, 1, ?, ?, ?, ?, ?, 0, ?)")
                        .bind(0, products.getName())
                        .bind(1, products.getPrice())
                        .bind(2, products.getDiscountPercent())
                        .bind(3, products.getProductType())
                        .bind(4, products.getDescription())
                        .bind(5, products.getVideoUrl())
                        .bind(6, products.getCategoryId())
                        .bind(7, products.getImage())
                        .bind(8, products.getStock())
                        .executeAndReturnGeneratedKeys("id")
                        .mapToBean(int.class)
                        .findOne().orElse(null)
        );
    }

    public void updateProduct(Products products) {
        Jdbi jdbi = JdbiConnect.get();
        jdbi.withHandle(handle ->
                handle.createUpdate("UPDATE products SET name = ?, price = ?, discount_percent = ?, product_type = ?, description = ?, " +
                                "video_url = ?, category_id = ?, image = ?, stock = ? WHERE id = ?")
                        .bind(0, products.getName())
                        .bind(1, products.getPrice())
                        .bind(2, products.getDiscountPercent())
                        .bind(3, products.getProductType())
                        .bind(4, products.getDescription())
                        .bind(5, products.getVideoUrl())
                        .bind(6, products.getCategoryId())
                        .bind(7, products.getImage())
                        .bind(8, products.getStock())
                        .bind(9, products.getId())
                        .execute()
        );
    }

    public void deleteProduct(int productId) {
        Jdbi jdbi = JdbiConnect.get();
        jdbi.withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE id = ?")
                        .bind(0, productId)
                        .execute());
    }

    public List<Products> searchProducts(String keyword) {
        Jdbi jdbi = JdbiConnect.get();
        String query = """
                SELECT id, name, price, discount_percent, description, image, stock, sold, category_id
                FROM products
                WHERE name LIKE :keyword OR id LIKE :keyword
                """;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("keyword", "%" + keyword + "%")
                        .mapToBean(Products.class)
                        .list());
    }


}
