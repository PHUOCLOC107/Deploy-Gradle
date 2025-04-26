package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.model.Product;
import vn.edu.hcmuaf.fit.clock.service.ProductService;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HotProductController", value = "/hot-product")
public class HotProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int itemsPerPage = 16;
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
        List<Product> product = productService.getHotProductsByPageSorted(currentPage, itemsPerPage, sortBy);
        int totalProducts = productService.getTotalHotProducts();
        int totalPages = (int) Math.ceil((double) totalProducts / itemsPerPage);

        request.setAttribute("product", product);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("sortBy", sortBy); // Để giữ giá trị của dropdown sắp xếp
        request.getRequestDispatcher("hot-product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}