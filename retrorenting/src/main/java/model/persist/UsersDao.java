package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.User;
import com.password4j.BcryptFunction;
import com.password4j.Password;

public class UsersDao {

    private final DbConnect dbConnect;

    public UsersDao() {
        dbConnect = new DbConnect();
    }

    public Integer loginUser(String email, String password) {
        Integer userId = null;
        String query = "SELECT id, password FROM users WHERE email = ?;";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                BcryptFunction bcrypt = BcryptFunction.getInstanceFromHash(hashedPassword);
                boolean verified = Password.check(password, hashedPassword).with(bcrypt);
                if (verified) {
                    userId = rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userId;
    }

    public Integer searchUserByEmail(String email) {
        String query = "SELECT * FROM users WHERE email = ?";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, email);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("id");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejar la excepción según sea necesario
        }
        return -1; // Devolver null si no se encontró ningún usuario con el correo electrónico dado
    }

    public User getUserById(int userId) {
        String query = "SELECT * FROM users WHERE id = ?;";
        User user = null;
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    user = new User();
                    user.setId(rs.getInt("id"));
                    user.setName(rs.getString("name"));
                    user.setSurname(rs.getString("surname"));
                    user.setEmail(rs.getString("email"));
                    user.setPassword(rs.getString("password"));
                    user.setBirthdate(rs.getDate("birthdate"));
                    user.setIdAddress(rs.getInt("idAddress"));
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    public List<User> listUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM users;";
        try (Connection conn = dbConnect.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setBirthdate(rs.getDate("birthdate"));
                Address address = new Address(); // Crea una nueva instancia de Address
                address.setId(rs.getInt("idAddress")); // Asigna solo el ID del Address
                // user.setAddress(address); // Asigna el objeto Address al usuario
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
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setBirthdate(rs.getDate("birthdate"));
                user.setIdAddress(rs.getInt("idAddress"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean addUser(User user) {
        boolean result = false;
        String query = "INSERT INTO users (name, surname, email, password, birthdate, idAddress) VALUES (?, ?, ?, ?, ?, ?);";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getSurname());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
            stmt.setInt(6, user.getIdAddress());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean editUser(User user) {
        boolean result = false;
        String query = "UPDATE users SET name = ?, surname = ?, email = ?, password = ?, birthdate = ?, idAddress = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getSurname());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
            stmt.setInt(6, user.getIdAddress()); // Asignar directamente el idAddress
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
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            result = stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
}
