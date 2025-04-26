package vn.edu.hcmuaf.fit.clock.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryController", value = "/manage-category")
public class CategoryController extends HttpServlet {
    private final CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String keyword = request.getParameter("keyword");

        if ("search".equals(action) && keyword != null && !keyword.trim().isEmpty()) {
            List<Category> categories = categoryService.findCategoryByName(keyword);
            request.setAttribute("categories", categories);
        } else {
            List<Category> categories = categoryService.getAllCategory();
            request.setAttribute("categories", categories);
        }
        request.getRequestDispatcher("manage-category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String action = req.getParameter("action");
        String id = req.getParameter("id");
        String name = req.getParameter("name");

        try {
            switch (action) {
                case "add":
                    categoryService.addCategory(name);
                    break;
                case "edit":
                    categoryService.updateCategory(Integer.parseInt(id), name);
                    break;
                case "delete":
                    categoryService.deleteCategory(Integer.parseInt(id));
                    break;
                default:
                    throw new IllegalArgumentException("Action không hợp lệ!");
            }
            resp.sendRedirect("manage-category");
        } catch (Exception e) {
            req.setAttribute("error", "Đã xảy ra lỗi: " + e.getMessage());
            req.getRequestDispatcher("manage-category.jsp").forward(req, resp);
        }
    }
}