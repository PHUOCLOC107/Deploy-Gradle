package vn.edu.hcmuaf.fit.clock.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.admin.AdminProductDao;
import vn.edu.hcmuaf.fit.clock.dao.admin.ProductImageDao;
import vn.edu.hcmuaf.fit.clock.dao.admin.ProductTechnicalSpecificationDao;
import vn.edu.hcmuaf.fit.clock.model.admin.Products;
import vn.edu.hcmuaf.fit.clock.service.AdminProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminProductController", value = "/manage-products")
public class AdminProductController extends HttpServlet {
    AdminProductDao adminProductDao = new AdminProductDao();
    ProductImageDao productImageDao = new ProductImageDao();
    ProductTechnicalSpecificationDao proTSDao = new ProductTechnicalSpecificationDao();
    AdminProductService adminProductService = new AdminProductService(adminProductDao, productImageDao, proTSDao);

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        List<Products> products;
        if (keyword != null && !keyword.trim().isEmpty()) {
            products = adminProductService.searchProducts(keyword);
        } else {
            products = adminProductService.getAllProducts();
        }
        request.setAttribute("products", products);
        request.getRequestDispatcher("manage-products.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("add".equals(action)) {
            handleAddProduct(request, response);
        } else if ("delete".equals(action)) {
            handleDeleteProduct(request, response);
        } else if ("update".equals(action)) {
            handleUpdateProduct(request, response);
        }
    }

    private void handleAddProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));
        String productType = request.getParameter("productType");
        String description = request.getParameter("description");
        String videoUrl = request.getParameter("videoUrl");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String image = request.getParameter("mainImage");
        int stock = Integer.parseInt(request.getParameter("stock"));

        Products product = new Products(0, name, price, discountPercent, 1, 1, productType, description, videoUrl, categoryId, image, 0, stock);
        int productId = adminProductDao.addProduct(product);

        response.sendRedirect("manage-products.jsp");
    }

    private void handleDeleteProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        adminProductDao.deleteProduct(productId);
        response.sendRedirect("manage-products.jsp");
    }

    private void handleUpdateProduct(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int price = Integer.parseInt(request.getParameter("price"));
        int discountPercent = Integer.parseInt(request.getParameter("discountPercent"));
        String productType = request.getParameter("productType");
        String description = request.getParameter("description");
        String videoUrl = request.getParameter("videoUrl");
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        String image = request.getParameter("mainImage");
        int stock = Integer.parseInt(request.getParameter("stock"));

        Products product = new Products(id, name, price, discountPercent, 1, 1, productType, description, videoUrl, categoryId, image, 0, stock);
        adminProductDao.updateProduct(product);
        response.sendRedirect("manage-products.jsp");
    }


}