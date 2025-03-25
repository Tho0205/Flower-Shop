package FlowerShop.DAO;
import FlowerShop.DTO.ReviewDTO;
import FlowerShop.Utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    
    public List<ReviewDTO> list() {
        List<ReviewDTO> reviews = new ArrayList<>();
        String sql = "SELECT * FROM Reviews";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                reviews.add(new ReviewDTO(
                    rs.getInt("reviewId"),
                    rs.getInt("userId"),
                    rs.getInt("productId"),
                    rs.getInt("rating"),
                    rs.getString("comment"),
                    rs.getTimestamp("createdAt")
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    public ReviewDTO load(int reviewId) {
        String sql = "SELECT * FROM Reviews WHERE reviewId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            
            stmt.setInt(1, reviewId);
            ResultSet rs = stmt.executeQuery();
            
            if (rs.next()) {
                return new ReviewDTO(
                    rs.getInt("reviewId"),
                    rs.getInt("userId"),
                    rs.getInt("productId"),
                    rs.getInt("rating"),
                    rs.getString("comment"),
                    rs.getTimestamp("createdAt")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int insert(ReviewDTO review) {
        String sql = "INSERT INTO Reviews (userId, productId, rating, comment, createdAt) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setInt(1, review.getUserId());
            stmt.setInt(2, review.getProductId());
            stmt.setInt(3, review.getRating());
            stmt.setString(4, review.getComment());
            stmt.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
            
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public boolean update(ReviewDTO review) {
        String sql = "UPDATE Reviews SET rating = ?, comment = ? WHERE reviewId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            
            stmt.setInt(1, review.getRating());
            stmt.setString(2, review.getComment());
            stmt.setInt(3, review.getReviewId());
            
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(int reviewId) {
        String sql = "DELETE FROM Reviews WHERE reviewId = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            
            stmt.setInt(1, reviewId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
