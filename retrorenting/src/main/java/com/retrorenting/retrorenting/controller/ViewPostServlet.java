package com.retrorenting.retrorenting.controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.persist.PostsDao;
import model.Post;
import model.persist.UsersDao;
import model.User;

@WebServlet(name = "ViewPostServlet", urlPatterns = {"/ViewPostServlet"})
public class ViewPostServlet extends HttpServlet {

    PostsDao postDao = new PostsDao();
    UsersDao userDao = new UsersDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String postId = request.getParameter("postId");
        Post selectedPost = postDao.findPostById(Integer.parseInt(postId));
        User userFromPost = userDao.searchUser(selectedPost.getIdUser());
        request.setAttribute("post", selectedPost);
        request.setAttribute("user", userFromPost);
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewPost.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
