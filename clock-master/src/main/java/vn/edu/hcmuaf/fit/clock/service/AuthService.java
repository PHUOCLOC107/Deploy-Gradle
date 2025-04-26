package vn.edu.hcmuaf.fit.clock.service;

import vn.edu.hcmuaf.fit.clock.dao.UserDao;
import vn.edu.hcmuaf.fit.clock.model.User;
import org.mindrot.jbcrypt.BCrypt;

public class AuthService {
    private UserDao userDao = new UserDao();
    public User checkLogin(String username, String pass) {
        UserDao udao = new UserDao();
        User u = udao.findUsername(username);

        if (u != null) {
            System.out.println("Username: " + username);
            System.out.println("Password entered: " + pass);
            System.out.println("Password in DB: " + u.getPassword());
            System.out.println("Status: " + u.getStatus());

            // ✅ Chỉ kiểm tra mật khẩu trước
            if (BCrypt.checkpw(pass, u.getPassword())) {
                if (u.getStatus() == 0) {
                    System.out.println("Tài khoản chưa kích hoạt.");
                    u.setPassword(null); // optional
                    u.setStatus(0); // để servlet nhận biết
                    return u;
                }

                u.setPassword(null); // Không lưu mật khẩu trong session
                return u;
            } else {
                System.out.println("Mật khẩu không đúng");
            }
        }

        return null; // Sai username hoặc mật khẩu
    }

    public String getUsernameById(int id) {
        return this.userDao.getUsernameById(id);
    }


}


