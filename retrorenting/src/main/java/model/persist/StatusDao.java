package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Status;

public class StatusDao {
    private final DbConnect dbConnect;

    public StatusDao() {
        dbConnect = new DbConnect();
    }

    // Obtener un estado por ID
    public Status findStatusById(int id) {
        Status status = null;
        String query = "SELECT * FROM status WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                status = new Status();
                status.setId(rs.getInt("id"));
                status.setName(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Listar todos los estados
    public List<Status> listAllStatuses() {
        List<Status> statuses = new ArrayList<>();
        String query = "SELECT * FROM status;";
        try (Connection conn = dbConnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Status status = new Status();
                status.setId(rs.getInt("id"));
                status.setName(rs.getString("name"));
                statuses.add(status);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return statuses;
    }

    // Agregar un nuevo estado
    public boolean addStatus(Status status) {
        boolean result = false;
        String query = "INSERT INTO status (name) VALUES (?);";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status.getName());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Actualizar un estado
    public boolean updateStatus(Status status) {
        boolean result = false;
        String query = "UPDATE status SET name = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, status.getName());
            stmt.setInt(2, status.getId());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Eliminar un estado
    public boolean deleteStatus(int id) {
        boolean result = false;
        String query = "DELETE FROM status WHERE id = ?;";
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

