package Controller;

import Model.Product;
import Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "managementProduct", value = "/managementProduct")
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productService.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/WEB-INF/managementProduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        String category = request.getParameter("category");

        List<String> errors = new ArrayList<>();

        // Validate dữ liệu
        if (name == null || name.trim().isEmpty()) {
            errors.add("Tên sản phẩm không được để trống.");
        }

        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
            if (price <= 10000000) {
                errors.add("Giá sản phẩm phải lớn hơn 10.000.000 VNĐ.");
            }
        } catch (NumberFormatException e) {
            errors.add("Giá phải là số hợp lệ.");
        }

        int quantity = 0;
        try {
            quantity = Integer.parseInt(quantityStr);
            if (quantity <= 0) {
                errors.add("Số lượng phải là số nguyên dương.");
            }
        } catch (NumberFormatException e) {
            errors.add("Số lượng phải là số nguyên hợp lệ.");
        }

        List<String> validColors = Arrays.asList("Đỏ", "Xanh", "Đen", "Trắng", "Vàng");
        if (!validColors.contains(color)) {
            errors.add("Màu sắc không hợp lệ.");
        }

        if (category == null || category.trim().isEmpty()) {
            errors.add("Danh mục không được để trống.");
        }

        // Nếu có lỗi, quay lại trang add-product.jsp và giữ lại dữ liệu
        if (!errors.isEmpty()) {
            request.setAttribute("errors", errors);
            request.setAttribute("name", name);
            request.setAttribute("price", priceStr);
            request.setAttribute("quantity", quantityStr);
            request.setAttribute("color", color);
            request.setAttribute("description", description);
            request.setAttribute("category", category);

            request.getRequestDispatcher("add-product.jsp").forward(request, response);
            return;
        }

        // Thêm sản phẩm vào database qua ProductService
        Product product = new Product(name, price, quantity, color, description, category);
        productService.addProduct(product);

        // Chuyển hướng về danh sách sản phẩm
        response.sendRedirect("/WEB-INF/managementProduct.jsp");
    }
}
