package Controller;

import Model.Product;
import Service.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet({"/products", "/"})
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            request.getRequestDispatcher("/WEB-INF/addProduct.jsp").forward(request, response);
        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            productService.hideProduct(id); // Ẩn sản phẩm thay vì xóa

            // Lưu thông báo vào session
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "📌 Sản phẩm đã được xóa thành công!");

            response.sendRedirect("products"); // Chuyển hướng lại trang danh sách
        } else if ("success".equals(action)) { // 🆕 Xử lý khi thêm sản phẩm thành công
            HttpSession session = request.getSession();
            session.setAttribute("successMessage", "✅ Sản phẩm đã được thêm thành công!");
            response.sendRedirect("products");
        } else {
            // Load danh sách sản phẩm từ database
            List<Product> productList = productService.getAllProducts();
            request.setAttribute("products", productList);

            // Kiểm tra session có thông báo không
            HttpSession session = request.getSession();
            String successMessage = (String) session.getAttribute("successMessage");
            String errorMessage = (String) session.getAttribute("errorMessage");

            if (successMessage != null) {
                request.setAttribute("successMessage", successMessage);
                session.removeAttribute("successMessage"); // Xóa thông báo sau khi hiển thị
            }
            if (errorMessage != null) {
                request.setAttribute("errorMessage", errorMessage);
                session.removeAttribute("errorMessage"); // Xóa thông báo sau khi hiển thị
            }

            request.getRequestDispatcher("/WEB-INF/managementProduct.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        try {
            // Lấy dữ liệu từ request
            String name = request.getParameter("name");
            String priceStr = request.getParameter("price");
            String quantityStr = request.getParameter("quantity");
            String color = request.getParameter("color");
            String description = request.getParameter("description");
            String category = request.getParameter("category");

            // Kiểm tra dữ liệu đầu vào
            if (name.isEmpty() || priceStr.isEmpty() || quantityStr.isEmpty() || color.isEmpty() || category.isEmpty()) {
                session.setAttribute("errorMessage", "⚠ Vui lòng nhập đầy đủ thông tin sản phẩm!");
                response.sendRedirect("products?action=add");
                return;
            }

            double price = Double.parseDouble(priceStr);
            int quantity = Integer.parseInt(quantityStr);

            // Tạo sản phẩm mới
            Product newProduct = new Product(0, name, price, quantity, color, description, category);
             productService.addProduct(newProduct);
            response.sendRedirect("products");
        } catch (NumberFormatException e) {
            session.setAttribute("errorMessage", "⚠ Giá tiền và số lượng phải là số hợp lệ!");
            response.sendRedirect("products?action=add");
        }
    }

}
