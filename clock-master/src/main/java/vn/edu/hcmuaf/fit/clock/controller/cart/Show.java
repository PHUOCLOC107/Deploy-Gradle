package vn.edu.hcmuaf.fit.clock.controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.dao.cart.Cart;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Show", value = "/ShowCart")
public class Show extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        CategoryService categoryService = new CategoryService();
        List<Category> listCate = categoryService.getAllCategory();
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}