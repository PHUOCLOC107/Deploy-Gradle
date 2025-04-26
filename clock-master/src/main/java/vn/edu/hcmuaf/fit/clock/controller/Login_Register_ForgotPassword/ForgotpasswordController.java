package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;


import java.io.IOException;

@WebServlet(name = "ForgotpasswordController", value = "/forgotpassword")
public class ForgotpasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        System.out.println("Email received: " + email);  // In giá trị email

        // Kiểm tra email không rỗng
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("errorMessage", "Email không được để trống.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
            return;
        }

        // Lưu email vào session để sử dụng cho các bước tiếp theo
        HttpSession session = request.getSession();
        session.setAttribute("email", email);
        session.setAttribute("username", username);
        System.out.println("Email saved in session: " + session.getAttribute("email"));  // In email trong session

        // Gửi OTP qua email (gọi DAO)
        UserDao userDao = new UserDao();
        boolean isSent = userDao.sendOtp(email);
        System.out.println("Gửi OTP thành công: " + isSent);

        if (isSent) {
            response.sendRedirect("verifyOtp.jsp");
        } else {
            request.setAttribute("errorMessage", "Tài khoản không chính xác.");
            request.getRequestDispatcher("forgotpassword.jsp").forward(request, response);
        }
    }


}




