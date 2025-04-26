package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/FacebookLoginServlet")
public class FacebookLoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Lấy giá trị từ web.xml
        String clientId = getServletContext().getInitParameter("FACEBOOK_CLIENT_ID");
        String redirectUri = getServletContext().getInitParameter("FACEBOOK_REDIRECT_URI");

        String facebookAuthUrl = "https://www.facebook.com/v12.0/dialog/oauth?" +
                "client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&scope=email" +
                "&auth_type=reauthenticate"; // Bắt buộc chọn lại tài khoản

        response.sendRedirect(facebookAuthUrl);
    }

}
