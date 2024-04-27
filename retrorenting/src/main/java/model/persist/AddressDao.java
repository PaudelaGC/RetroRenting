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

    // List all addresses
    public List<Address> listAddresses() {
        List<Address> addresses = new ArrayList<>();
        String query = "SELECT * FROM addresses;";
        try (Connection conn = dbConnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Address address = new Address(
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
                addresses.add(address);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return addresses;
    }

    // Search an address by ID
    public Address findAddressById(int id) {
        Address address = null;
        String query = "SELECT * FROM addresses WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                address = new Address(
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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return address;
    }

    // Add a new address
    public int addAddress(Address address) {
    int addressId = -1; // Valor predeterminado en caso de error
    String query = "INSERT INTO addresses (street, number, block, door, floor, postal_code, city, state, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
    try (Connection conn = dbConnect.getConnection();
         PreparedStatement stmt = conn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
        stmt.setString(1, address.getStreet());
        stmt.setString(2, address.getNumber());
        stmt.setString(3, address.getBlock());
        stmt.setString(4, address.getDoor());
        stmt.setString(5, address.getFloor());
        stmt.setString(6, address.getPostalCode());
        stmt.setString(7, address.getCity());
        stmt.setString(8, address.getState());
        stmt.setString(9, address.getCountry());

        // Ejecutar la inserción
        int affectedRows = stmt.executeUpdate();

        // Verificar si se insertó correctamente y obtener el ID generado
        if (affectedRows == 1) {
            try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    addressId = generatedKeys.getInt(1); // Obtener el ID generado automáticamente
                } else {
                    throw new SQLException("Creating address failed, no ID obtained.");
                }
            }
        }
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
    return addressId;
}


    // Update an existing address
    public boolean updateAddress(Address address) {
        boolean result = false;
        String query = "UPDATE addresses SET street = ?, number = ?, block = ?, door = ?, floor = ?, postal_code = ?, city = ?, state = ?, country = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, address.getStreet());
            stmt.setString(2, address.getNumber());
            stmt.setString(3, address.getBlock());
            stmt.setString(4, address.getDoor());
            stmt.setString(5, address.getFloor());
            stmt.setString(6, address.getPostalCode());
            stmt.setString(7, address.getCity());
            stmt.setString(8, address.getState());
            stmt.setString(9, address.getCountry());
            stmt.setInt(10, address.getId());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Delete an address
    public boolean deleteAddress(int id) {
        boolean result = false;
        String query = "DELETE FROM addresses WHERE id = ?;";
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
