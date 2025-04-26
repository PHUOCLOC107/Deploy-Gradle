package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.clock.dao.ContactDao;
import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.model.Contact;
import vn.edu.hcmuaf.fit.clock.model.User;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

@WebServlet(name = "ContactController", value = "/contact")
public class ContactController extends HttpServlet {
    private static final String EMAIL_REGEX = "^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\\.[a-zA-Z]{2,6}$";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CategoryService categoryService = new CategoryService();
        List<Category> listCate = categoryService.getAllCategory();
        request.setAttribute("listCate", listCate);

        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);  // false: không tạo mới session nếu không tồn tại
        if (session == null || session.getAttribute("auth") == null) {
            // Người dùng chưa đăng nhập, hiển thị thông báo lỗi
            request.setAttribute("errorMessage", "Bạn cần đăng nhập để gửi thông tin liên hệ.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;  // Dừng xử lý
        }




        // Lấy dữ liệu từ form
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        // Kiểm tra tính hợp lệ của email
        if (!isValidEmail(email)) {
            // Nếu email không hợp lệ, hiển thị thông báo lỗi và quay lại trang liên hệ
            request.setAttribute("errorMessage", "Email không hợp lệ. Vui lòng nhập lại.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return; // Dừng xử lý và không lưu vào database
        }

        // Tạo đối tượng Contact
        Contact contact = new Contact();
        contact.setFullname(fullname);
        contact.setEmail(email);
        contact.setMessage(message);


        // Kiểm tra email có tồn tại trong cơ sở dữ liệu không
        UserDao userDao = new UserDao();
        User user = userDao.findUserByEmail(email);
        if (user == null) {
            // Nếu email không tồn tại trong cơ sở dữ liệu
            request.setAttribute("errorMessage", "Email không tồn tại trong hệ thống.");
            request.getRequestDispatcher("contact.jsp").forward(request, response);
            return;
        }

        // Gọi DAO để lưu thông tin vào database
        ContactDao contactDao = new ContactDao();
        boolean isAdded = contactDao.addContact(contact);

        if (isAdded) {
            // Thông báo thành công
            request.setAttribute("successMessage", "Cảm ơn bạn đã liên hệ với chúng tôi. Chúng tôi sẽ phản hồi sớm nhất.");
        } else {
            // Thông báo lỗi khi thêm liên hệ
            request.setAttribute("errorMessage", "Đã xảy ra lỗi khi gửi liên hệ. Vui lòng thử lại.");
        }

        // Trả về trang liên hệ
        request.getRequestDispatcher("contact.jsp").forward(request, response);
    }

    // Hàm kiểm tra tính hợp lệ của email
    private boolean isValidEmail(String email) {
        return email != null && Pattern.matches(EMAIL_REGEX, email);
    }
}
