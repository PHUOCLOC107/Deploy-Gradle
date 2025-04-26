package vn.edu.hcmuaf.fit.clock.controller.admin;

import vn.edu.hcmuaf.fit.clock.dao.OrderDAO;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.Order;
import vn.edu.hcmuaf.fit.clock.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GeneralController", value = "/GeneralController")
public class GeneralController extends HttpServlet {

    private OrderDAO orderDAO = new OrderDAO();
    private UserDao userDAO = new UserDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int totalOrders = orderDAO.getAll().size(); // Tổng số đơn hàng
        int totalCustomers = userDAO.getAllCustomer().size(); // Tổng số khách hàng
        double totalRevenue = orderDAO.getTotalRevenue(); // Tổng doanh thu
        int pendingOrders = orderDAO.getTotalUnprocessedOrders(); // Tổng đơn hàng chưa xử lý

        // Lấy 20 đơn hàng và khách hàng mới nhất
        List<Order> latestOrders = orderDAO.getLatestOrders();
        List<User> latestUsers = userDAO.getLatestUser();

        // Đưa dữ liệu vào request để sử dụng trong JSP
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("pendingOrders", pendingOrders);
        request.setAttribute("ordersFiltered", latestOrders);  // Truyền tất cả đơn hàng vào cho bảng
        request.setAttribute("usersFiltered", latestUsers);    // Truyền tất cả khách hàng vào cho bảng

        // Chuyển tiếp đến trang JSP (admin.jsp hoặc index.jsp)
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
        dispatcher.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Xử lý khi người dùng gửi form hoặc thay đổi lựa chọn lọc
        String filterType = request.getParameter("filter"); // Lọc theo "today" hoặc "month"

        List<Order> ordersFiltered = null;
        List<User> usersFiltered = null;

        if ("today".equalsIgnoreCase(filterType)) {
            // Lọc theo ngày hôm nay
            ordersFiltered = orderDAO.getOrdersByToday();
            usersFiltered = userDAO.getUsersByToday();
        } else if ("month".equalsIgnoreCase(filterType)) {
            // Lọc theo tháng này
            ordersFiltered = orderDAO.getOrdersByThisMonth();
            usersFiltered = userDAO.getUsersByThisMonth();
        } else {
            // Lọc mặc định hoặc xử lý không có lựa chọn
            ordersFiltered = orderDAO.getAll();
            usersFiltered = userDAO.getAll();
        }

        // Lấy các dữ liệu thống kê
        int totalOrders = orderDAO.getAll().size();
        int totalCustomers = userDAO.getAll().size();
        double totalRevenue = orderDAO.getTotalRevenue();
        int pendingOrders = orderDAO.getTotalUnprocessedOrders();

        // Đưa dữ liệu vào request
        request.setAttribute("totalOrders", totalOrders);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("pendingOrders", pendingOrders);
        request.setAttribute("ordersFiltered", ordersFiltered);
        request.setAttribute("usersFiltered", usersFiltered);

        // Chuyển tiếp đến trang JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
        dispatcher.forward(request, response);

    }
}
