package vn.edu.hcmuaf.fit.clock.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.Product;

import vn.edu.hcmuaf.fit.clock.model.ProductDetail;
import vn.edu.hcmuaf.fit.clock.model.ProductImage;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

import java.util.List;

public class ProductDao {

    // Tìm sản phẩm theo id
    public Product findById(int id) {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM products WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Product.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Tìm sản phẩm theo tên và loại
    public Product findByNameAndType(String name, String type) {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("select * from products where name = :name and product_type = :type")
                        .bind("name", name)
                        .bind("type", type)
                        .mapToBean(Product.class)
                        .findFirst().orElse(null));
    }

    // Danh sách sản phẩm theo danh mục
    public List<Product> findByCategory(String category) {
        Jdbi jdbi = JdbiConnect.get();
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice " +
                "FROM products WHERE category_id = (SELECT id FROM categories WHERE name = :category)";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("category", category)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }


    // Danh sách sản phẩm hot
    public List<Product> findHot() {
        Jdbi jdbi = JdbiConnect.get();
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice " +
                "FROM products WHERE sold > 10";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    // Danh sách sản phẩm mới (được tạo trong vòng 20 ngày)
    public List<Product> findNew() {
        Jdbi jdbi = JdbiConnect.get();
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice " +
                "FROM products WHERE DATEDIFF(CURDATE(), created_at) <= 20";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    // Danh sách sản phẩm đang giảm giá
    public List<Product> findSale() {
        Jdbi jdbi = JdbiConnect.get();
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice " +
                "FROM products WHERE discount_percent > 0";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }


    // Cập nhật mức giảm giá
    public void updateDiscount(int productId, int discount) {
        JdbiConnect.get().useHandle(handle ->
                handle.createUpdate("UPDATE products SET discount_percent = :discount WHERE id = :id")
                        .bind("discount", discount)
                        .bind("id", productId)
                        .execute());
    }

    // Thêm sản phẩm
    public boolean addProduct(Product product) {
        Product existingProduct = findByNameAndType(product.getName(), product.getType());
        if (existingProduct != null) {
            return false;
        }
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO products (category_id, name, price, discount_percent, refund_policy_id, shipping_info_id," +
                                " product_type, stock, description, video_path) " +
                                "VALUES (:category_id, :name, :price, :discount, :refund_policy_id," +
                                " :shipping_info_id, :product_type, :stock, :description, :video_path)")
                        .bind("category_id", product.getCategoryId())
                        .bind("name", product.getName())
                        .bind("price", product.getPrice())
                        .bind("discount", product.getDiscountPercent())
                        .bind("return_policy_id", product.getReturnPolicyId())
                        .bind("shipping_policy_id", product.getShippingPolicyId())
                        .bind("type", product.getType())
                        .bind("stock", product.getStock())
                        .bind("description", product.getDescription())
                        .bind("video_path", product.getVideoPath())
                        .execute());
        return rowsAffected > 0;
    }

    // Xóa sản phẩm
    public boolean deleteProduct(int productId) {
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM products WHERE id = :id")
                        .bind("id", productId)
                        .execute());
        return rowsAffected > 0;
    }

