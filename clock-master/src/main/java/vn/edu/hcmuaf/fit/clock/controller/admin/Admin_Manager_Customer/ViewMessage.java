package vn.edu.hcmuaf.fit.clock.controller.admin.Admin_Manager_Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.clock.dao.ContactDao;
import vn.edu.hcmuaf.fit.clock.model.Contact;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ViewMessage",value="/viewMessages")
public class ViewMessage extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");

        // Truy vấn cơ sở dữ liệu để lấy tin nhắn của khách hàng theo email
        ContactDao  contactDao = new ContactDao();
        List<Contact> messages = contactDao.getContactByEmail(email);

        // Gửi dữ liệu vào JSP
        request.setAttribute("messages", messages);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewMessages.jsp");
        dispatcher.forward(request, response);
    }
}

