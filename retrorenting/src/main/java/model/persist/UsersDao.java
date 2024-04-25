package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.User;

public class UsersDao {
    private final DbConnect dbConnect;
    
    public UsersDao() {
        dbConnect = new DbConnect();
    }
    public Integer loginUser(String email, String password) {
    Integer userId = null;
    String query = "SELECT id FROM users WHERE mail = ? AND password = ?;";
    try (Connection conn = dbConnect.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query)) {
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            userId = rs.getInt("id");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return userId;
}


    public List<User> listUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users;";
        try (Connection conn = dbConnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setMail(rs.getString("mail"));
                user.setPassword(rs.getString("password"));
                user.setBirthdate(rs.getDate("birthdate"));
                Address address = new Address(); // Crea una nueva instancia de Address
                address.setId(rs.getInt("idAddress")); // Asigna solo el ID del Address
                user.setAddress(address); // Asigna el objeto Address al usuario
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }


 public User searchUser(int id) {
        User user = null;
        String query = "SELECT * FROM users WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id")); // esto es necesario?
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setMail(rs.getString("mail"));
                user.setPassword(rs.getString("password"));
                user.setBirthdate(rs.getDate("birthdate"));
                Address address = new Address(); // Crea una nueva instancia de Address
                address.setId(rs.getInt("idAddress")); // Asigna solo el ID del Address
                user.setAddress(address); // Asigna el objeto Address al usuario
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean addUser(User user) {
        boolean result = false;
        String query = "INSERT INTO users (name, surname, mail, password, birthdate, idAddress) VALUES (?, ?, ?, ?, ?, ?);";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getSurname());
            stmt.setString(3, user.getMail());
            stmt.setString(4, user.getPassword());
            stmt.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
            stmt.setInt(6, user.getAddress().getId()); // Asignar directamente el idAddress
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean editUser(User user) {
        boolean result = false;
        String query = "UPDATE users SET name = ?, surname = ?, mail = ?, password = ?, birthdate = ?, idAddress = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getSurname());
            stmt.setString(3, user.getMail());
            stmt.setString(4, user.getPassword());
            stmt.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
            stmt.setInt(6, user.getAddress().getId()); // Asignar directamente el idAddress
            stmt.setInt(7, user.getId());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean deleteUser(int id) {
        boolean result = false;
        String query = "DELETE FROM users WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            result = stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
}
