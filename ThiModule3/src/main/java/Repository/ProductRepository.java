package Repository;

import Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static javax.management.remote.JMXConnectorFactory.connect;

public class ProductRepository {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/productdb?useSSL=false&serverTimezone=UTC";
    private static final String JDBC_USERNAME = "root";
    private static final String JDBC_PASSWORD = "admin4320";
    private static Connection connection;

    static {
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USERNAME, JDBC_PASSWORD);
            System.out.println("✅ Kết nối database thành công!");
        } catch (SQLException | ClassNotFoundException e) {
            System.err.println("❌ Lỗi kết nối database: " + e.getMessage());
            throw new RuntimeException(e);
        }
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM products";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                products.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getDouble("price"),
                        rs.getInt("quantity"),
                        rs.getString("color"),
                        rs.getString("description"),
                        rs.getString("category")
                ));
            }
        } catch (SQLException e) {
            System.err.println("❌ Lỗi khi lấy danh sách sản phẩm: " + e.getMessage());
            e.printStackTrace();
        }
        return products;
    }

    public static void addProduct(Product product) {
        String sql = "INSERT INTO products (name, price, quantity, color, description, category) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getColor());
            stmt.setString(5, product.getDescription());
            stmt.setString(6, product.getCategory());

            stmt.executeUpdate();
            System.out.println(" Thêm sản phẩm thành công!");
        } catch (SQLException e) {
            System.err.println(" Lỗi khi thêm sản phẩm: " + e.getMessage());
            e.printStackTrace();
        }
    }
}
