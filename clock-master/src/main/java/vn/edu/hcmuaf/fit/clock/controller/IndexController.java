package vn.edu.hcmuaf.fit.clock.controller;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.model.Product;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;
import vn.edu.hcmuaf.fit.clock.service.ProductService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "IndexController", value = "/index")
public class IndexController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ProductService productService = new ProductService();
        CategoryService categoryService = new CategoryService();

        // Lấy các sản phẩm cho các danh mục chính
        List<Product> newProducts = productService.findNew().size()  >= 4 ? productService.findNew().subList(0, 4) : productService.findNew();
        List<Product> bestSellingProducts = productService.findHot().size() >= 4 ? productService.findHot().subList(0, 4) : productService.findHot();
        List<Product> saleProducts = productService.findSale().size() >= 4 ? productService.findSale().subList(0, 4) : productService.findSale();

        boolean isNewProduct = productService.findNew().size() >  4;
        boolean isBestSellingProducts = productService.findHot().size() >  4;
        boolean isSale = productService.findSale().size() >  4;

        // Lấy danh sách các danh mục
        List<Category> categories = categoryService.getAllCategory();
        Map<String, List<Product>> productsByCategory = new HashMap<>();
        Map<String, Boolean> showMoreByCategory = new HashMap<>(); // Thêm map để lưu thông tin hiển thị "Xem thêm"

        // Lấy sản phẩm cho mỗi danh mục và đảm bảo tối đa 4 sản phẩm
        for (Category category : categories) {
            List<Product> products = productService.findByCategory(category.getName());
            // Lấy tối đa 4 sản phẩm, nếu có ít hơn thì lấy hết
            int limit = Math.min(4, products.size());
            productsByCategory.put(category.getName(), products.subList(0, limit));

            // Kiểm tra xem số lượng sản phẩm trong danh mục có lớn hơn 4 hay không
            showMoreByCategory.put(category.getName(), products.size() > 4);
        }

        // Chuyển danh sách sản phẩm theo danh mục và thông tin "Xem thêm" vào request
        request.setAttribute("newProducts", newProducts);
        request.setAttribute("bestSellingProducts", bestSellingProducts);
        request.setAttribute("saleProducts", saleProducts);
        request.setAttribute("productsByCategory", productsByCategory);
        request.setAttribute("categories", categories); // Thêm danh mục vào request
        request.setAttribute("showMoreByCategory", showMoreByCategory); // Thêm thông tin hiển thị "Xem thêm"
        request.setAttribute("isNewProduct", isNewProduct);
        request.setAttribute("isBestSellingProducts", isBestSellingProducts);
        request.setAttribute("isSale", isSale);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
