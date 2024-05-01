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
import java.util.List;
import model.Address;
import model.Post;
import model.Request;
import model.persist.AddressDao;
import model.persist.ModelView;
import model.persist.PostsDao;
import model.persist.RequestsDao;
import model.persist.UsersDao;

@WebServlet(name = "DeletePostServlet", urlPatterns = {"/DeletePostServlet"})
public class DeletePostServlet extends HttpServlet {

    ModelView MV = new ModelView();
    RequestsDao requestDao = new RequestsDao();
    PostsDao postDao = new PostsDao();
    UsersDao userDao = new UsersDao();
    AddressDao addressDao = new AddressDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
        int userIdInt = Integer.parseInt(userId);
        if (selfUserId.equals(userId)) {
            request.setAttribute("profile", "self");
        }
        request.setAttribute("userId", userId);
        int postId = Integer.parseInt(request.getParameter("postId"));
        List<Request> allRequests = requestDao.listRequests();
        for (Request req : allRequests) {
            if (req.getIdPost() == postId) {
                requestDao.deleteRequest(req.getId());
            }
        }
        postDao.deletePost(postId);
        List<Post> posts = MV.listPostsByUser(userIdInt);
        Address address = addressDao.findAddressById(userDao.getUserById(userIdInt).getIdAddress());
        request.setAttribute("postsList", posts);
        request.setAttribute("user", userDao.getUserById(userIdInt));
        request.setAttribute("address", address);
        RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