    public List<Product> getAll() {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("select * from products").mapToBean(Product.class).list());
    }

    // Lấy tổng số sản phẩm
    public int getTotalProducts() {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("select count(*) from products ")
                        .mapTo(Integer.class).one());
    }

    // Lấy tổng số sản phẩm mới
    public int getTotalNewProducts() {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM products WHERE DATEDIFF(CURDATE(), created_at) <= 20 ")
                        .mapTo(Integer.class)
                        .one()
        );
    }

    // Lấy tổng số sản phẩm bán chạy
    public int getTotalHotProducts() {
        List<Integer> hotProductsCount = JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold " +
                                "FROM products WHERE sold > 10 ")
                        .mapTo(Integer.class)
                        .list());
        return hotProductsCount.size();
    }

    // Lấy tổng số sản phẩm sale
    public int getTotalSaleProducts() {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("select count(*) from products where discount_percent > 0 ")
                        .mapTo(Integer.class).one());
    }

    // Lấy tổng số sản phẩm thuộc loại danh mục
    public int getTotalProductsByCategory(String categoryName) {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM products p JOIN categories c ON p.category_id = c.id WHERE c.name = :categoryName ")
                        .bind("categoryName", categoryName)
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public List<Product> getProductsByPage(int page, int itemsPerPage) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String query = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at " +
                "FROM products " +
                "LIMIT :limit OFFSET :offset ";
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            return product;
                        }).list()
        );
    }

    public List<Product> getProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice " +
                "FROM products ";

        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public List<Product> getNewProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice FROM products WHERE DATEDIFF(CURDATE(), created_at) <= 20 ";

        // Xử lý các tiêu chí sắp xếp
        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                // Sắp xếp theo số lượng bán (sold), chỉ các sản phẩm bán được hơn 10 sản phẩm
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }
        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold")); // Lấy số lượng sản phẩm đã bán
                            return product;
                        }).list()
        );
    }

    public List<Product> getHotProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice FROM products WHERE sold > 10 ";

        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public List<Product> getSaleProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold, " +
                "(price * (1 - discount_percent / 100.0)) AS discountedPrice FROM products WHERE discount_percent > 0 ";

        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public List<Product> getPeacockClocksByPageSorted(int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT p.id, p.name, p.price, p.discount_percent AS discountPercent, p.image, p.created_at, p.sold, " +
                "(p.price * (1 - p.discount_percent / 100.0)) AS discountedPrice FROM products p JOIN categories c ON p.category_id = c.id WHERE c.name = 'Đồng hồ con công' ";

        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public List<Product> getProductsByCategoryPageSorted(int page, int itemsPerPage, String sortBy, String category) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT p.id, p.name, p.price, p.discount_percent AS discountPercent, p.image, p.created_at, p.sold, " +
                "(p.price * (1 - p.discount_percent / 100.0)) AS discountedPrice FROM products p JOIN categories c ON p.category_id = c.id WHERE c.name = :category ";

        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("category", category)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public List<Product> getGiftClocksByPageSorted(int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT p.id, p.name, p.price, p.discount_percent AS discountPercent, p.image, p.created_at, p.sold, " +
                "(p.price * (1 - p.discount_percent / 100.0)) AS discountedPrice FROM products p JOIN categories c ON p.category_id = c.id WHERE c.name = 'Đồng hồ quà tặng' ";

        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public List<Product> getPictureClocksByPageSorted(int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;
        String sql = "SELECT p.id, p.name, p.price, p.discount_percent AS discountPercent, p.image, p.created_at, p.sold, " +
                "(p.price * (1 - p.discount_percent / 100.0)) AS discountedPrice FROM products p JOIN categories c ON p.category_id = c.id WHERE c.name = 'Đồng hồ tranh' ";

        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";
        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public ProductDetail getProductById(int id) {
        Jdbi jdbi = JdbiConnect.get();

        String query = "SELECT p.id, p.name, p.price, p.discount_percent, p.product_type, p.description, " +
                "p.video_url, p.image, p.stock, r.policy_description AS refund_policy, " +
                "s.policy_description AS shipping_info, ps.brand, ps.product_code, ps.height, " +
                "ps.width, ps.dial_diameter, ps.engine, ps.material, ps.color, ps.style, ps.power " +
                "FROM products p " +
                "JOIN refund_policies r ON p.refund_policy_id = r.id " +
                "JOIN shipping_info s ON p.shipping_info_id = s.id " +
                "JOIN product_technical_specifications ps ON p.id = ps.product_id " +
                "WHERE p.id = :id";
        return jdbi.withHandle(handle -> handle.createQuery(query)
                .bind("id", id)
                .mapToBean(ProductDetail.class).findOne().orElse(null));
    }

    public List<ProductImage> getProductImagesById(int productId) {
        String sql = "SELECT image_url FROM product_images WHERE product_id = :id";
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery(sql)
                .bind("id", productId)
                .mapToBean(ProductImage.class).list());
    }

    //Tìm kiếm PRODUCT:
    public List<Product> searchProductsByPage(String searchQuery, int page, int itemsPerPage, String sortBy) {
        Jdbi jdbi = JdbiConnect.get();
        int offset = (page - 1) * itemsPerPage;

        // Xây dựng câu truy vấn SQL cơ bản
        String sql = "SELECT id, name, price, discount_percent AS discountPercent, image, created_at, sold " +
                "FROM products " +
                "WHERE LOWER(name) LIKE CONCAT('%', :searchQuery, '%') ";

        // Thêm sắp xếp tùy theo sortBy
        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY price ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY price DESC ";
                break;
        }

        sql += "LIMIT :limit OFFSET :offset";

        String query = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(query)
                        .bind("searchQuery", searchQuery.toLowerCase())
                        .bind("limit", itemsPerPage)
                        .bind("offset", offset)
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }
    public int getTotalSearchProducts(String searchQuery) {
        Jdbi jdbi = JdbiConnect.get();
        String sql = "SELECT COUNT(*) FROM products WHERE LOWER(name) LIKE CONCAT('%', :searchQuery, '%')";
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("searchQuery", searchQuery.toLowerCase())
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public List<Product> searchProductsByCategoryAndPage(String searchQuery, int page, int itemsPerPage, String sortBy, String category) {
        Jdbi jdbi = JdbiConnect.get();

        // Đảm bảo offset là final hoặc hiệu quả final
        final int offset = (page - 1) * itemsPerPage;

        // Xây dựng câu truy vấn SQL cơ bản để tìm kiếm theo tên sản phẩm và lọc theo danh mục
        String sql = "SELECT p.id, p.name, p.price, p.discount_percent AS discountPercent, p.image, p.created_at, p.sold, " +
                "(p.price * (1 - p.discount_percent / 100.0)) AS discountedPrice " +
                "FROM products p " +
                "JOIN categories c ON p.category_id = c.id " +
                "WHERE LOWER(p.name) LIKE CONCAT('%', :searchQuery, '%') " +
                "AND LOWER(c.name) = LOWER(:category) ";

        // Thêm phần sắp xếp tùy thuộc vào giá trị của sortBy
        switch (sortBy) {
            case "sort-new":
                sql += "ORDER BY p.created_at DESC ";
                break;
            case "sort-popular":
                sql += "ORDER BY p.sold DESC ";
                break;
            case "sort-lowToHigh":
                sql += "ORDER BY discountedPrice ASC ";
                break;
            case "sort-highToLow":
                sql += "ORDER BY discountedPrice DESC ";
                break;
        }

        // Thêm phân trang (LIMIT và OFFSET)
        sql += "LIMIT :limit OFFSET :offset";

        // Thực hiện truy vấn và trả về kết quả
        String finalSql = sql;
        return jdbi.withHandle(handle ->
                handle.createQuery(finalSql)
                        .bind("searchQuery", searchQuery.toLowerCase()) // Liên kết tham số tìm kiếm
                        .bind("category", category.toLowerCase()) // Liên kết tham số danh mục
                        .bind("limit", itemsPerPage) // Liên kết tham số giới hạn số sản phẩm mỗi trang
                        .bind("offset", offset) // Liên kết tham số offset cho phân trang
                        .map((rs, ctx) -> {
                            Product product = new Product();
                            product.setId(rs.getInt("id"));
                            product.setName(rs.getString("name"));
                            product.setPrice(rs.getInt("price"));
                            product.setDiscountPercent(rs.getInt("discountPercent"));
                            product.setImage(rs.getString("image"));
                            product.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                            product.setSold(rs.getInt("sold"));
                            return product;
                        }).list()
        );
    }

    public int getTotalSearchProductsByCategory(String searchQuery, String category) {
        Jdbi jdbi = JdbiConnect.get();
        String sql = "SELECT COUNT(*) FROM products p " +
                "JOIN categories c ON p.category_id = c.id " +
                "WHERE LOWER(p.name) LIKE CONCAT('%', :searchQuery, '%') " +
                "AND LOWER(c.name) = LOWER(:category)";

        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .bind("searchQuery", searchQuery.toLowerCase())
                        .bind("category", category.toLowerCase())
                        .mapTo(Integer.class)
                        .one()
        );
    }

    public List<Product> getSimilarProducts(int categoryId, int productId) {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery("SELECT * FROM products WHERE category_id = :categoryId AND id != :productId ORDER BY RAND() LIMIT 4")
                        .bind("categoryId", categoryId)
                        .bind("productId", productId)
                        .mapToBean(Product.class)
                        .list()
        );
    }



    public static void main(String[] args) {
        ProductDao dao = new ProductDao();
        List <Product> products  = dao.findByCategory("Đồng hồ tranh");
        for (Product product : products) {
            System.out.println(product);
        }
    }


}
