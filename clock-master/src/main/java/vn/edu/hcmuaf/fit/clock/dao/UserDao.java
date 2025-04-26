package vn.edu.hcmuaf.fit.clock.dao;


import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.clock.model.User;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;
import jakarta.mail.*;
import jakarta.mail.internet.*;

import java.time.LocalDate;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.mindrot.jbcrypt.BCrypt;




public class UserDao {

    public List<User> getAll() {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users")
                        .mapToBean(User.class)
                        .list()
        );
    }

    public List<User> getAllCustomer() {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE role = 'customer'")
                        .mapToBean(User.class)
                        .list()
        );
    }

    public List<User> getLatestUser() {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE role = 'customer' ORDER BY created_at DESC LIMIT 20")
                        .mapToBean(User.class)
                        .list()
        );
    }

    public User findUsername(String username) {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("select * from users where username = :username")
                        .bind("username", username)
                        .mapToBean(User.class)
                        .findFirst().orElse(null));
    }

    //Chức năng đăng kí  - Thêm người dùng mới vào cơ sở dữ liệu:

    public boolean activateAccount(String activationCode) {
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET status = 1 WHERE activation_code = :activationCode")
                        .bind("activationCode", activationCode)
                        .execute());

        return rowsAffected > 0; // Trả về true nếu cập nhật thành công
    }

    public boolean sendActivationEmail(String email, String activationCode) {
        String from = "vophuocloc2004@gmail.com";
        String password = System.getenv("EMAIL_PASSWORD"); // hoặc dùng mật khẩu ứng dụng

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            message.setSubject("Kích hoạt tài khoản của bạn");

            String activationLink = "http://localhost:8080/LTW_CK_Clock/active-account?code=" + activationCode;
            message.setText("Chào bạn,\n\nVui lòng nhấp vào liên kết sau để kích hoạt tài khoản của bạn:\n" + activationLink + "\n\nLink sẽ chỉ hoạt động một lần.");

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean registerUser(User user) {
        // Kiểm tra xem username đã tồn tại chưa
        User existingUser = findUsername(user.getUsername());
        if (existingUser != null) {
            System.out.println("❌ Tên đăng nhập đã tồn tại: " + user.getUsername());
            return false;
        }

        // Log thông tin đăng ký
        System.out.println("✅ Bắt đầu đăng ký tài khoản");
        System.out.println("Fullname: " + user.getFullname());
        System.out.println("Phone: " + user.getPhone());
        System.out.println("Username: " + user.getUsername());
        System.out.println("Email: " + user.getEmail());
        System.out.println("Mật khẩu gốc: " + user.getPassword());

        // Hash mật khẩu và log
        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        System.out.println("🔐 Mật khẩu đã hash: " + hashedPassword);

        // Sinh mã kích hoạt
        String activationCode = generateOtp();
        System.out.println("🔑 Mã kích hoạt: " + activationCode);

        // Thực hiện insert
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO users (fullname, phone, username, password, email, status, activation_code) " +
                                "VALUES (:fullname, :phone, :username, :password, :email, :status, :activation_code)")
                        .bind("fullname", user.getFullname())
                        .bind("phone", user.getPhone())
                        .bind("username", user.getUsername())
                        .bind("password", hashedPassword)
                        .bind("email", user.getEmail())
                        .bind("status", 0)
                        .bind("activation_code", activationCode)
                        .execute());

        if (rowsAffected > 0) {
            System.out.println("✅ Đăng ký thành công, tiến hành gửi email kích hoạt...");
            return sendActivationEmail(user.getEmail(), activationCode);
        }

        System.out.println("❌ Đăng ký thất bại.");
        return false;
    }


    //--------------------------Cap Nhat Thong Tin User-------------------------------//
    public boolean updateUser(User user) {
        // Cập nhật thông tin người dùng trong cơ sở dữ liệu
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET fullname = :fullname, phone = :phone, email = :email, address = :address WHERE username = :username")
                        .bind("fullname", user.getFullname())
                        .bind("phone", user.getPhone())
                        .bind("email", user.getEmail())
                        .bind("address", user.getAddress())
                        .bind("username", user.getUsername()) // Giả sử dùng `username` để xác định người dùng
                        .execute());

        // Trả về true nếu cập nhật thành công, false nếu không thành công
        return rowsAffected > 0;
    }


    //--------------------------------Lấy mật khẩu mới------------------------------//
    // Phương thức mã hóa mật khẩu sử dụng BCrypt
