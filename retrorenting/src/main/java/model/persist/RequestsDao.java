/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Request;

public class RequestsDao {
    private final DbConnect dbConnect;
    private final UsersDao userDao;
    private final PostsDao postDao;
    private final StatusDao statusDao;

    public RequestsDao() {
        dbConnect = new DbConnect();
        userDao = new UsersDao();
        postDao = new PostsDao();
        statusDao = new StatusDao();
    }

    // Añadir un nuevo request
    public boolean addRequest(Request request) {
        boolean result = false;
        String query = "INSERT INTO requests (idStatus, idUser, idPost, requestDate) VALUES (?, ?, ?, ?);";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, request.getStatus().getId());
            stmt.setInt(2, request.getUser().getId());
            stmt.setInt(3, request.getPost().getId());
            stmt.setDate(4, new java.sql.Date(request.getResquestDate().getTime()));
            result = stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    // Listar todos los requests
    public List<Request> listRequests() {
        List<Request> requests = new ArrayList<>();
        String query = "SELECT * FROM requests;";
        try (Connection conn = dbConnect.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Request request = new Request();
                request.setId(rs.getInt("id"));
                request.setStatus(statusDao.findStatusById(rs.getInt("idStatus")));
                request.setUser(userDao.findUserById(rs.getInt("idUser")));
                request.setPost(postDao.findPostById(rs.getInt("idPost")));
                request.setResquestDate(rs.getDate("requestDate"));
                requests.add(request);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return requests;
    }

    // Buscar un request por ID
    public Request findRequestById(int id) {
        Request request = null;
        String query = "SELECT * FROM requests WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request = new Request();
                request.setId(rs.getInt("id"));
                request.setStatus(statusDao.findStatusById(rs.getInt("idStatus")));
                request.setUser(userDao.findUserById(rs.getInt("idUser")));
                request.setPost(postDao.findPostById(rs.getInt("idPost")));
                request.setResquestDate(rs.getDate("requestDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return request;
    }

    // Actualizar un request
    public boolean updateRequest(Request request) {
        boolean result = false;
        String query = "UPDATE requests SET idStatus = ?, idUser = ?, idPost = ?, requestDate = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, request.getStatus().getId());
            stmt.setInt(2, request.getUser().getId());
            stmt.setInt(3, request.getPost().getId());
            stmt.setDate(4, new java.sql.Date(request.getResquestDate().getTime()));
            stmt.setInt(5, request.getId());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Eliminar un request
    public boolean deleteRequest(int id) {
        boolean result = false;
        String query = "DELETE FROM requests WHERE id = ?;";
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

