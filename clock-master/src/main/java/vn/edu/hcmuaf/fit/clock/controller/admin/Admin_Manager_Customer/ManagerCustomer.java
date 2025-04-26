package vn.edu.hcmuaf.fit.clock.controller.admin.Admin_Manager_Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.LogDao;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.User;
import vn.edu.hcmuaf.fit.clock.service.AuthService;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ManagerCustomer", value = "/manager_customer")
public class ManagerCustomer extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        List<User> customers = userDao.getAll();
        request.setAttribute("customers", customers);
        RequestDispatcher dispatcher = request.getRequestDispatcher("manage-customers.jsp");
        dispatcher.forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        int userId = Integer.parseInt(request.getParameter("id"));
        UserDao userDao = new UserDao();
        LogDao logDao = new LogDao();
        AuthService service = new AuthService();
        String username = service.getUsernameById(userId);
        try {

            if ("add".equals(action)) {
                // Thêm khách hàng
                String fullname = request.getParameter("fullname");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String address = request.getParameter("address");


                User newUser = new User();
                newUser.setFullname(fullname);
                newUser.setPhone(phone);
                newUser.setEmail(email);
                newUser.setAddress(address);

                // Kiểm tra xem email đã tồn tại trong cơ sở dữ liệu chưa
                boolean isEmailExists = userDao.isEmailExists(email);

                if (isEmailExists) {
                    // Nếu email đã tồn tại, thông báo lỗi
                    request.setAttribute("error", "Email đã tồn tại. Vui lòng nhập email khác.");
                    request.getRequestDispatcher("manage-customers.jsp").forward(request, response);
                } else {
                    // Nếu email chưa tồn tại, tiến hành thêm khách hàng mới
                    boolean isAdded = userDao.addCustomer(newUser);

                    if (isAdded) {
                        response.sendRedirect(request.getContextPath() + "/manager_customer");
                    } else {
                        request.setAttribute("error", "Không thể thêm người dùng.");
                        request.getRequestDispatcher("manage-customers.jsp").forward(request, response);
                    }
                }
//        } else if ("update".equals(action)) {
//            // Cập nhật thông tin khách hàng
//            String id = request.getParameter("id");
//            String fullname = request.getParameter("fullname");
//            String phone = request.getParameter("phone");
//            String email = request.getParameter("email");
//            String address = request.getParameter("address");
//
//            User updatedUser = new User();
//            updatedUser.setUsername(id);
//            updatedUser.setFullname(fullname);
//            updatedUser.setPhone(phone);
//            updatedUser.setEmail(email);
//            updatedUser.setAddress(address);
//
//            UserDao userDao = new UserDao();
//            boolean isUpdated = userDao.updateCustomer(updatedUser);
//
//            if (isUpdated) {
//                response.sendRedirect(request.getContextPath() + "/manager_customer");
//            } else {
//                request.setAttribute("error", "Không thể cập nhật thông tin người dùng.");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("manage-customers.jsp");
//                dispatcher.forward(request, response);
//            }
            } else if ("delete".equals(action)) {
                String id = request.getParameter("id"); // Lấy id từ request
                boolean isDeleted = userDao.deleteCustomer(id); // Gọi phương thức xóa với id

                if (isDeleted) {
                    response.sendRedirect(request.getContextPath() + "/manager_customer"); // Redirect lại sau khi xóa thành công
                } else {
                    request.setAttribute("error", "Không thể xóa người dùng.");
                }
            } else if ("lock".equals(action)) {
                userDao.toggleUserStatus(userId, 0);
                logDao.insertLog(userId, "Lock Account", "Khóa tài khoản người dùng " + username);
                request.setAttribute("message", "Tài khoản đã bị khóa.");
            } else if ("unlock".equals(action)) {
                userDao.toggleUserStatus(userId, 1);
                logDao.insertLog(userId, "Unlock Account", "Mở khóa tài khoản người dùng " + username);
                request.setAttribute("message", "Tài khoản đã được mở.");
            }
            request.getRequestDispatcher("manage-customers.jsp").forward(request, response);
        }
        catch (Exception e) {
            request.setAttribute("error", "Có lỗi xảy ra trong quá trình xử lý.");
            request.getRequestDispatcher("manage_customers.jsp").forward(request, response);
        }


    }
}

