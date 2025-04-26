package vn.edu.hcmuaf.fit.clock.controller.admin.Admin_Manager_Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Search_Customer", value = "/searchCustomer")
public class Search_Customer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword"); // Lấy từ khóa tìm kiếm từ request
        UserDao userDao = new UserDao();

        // Tìm kiếm khách hàng
        List<User> customers;
        if (keyword == null || keyword.trim().isEmpty()) {
            customers = userDao.manageCustomer(); // Nếu không có từ khóa, trả về tất cả khách hàng
        } else {
            customers = userDao.searchCustomers(keyword.trim()); // Tìm kiếm khách hàng theo từ khóa
        }

        // Đưa danh sách khách hàng vào request để hiển thị trong giao diện
        request.setAttribute("customers", customers);

        // Forward đến trang quản lý khách hàng (thay thế đường dẫn theo cấu trúc dự án của bạn)
        request.getRequestDispatcher("manage-customers.jsp").forward(request, response);
    }
}

