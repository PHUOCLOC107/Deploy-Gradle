package vn.edu.hcmuaf.fit.clock.controller.admin;


import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.clock.model.User;

import java.io.IOException;

@WebFilter(filterName = "AdminFilter", urlPatterns = {"/admin/*", "/admin.jsp", "/manage-customers.jsp", "/manage-products.jsp", "/manage-order.jsp", "/manage-category.jsp", "/manager_customer", "/manage-category", "/manage-products", "/manage-orders", "/viewMessages", "/GeneralController"})
public class AdminFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Lấy session và kiểm tra quyền
        HttpSession session = httpRequest.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("auth") : null;

        if (user == null || !"admin".equals(user.getRole())) {
            // Nếu không có quyền admin, chuyển hướng đến trang đăng nhập
            httpResponse.sendRedirect(httpRequest.getContextPath() + "/login.jsp");
            return; // Dừng xử lý
        }

        // Tiếp tục nếu người dùng hợp lệ
        chain.doFilter(request, response);
    }

}
