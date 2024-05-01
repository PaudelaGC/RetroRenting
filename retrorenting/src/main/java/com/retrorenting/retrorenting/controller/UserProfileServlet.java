package com.retrorenting.retrorenting.controller;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.Post;
import model.User;
import model.persist.AddressDao;
import model.persist.PostsDao;
import model.persist.UsersDao;

@WebServlet(name = "UserProfileServlet", urlPatterns = {"/UserProfileServlet"})
public class UserProfileServlet extends HttpServlet {

    AddressDao addressDao = new AddressDao();
    PostsDao postDao = new PostsDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        String selfUserId = "";
        if (token != null) {
            Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(token).getBody();
            selfUserId = claims.getSubject();
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        String userId = request.getParameter("userId");
        int userIdInt = Integer.parseInt(userId);
        if (selfUserId.equals(userId)) {
            request.setAttribute("profile", "self");
        }
        UsersDao userDao = new UsersDao();
        User user = userDao.getUserById(userIdInt);
        if (user != null) {
            Address address = addressDao.findAddressById(user.getIdAddress());
            List<Post> posts = postDao.listPosts();
            List<Post> postsFromUser = new ArrayList<>();
            for (Post post : posts) {
                if (post.getIdUser() == userIdInt) {
                    postsFromUser.add(post);
                }
            }
            request.setAttribute("postsList", postsFromUser);
            request.setAttribute("user", user);
            request.setAttribute("address", address);
        } else {
            request.setAttribute("errorMessage", "Usuario no encontrado.");
            response.sendRedirect("login.jsp");
            return;
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
