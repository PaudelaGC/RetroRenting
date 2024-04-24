package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.BillingHistory;
import model.Request;

public class BillingHistoryDao {
    private final DbConnect dbConnect;

    public BillingHistoryDao() {
        dbConnect = new DbConnect();
    }

    private BillingHistory fromResultSet(ResultSet rs) throws SQLException {
        RequestsDao requestDao = new RequestsDao();
        int requestId = rs.getInt("idRequest");
        Request request = requestDao.searchRequest(requestId);
        return new BillingHistory(
            rs.getInt("id"),
            request,
            rs.getDate("billingDate")
        );
    }

    public List<BillingHistory> listAllBillingHistory() {
        List<BillingHistory> billingHistories = new ArrayList<>();
        String query = "SELECT * FROM billing_history;";
        try (Connection conn = dbConnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                billingHistories.add(fromResultSet(rs));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return billingHistories;
    }

    public BillingHistory searchBillingHistory(int id) {
        BillingHistory billingHistory = null;
        String query = "SELECT * FROM billing_history WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                billingHistory = fromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return billingHistory;
    }

    public boolean addBillingHistory(BillingHistory billingHistory) {
        boolean result = false;
        String query = "INSERT INTO billing_history (idRequest, billingDate) VALUES (?, ?);";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, billingHistory.getRequest().getId());
            stmt.setDate(2, new java.sql.Date(billingHistory.getBillingDate().getTime()));
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean updateBillingHistory(BillingHistory billingHistory) {
        boolean result = false;
        String query = "UPDATE billing_history SET idRequest = ?, billingDate = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, billingHistory.getRequest().getId());
            stmt.setDate(2, new java.sql.Date(billingHistory.getBillingDate().getTime()));
            stmt.setInt(3, billingHistory.getId());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    public boolean deleteBillingHistory(int id) {
        boolean result = false;
        String query = "DELETE FROM billing_history WHERE id = ?;";
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