//    private String hashPassword(String password) {
//        return BCrypt.hashpw(password, BCrypt.gensalt());
//    }

    // Phương thức cập nhật mật khẩu vào cơ sở dữ liệu
    public boolean updatePassword(String email, String newPassword) {
        // Mã hóa mật khẩu mới
        String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        // Cập nhật mật khẩu trong cơ sở dữ liệu bằng email
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET password = :password WHERE email = :email")
                        .bind("password", hashedPassword)
                        .bind("email", email)
                        .execute());

        System.out.println("Rows affected: " + rowsAffected);  // In ra số dòng bị ảnh hưởng

        return rowsAffected > 0;  // Trả về true nếu cập nhật thành công, false nếu không thành công
    }

    //--------------------------------QUên mật khẩu----------------------------------//
    public User findUserByEmail(String email) {
        return JdbiConnect.get().withHandle(handle -> handle.createQuery("SELECT * FROM users WHERE email = :email")
                .bind("email", email)
                .mapToBean(User.class)  // Map trực tiếp vào User
                .findOne()
                .orElse(null));
    }

    // Gửi OTP qua email
    public boolean sendOtp(String email) {
        User user = findUserByEmail(email);

        if (user == null || user.getEmail() == null || user.getEmail().isEmpty()) {
            System.out.println("Không tìm thấy người dùng với email: " + email);
            return false;
        }

        // Tạo mã OTP ngẫu nhiên
        String otp = generateOtp();

        // Tính thời gian hết hạn cho OTP (5 phút sau hiện tại)
        LocalDateTime expiresAt = LocalDateTime.now().plusMinutes(5);

        // Lưu OTP vào cơ sở dữ liệu
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO otp_requests (username, email, otp_code, expires_at) VALUES (:username, :email, :otp_code, :expires_at)")
                        .bind("username", user.getUsername()) // Thêm giá trị username
                        .bind("email", user.getEmail())
                        .bind("otp_code", otp)
                        .bind("expires_at", expiresAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")))
                        .execute());


        if (rowsAffected > 0) {
            // Gửi email OTP
            return sendEmail(user.getEmail(), otp);
        }
        return false;
    }

    // Xác minh OTP
    public boolean verifyOtp(String email, String otp) {
        Map<String, Object> result = JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM otp_requests WHERE email = :email AND otp_code = :otp_code AND expires_at > CURRENT_TIMESTAMP")
                        .bind("email", email)
                        .bind("otp_code", otp)
                        .mapToMap()
                        .findFirst()
                        .orElse(null));

        if (result == null) {
            System.out.println("OTP không hợp lệ.");
            return false;
        }
        System.out.println("OTP hợp lệ.");
        return true;
    }

    // Gửi email sử dụng JavaMail API
    private boolean sendEmail(String recipient, String otp) {
        String from = "vophuocloc2004@gmail.com";
        String password = System.getenv("EMAIL_PASSWORD"); // Lấy mật khẩu từ biến môi trường
        //String password = "";

        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Tạo một phiên làm việc với xác thực
        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication(from, password);  // Thay thế bằng tài khoản của bạn
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipient));
            message.setSubject("OTP Quên Mật Khẩu");
            message.setText("Mã OTP của bạn là: " + otp + ". Mã sẽ hết hạn sau 5 phút.");

            Transport.send(message);
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Tạo mã OTP ngẫu nhiên
    private String generateOtp() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000); // Mã OTP 6 chữ số
        return String.valueOf(otp);
    }

    //------------------------------Change password-----------------------------------------
    public boolean changePassword(String username, String oldPassword, String newPassword) {
        // Tìm người dùng bằng username
        User user = findUsername(username);

        if (user == null) {
            System.out.println("Không tìm thấy người dùng với tên đăng nhập: " + username);
            return false;
        }

        // Kiểm tra mật khẩu cũ có đúng không
        if (!BCrypt.checkpw(oldPassword, user.getPassword())) {
            System.out.println("Mật khẩu cũ không chính xác.");
            return false;
        }

        // Kiểm tra mật khẩu mới có trùng với mật khẩu cũ không
        if (BCrypt.checkpw(newPassword, user.getPassword())) {
            System.out.println("Mật khẩu mới không thể trùng với mật khẩu cũ.");
            return false;
        }

        // Mã hóa mật khẩu mới
        String hashedNewPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

        // Cập nhật mật khẩu mới vào cơ sở dữ liệu
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET password = :password WHERE username = :username")
                        .bind("password", hashedNewPassword)
                        .bind("username", username)
                        .execute());

        if (rowsAffected > 0) {
            System.out.println("Đổi mật khẩu thành công.");
            return true;
        } else {
            System.out.println("Đổi mật khẩu thất bại.");
            return false;
        }
    }


    // Lọc khách hàng mới theo ngày hôm nay
    public List<User> getUsersByToday() {
        LocalDate today = LocalDate.now();
        String todayStr = today.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE DATE(created_at) = :created_at AND role = 'customer' ORDER BY created_at DESC LIMIT 20")
                        .bind("created_at", todayStr)
                        .mapToBean(User.class)
                        .list()
        );
    }

    // Lọc khách hàng mới theo tháng này
    public List<User> getUsersByThisMonth() {
        LocalDate firstDayOfMonth = LocalDate.now().withDayOfMonth(1);
        String firstDayStr = firstDayOfMonth.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE DATE(created_at) >= :first_day_of_month AND role = 'customer' ORDER BY created_at DESC LIMIT 20")
                        .bind("first_day_of_month", firstDayStr)
                        .mapToBean(User.class)
                        .list()
        );
    }

    public List<User> manageCustomer() {
        List<User> customers = JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE role = :role")
                        .bind("role", "customer")
                        .mapToBean(User.class)
                        .list());
        System.out.println(customers); // Log danh sách khách hàng
        return customers;
    }

    //Thêm thông tin khách hàng:
    // Kiểm tra email đã tồn tại trong cơ sở dữ liệu hay chưa
    public boolean isEmailExists(String email) {
        User existingUser = JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM users WHERE email = :email")
                        .bind("email", email)
                        .mapToBean(User.class)
                        .findFirst().orElse(null));
        return existingUser != null;
    }

    // Thêm thông tin khách hàng
    public boolean addCustomer(User user) {
        // Kiểm tra xem email đã tồn tại chưa
        if (isEmailExists(user.getEmail())) {
            System.out.println("Email đã tồn tại.");
            return false; // Không thêm khách hàng nếu email đã tồn tại
        }

        return JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("INSERT INTO users (fullname, phone, email, address, role) VALUES (:fullname, :phone, :email, :address, :role)")
                        .bind("fullname", user.getFullname())
                        .bind("phone", user.getPhone())
                        .bind("email", user.getEmail())
                        .bind("address", user.getAddress())
                        .bind("role", "customer")
                        .execute() > 0);
    }


    // Cập nhật thông tin khách hàng
    public boolean updateCustomer(User user) {
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET fullname = :fullname, phone = :phone, email = :email, role = :role, address = :address WHERE email = :email")
                        .bind("fullname", user.getFullname())
                        .bind("phone", user.getPhone())
                        .bind("email", user.getEmail())
                        .bind("role", user.getRole())
                        .bind("address", user.getAddress())
                        .execute());
        return rowsAffected > 0;
    }


    // Xóa khách hàng
    public boolean deleteCustomer(String id) {
        int rowsAffected = JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("DELETE FROM users WHERE id = :id")
                        .bind("id", id)
                        .execute());
        return rowsAffected > 0;
    }

    public List<User> searchCustomers(String keyword) {
        String query = "SELECT * FROM users WHERE role = 'customer' AND " +
                "(fullname LIKE :keyword OR email LIKE :keyword OR phone LIKE :keyword)";
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery(query)
                        .bind("keyword", "%" + keyword + "%")
                        .mapToBean(User.class)
                        .list());
    }

    //Chức năng đăng nhập thông qua google or facebook:
