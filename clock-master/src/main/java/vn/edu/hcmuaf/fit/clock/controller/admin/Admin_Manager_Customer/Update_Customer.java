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

@WebServlet(name = "Update_Customer", value = "/updateCustomer")
public class Update_Customer extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("update".equals(action)) {
            // Lấy thông tin từ form

            String fullname = request.getParameter("fullname");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String role = request.getParameter("role");
            String address = request.getParameter("address");

            // Tạo đối tượng User từ thông tin nhận được
            User user = new User();
            user.setFullname(fullname);
            user.setEmail(email);
            user.setPhone(phone);
            user.setRole(role);
            user.setAddress(address);

            // Cập nhật thông tin khách hàng
            UserDao userDao = new UserDao();
            boolean isUpdated = userDao.updateCustomer(user);
            if (isUpdated) {
                // Lấy lại danh sách khách hàng sau khi cập nhật
                List<User> customers = userDao.manageCustomer();
                request.setAttribute("customers", customers);
                request.setAttribute("message", "Cập nhật thành công");
                request.getRequestDispatcher("manage-customers.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Cập nhật thông tin thất bại!");
                request.getRequestDispatcher("manage-customers.jsp").forward(request, response);
            }
        }
    }
}