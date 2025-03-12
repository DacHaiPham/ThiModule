package Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/productdb";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "admin4320";

    static final String INSERT_PRODUCT_SQL = "INSERT INTO products (name, price, quantity, color, description, category) VALUES (?, ?, ?, ?, ?, ?)";
    static final String SELECT_ALL_PRODUCTS = "SELECT * FROM products";

    protected static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
