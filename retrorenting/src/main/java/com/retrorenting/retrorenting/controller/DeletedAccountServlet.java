package com.retrorenting.retrorenting.controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Post;
import model.Request;
import model.persist.AddressDao;
import model.persist.ModelView;
import model.persist.PostsDao;
import model.persist.RequestsDao;
import model.persist.UsersDao;

@WebServlet(name = "DeletedAccountServlet", urlPatterns = {"/DeletedAccountServlet"})
public class DeletedAccountServlet extends HttpServlet {

    ModelView MV = new ModelView();
    PostsDao postDao = new PostsDao();
    UsersDao userDao = new UsersDao();
    AddressDao addressDao = new AddressDao();
    RequestsDao requestDao = new RequestsDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        int userId = Integer.parseInt(request.getParameter("userId"));
        List<Request> allRequests = requestDao.listRequests();
        for (Request req : allRequests) {
            if (req.getIdUser() == userId || postDao.findPostById(req.getIdPost()).getIdUser() == userId) {
                requestDao.deleteRequest(req.getId());
            }
        }
        List<Post> posts = MV.listPostsByUser(userId);
        for (Post post : posts) {
            postDao.deletePost(post.getId());
        }
        int userAddress = userDao.getUserById(userId).getIdAddress();
        userDao.deleteUser(userId);
        addressDao.deleteAddress(userAddress);
        posts = postDao.listPosts();
        request.setAttribute("postsList", posts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
