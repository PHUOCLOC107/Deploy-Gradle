package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.dao.LogDao;
import vn.edu.hcmuaf.fit.clock.model.User;
import vn.edu.hcmuaf.fit.clock.service.AuthService;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Kiểm tra nếu người dùng đã đăng nhập, thì không cho phép truy cập lại trang đăng nhập
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("auth") != null) {
            response.sendRedirect("index.jsp"); // Đã đăng nhập, chuyển hướng tới trang chính
        } else {
            request.getRequestDispatcher("login.jsp").forward(request, response); // Chưa đăng nhập, cho phép vào trang login
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        AuthService service = new AuthService();
        User u = service.checkLogin(username, password);

        if (u != null) {
            // Kiểm tra trạng thái tài khoản (status)
            if (u.getStatus() == 0) {
                // Tài khoản chưa kích hoạt, hiển thị thông báo
                request.setAttribute("activationError", "Tài khoản chưa được kích hoạt!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }

            // Tạo session khi đăng nhập thành công
            HttpSession session = request.getSession(true);
            u.setPassword(null); // Không lưu mật khẩu trong session
            session.setAttribute("auth", u);
            session.setAttribute("username", username); // Lưu username vào session

            // Ghi log đăng nhập thành công
            LogDao logDao = new LogDao();
            logDao.insertLog(u.getId(), "Đăng nhập", "Người dùng " + u.getUsername() + " đăng nhập vào hệ thống");

            // Kiểm tra quyền truy cập
            if ("admin".equals(u.getRole())) {
                response.sendRedirect("GeneralController"); // Chuyển hướng tới trang admin.jsp nếu là admin
            } else {
                response.sendRedirect("index"); // Chuyển hướng tới trang chính nếu không phải admin
            }
        } else {
            // Tài khoản hoặc mật khẩu không chính xác
            request.setAttribute("ERROR", "Tài khoản hoặc mật khẩu không chính xác!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
