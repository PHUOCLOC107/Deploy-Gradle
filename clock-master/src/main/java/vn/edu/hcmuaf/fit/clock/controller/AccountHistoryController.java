package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.model.Order;
import vn.edu.hcmuaf.fit.clock.model.OrderItem;
import vn.edu.hcmuaf.fit.clock.model.User;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AccountHistoryController", value = "/showHistory")
public class AccountHistoryController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session
        User user = (User) request.getSession().getAttribute("auth");

        if (user != null) {
            // Kết nối đến cơ sở dữ liệu qua Jdbi
            Jdbi jdbi = JdbiConnect.get();

            // Lấy lịch sử đơn hàng của người dùng từ cơ sở dữ liệu
            List<Order> orders = jdbi.withHandle(handle ->
                    handle.createQuery("SELECT * FROM orders WHERE user_id = :userId")
                            .bind("userId", user.getId())
                            .map((rs, ctx) -> {
                                Order order = new Order();
                                order.setId(rs.getInt("id"));
                                order.setTotalPrice(rs.getInt("total_price"));
                                order.setStatus(rs.getString("status"));
                                order.setPaymentMethod(rs.getString("payment_method"));
                                order.setShippingAddress(rs.getString("shipping_address"));
                                order.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());

                                // Lấy chi tiết các mục hóa đơn của đơn hàng này
                                List<OrderItem> items = handle.createQuery("SELECT oi.*, p.name, p.price FROM order_items oi " +
                                                "JOIN products p ON oi.product_id = p.id " +
                                                "WHERE oi.order_id = :orderId")
                                        .bind("orderId", order.getId())
                                        .map((itemRs, itemCtx) -> {
                                            OrderItem item = new OrderItem();
                                            item.setProductName(itemRs.getString("name"));
                                            item.setQuantity(itemRs.getInt("quantity"));
                                            item.setPrice(itemRs.getInt("price"));
                                            item.setTotalPrice(itemRs.getInt("quantity") * itemRs.getInt("price"));
                                            return item;
                                        })
                                        .list();
                                order.setItems(items);
                                return order;
                            })
                            .list()
            );

            // Gửi danh sách đơn hàng vào JSP để hiển thị
            request.setAttribute("orders", orders);
            RequestDispatcher dispatcher = request.getRequestDispatcher("account.jsp");
            dispatcher.forward(request, response);
        } else {
            // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
            response.sendRedirect("login.jsp");
        }
    }
}
