/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.retrorenting.retrorenting.controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.Post;
import model.User;
import model.persist.AddressDao;
import model.persist.PostsDao;
import model.persist.UsersDao;

/**
 *
 * @author 39348
 */
@WebServlet(name = "LoginServlet2", urlPatterns = {"/LoginServlet2"})
public class LoginServlet2 extends HttpServlet {

    UsersDao userDao = new UsersDao();
    PostsDao postDao = new PostsDao();
    AddressDao addressDao = new AddressDao();


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("userId");
        String post = request.getParameter("postId");
        request.setAttribute("userId", user);
        request.setAttribute("postId", post);
        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Integer id = userDao.loginUser(email, password);
        String userId = "";
        if (id == null) {
            userId = "null";
        } else {
            userId = Integer.toString(id);
        }
        String user = request.getParameter("userId");
        String postId = request.getParameter("postId");
        if (!userId.equals("null")) {
            TokenService tokenService = new TokenService();
            String token = tokenService.createToken(userId);
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
            if (user.length() != 0) {
                Post selectedPost = postDao.findPostById(Integer.parseInt(postId));
                User userToLoad = userDao.getUserById(Integer.parseInt(user));
                Address address = addressDao.findAddressById(userToLoad.getIdAddress());
                List<Post> posts = postDao.listPosts();
                List<Post> postsFromUser = new ArrayList<>();
                for (Post post : posts) {
                    if (post.getIdUser() == Integer.parseInt(user)) {
                        postsFromUser.add(post);
                    }
                }
                request.setAttribute("postsList", postsFromUser);
                request.setAttribute("post", selectedPost);
                request.setAttribute("user", userToLoad);
                request.setAttribute("address", address);
                request.setAttribute("userId", user);
                RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
                dispatcher.forward(request, response);
            } else if (postId.length() != 0) {
                Post selectedPost = postDao.findPostById(Integer.parseInt(postId));
                request.setAttribute("post", selectedPost);
                RequestDispatcher dispatcher = request.getRequestDispatcher("paymentForm.jsp");
                dispatcher.forward(request, response);
            } else {
                List<Post> posts = postDao.listPosts();
                request.setAttribute("postsList", posts);
                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            request.setAttribute("denied", "denied");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
