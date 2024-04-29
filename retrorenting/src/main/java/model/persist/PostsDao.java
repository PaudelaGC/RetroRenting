/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Post;

public class PostsDao {

    private final DbConnect dbConnect;

    public PostsDao() {
        dbConnect = new DbConnect();
    }

    // Añadir un nuevo post
    public boolean addPost(Post post) {
        boolean result = false;
        String query = "INSERT INTO posts (idUser, title, description, image, price, duration, available, lastRentDate, lastReturnDate) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?);";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(2, post.getTitle());
            stmt.setString(3, post.getDescription());
            stmt.setString(4, post.getImage());
            stmt.setDouble(5, post.getPrice());
            stmt.setInt(6, post.getDuration());
            stmt.setBoolean(7, post.isAvailable());
            stmt.setDate(8, new java.sql.Date(post.getLastRentDate().getTime()));
            stmt.setDate(9, post.getLastReturnDate() != null ? new java.sql.Date(post.getLastReturnDate().getTime()) : null);
            result = stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }

    // Listar todos los posts
    public List<Post> listPosts() {
        List<Post> posts = new ArrayList<>();
        String query = "SELECT id, title, image, price, duration, available, idUser, lastRentDate, lastReturnDate FROM posts;";
        try (Connection conn = dbConnect.getConnection(); Statement stmt = conn.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt("id"));
                post.setTitle(rs.getString("title"));
                post.setImage(rs.getString("image"));
                post.setPrice(rs.getDouble("price"));
                post.setDuration(rs.getInt("duration"));
                post.setAvailable(rs.getBoolean("available"));
                post.setLastRentDate(rs.getDate("lastRentDate"));
                post.setLastReturnDate(rs.getDate("lastReturnDate"));
                posts.add(post);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return posts;
    }

    // Buscar un post por ID
    public Post findPostById(int id) {
        Post post = null;
        String query = "SELECT * FROM posts WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                post = new Post();
                post.setId(rs.getInt("id"));
                post.setIdUser(rs.getInt("idUser"));
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setImage(rs.getString("image"));
                post.setPrice(rs.getDouble("price"));
                post.setDuration(rs.getInt("duration"));
                post.setAvailable(rs.getBoolean("available"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return post;
    }

    // Actualizar un post
    public boolean updatePost(Post post) {
        boolean result = false;
        String query = "UPDATE posts SET title = ?, description = ?, image = ?, price = ?, duration = ?, available = ?, lastRentDate = ?, lastReturnDate = ? WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getDescription());
            stmt.setString(3, post.getImage());
            stmt.setDouble(4, post.getPrice());
            stmt.setInt(5, post.getDuration());
            stmt.setBoolean(6, post.isAvailable());
            java.util.Date utilDate1 = post.getLastRentDate();
            java.sql.Date sqlDate1 = new java.sql.Date(utilDate1.getTime());
            stmt.setDate(7, sqlDate1);
            java.util.Date utilDate2 = post.getLastReturnDate();
            java.sql.Date sqlDate2 = new java.sql.Date(utilDate2.getTime());
            stmt.setDate(8, sqlDate2);
            stmt.setInt(9, post.getId());
            result = stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

    // Eliminar un post
    public boolean deletePost(int id) {
        boolean result = false;
        String query = "DELETE FROM posts WHERE id = ?;";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, id);
            result = stmt.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return result;
    }
}
