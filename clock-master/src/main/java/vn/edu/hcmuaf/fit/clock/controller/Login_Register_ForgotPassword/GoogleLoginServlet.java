package vn.edu.hcmuaf.fit.clock.controller.Login_Register_ForgotPassword;

import com.google.api.client.auth.oauth2.AuthorizationCodeFlow;
import com.google.api.client.auth.oauth2.AuthorizationCodeRequestUrl;
import com.google.api.client.auth.oauth2.AuthorizationCodeTokenRequest;
import com.google.api.client.auth.oauth2.TokenResponse;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Collections;

@WebServlet("/GoogleLoginServlet")
public class GoogleLoginServlet extends HttpServlet {
    private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String clientId = getServletContext().getInitParameter("GOOGLE_CLIENT_ID");
        String clientSecret = getServletContext().getInitParameter("GOOGLE_CLIENT_SECRET");
        String redirectUri = getServletContext().getInitParameter("GOOGLE_REDIRECT_URI");

        AuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                new NetHttpTransport(), JSON_FACTORY, clientId, clientSecret,
                Arrays.asList(
                        "https://www.googleapis.com/auth/userinfo.profile",
                        "https://www.googleapis.com/auth/userinfo.email"
                )
        ).build();

        String url = flow.newAuthorizationUrl()
                .setRedirectUri(redirectUri)
                .set("prompt", "select_account")
                .build();
        response.sendRedirect(url);
    }
}
