package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mindrot.jbcrypt.BCrypt;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;


import java.io.IOException;


@WebServlet(name = "ResetPasswordController", value = "/resetPassword")
public class ResetPasswordController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // Lấy email từ session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Kiểm tra xem session có chứa email hay không
        if (email == null) {
            // Nếu không có email trong session, chuyển hướng về trang đăng nhập hoặc thông báo lỗi
            response.sendRedirect("login.jsp");
            return;
        }

        // Lấy mật khẩu mới và xác nhận mật khẩu
        String newPassword = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Kiểm tra tính hợp lệ của mật khẩu
        if (newPassword != null && newPassword.equals(confirmPassword)) {
            // Mã hóa mật khẩu mới
            String hashedPassword = hashPassword(newPassword);

            // Cập nhật mật khẩu trong cơ sở dữ liệu (cần có mã xử lý DB)
            boolean isUpdated = updatePasswordInDatabase(email, hashedPassword);

            if (isUpdated) {
                // Nếu cập nhật thành công, xóa session cũ và chuyển hướng tới trang đăng nhập
                response.sendRedirect("login.jsp");
            } else {
                // Nếu cập nhật không thành công, thông báo lỗi
                request.setAttribute("errorMessage", "Có lỗi xảy ra khi đặt lại mật khẩu. Vui lòng thử lại.");
                request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
            }
        } else {
            // Nếu mật khẩu và xác nhận không khớp
            request.setAttribute("errorMessage", "Mật khẩu và xác nhận mật khẩu không khớp.");
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        }
    }

    private String hashPassword(String password) {
        return BCrypt.hashpw(password, BCrypt.gensalt());
    }

    // Phương thức cập nhật mật khẩu vào cơ sở dữ liệu
    private boolean updatePasswordInDatabase(String email, String newPassword) {
        if (email == null) {
            return false;
        }

        UserDao userDao = new UserDao();
        // Gọi phương thức updatePassword của UserDao để cập nhật mật khẩu
        return userDao.updatePassword(email, newPassword);
    }
}
