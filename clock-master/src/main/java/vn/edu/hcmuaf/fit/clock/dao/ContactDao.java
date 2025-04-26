package vn.edu.hcmuaf.fit.clock.dao;


import vn.edu.hcmuaf.fit.clock.model.Contact;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

import java.util.List;
import java.util.Properties;
import jakarta.mail.*;
import jakarta.mail.internet.*;

public class ContactDao {
    // Thêm một liên hệ mới
    public boolean addContact(Contact contact) {
        System.out.println("Contact info: " + contact.getFullname() + ", " + contact.getEmail() + ", " + contact.getMessage());
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO contact (id, fullname, email, message) VALUES (:id, :fullname, :email, :message)")
                        .bind("id", contact.getId())
                        .bind("fullname", contact.getFullname())
                        .bind("email", contact.getEmail())
                        .bind("message", contact.getMessage())
                        .execute());
        // Gửi email nếu lưu thành công
        if (rowsAffected > 0) {
            sendEmail(contact); // Gửi email thông báo đến quản trị viên
            return true;
        }
        return false;
    }
    private void sendEmail(Contact contact) {
        // Thông tin cấu hình máy chủ SMTP (ví dụ Gmail)
        String host = "smtp.gmail.com"; // Sử dụng máy chủ SMTP của Gmail
        String port = "587";           // Cổng SMTP cho TLS
        String username = "vophuocloc2004@gmail.com"; // Email của bạn (người nhận)
        String password = System.getenv("EMAIL_PASSWORD");  // Mật khẩu ứng dụng của bạn

        // Thiết lập cấu hình SMTP
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");

        // Tạo session và xác thực
        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // Tạo email
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));  // Địa chỉ email gửi
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("vophuocloc2004@gmail.com")); // Địa chỉ email bạn nhận
            message.setSubject("Yêu cầu liên hệ mới từ: " + contact.getFullname()); // Tiêu đề email
            message.setText("Bạn có một yêu cầu mới từ: " + contact.getFullname() + "\n" +
                    "Email: " + contact.getEmail() + "\n" +
                    "Tin nhắn: " + contact.getMessage()); // Nội dung email

            // Gửi email
            Transport.send(message);
            System.out.println("Email sent successfully.");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    // Lấy tất cả tin nhắn của khách hàng
    public List<Contact> getAllContacts() {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM contact")
                        .mapToBean(Contact.class)
                        .list());
    }

    // Lấy tin nhắn của một khách hàng theo ID
    public List<Contact> getContactByEmail(String email) {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM contact WHERE email = :email")
                        .bind("email", email)
                        .mapToBean(Contact.class)
                        .list());
    }
}
