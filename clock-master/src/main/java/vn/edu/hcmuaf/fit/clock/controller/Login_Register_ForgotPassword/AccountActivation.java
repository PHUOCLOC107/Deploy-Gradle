package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;

import java.io.IOException;

@WebServlet(name = "ActivateAccountServlet", value = "/active-account")
public class AccountActivation extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activationCode = request.getParameter("code");

        if (activationCode != null) {
            UserDao userDao = new UserDao();
            boolean isActivated = userDao.activateAccount(activationCode);

            if (isActivated) {
                request.setAttribute("message", "Kích hoạt tài khoản thành công.");
            } else {
                request.setAttribute("error", "Kích hoạt tài khoản thất bại.");
            }
        } else {
            request.setAttribute("error", "Mã kích hoạt không hợp lệ.");
        }

        // Forward đến JSP
        request.getRequestDispatcher("notify-account.jsp").forward(request, response);
    }
}

