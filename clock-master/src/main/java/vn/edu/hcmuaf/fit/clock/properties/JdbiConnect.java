package vn.edu.hcmuaf.fit.clock.properties;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.clock.model.Category;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;

public class JdbiConnect {
    static String url = "jdbc:mysql://" + DbProperties.host() + ":" + DbProperties.port() + "/" + DbProperties.dbname() + "?" + DbProperties.option();
    static Jdbi jdbi;

    public static Jdbi get() {
        if (jdbi == null) makeConnect();
        return jdbi;
    }

    private static void makeConnect() {
        MysqlDataSource source = new MysqlDataSource();
        source.setUrl(url);
        source.setUser(DbProperties.username());
        source.setPassword(DbProperties.password());
        try {
            source.setUseCompression(true);
            source.setAutoReconnect(true);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        jdbi = Jdbi.create(source);
    }

    public static void main(String[] args) {

    }
}
