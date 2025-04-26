package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.User;
import jakarta.servlet.http.*;


import java.io.IOException;

@WebServlet(name = "Updata_Infor_Controller", value = "/update_infor")
public class Update_Infor_Controller extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy thông tin người dùng từ session và hiển thị lên form
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("auth") != null) {
            User user = (User) session.getAttribute("auth");
            request.setAttribute("user", user);
            request.getRequestDispatcher("account.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Lấy thông tin từ form gửi lên
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String newEmail = request.getParameter("email"); // <-- Email người dùng nhập từ form
        String address = request.getParameter("address");

        // Lấy thông tin người dùng từ session
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("auth") != null) {
            User user = (User) session.getAttribute("auth");

            // Kiểm tra nếu user đăng nhập bằng Google hoặc Facebook
            String googleEmail = (String) session.getAttribute("google_email"); // Email từ Google nếu có
            String facebookEmail = (String) session.getAttribute("facebook_email"); // Email từ Facebook nếu có

            if ((googleEmail != null && !googleEmail.equals(newEmail)) ||
                    (facebookEmail != null && !facebookEmail.equals(newEmail))) {
                request.setAttribute("ERROR", "Bạn không thể thay đổi email khi đăng nhập bằng Google hoặc Facebook.");
                request.getRequestDispatcher("account.jsp").forward(request, response);
                return; // Dừng xử lý tiếp
            }

            // Cập nhật thông tin khác (ngoại trừ email nếu đăng nhập bằng Google/Facebook)
            user.setFullname(fullName);
            user.setPhone(phone);
            user.setAddress(address);

            // Nếu user KHÔNG đăng nhập bằng Google/Facebook, cho phép cập nhật email
            if (googleEmail == null && facebookEmail == null) {
                user.setEmail(newEmail);
            }

            // Gửi thông tin cập nhật vào database
            UserDao userDao = new UserDao();
            boolean isUpdated = userDao.updateUser(user);

            if (isUpdated) {
                session.setAttribute("auth", user); // Cập nhật lại session
                response.sendRedirect("account.jsp?success=1");
            } else {
                request.setAttribute("ERROR", "Cập nhật không thành công.");
                request.getRequestDispatcher("account.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp"); // Chưa đăng nhập, chuyển về trang đăng nhập
        }
    }
}
