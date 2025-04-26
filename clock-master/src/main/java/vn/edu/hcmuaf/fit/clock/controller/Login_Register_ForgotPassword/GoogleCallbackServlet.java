package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeTokenRequest;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.User;

import java.io.IOException;

@WebServlet("/GoogleCallbackServlet")
public class GoogleCallbackServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        GoogleTokenResponse tokenResponse = new GoogleAuthorizationCodeTokenRequest(
                new NetHttpTransport(), JacksonFactory.getDefaultInstance(),
                "https://oauth2.googleapis.com/token",
                getServletContext().getInitParameter("GOOGLE_CLIENT_ID"),
                getServletContext().getInitParameter("GOOGLE_CLIENT_SECRET"),
                code, "http://localhost:8080/LTW_CK_Clock/GoogleCallbackServlet")
                .execute();

        GoogleIdToken idToken = tokenResponse.parseIdToken();
        GoogleIdToken.Payload payload = idToken.getPayload();

        String email = payload.getEmail();
        String name = (String) payload.get("name");

        // Lưu thông tin vào CSDL
        UserDao userDao = new UserDao();
        userDao.saveUserIfNotExist(email, name);

        // Lấy lại user từ database
        User user = userDao.findUserByEmail(email);

//        // Cập nhật thêm thông tin nếu có
//        String phone = request.getParameter("phone");  // Giả sử lấy từ frontend
//        String address = request.getParameter("address");
//        if (phone != null && address != null) {
//            userDao.updateUserInfo(email, phone, address);
//        }

        // Lưu user vào session để hiển thị trên trang web
        HttpSession session = request.getSession();
        session.setAttribute("auth", user);
        session.setAttribute("google_email", email);

        session.setAttribute("username", user.getUsername());

        // Chuyển hướng về trang chính sau khi đăng nhập thành công
        response.sendRedirect("index.jsp");
    }
}
