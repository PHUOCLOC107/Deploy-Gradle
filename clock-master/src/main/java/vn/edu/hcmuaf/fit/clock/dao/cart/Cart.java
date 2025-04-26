package vn.edu.hcmuaf.fit.clock.dao.cart;

import vn.edu.hcmuaf.fit.clock.model.ProductDetail;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

public class Cart {
    private Map<Integer, CartProduct> map;

    public Cart() {
        this.map = new HashMap<>();
    }

    // Thêm sản phẩm vào giỏ với số lượng tùy chỉnh
    public boolean add(ProductDetail p, int quantity) {
        if (quantity <= 0) {
            return false; // Nếu số lượng không hợp lệ, không thêm vào giỏ
        }

        if (map.containsKey(p.getId())) {
            // Nếu sản phẩm đã có trong giỏ, cập nhật số lượng
            return update(p.getId(), map.get(p.getId()).getQuantity() + quantity);
        }

        // Nếu sản phẩm chưa có trong giỏ, chuyển đổi và thêm vào giỏ
        map.put(p.getId(), convert(p, quantity));
        return true;
    }

    // Cập nhật số lượng của sản phẩm trong giỏ
    public boolean update(int id, int quantity) {
        if (map.containsKey(id)) {
            CartProduct cartProduct = map.get(id);
            cartProduct.setQuantity(quantity);
            map.put(cartProduct.getId(), cartProduct);
            return true;
        }
        return false;
    }

    // Xóa sản phẩm khỏi giỏ
    public boolean remove(int id) {
        return map.remove(id) != null;
    }

    // Xóa tất cả sản phẩm trong giỏ
    public void removeAll() {
        map.clear();
    }

    // Lấy danh sách sản phẩm trong giỏ
    public List<CartProduct> getList() {
        return new ArrayList<>(map.values());
    }

    // Tính tổng số lượng sản phẩm trong giỏ
    public int getTotalQuantity() {
        AtomicInteger i = new AtomicInteger(0);
        map.values().forEach(cartProduct -> i.addAndGet(cartProduct.getQuantity()));
        return i.get();
    }

    // Tính tổng tiền của giỏ hàng
    public Double getTotal() {
        AtomicReference<Double> sum = new AtomicReference<>(0.0);
        map.values().forEach(cartProduct -> {
            double discountedPrice = cartProduct.getDiscountedPrice();
            sum.updateAndGet(v -> v + (cartProduct.getQuantity() * discountedPrice));
        });
        return sum.get();
    }

    // Chuyển đổi từ ProductDetail sang CartProduct với số lượng
    private CartProduct convert(ProductDetail p, int quantity) {
        CartProduct cp = new CartProduct();
        cp.setId(p.getId());
        cp.setName(p.getName());
        cp.setPrice(p.getPrice());
        cp.setDiscountPercent(p.getDiscountPercent());
        cp.setImage(p.getImage());
        cp.setQuantity(quantity); // Sử dụng số lượng tùy chỉnh
        return cp;
    }
}
