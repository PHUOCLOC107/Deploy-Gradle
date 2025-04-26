package vn.edu.hcmuaf.fit.clock.dao.admin;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.admin.ProductTechnicalSpec;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

public class ProductTechnicalSpecificationDao {
    // Lấy thông số kỹ thuật của sản phẩm
    public ProductTechnicalSpec getTechnicalSpecification(int productId) {
        Jdbi jdbi = JdbiConnect.get();
        String query = "SELECT * FROM product_technical_specifications WHERE product_id = ?";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind(0, productId)
                        .mapToBean(ProductTechnicalSpec.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Thêm thông số kỹ thuật sản phẩm
    public void addTechnicalSpecification(ProductTechnicalSpec spec) {
        Jdbi jdbi = JdbiConnect.get();
        String insertQuery = "INSERT INTO product_technical_specifications (product_id, brand, product_code, height, width, dial_diameter, " +
                "engine, material, color, style, power) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        jdbi.withHandle(handle ->
                handle.createUpdate(insertQuery)
                        .bind(0, spec.getProductId())
                        .bind(1, spec.getBrand())
                        .bind(2, spec.getProductCode())
                        .bind(3, spec.getHeight())
                        .bind(4, spec.getWidth())
                        .bind(5, spec.getDialDiameter())
                        .bind(6, spec.getEngine())
                        .bind(7, spec.getMaterial())
                        .bind(8, spec.getColor())
                        .bind(9, spec.getStyle())
                        .bind(10, spec.getPower())
                        .execute()
        );
    }

}
