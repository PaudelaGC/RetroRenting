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
import model.Request;
import model.User;
import model.persist.AddressDao;
import model.persist.ModelView;
import model.persist.PostsDao;
import model.persist.RequestsDao;
import model.persist.UsersDao;

@WebServlet(name = "UpdatePostServlet", urlPatterns = {"/UpdatePostServlet"})
public class UpdatePostServlet extends HttpServlet {

    PostsDao postDao = new PostsDao();
    RequestsDao requestDao = new RequestsDao();
    UsersDao userDao = new UsersDao();
    AddressDao addressDao = new AddressDao();
    ModelView MV = new ModelView();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        boolean denied = false;
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
        request.setAttribute("userId", userIdInt);
        int postId = Integer.parseInt(request.getParameter("postId"));
        List<Request> allRequests = requestDao.listRequests();
        for (Request req : allRequests) {
            if (req.getIdPost() == postId && req.getIdStatus() == 3) {
                denied = true;
                request.setAttribute("denied", "denied");
            }
        }
        if (denied) {
            Address address = addressDao.findAddressById(userIdInt);
            List<Post> posts = postDao.listPosts();
            List<Post> postsFromUser = new ArrayList<>();
            for (Post post : posts) {
                if (post.getIdUser() == userIdInt) {
                    postsFromUser.add(post);
                }
            }
            if (selfUserId.equals(userId)) {
                request.setAttribute("profile", "self");
            }
            request.setAttribute("postsList", postsFromUser);
            request.setAttribute("user", userDao.getUserById(userIdInt));
            request.setAttribute("address", address);
            RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            Post postToModify = postDao.findPostById(postId);
            request.setAttribute("post", postToModify);
            RequestDispatcher dispatcher = request.getRequestDispatcher("updatePost.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
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
        request.setAttribute("userId", userId);
        int postId = Integer.parseInt(request.getParameter("postId"));
        Post postToModify = postDao.findPostById(postId);
        boolean denied = false;
        if (!request.getParameter("title").equals("")) {
            postToModify.setTitle(request.getParameter("title"));
        }
        if (!request.getParameter("description").equals("")) {
            postToModify.setDescription(request.getParameter("description"));
        }
        if (!request.getParameter("price").equals("")) {
            if (Double.parseDouble(request.getParameter("price")) < 1) {
                denied = true;
                request.setAttribute("denied1", "¡El precio debe ser como mínimo 1€!");
            }
            postToModify.setPrice(Double.parseDouble(request.getParameter("price")));
        }
        if (!request.getParameter("duration").equals("")) {
            if (Integer.parseInt(request.getParameter("duration")) < 1) {
                denied = true;
                request.setAttribute("denied2", "¡La duración del alquiler debe ser como mínimo 1 dia!");
            }
            postToModify.setDuration(Integer.parseInt(request.getParameter("duration")));
        }
        if (!denied) {
            postDao.updatePost(postToModify);
            User user = userDao.getUserById(postToModify.getIdUser());
            Address address = addressDao.findAddressById(user.getIdAddress());
            List<Post> posts = MV.listPostsByUser(Integer.parseInt(userId));
            if (selfUserId.equals(userId)) {
                request.setAttribute("profile", "self");
            }
            request.setAttribute("postsList", posts);
            request.setAttribute("user", user);
            request.setAttribute("userId", userId);
            request.setAttribute("address", address);
            RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("updatePost.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
