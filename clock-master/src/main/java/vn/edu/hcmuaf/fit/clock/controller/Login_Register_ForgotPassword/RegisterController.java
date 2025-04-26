package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import vn.edu.hcmuaf.fit.clock.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;

import java.io.IOException;

@WebServlet(name = "RegisterController", value = "/register")
public class RegisterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Có thể chuyển hướng đến form đăng ký nếu cần
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin từ form
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Tạo đối tượng User và gán thông tin
        User user = new User();
        user.setFullname(fullname);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password); // ✅ Giữ nguyên password thô, để DAO xử lý hash

        // Gọi DAO để đăng ký
        UserDao userDao = new UserDao();
        boolean isRegistered = userDao.registerUser(user);

        // Điều hướng dựa vào kết quả đăng ký
        if (isRegistered) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("register.jsp?error=1");
        }
    }
}