//    public User loginWithFacebook(String accessToken) {
//
//    }
    // Lưu thông tin user nếu chưa có trong CSDL
//    public void saveUserIfNotExist(String email, String name, String phone, String address) {
//        User user = findUserByEmail(email);
//        if (user == null) { // Nếu chưa có trong CSDL, thì thêm mới
//            JdbiConnect.get().withHandle(handle ->
//                    handle.createUpdate("INSERT INTO users (email, fullname, phone, address) VALUES (?, ?, ?, ?)")
//                            .bind(0, email)
//                            .bind(1, name)
//                            .bind(2, phone != null ? phone : "Chưa cập nhật")
//                            .bind(3, address != null ? address : "Chưa cập nhật")
//                            .execute()
//            );
//        } else { // Nếu đã tồn tại, cập nhật lại thông tin đầy đủ
//            JdbiConnect.get().withHandle(handle ->
//                    handle.createUpdate("UPDATE users SET fullname = ?, phone = ?, address = ? WHERE email = ?")
//                            .bind(0, name)
//                            .bind(1, phone != null ? phone : user.getPhone()) // Nếu null thì giữ nguyên giá trị cũ
//                            .bind(2, address != null ? address : user.getAddress()) // Nếu null thì giữ nguyên giá trị cũ
//                            .bind(3, email)
//                            .execute()
//            );
//        }
//    }
//
//    public boolean updateGoogleUser(User user) {
//        return JdbiConnect.get().withHandle(handle -> handle.inTransaction(h -> {
//            System.out.println("🔍 Trước khi cập nhật: " + findUserByEmail(user.getEmail()));
//
//            int rowsAffected = h.createUpdate("UPDATE users SET fullname = :fullname, phone = :phone, address = :address WHERE email = :email")
//                    .bind("fullname", user.getFullname())
//                    .bind("phone", user.getPhone() != null ? user.getPhone() : "Chưa cập nhật")
//                    .bind("address", user.getAddress() != null ? user.getAddress() : "Chưa cập nhật")
//                    .bind("email", user.getEmail())
//                    .execute();
//
//            System.out.println("✅ Rows affected: " + rowsAffected);
//
//            if (rowsAffected > 0) {
//                System.out.println("📌 Đã commit dữ liệu!");
//                h.commit(); // Bắt buộc commit nếu Jdbi không auto-commit
//            } else {
//                System.out.println("⚠ Không có dữ liệu nào thay đổi. Có thể dữ liệu đã giống hệt trước đó.");
//                h.rollback();
//            }
//
//            System.out.println("🔍 Sau khi cập nhật: " + findUserByEmail(user.getEmail()));
//
//            return rowsAffected > 0;
//        }));
//    }
//    public void saveUserIfNotExist(String email, String name) {
//        User user = getUserByEmail(email);
//        if (user == null) { // Nếu chưa có trong CSDL, thì thêm mới
//            JdbiConnect.get().withHandle(handle ->
//                    handle.createUpdate("INSERT INTO users (email, fullname, role) VALUES (?, ?, 'user')")
//                            .bind(0, email)
//                            .bind(1, name)
//                            .execute()
//            );
//        } else { // Nếu đã tồn tại, cập nhật lại tên
//            JdbiConnect.get().withHandle(handle ->
//                    handle.createUpdate("UPDATE users SET fullname = ? WHERE email = ?")
//                            .bind(0, name)
//                            .bind(1, email)
//                            .execute()
//            );
//        }
//    }
    public void saveUserIfNotExist(String email, String fullname) {
        User user = findUserByEmail(email);
        if (user == null) { // Nếu user chưa tồn tại, thêm mới
            JdbiConnect.get().withHandle(handle ->
                    handle.createUpdate("INSERT INTO users (email, username, fullname) VALUES (?, ?, ?)")
                            .bind(0, email)
                            .bind(1, email)  // Dùng email làm username
                            .bind(2, fullname)
                            .execute()
            );
        } else { // Nếu user đã tồn tại, chỉ cập nhật fullname
            JdbiConnect.get().withHandle(handle ->
                    handle.createUpdate("UPDATE users SET fullname = ? WHERE email = ?")
                            .bind(0, fullname)
                            .bind(1, email)
                            .execute()
            );
        }
    }
    //    public void updateUserInfo(String email, String phone, String address) {
