package vn.edu.hcmuaf.fit.clock.dao;

import vn.edu.hcmuaf.fit.clock.model.Order;
import vn.edu.hcmuaf.fit.clock.model.admin.OrderView;
import vn.edu.hcmuaf.fit.clock.properties.JdbiConnect;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

public class OrderDAO {
    // Tìm hóa đơn theo id
    public Order getOrderById(int id) {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE id = :id")
                        .bind("id", id)
                        .mapToBean(Order.class)
                        .findOne()
                        .orElse(null)
        );
    }

    // Danh sách tất cả các hóa đơn
    public List<Order> getAll() {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders")
                        .mapToBean(Order.class)
                        .list()
        );
    }

    // Danh sách 20 hóa đơn mới nhất
    public List<Order> getLatestOrders() {
        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders ORDER BY created_at DESC LIMIT 20")
                        .mapToBean(Order.class)
                        .list()
        );
    }

    // Tính tổng doanh thu từ các đơn hàng (status = 'Đã giao')
    public int getTotalRevenue() {
        return JdbiConnect.get().withHandle(handle -> {
            Integer totalRevenue = handle.createQuery("SELECT SUM(total_price) FROM orders WHERE status = 'Đã giao'")
                    .mapTo(Integer.class)
                    .findOnly();
            return totalRevenue != null ? totalRevenue : 0; // Nếu totalRevenue là null, trả về 0
        });
    }

    // Tính tổng số lượng đơn hàng chưa xử lý (status = 'Đang xử lý')
    public int getTotalUnprocessedOrders() {
        return JdbiConnect.get().withHandle(handle -> {
            Integer totalUnprocessed = handle.createQuery("SELECT COUNT(*) FROM orders WHERE status = 'Đang xử lý'")
                    .mapTo(Integer.class)
                    .findOnly();
            return totalUnprocessed != null ? totalUnprocessed : 0; // Nếu không có đơn hàng, trả về 0
        });
    }

    // Lọc 20 đơn hàng mới nhất theo ngày hôm nay
    public List<Order> getOrdersByToday() {
        LocalDate today = LocalDate.now();
        String startOfDay = today.atStartOfDay().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String endOfDay = today.plusDays(1).atStartOfDay().minusSeconds(1).format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE created_at >= :start_of_day AND created_at <= :end_of_day ORDER BY created_at DESC LIMIT 20")
                        .bind("start_of_day", startOfDay)
                        .bind("end_of_day", endOfDay)
                        .mapToBean(Order.class)
                        .list()
        );
    }


    // Lọc 20 đơn hàng mới nhất theo tháng này
    public List<Order> getOrdersByThisMonth() {
        LocalDate firstDayOfMonth = LocalDate.now().withDayOfMonth(1);
        LocalDate firstDayOfNextMonth = firstDayOfMonth.plusMonths(1);
        String startOfMonth = firstDayOfMonth.atStartOfDay().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        String startOfNextMonth = firstDayOfNextMonth.atStartOfDay().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery("SELECT * FROM orders WHERE created_at >= :start_of_month AND created_at < :start_of_next_month ORDER BY created_at DESC LIMIT 20")
                        .bind("start_of_month", startOfMonth)
                        .bind("start_of_next_month", startOfNextMonth)
                        .mapToBean(Order.class)
                        .list()
        );
    }

    public List<OrderView> filterOrdersByStatus(String status) {
        String sql = """
        SELECT o.id AS order_id, u.id AS user_id, u.fullname AS customer_name, p.name AS product_name,
               oi.quantity, o.total_price, o.status, o.payment_method, o.shipping_address
        FROM orders o
        JOIN users u ON o.user_id = u.id
        JOIN order_items oi ON oi.order_id = o.id
        JOIN products p ON oi.product_id = p.id
        WHERE o.status = :status
        ORDER BY o.created_at DESC
    """;

        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("status", status)
                        .map((rs, ctx) -> {
                            OrderView view = new OrderView();
                            view.setOrderId(rs.getInt("order_id"));
                            view.setUserId(rs.getInt("user_id"));
                            view.setCustomerName(rs.getString("customer_name"));
                            view.setProductName(rs.getString("product_name"));
                            view.setQuantity(rs.getInt("quantity"));
                            view.setTotalPrice(rs.getInt("total_price"));
                            view.setStatus(rs.getString("status"));
                            view.setPaymentMethod(rs.getString("payment_method"));
                            view.setShippingMethod(rs.getString("shipping_address"));
                            return view;
                        })
                        .list()
        );
    }




    // Tìm hóa đơn theo từ khóa (search)
    public List<OrderView> searchOrders(String searchQuery) {
        String sql = """
        SELECT o.id AS order_id, u.id AS user_id, u.fullname AS customer_name, p.name AS product_name,
               oi.quantity, o.total_price, o.status, o.payment_method, o.shipping_address
        FROM orders o
        JOIN users u ON o.user_id = u.id
        JOIN order_items oi ON oi.order_id = o.id
        JOIN products p ON oi.product_id = p.id
        WHERE u.fullname LIKE :searchQuery OR p.name LIKE :searchQuery
        ORDER BY o.created_at DESC
    """;

        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .bind("searchQuery", "%" + searchQuery + "%")
                        .map((rs, ctx) -> {
                            OrderView view = new OrderView();
                            view.setOrderId(rs.getInt("order_id"));
                            view.setUserId(rs.getInt("user_id"));
                            view.setCustomerName(rs.getString("customer_name"));
                            view.setProductName(rs.getString("product_name"));
                            view.setQuantity(rs.getInt("quantity"));
                            view.setTotalPrice(rs.getInt("total_price"));
                            view.setStatus(rs.getString("status"));
                            view.setPaymentMethod(rs.getString("payment_method"));
                            view.setShippingMethod(rs.getString("shipping_address"));
                            return view;
                        })
                        .list()
        );
    }


    public void updateOrderStatus(int orderId, String newStatus) {
        JdbiConnect.get().withHandle(handle ->
                handle.createUpdate("UPDATE orders SET status = :status WHERE id = :id")
                        .bind("status", newStatus)
                        .bind("id", orderId)
                        .execute()
        );
    }

    public List<OrderView> getOrderAdminList() {
        String sql = """
        SELECT o.id AS order_id, u.id AS user_id, u.fullname AS customer_name, p.name AS product_name,
               oi.quantity, o.total_price, o.status, o.payment_method, o.shipping_address
        FROM orders o
        JOIN users u ON o.user_id = u.id
        JOIN order_items oi ON oi.order_id = o.id
        JOIN products p ON oi.product_id = p.id
        ORDER BY o.created_at DESC
    """;

        return JdbiConnect.get().withHandle(handle ->
                handle.createQuery(sql)
                        .map((rs, ctx) -> {
                            OrderView view = new OrderView();
                            view.setOrderId(rs.getInt("order_id"));
                            view.setUserId(rs.getInt("user_id"));
                            view.setCustomerName(rs.getString("customer_name"));
                            view.setProductName(rs.getString("product_name"));
                            view.setQuantity(rs.getInt("quantity"));
                            view.setTotalPrice(rs.getInt("total_price"));
                            view.setStatus(rs.getString("status"));
                            view.setPaymentMethod(rs.getString("payment_method"));
                            view.setShippingMethod(rs.getString("shipping_address"));
                            return view;
                        })
                        .list()
        );
    }



    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        System.out.println(dao.getOrdersByToday());
        System.out.println(dao.getOrdersByThisMonth());
    }
}
