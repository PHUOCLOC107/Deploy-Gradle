package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.dao.cart.Cart;
import vn.edu.hcmuaf.fit.clock.dao.cart.CartProduct;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.model.User;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "PayController", value = "/pay")
public class PayController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CategoryService categoryService = new CategoryService();
        List<Category> listCate = categoryService.getAllCategory();
        request.setAttribute("listCate", listCate);
        request.getRequestDispatcher("pay.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get user details from session
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("auth");

        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Get order details from the request (shipping information, payment method)
        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String address = request.getParameter("address");
        String note = request.getParameter("note"); // optional

        // Get cart details from session
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getList().isEmpty()) {
            response.sendRedirect("cart.jsp");
            return;
        }

        Jdbi jdbi = JdbiConnect.get();

        try {
            // Begin transaction
            jdbi.useTransaction(handle -> {
                // 1. Insert into `orders` table
                String insertOrderSQL = "INSERT INTO orders (user_id, total_price, status, payment_method, shipping_address, created_at) VALUES (?, ?, ?, ?, ?, ?)";
                       int orderId = handle.createUpdate(insertOrderSQL)
                        .bind(0, user.getId())
                        .bind(1, cart.getTotal())
                        .bind(2, "Đang xử lý")
                        .bind(3, "Trả tiền mặt khi giao hàng")
                        .bind(4, address + ", " + district + ", " + province)
                        .bind(5, Timestamp.valueOf(LocalDateTime.now()))
                        .executeAndReturnGeneratedKeys("id")
                        .mapTo(int.class)
                        .one();
                request.setAttribute("orderId", orderId);

                // 2. Insert into `order_items` table for each product in the cart
                String insertOrderItemSQL = "INSERT INTO order_items (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";
                for (CartProduct product : cart.getList()) {
                    handle.createUpdate(insertOrderItemSQL)
                            .bind(0, orderId)
                            .bind(1, product.getId())
                            .bind(2, product.getQuantity())
                            .bind(3, product.getPrice())
                            .execute();
                }

                // 3. Insert into `payment` table
                String insertPaymentSQL = "INSERT INTO payment (order_id, province, district, note, status, created_at) VALUES (?, ?, ?, ?, ?, ?)";
                handle.createUpdate(insertPaymentSQL)
                        .bind(0, orderId)
                        .bind(1, province)
                        .bind(2, district)
                        .bind(3, note)
                        .bind(4, "pending")
                        .bind(5, Timestamp.valueOf(LocalDateTime.now()))
                        .execute();
                // 4. Update `sold`, `stock`, and `updated_at` for each product
                for (CartProduct product : cart.getList()) {
                    handle.createUpdate("UPDATE products SET sold = sold + ?, stock = stock - ?, updated_at = ? WHERE id = ?")
                            .bind(0, product.getQuantity())
                            .bind(1, product.getQuantity())
                            .bind(2, LocalDateTime.now())
                            .bind(3, product.getId())
                            .execute();
                }
            });

            // Set attributes for order details
            request.setAttribute("successMessage", "Cảm ơn bạn đã đặt hàng! Chúng tôi sẽ xử lý đơn hàng của bạn sớm nhất có thể.");
            request.setAttribute("fullname", fullname);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            request.setAttribute("district", district);
            request.setAttribute("province", province);
            request.setAttribute("note", note);
            request.setAttribute("totalPrice", cart.getTotal());
            request.setAttribute("orderItems", cart.getList());

            request.getRequestDispatcher("order-success.jsp").forward(request,response);
            // Remove cart from session
            session.removeAttribute("cart");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database error occurred.");
        }
    }
}