package Repository;

import Model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.SQLException;


public class ProductRepository {

    private static final String INSERT_PRODUCT_SQL = "INSERT INTO products (name, price, quantity, color, description, category) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String GET_ALL_PRODUCTS_SQL = "SELECT * FROM products WHERE is_deleted = 0";
    private static final String SOFT_DELETE_PRODUCT_SQL = "UPDATE products SET is_deleted = 1 WHERE id = ?";

    public void addProduct(Product product) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(INSERT_PRODUCT_SQL)) {
            stmt.setString(1, product.getName());
            stmt.setDouble(2, product.getPrice());
            stmt.setInt(3, product.getQuantity());
            stmt.setString(4, product.getColor());
            stmt.setString(5, product.getDescription());
            stmt.setString(6, product.getCategory());
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ALL_PRODUCTS_SQL);
             ResultSet rs = preparedStatement.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                int quantity = rs.getInt("quantity");
                String color = rs.getString("color");
                String description = rs.getString("description");
                String category = rs.getString("category");

                products.add(new Product(id, name, price, quantity, color, description, category));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    // Phương thức ẩn sản phẩm (soft delete)
    public boolean hideProduct(int id) {
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(SOFT_DELETE_PRODUCT_SQL)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}