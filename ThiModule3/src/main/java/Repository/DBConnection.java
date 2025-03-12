package Repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static String URL = "jdbc:mysql://localhost:3306/productdb";
    private static String Username = "root";
    private static String Password = "admin4320";


    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, Username, Password);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi kết nối CSDL");
        }
    }
}
