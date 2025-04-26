package vn.edu.hcmuaf.fit.clock.service;

import vn.edu.hcmuaf.fit.clock.dao.admin.AdminProductDao;
import vn.edu.hcmuaf.fit.clock.dao.admin.ProductImageDao;
import vn.edu.hcmuaf.fit.clock.dao.admin.ProductTechnicalSpecificationDao;
import vn.edu.hcmuaf.fit.clock.model.admin.ProductTechnicalSpec;
import vn.edu.hcmuaf.fit.clock.model.admin.Products;

import java.util.List;

public class AdminProductService {
    private AdminProductDao productDAO;
    private ProductImageDao productImageDAO;
    private ProductTechnicalSpecificationDao productTechnicalSpecificationDAO;

    public AdminProductService(AdminProductDao productDAO, ProductImageDao productImageDAO, ProductTechnicalSpecificationDao productTechnicalSpecificationDAO) {
        this.productDAO = productDAO;
        this.productImageDAO = productImageDAO;
        this.productTechnicalSpecificationDAO = productTechnicalSpecificationDAO;
    }

    public List<Products> getAllProducts() {
        return productDAO.getAllProducts();
    }

    public int addProduct(Products product, List<String> imageUrls, ProductTechnicalSpec technicalSpecification) {
        int productId = productDAO.addProduct(product);
        productImageDAO.addProductImages(productId, imageUrls);
        technicalSpecification.setProductId(productId);
        productTechnicalSpecificationDAO.addTechnicalSpecification(technicalSpecification);
        return productId;
    }

    public void updateProduct(Products product, List<String> imageUrls, ProductTechnicalSpec technicalSpecification) {
        productDAO.updateProduct(product);
        productImageDAO.addProductImages(product.getId(), imageUrls); // Cập nhật ảnh
        productTechnicalSpecificationDAO.addTechnicalSpecification(technicalSpecification); // Cập nhật thông số kỹ thuật
    }

    public void deleteProduct(int productId) {
        productDAO.deleteProduct(productId);
    }

    public List<Products> searchProducts(String keyword) {
        return productDAO.searchProducts(keyword);
    }
}
