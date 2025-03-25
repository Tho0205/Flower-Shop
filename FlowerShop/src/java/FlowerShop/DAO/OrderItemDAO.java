package FlowerShop.DAO;

import FlowerShop.DTO.OrderItemDTO;
import FlowerShop.Utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderItemDAO {
    public List<OrderItemDTO> list() {
        List<OrderItemDTO> orderItems = new ArrayList<>();
        String sql = "SELECT orderItemId, orderId, productId, quantity, price FROM OrderItems";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                orderItems.add(new OrderItemDTO(
                    rs.getInt("orderItemId"),
                    rs.getInt("orderId"),
                    rs.getInt("productId"),
                    rs.getInt("quantity"),
                    rs.getDouble("price")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderItems;
    }
    
    public OrderItemDTO load(int orderItemId) {
        String sql = "SELECT orderItemId, orderId, productId, quantity, price FROM OrderItems WHERE orderItemId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, orderItemId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return new OrderItemDTO(
                    rs.getInt("orderItemId"),
                    rs.getInt("orderId"),
                    rs.getInt("productId"),
                    rs.getInt("quantity"),
                    rs.getDouble("price")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean insert(OrderItemDTO orderItem) {
        String sql = "INSERT INTO OrderItems (orderId, productId, quantity, price) VALUES (?, ?, ?, ?)";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, orderItem.getOrderId());
            stmt.setInt(2, orderItem.getProductId());
            stmt.setInt(3, orderItem.getQuantity());
            stmt.setDouble(4, orderItem.getPrice());
            
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderItem.setOrderItemId(generatedKeys.getInt(1));
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean update(OrderItemDTO orderItem) {
        String sql = "UPDATE OrderItems SET orderId = ?, productId = ?, quantity = ?, price = ? WHERE orderItemId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, orderItem.getOrderId());
            stmt.setInt(2, orderItem.getProductId());
            stmt.setInt(3, orderItem.getQuantity());
            stmt.setDouble(4, orderItem.getPrice());
            stmt.setInt(5, orderItem.getOrderItemId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean delete(int orderItemId) {
        String sql = "DELETE FROM OrderItems WHERE orderItemId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, orderItemId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
