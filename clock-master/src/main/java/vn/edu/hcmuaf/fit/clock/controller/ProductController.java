package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.model.Product;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;
import vn.edu.hcmuaf.fit.clock.service.ProductService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/product")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemsPerPage = 12;
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            currentPage = Integer.parseInt(pageParam);
        }

        // Lấy tham số sắp xếp từ request
        String sortBy = request.getParameter("sort-by");
        if (sortBy == null) {
            sortBy = "sort-default"; // Giá trị mặc định
        }

        ProductService productService = new ProductService();
        List<Product> products;
        int totalProducts;

        // Lấy tham số category từ request
        String category = request.getParameter("category");

        // Lấy tham số tìm kiếm từ request
        String searchQuery = request.getParameter("search");

        if (searchQuery != null && !searchQuery.trim().isEmpty()) {
            // Nếu có từ khóa tìm kiếm
            if (category != null && !category.trim().isEmpty()) {
                // Nếu có danh mục, tìm kiếm sản phẩm theo danh mục và từ khóa
                products = productService.searchProductsByCategoryAndPage(searchQuery, currentPage, itemsPerPage, sortBy, category);
                totalProducts = productService.getTotalSearchProductsByCategory(searchQuery, category);
            } else {
                // Nếu không có danh mục, tìm kiếm tất cả sản phẩm theo từ khóa
                products = productService.searchProductsByPage(searchQuery, currentPage, itemsPerPage, sortBy);
                totalProducts = productService.getTotalSearchProducts(searchQuery);
            }
        } else {
            // Nếu không có từ khóa tìm kiếm
            if (category != null && !category.trim().isEmpty()) {
                // Nếu có danh mục, lấy sản phẩm theo danh mục đó
                products = productService.getProductsByCategoryPageSorted(currentPage, itemsPerPage, sortBy, category);
                totalProducts = productService.getTotalProductsByCategory(category);
            } else {
                // Nếu không có danh mục, lấy tất cả sản phẩm
                products = productService.getProductsByPageSorted(currentPage, itemsPerPage, sortBy);
                totalProducts = productService.getTotalProducts();
            }
        }

        int totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage);
        CategoryService categoryService = new CategoryService();
        List<Category> listCate = categoryService.getAllCategory();

        // Lưu các dữ liệu vào request để chuyển qua trang JSP
        request.setAttribute("listCate", listCate);
        request.setAttribute("product", products);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("category", category); // Lưu tham số category vào request để hiển thị tiêu đề
        request.setAttribute("searchQuery", searchQuery); // Lưu từ khóa tìm kiếm vào request để hiển thị lại trên giao diện

        // Chuyển tiếp đến trang JSP
        request.getRequestDispatcher("product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}


