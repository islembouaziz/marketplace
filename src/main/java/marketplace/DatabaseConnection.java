package marketplace;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    
    // Change 'marketplace_db' to your actual database name in phpMyAdmin
    private static final String URL = "jdbc:mysql://localhost:3306/marketplace";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Default XAMPP password is empty

    public static Connection getConnection() {
        Connection connection = null;
        try {
            // This loads the JAR driver you put in the lib folder
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Connection to XAMPP successful!");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver not found! Check your lib folder.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failed! Is MySQL running in XAMPP?");
            e.printStackTrace();
        }
        return connection;
    }
    public static void main(String[] args) {
        Connection conn = getConnection();
        if (conn != null) {
            System.out.println("--- SUCCESS: Java is now talking to XAMPP! ---");
        } else {
            System.out.println("--- FAILURE: Check if MySQL is started in XAMPP. ---");
        }
    }
}