package vn.edu.hcmuaf.fit.clock.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.clock.model.Category;
import vn.edu.hcmuaf.fit.clock.model.Product;
import vn.edu.hcmuaf.fit.clock.model.ProductImage;
import vn.edu.hcmuaf.fit.clock.model.ProductDetail;
import vn.edu.hcmuaf.fit.clock.service.CategoryService;
import vn.edu.hcmuaf.fit.clock.service.ProductService;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

@WebServlet(name = "ProductDetailController", value = "/product-detail")
public class ProductDetailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        ProductService productService = new ProductService();
        try {
            int id = Integer.parseInt(pid);
            ProductDetail productDetail = productService.getDetail(String.valueOf(id));
            Product product = productService.findById(id);
            List<ProductImage> productImages = productService.getProductImages(String.valueOf(id));
            List<Product> similarProducts = productService.getSimilarProducts(product.getCategoryId(), id);

            String formattedPrice = formatPrice(productDetail.getPrice());
            String formattedDiscountedPrice = formatPrice(productDetail.getDiscountedPrice());
            CategoryService categoryService = new CategoryService();
            List<Category> listCate = categoryService.getAllCategory();
            request.setAttribute("listCate", listCate);
            request.setAttribute("formattedPrice", formattedPrice);
            request.setAttribute("formattedDiscountedPrice", formattedDiscountedPrice);
            request.setAttribute("productDetail", productDetail);
            request.setAttribute("productImages", productImages);
            request.setAttribute("similarProducts", similarProducts);
        } catch (NumberFormatException e) {
            response.sendError(404, "Not found");
            return;
        }
        request.getRequestDispatcher("product-detail.jsp").forward(request, response);

    }


    public String formatPrice(int price) {
        NumberFormat format = NumberFormat.getInstance(new Locale("vi", "VN"));
        return format.format(price) + " ₫";

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}