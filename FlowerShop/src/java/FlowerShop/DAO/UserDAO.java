package FlowerShop.DAO;

import FlowerShop.DTO.UserDTO;
import FlowerShop.Utils.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UserDAO {
    
    public UserDTO login(String username, String password) {
         String sql = "SELECT id, email, username, password, phone, role FROM Users WHERE username = ? and password = ?";
         try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new UserDTO(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("role")
                    );
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    };
    
    public List<UserDTO> list() {
        List<UserDTO> userList = new ArrayList<>();
        String sql = "SELECT id, email, username, password, phone, role FROM Users";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                userList.add(new UserDTO(
                    rs.getInt("id"),
                    rs.getString("email"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getString("phone"),
                    rs.getString("role")
                ));
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return userList;
    }
    
    public UserDTO load(int id) {
        String sql = "SELECT id, email, username, password, phone, role FROM Users WHERE id = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return new UserDTO(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("role")
                    );
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int insert(UserDTO user) {
        String sql = "INSERT INTO Users (email, username, password, phone, role) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, user.getEmail());
            stmt.setString(2, user.getUsername());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getPhone());
            stmt.setString(5, user.getRole());
            
            int affectedRows = stmt.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        return generatedKeys.getInt(1);
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
    
    public boolean update(int id, String email, String username, String phone, String role) {
        String sql = "UPDATE Users SET email = ?, username = ?, phone = ?, role = ? WHERE id = ?";

        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, email);
            stmt.setString(2, username);
            stmt.setString(3, phone);
            stmt.setString(4, role);
            stmt.setInt(5, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    
    public boolean delete(int id) {
        String sql = "DELETE FROM Users WHERE id = ?";
        
        try (Connection con = DBUtils.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