//        JdbiConnect.get().withHandle(handle ->
//                handle.createUpdate("UPDATE users SET phone = ?, address = ? WHERE email = ?")
//                        .bind(0, phone)
//                        .bind(1, address)
//                        .bind(2, email)
//                        .execute()
//        );
//    }
    public void updateUserInfo(String email, String phone, String address, HttpSession session) {
        String googleEmail = (String) session.getAttribute("google_email");

        // Kiểm tra nếu email đăng nhập bằng Google
        if (googleEmail != null && !email.equals(googleEmail)) {
            throw new IllegalArgumentException("Bạn không thể thay đổi email đăng nhập Google.");
        }

        // Thực hiện cập nhật nếu hợp lệ
        JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("UPDATE users SET phone = ?, address = ? WHERE email = ?")
                        .bind(0, phone)
                        .bind(1, address)
                        .bind(2, email)
                        .execute()
        );
    }

    // Khóa tài khoản
    public void toggleUserStatus(int userId, int status) {
            String query = "UPDATE users SET status = :status WHERE id = :id";
            JdbiConnect.get().withHandle(handle ->
                    handle.createUpdate(query)
                            .bind("status", status)
                            .bind("id", userId)
                            .execute()
            );
    }

    public String getUsernameById(int id) {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT username FROM users WHERE id = :id")
                        .bind("id", id)
                        .mapTo(String.class)
                        .findOne()
                        .orElse("Không rõ")
        );
    }


}
