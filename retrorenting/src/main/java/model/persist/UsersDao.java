/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.User;


/**
 *
 * @author Nestor
 */
public class UsersDao {
    private final DbConnect dbConnect;
    
    public UsersDao(){
        dbConnect = new DbConnect();
    }
    
private User fromResultSet(ResultSet rs) throws SQLException {
    Address address = new Address(
        rs.getInt("address_id"), // Asumiendo que los campos de Address se prefijan o se unan correctamente en la consulta SQL
        rs.getString("street"),
        rs.getString("number"),
        rs.getString("block"),
        rs.getString("door"),
        rs.getString("floor"),
        rs.getString("postal_code"),
        rs.getString("city"),
        rs.getString("state"),
        rs.getString("country")
    );
    return new User(
        rs.getInt("id"),
        rs.getString("name"),
        rs.getString("surname"),
        rs.getString("mail"),
        rs.getString("password"),
        rs.getDate("birthdate"),
        address
    );
}

public List<User> listUsers() {
    List<User> result = new ArrayList<>();
    // Asume una JOIN con la tabla addresses
    String query = "SELECT users.*, addresses.id as address_id, addresses.street, addresses.number, addresses.block, addresses.door, addresses.floor, addresses.postal_code, addresses.city, addresses.state, addresses.country FROM users JOIN addresses ON users.idAddress = addresses.id;";
    try (Connection conn = dbConnect.getConnection();
         Statement st = conn.createStatement();
         ResultSet rs = st.executeQuery(query)) {
        while (rs.next()) {
            result.add(fromResultSet(rs));
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return result;
}

    
    public User searchUser(int id) {
        User result = null;
        String query = "SELECT * FROM users WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
             st.setInt(1, id);
             try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    result = fromResultSet(rs);
                }
        }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
        public int addUser(User user) {
        int id = 0;
        AddressDao addDao = new AddressDao();
                int addressId = addDao.addAddress(user.getAddress()); // Primero crea la dirección y obtén el ID.

        String query = "INSERT INTO users (name, surname, mail, password, birthdate, idAddress) VALUES (?, ?, ?, ?, ?, ?    );";
        try(Connection conn = dbConnect.getConnection();
                
                // insert de address user.adress
//            addredao dao.add(user.getAddress())    
                
                // idaddress -> user
                
                // insert de user
            
            PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, user.getName());
            st.setString(2, user.getSurname());
            st.setString(3, user.getMail());
            st.setString(4, user.getPassword());
            st.setDate(5, user.getBirthdate());
            st.setInt(6, addressId);
            int affectedRows = st.executeUpdate();
            if (affectedRows > 0){
                try(ResultSet rs = st.getGeneratedKeys()){
                    id = rs.getInt(1);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            id = 0;
        } return id;          
    }
    
    public boolean editUser (User user){
        boolean result = false;
        String query = "UPDATE users SET name = ?, surname = ?, mail = ?, password = ?, birthdate = ?, idAddress = id  WHERE id = ?;";
        try(Connection conn = dbConnect.getConnection();
            PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, user.getName());
            st.setString(2, user.getSurname());
            st.setString(3, user.getMail());
            st.setString(4, user.getPassword());
            st.setDate(5, new java.sql.Date(user.getBirthdate().getTime()));
            st.setInt(6, user.getAddress().getId()); // Usa getId() del objeto Address para obtener el idAddress
            st.setInt(7, user.getId());
            result = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } return result;          
    }
    
    public boolean deleteAddress (int id){
        boolean result = false;
        String query = "DELETE FROM users WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, id);
            result = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } return result;
    }
    
    
    
}
