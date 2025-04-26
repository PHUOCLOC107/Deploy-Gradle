package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;

import java.io.IOException;

@WebServlet(name = "ChangepasswordController", value = "/changepassword")
public class ChangepasswordController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy username từ session
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            // Nếu không có username trong session, yêu cầu người dùng đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy mật khẩu cũ, mật khẩu mới và mật khẩu xác nhận từ form
        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra nếu mật khẩu cũ, mật khẩu mới và mật khẩu xác nhận không rỗng
        if (oldPassword == null || newPassword == null || confirmPassword == null || oldPassword.isEmpty() || newPassword.isEmpty() || confirmPassword.isEmpty()) {
            // Nếu có trường nào bị thiếu, hiển thị thông báo lỗi
            request.setAttribute("error", "Vui lòng nhập đầy đủ thông tin.");
            request.getRequestDispatcher("account.jsp").forward(request, response);
            return;
        }

        // Kiểm tra nếu mật khẩu mới và mật khẩu xác nhận không khớp
        if (!newPassword.equals(confirmPassword)) {
            // Nếu mật khẩu mới và xác nhận mật khẩu không khớp, hiển thị thông báo lỗi
            request.setAttribute("error", "Mật khẩu xác nhận không khớp!");
            request.getRequestDispatcher("account.jsp").forward(request, response);
            return;
        }

        // Kiểm tra nếu mật khẩu cũ và mật khẩu mới trùng nhau
        if (oldPassword.equals(newPassword)) {
            // Nếu mật khẩu cũ và mật khẩu mới trùng nhau, hiển thị thông báo lỗi
            request.setAttribute("error", "Mật khẩu cũ và mật khẩu mới bị trùng lặp!");
            request.getRequestDispatcher("account.jsp").forward(request, response);
            return;
        }

        // Gọi UserDao để xử lý đổi mật khẩu
        UserDao userDao = new UserDao();
        boolean isPasswordChanged = userDao.changePassword(username, oldPassword, newPassword);

        if (isPasswordChanged) {
            // Đổi mật khẩu thành công, chuyển hướng đến trang thông báo thành công
            request.setAttribute("message", "Đổi mật khẩu thành công!");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        } else {
            // Đổi mật khẩu thất bại, hiển thị thông báo lỗi
            request.setAttribute("error", "Mật khẩu cũ không chính xác!.");
            request.getRequestDispatcher("account.jsp").forward(request, response);
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

