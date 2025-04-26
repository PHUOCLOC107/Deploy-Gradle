package vn.edu.hcmuaf.fit.clock.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.Log;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

import java.util.List;

public class LogDao {
    public void insertLog(int userId, String action, String description) {
        Jdbi jdbi = JdbiConnect.get();
        jdbi.useHandle(handle -> handle.createUpdate("INSERT INTO logs (user_id, action, description) VALUES (:userId, :action, :description)")
                .bind("userId", userId)
                .bind("action", action)
                .bind("description", description)
                .execute()
        );
    }

    public List<Log> getRecentLogs() {
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle -> handle.createQuery("SELECT * FROM logs ORDER BY created_at DESC LIMIT 100"))
                .mapToBean(Log.class)
                .list();
    }

    public List<Log> getAllLogs() {
        String sql = "SELECT * FROM logs ORDER BY created_at DESC";
        Jdbi jdbi = JdbiConnect.get();
        return jdbi.withHandle(handle ->
                handle.createQuery(sql)
                        .mapToBean(Log.class)
                        .list()
        );
    }

    // Xóa log theo ID
    public void deleteLogById(int id) {
        String sql = "DELETE FROM logs WHERE id = :id";
        Jdbi jdbi = JdbiConnect.get();
        jdbi.useHandle(handle ->
                handle.createUpdate(sql)
                        .bind("id", id)
                        .execute()
        );
    }

    // Xóa toàn bộ log
    public void clearLogs() {
        Jdbi jdbi = JdbiConnect.get();
        String sql = "DELETE FROM logs";
        jdbi.useHandle(handle -> handle.execute(sql));
    }

}
