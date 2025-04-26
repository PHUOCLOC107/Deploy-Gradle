package vn.edu.hcmuaf.fit.clock.dao.admin;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

import java.util.List;

public class CategoryDao {
    public List<Category> getAllCategory() {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM categories")
                .mapToBean(Category.class).list());
    }

    public void addCategory(String categoryName) {
        Jdbi jdbi = JdbiConnect.get();
        jdbi.withHandle(handle -> handle.createUpdate("INSERT INTO categories (name) VALUES (:name)")
                .bind("name", categoryName)
                .execute());
    }

    public void updateCategory(int id, String categoryName) {
        Jdbi jdbi = JdbiConnect.get();
        jdbi.withHandle(handle -> handle.createUpdate("UPDATE categories SET name = :name, updated_at = NOW() WHERE id = :id")
                .bind("name", categoryName)
                .bind("id", id)
                .execute());
    }

    public void deleteCategory(int id) {
        Jdbi jdbi = JdbiConnect.get();

        jdbi.useTransaction(handle -> {
            // Xóa tất cả các hình ảnh sản phẩm có product_id liên quan đến các sản phẩm trong danh mục
            handle.createUpdate("DELETE FROM product_images WHERE product_id IN (SELECT id FROM products WHERE category_id = :category_id)")
                    .bind("category_id", id)
                    .execute();

            // Xóa tất cả các thông số kỹ thuật sản phẩm có product_id liên quan đến các sản phẩm trong danh mục
            handle.createUpdate("DELETE FROM product_technical_specifications WHERE product_id IN (SELECT id FROM products WHERE category_id = :category_id)")
                    .bind("category_id", id)
                    .execute();

            // Xóa tất cả các sản phẩm trong bảng products có category_id trùng với id của danh mục
            handle.createUpdate("DELETE FROM products WHERE category_id = :category_id")
                    .bind("category_id", id)
                    .execute();

            // Xóa danh mục trong bảng categories
            handle.createUpdate("DELETE FROM categories WHERE id = :category_id")
                    .bind("category_id", id)
                    .execute();
        });
    }

    public Category findCategoryById(int id) {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM categories WHERE id = :id")
                .bind("id", id)
                .mapToBean(Category.class).findOne().orElse(null));
    }

    public List<Category> findCategoryByName(String keyword) {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT id, name FROM categories WHERE name LIKE :keyword OR id LIKE :keyword")
                .bind("keyword", "%" + keyword + "%")
                .mapToBean(Category.class)
                .list());
    }
}
