package vn.edu.hcmuaf.fit.clock.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.OrderDAO;
import vn.edu.hcmuaf.fit.clock.model.admin.OrderView;


import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderController", value = "/manage-order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchQuery = request.getParameter("search");
        String filterStatus = request.getParameter("status");

        OrderDAO orderDAO = new OrderDAO();
        List<OrderView> orders;

        // Kiểm tra nếu có filter hoặc search
        if (searchQuery != null && !searchQuery.isEmpty()) {
            orders = orderDAO.searchOrders(searchQuery); // Cần thêm phương thức tìm kiếm trong DAO
        } else if (filterStatus != null && !filterStatus.isEmpty()) {
            orders = orderDAO.filterOrdersByStatus(filterStatus); // Cần thêm phương thức lọc theo trạng thái trong DAO
        } else {
            orders = orderDAO.getOrderAdminList(); // Lấy tất cả đơn hàng nếu không có điều kiện tìm kiếm hoặc lọc
        }

        // Kiểm tra nếu không có đơn hàng
        if (orders.isEmpty()) {
            request.setAttribute("message", "Không có đơn hàng nào!");
        }

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("manage-order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderIdStr = request.getParameter("orderId");
        String newStatus = request.getParameter("status");

        if (orderIdStr != null && newStatus != null) {
            int orderId = Integer.parseInt(orderIdStr);
            OrderDAO orderDAO = new OrderDAO();
            orderDAO.updateOrderStatus(orderId, newStatus);
        }

        // Sau khi cập nhật trạng thái, lấy lại toàn bộ danh sách đơn hàng
        OrderDAO orderDAO = new OrderDAO();
        List<OrderView> orders = orderDAO.getOrderAdminList();  // Lấy toàn bộ danh sách đơn hàng

        // Kiểm tra nếu không có đơn hàng
        if (orders.isEmpty()) {
            request.setAttribute("message", "Không có đơn hàng nào!");
        }

        request.setAttribute("orders", orders);
        request.setAttribute("message", "Trạng thái đơn hàng đã được cập nhật!");
        request.getRequestDispatcher("manage-order.jsp").forward(request, response);
    }
}

