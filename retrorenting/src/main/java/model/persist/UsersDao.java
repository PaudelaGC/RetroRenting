/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect; 
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
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
    
    private User fromResultSet(ResultSet rs) throws SQLException{
        return new User(
            rs.getInt("id"),
            rs.getString("name"),
            rs.getString("surname"),
            rs.getString("mail"),
            rs.getString("password"),
            rs.getDate("birthdate"),
            rs.getInt("idAddress")
        );
    }
    
    public List<User> listUsers(){
        List<User> result = new ArrayList<>();
        String query = "SELECT * FROM users;";
        try (Connection conn = dbConnect.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            while (rs.next()){
                result.add(fromResultSet(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
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
    
        public boolean addUser(User user) {
        boolean result = false;
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
            st.setString(6, user.getidAddress());
            result = st.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        } return result;          
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
            st.setDate(5, user.getBirthdate());
            st.setString(6, user.getidAddress());
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
