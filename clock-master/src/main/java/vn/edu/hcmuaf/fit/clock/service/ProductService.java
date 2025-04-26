
package vn.edu.hcmuaf.fit.clock.service;

import vn.edu.hcmuaf.fit.clock.dao.ProductDao;
import vn.edu.hcmuaf.fit.clock.model.Product;
import vn.edu.hcmuaf.fit.clock.model.ProductDetail;
import vn.edu.hcmuaf.fit.clock.model.ProductImage;

import java.util.List;

public class ProductService {
    ProductDao productDao = new ProductDao();

    public Product findById(int id) {
        return productDao.findById(id);
    }

    public List<Product> getAll() {
        return productDao.getAll();
    }

    // Danh sách sản phẩm theo danh mục
    public List<Product> findByCategory(String category) {
        return productDao.findByCategory(category);
    }

    // Danh sách sản phẩm hot (bán chạy)
    public List<Product> findHot() {
        return productDao.findHot();
    }

    // Danh sách sản phẩm mới
    public List<Product> findNew() {
        return productDao.findNew();
    }

    // Danh sách sản phẩm sale
    public List<Product> findSale() {
        return productDao.findSale();
    }

    public List<Product> getProductsByPage(int page, int itemsPerPage) {
        return productDao.getProductsByPage(page, itemsPerPage);
    }

    public int getTotalProducts() {
        return productDao.getTotalProducts();
    }

    public int getTotalNewProducts() {
        return productDao.getTotalNewProducts();
    }

    public int getTotalHotProducts() {
        return productDao.getTotalHotProducts();
    }

    public int getTotalSaleProducts() {
        return productDao.getTotalSaleProducts();
    }

    public int getTotalProductsByCategory(String category) {
        return productDao.getTotalProductsByCategory(category);
    }

    public List<Product> getProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        return productDao.getProductsByPageSorted(page, itemsPerPage, sortBy);
    }

    public List<Product> getNewProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        return productDao.getNewProductsByPageSorted(page, itemsPerPage, sortBy);
    }

    public List<Product> getHotProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        return productDao.getHotProductsByPageSorted(page, itemsPerPage, sortBy);
    }

    public List<Product> getSaleProductsByPageSorted(int page, int itemsPerPage, String sortBy) {
        return productDao.getSaleProductsByPageSorted(page, itemsPerPage, sortBy);
    }

    public List<Product> getPictureClocksByPageSorted(int page, int itemsPerPage, String sortBy) {
        return productDao.getPictureClocksByPageSorted(page, itemsPerPage, sortBy);
    }

    public List<Product> getPeacockClocksByPageSorted(int page, int itemsPerPage, String sortBy) {
        return productDao.getPeacockClocksByPageSorted(page, itemsPerPage, sortBy);
    }

    public List<Product> getGiftClocksByPageSorted(int page, int itemsPerPage, String sortBy) {
        return productDao.getGiftClocksByPageSorted(page, itemsPerPage, sortBy);
    }

    public List<Product> getProductsByCategoryPageSorted(int page, int itemsPerPage, String sortBy, String category) {
        return productDao.getProductsByCategoryPageSorted(page, itemsPerPage, sortBy, category);
    }

    public ProductDetail getDetail(String id) {
        return productDao.getProductById(Integer.parseInt(id));
    }

    public List<ProductImage> getProductImages(String productId) {
        return productDao.getProductImagesById(Integer.parseInt(productId));
    }

    public List<Product> searchProductsByPage(String searchQuery, int page, int itemsPerPage, String sortBy) {
        return productDao.searchProductsByPage(searchQuery, page, itemsPerPage, sortBy);
    }

    public int getTotalSearchProducts(String searchQuery) {
        return productDao.getTotalSearchProducts(searchQuery);
    }

    public List<Product> searchProductsByCategoryAndPage(String searchQuery, int page, int itemsPerPage, String sortBy, String category) {
        return productDao.searchProductsByCategoryAndPage(searchQuery, page, itemsPerPage, sortBy, category);
    }

    public int getTotalSearchProductsByCategory(String searchQuery, String category) {
        return productDao.getTotalSearchProductsByCategory(searchQuery, category);
    }

    public List<Product> getSimilarProducts(int categoryId, int productId) {
        return productDao.getSimilarProducts(categoryId, productId);
    }

    public static void main(String[] args) {
        ProductService productService = new ProductService();
        List<Product> products = productService.getNewProductsByPageSorted(1, 5, "sort-new");
        for (Product product : products) {
            System.out.println(product);
        }
    }


}
