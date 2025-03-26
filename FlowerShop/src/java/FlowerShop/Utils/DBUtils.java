package FlowerShop.Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DUNGHUYNH
 */
public class DBUtils {
    

    public static Connection getConnection() {
        String url;
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName + ";encrypt=false;trustServerCertificate=true";
        } else {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName + ";encrypt=false;trustServerCertificate=true";
        }

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (ClassNotFoundException ex) {
            System.out.println("Lỗi: Không thể tải driver JDBC. Kiểm tra pom.xml!");
            return null;
        }

        try {
            Connection con = DriverManager.getConnection(url, userID, password);
            System.out.println(" Kết nối thành công đến SQL Server!");
            return con;
        } catch (SQLException ex) {
            System.out.println(" Lỗi kết nối SQL Server: " + ex.getMessage());
            return null;
        }
    }

    
    
    
    private final static String serverName = "localhost";
    private final static String dbName = "FlowerShop";
    private final static String portNumber = "1433";
    private final static String instance = "";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final static String userID = "sa";
    private final static String password = "12345";
}
