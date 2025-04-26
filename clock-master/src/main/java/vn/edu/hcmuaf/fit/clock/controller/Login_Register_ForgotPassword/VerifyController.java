package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;

import java.io.IOException;

@WebServlet(name = "VerifyController", value = "/verify")
public class VerifyController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy email từ session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");




        // Kiểm tra email có tồn tại trong session không
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email không tồn tại trong phiên làm việc. Vui lòng thử lại.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        // Lấy từng ký tự OTP từ các input
        String otp1 = request.getParameter("otp1");
        String otp2 = request.getParameter("otp2");
        String otp3 = request.getParameter("otp3");
        String otp4 = request.getParameter("otp4");
        String otp5 = request.getParameter("otp5");
        String otp6 = request.getParameter("otp6");

        // Kiểm tra OTP rỗng
        if (otp1 == null || otp2 == null || otp3 == null || otp4 == null || otp5 == null || otp6 == null) {
            request.setAttribute("errorMessage", "Mã OTP không được để trống.");
            request.getRequestDispatcher("verifyOtp.jsp").forward(request, response);
            return;
        }

        // Ghép các giá trị OTP lại thành một chuỗi
        String otp = otp1 + otp2 + otp3 + otp4 + otp5 + otp6;

        // Gọi DAO để xác minh OTP
        UserDao userDao = new UserDao();
        boolean isVerified = userDao.verifyOtp(email.trim(), otp.trim());

        // Xử lý kết quả xác minh
        if (isVerified) {
            // Nếu OTP đúng, chuyển hướng đến trang thay đổi mật khẩu
            request.getRequestDispatcher("resetpassword.jsp").forward(request, response);
        } else {
            // Nếu OTP sai, trả về lỗi
            request.setAttribute("errorMessage", "Mã OTP không chính xác. Vui lòng thử lại.");
            request.getRequestDispatcher("verifyOtp.jsp").forward(request, response);
        }
    }
}


