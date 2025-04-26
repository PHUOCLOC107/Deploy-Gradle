package vn.edu.hcmuaf.fit.clock.properties;

import java.sql.*;

public class DBConnect {
    static String url = "jdbc:mysql://" + DbProperties.host() + ":" + DbProperties.port() + "/" + DbProperties.dbname() + "?" + DbProperties.option();
    static Connection conn;

    public static Statement get() {
        try {
            if (conn == null || conn.isClosed()) {
                makeConnect();
            }
            return conn.createStatement();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    private static void makeConnect() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, DbProperties.username(), DbProperties.password());
    }

    public static void main(String[] args) throws SQLException {
        Statement s = DBConnect.get();
        if (s == null) return;
        ResultSet rs = s.executeQuery("select * from products");
        while (rs.next()) {
            System.out.println(rs.getInt(1)
                    + ", " + rs.getString(2)
                    + ", " + rs.getString(3)
                    + ", " + rs.getString(4)
                    + ", " + rs.getString(5)
                    + ", " + rs.getString(6)
                    + ", " + rs.getString(7)
                    + ", " + rs.getString(8)
                    + ", " + rs.getString(9)
                    + ", " + rs.getString(10)
                    + ", " + rs.getString(11)
                    + ", " + rs.getString(12)
                    + ", " + rs.getString(13)
                    + ", " + rs.getString(14)
                    + ", " + rs.getString(15));
        }


    }
}
