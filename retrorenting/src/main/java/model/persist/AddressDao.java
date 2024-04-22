/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/*
*
* Author Nestor
*/
package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Address;

public class AddressDao {

    private final DbConnect dbConnect;

    public AddressDao() {
        dbConnect = new DbConnect();
    }

    private Address fromResultSet(ResultSet rs) throws SQLException {
        return new Address(
            rs.getInt("id"),
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
    }

    public List<Address> listAddresses() {
        List<Address> result = new ArrayList<>();
        String query = "SELECT * FROM addresses;";
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

    public Address searchAddress(int id) {
        Address result = null;
        String query = "SELECT * FROM addresses WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    result = fromResultSet(rs);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public boolean addAddress(Address address) {
        boolean result = false;
        String query = "INSERT INTO addresses (street, number, block, door, floor, postal_code, city, state, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, address.getStreet());
            st.setString(2, address.getNumber());
            st.setString(3, address.getBlock());
            st.setString(4, address.getDoor());
            st.setString(5, address.getFloor());
            st.setString(6, address.getPostalCode());
            st.setString(7, address.getCity());
            st.setString(8, address.getState());
            st.setString(9, address.getCountry());
            result = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    public boolean editAddress(Address address) {
        boolean result = false;
        String query = "UPDATE addresses SET street = ?, number = ?, block = ?, door = ?, floor = ?, postal_code = ?, city = ?, state = ?, country = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setString(1, address.getStreet());
            st.setString(2, address.getNumber());
            st.setString(3, address.getBlock());
            st.setString(4, address.getDoor());
            st.setString(5, address.getFloor());
            st.setString(6, address.getPostalCode());
            st.setString(7, address.getCity());
            st.setString(8, address.getState());
            st.setString(9, address.getCountry());
            st.setInt(10, address.getId());
            result = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }return result;
    }

    public boolean deleteAddress(int id) {
        boolean result = false;
        String query = "DELETE FROM addresses WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, id);
            result = st.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } return result;
    }                                                                       
}

