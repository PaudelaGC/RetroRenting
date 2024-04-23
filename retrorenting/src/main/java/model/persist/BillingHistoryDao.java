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
import model.BillingHistory;
import model.User;

public class BillingHistoryDao {
    private final DbConnect dbConnect;
    
    public BillingHistoryDao(){
        dbConnect = new DbConnect();
    }
    
    private BillingHistory fromResultSet(ResultSet rs)throws SQLException{
        return new BillingHistory(
                rs.getInt("id"),
                rs.getInt("idStatus"),
                rs.getInt("idUser"),
                rs.getInt("idPost"),
                rs.getDate("requestDate")
        );
    }
    
    public List<BillingHistory> listBillingHistory(){
        List<BillingHistory> result = new ArrayList<>();
        String query = "SELECT * FROM billing_history;";
        try (Connection conn = dbConnect.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(query)) {
            while(rs.next()) {
                result.add(fromResultSet(rs));
            }    
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
    
    public BillingHistory searchBillingHistory(int id) {
        BillingHistory result = null;
        String query = "SELECT * FROM billing_history WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement st = conn.prepareStatement(query)) {
            st.setInt(1, id);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()){
                    result = fromResultSet(rs);
                }
            }
            
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;    
    }
    
    public boolean addBillingHistory(BillingHistory billingHistory){
        boolean result = false;
        String query = "INSERT INTO billing_history (id, idStatus, idUser, idPost, requestDate) VALUES (?, ?, ?, ?);";
        
        // insert de idStatus, idUser y idPost 
        int idUser = addUser(billingHistory.getUser());
        UsersDao.user(billingHistory.getUser());
    }

}
