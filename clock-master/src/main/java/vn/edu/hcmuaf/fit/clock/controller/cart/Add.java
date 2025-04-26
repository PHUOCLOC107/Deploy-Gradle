package vn.edu.hcmuaf.fit.clock.controller.cart;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.dao.cart.Cart;
import vn.edu.hcmuaf.fit.clock.model.Product;
import vn.edu.hcmuaf.fit.clock.model.ProductDetail;
import vn.edu.hcmuaf.fit.clock.service.ProductService;

import java.io.IOException;

@WebServlet(name = "Add", value = "/add-cart")
public class Add extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin sản phẩm từ dịch vụ
        ProductService productService = new ProductService();
        ProductDetail productDetail = productService.getDetail(request.getParameter("pid"));

        if (productDetail == null) {
            response.sendRedirect("product?addCart=false");
            return;
        }

        // Lấy số lượng từ request, mặc định là 1 nếu không có giá trị
        String quantityStr = request.getParameter("quantity");
        int quantity = 1; // Mặc định số lượng là 1
        try {
            if (quantityStr != null) {
                quantity = Integer.parseInt(quantityStr);
            }
        } catch (NumberFormatException e) {
            quantity = 1; // Nếu không hợp lệ, sử dụng số lượng mặc định là 1
        }

        // Lấy giỏ hàng từ session
        HttpSession session = request.getSession(true);
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) cart = new Cart();

        // Thêm sản phẩm vào giỏ hàng với số lượng
        cart.add(productDetail, quantity);
        session.setAttribute("cart", cart);

        // Quay lại trang trước đó hoặc trang sản phẩm nếu không có referer
        String referer = request.getHeader("Referer");
        if (referer != null) {
            response.sendRedirect(referer); // Quay lại trang gọi yêu cầu
        } else {
            response.sendRedirect("product?addCart=ok"); // Default fallback
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Nếu cần xử lý POST, bạn có thể thêm mã ở đây
    }
}
