package FlowerShop.DAO;
import FlowerShop.DTO.OrderDTO;
import FlowerShop.Utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
public class OrderDAO {
    
    public List<OrderDTO> list() {
        List<OrderDTO> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                orders.add(new OrderDTO(
                    rs.getInt("orderId"),
                    rs.getInt("userId"),
                    rs.getDouble("totalPrice"),
                    rs.getString("orderStatus"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getTimestamp("createdAt")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }
    
    public OrderDTO load(int orderId) {
        String sql = "SELECT * FROM Orders WHERE orderId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                return new OrderDTO(
                    rs.getInt("orderId"),
                    rs.getInt("userId"),
                    rs.getDouble("totalPrice"),
                    rs.getString("orderStatus"),
                    rs.getString("phone"),
                    rs.getString("address"),
                    rs.getTimestamp("createdAt")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public int insert(OrderDTO order) {
        String sql = "INSERT INTO Orders (userId, totalPrice, orderStatus, phone, address, createdAt) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalPrice());
            ps.setString(3, order.getOrderStatus());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getAddress());
            ps.setTimestamp(6, order.getCreatedAt());
            
            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    public boolean update(OrderDTO order) {
        String sql = "UPDATE Orders SET userId = ?, totalPrice = ?, orderStatus = ?, phone = ?, address = ?, createdAt = ? WHERE orderId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, order.getUserId());
            ps.setDouble(2, order.getTotalPrice());
            ps.setString(3, order.getOrderStatus());
            ps.setString(4, order.getPhone());
            ps.setString(5, order.getAddress());
            ps.setTimestamp(6, order.getCreatedAt());
            ps.setInt(7, order.getOrderId());
            
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean delete(int orderId) {
        String sql = "DELETE FROM Orders WHERE orderId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setInt(1, orderId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
