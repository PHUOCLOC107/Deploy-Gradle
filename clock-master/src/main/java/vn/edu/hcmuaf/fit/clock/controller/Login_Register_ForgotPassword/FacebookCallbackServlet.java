package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/FacebookCallbackServlet")
public class FacebookCallbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // Lấy các tham số từ web.xml
        String clientId = getServletContext().getInitParameter("FACEBOOK_CLIENT_ID");
        String clientSecret = getServletContext().getInitParameter("FACEBOOK_CLIENT_SECRET");
        String redirectUri = getServletContext().getInitParameter("FACEBOOK_REDIRECT_URI");

        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect("/login.jsp?error=access_denied");
            return;
        }

        String accessTokenUrl = "https://graph.facebook.com/v12.0/oauth/access_token?" +
                "client_id=" + clientId +
                "&redirect_uri=" + redirectUri +
                "&client_secret=" + clientSecret +
                "&code=" + code;

        String accessTokenResponse = sendGetRequest(accessTokenUrl);
        String accessToken = extractAccessToken(accessTokenResponse);

        String userInfoUrl = "https://graph.facebook.com/me?fields=id,name,email&access_token=" + accessToken;
        String userInfoResponse = sendGetRequest(userInfoUrl);

        JSONObject json = new JSONObject(userInfoResponse);
        String id = json.getString("id");
        String name = json.getString("name");
        String email = json.optString("email", "no_email@example.com");

        UserDao userDao = new UserDao();
        userDao.saveUserIfNotExist(email, name);

        User user = userDao.findUserByEmail(email);

        HttpSession session = request.getSession();
        session.setAttribute("auth", user);
        session.setAttribute("facebook_email", email);
        session.setAttribute("username", user.getUsername());

        response.sendRedirect("index.jsp");
    }

    private String sendGetRequest(String url) throws IOException {
        URL obj = new URL(url);
        HttpURLConnection con = (HttpURLConnection) obj.openConnection();
        con.setRequestMethod("GET");

        BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
        String inputLine;
        StringBuilder response = new StringBuilder();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();
        return response.toString();
    }

    private String extractAccessToken(String jsonResponse) {
        return jsonResponse.split("\"access_token\":\"")[1].split("\"")[0];
    }
}
