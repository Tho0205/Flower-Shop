package FlowerShop.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import FlowerShop.DTO.ProductDTO;
import FlowerShop.Utils.DBUtils;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {
    public List<ProductDTO> list(String keyword, int limit, int offset) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "SELECT productId, productName, description, price, quantity, categoryId, image FROM Products";

        if (keyword != null && !keyword.isEmpty()) {
            sql += " WHERE productName LIKE ?";
        }
        sql += " ORDER BY productId DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY"; 

        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                stmt.setString(paramIndex++, "%" + keyword.trim() + "%");
            }
            stmt.setInt(paramIndex++, offset);
            stmt.setInt(paramIndex, limit);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productId"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("quantity"),
                    rs.getInt("categoryId"),
                    rs.getString("image")
                );
                list.add(product);
                System.out.println("🛒 Lấy sản phẩm: " + product.getProductName());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        System.out.println("🔹 Tổng số sản phẩm lấy được: " + list.size());
        return list;
    }
    public List<ProductDTO> listFiltered(double minPrice, double maxPrice, int category, int limit, int offset, String sort) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "SELECT productId, productName, description, price, quantity, categoryId, image FROM Products WHERE price BETWEEN ? AND ?";
        
        if (category > 0) {
            sql += " AND categoryId = ?";
        }
        sql += "ORDER BY price " + sort + " OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";

        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setDouble(1, minPrice);
            stmt.setDouble(2, maxPrice);
            int paramIndex = 3;
            if (category > 0) {
                stmt.setInt(paramIndex++, category);
            }
            stmt.setInt(paramIndex++, offset);
            stmt.setInt(paramIndex, limit);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productId"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("quantity"),
                    rs.getInt("categoryId"),
                    rs.getString("image")
                );
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM Products";
        try (
            Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }
    public List<ProductDTO> list(int currentPage, int recordsPerPage) {
        List<ProductDTO> list = new ArrayList<>();
        int start = (currentPage - 1) * recordsPerPage;
        String sql = "SELECT * FROM Products ORDER BY productId OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, start);
            stmt.setInt(2, recordsPerPage);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productId"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("quantity"),
                    rs.getInt("categoryId"),
                    rs.getString("image")
                );
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<ProductDTO> SearchByKeyword(String keyword) {
        List<ProductDTO> list = new ArrayList<>();
        String sql = "SELECT productId, productName, description, price, quantity, categoryId, image FROM Products WHERE productName LIKE ?";
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, "%" + keyword + "%");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                ProductDTO product = new ProductDTO(
                    rs.getInt("productId"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("quantity"),
                    rs.getInt("categoryId"),
                    rs.getString("image")
                );
                list.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    
    public ProductDTO load(int productId)  {
        String sql = "SELECT productId, productName, description, price, quantity, categoryId, image FROM Products WHERE productId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new ProductDTO(
                    rs.getInt("productId"),
                    rs.getString("productName"),
                    rs.getString("description"),
                    rs.getDouble("price"),
                    rs.getInt("quantity"),
                    rs.getInt("categoryId"),
                    rs.getString("image")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public void update(int productId, String productName, String description, double price, int quantity, int categoryId, String image) {
        String sql = "UPDATE Products SET productName = ?, description = ?, price = ?, quantity = ?, categoryId = ?, image = ? WHERE productId = ?";
        try (
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, productName);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, quantity);
            stmt.setInt(5, categoryId);
            stmt.setString(6, image);
            stmt.setInt(7, productId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    public boolean delete(int productId) {
        String sql = "DELETE FROM Products WHERE productId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, productId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public void create(String productName, String description, double price, int quantity, int categoryId, String image) {
        String sql = "INSERT INTO Products (productName, description, price, quantity, categoryId, image) VALUES (?, ?, ?, ?, ?, ?)";
        try (
            Connection con = DBUtils.getConnection();
            PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, productName);
            stmt.setString(2, description);
            stmt.setDouble(3, price);
            stmt.setInt(4, quantity);
            stmt.setInt(5, categoryId);
            stmt.setString(6, image);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}
