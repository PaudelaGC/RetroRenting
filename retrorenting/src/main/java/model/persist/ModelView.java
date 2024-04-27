/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.persist;

import com.retrorenting.retrorenting.configuration.db.DbConnect;
import model.Post;
import model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ModelView {

    private DbConnect dbConnect;

    public ModelView() {
        this.dbConnect = new DbConnect();
    }

    // Listar posts con detalles del usuario
    public List<Post> listPostsByUser(int userId) {
        List<Post> posts = new ArrayList<>();
        String query = "SELECT p.*, u.id AS userId, u.name, u.surname, u.email FROM retrorenting.posts p JOIN retrorenting.users u ON p.idUser = u.id WHERE u.id = ?;";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query)) {
            stmt.setInt(1, userId); // Establecer el ID del usuario
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("userId"));
                    user.setName(rs.getString("name"));
                    user.setSurname(rs.getString("surname"));
                    user.setEmail(rs.getString("email"));

                    Post post = new Post();
                    post.setId(rs.getInt("id"));
                    post.setTitle(rs.getString("title"));
                    post.setDescription(rs.getString("description"));
                    post.setImage(rs.getString("image"));
                    post.setPrice(rs.getDouble("price"));
                    post.setDuration(rs.getInt("duration"));
                    post.setAvailable(rs.getBoolean("available"));
                    post.setLastRentDate(rs.getDate("lastRentDate"));
                    post.setLastReturnDate(rs.getDate("lastReturnDate"));

                    posts.add(post);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return posts;
    }

    public List<Post> listAllPostsWithUsers() {
        List<Post> posts = new ArrayList<>();
        // Define la consulta SQL para obtener los datos requeridos de las tablas de posts y users
        String query = "SELECT p.title, p.description, p.price, p.duration, p.available, p.image, u.name, u.surname "
                + "FROM retrorenting.posts p "
                + "JOIN retrorenting.users u ON p.idUser = u.id;";
        try (Connection conn = dbConnect.getConnection(); PreparedStatement stmt = conn.prepareStatement(query); ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                // Crea un nuevo objeto Post
                Post post = new Post();
                post.setTitle(rs.getString("title"));
                post.setDescription(rs.getString("description"));
                post.setPrice(rs.getDouble("price"));
                post.setDuration(rs.getInt("duration"));
                post.setAvailable(rs.getBoolean("available"));
                post.setImage(rs.getString("image"));

                // Crea un nuevo objeto User y lo asocia al Post
                User user = new User();
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));

                // Agrega el post a la lista de posts
                posts.add(post);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return posts;
    }

}
