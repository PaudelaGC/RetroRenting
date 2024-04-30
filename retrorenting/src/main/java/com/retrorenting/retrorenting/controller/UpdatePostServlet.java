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
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Address;
import model.Post;
import model.Request;
import model.User;
import model.persist.AddressDao;
import model.persist.PostsDao;
import model.persist.RequestsDao;
import model.persist.UsersDao;

/**
 *
 * @author Mi Pc
 */
@WebServlet(name = "UpdatePostServlet", urlPatterns = {"/UpdatePostServlet"})
public class UpdatePostServlet extends HttpServlet {

    PostsDao postDao = new PostsDao();
    RequestsDao requestDao = new RequestsDao();
    UsersDao userDao = new UsersDao();
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
        response.setContentType("text/html;charset=UTF-8");
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
        response.setContentType("text/html;charset=UTF-8");
        boolean denied = false;
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        int userId = Integer.parseInt(request.getParameter("userId"));
        request.setAttribute("userId", userId);
        int postId = Integer.parseInt(request.getParameter("postId"));
        List<Request> allRequests = requestDao.listRequests();
        for (Request req : allRequests) {
            if (req.getIdPost() == postId && req.getIdStatus() == 3) {
                denied = true;
                request.setAttribute("denied", "denied");
            }
        }
        if (denied) {
            Address address = addressDao.findAddressById(userId);
            List<Post> posts = postDao.listPosts();
            List<Post> postsFromUser = new ArrayList<>();
            for (Post post : posts) {
                if (post.getIdUser() == userId) {
                    postsFromUser.add(post);
                }
            }
            request.setAttribute("postsList", postsFromUser);
            request.setAttribute("user", userDao.getUserById(userId));
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
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
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
                request.setAttribute("denied1", "El precio debe ser como mínimo 1€!");
            }
            postToModify.setPrice(Double.parseDouble(request.getParameter("price")));
        }
        if (!request.getParameter("duration").equals("")) {
            if (Integer.parseInt(request.getParameter("duration")) < 1) {
                denied = true;
                request.setAttribute("denied2", "La duración del alquilar debe ser como mínimo 1 dia!");
            }
            postToModify.setDuration(Integer.parseInt(request.getParameter("duration")));
        }
        if (!denied) {
            postDao.updatePost(postToModify);
            User user = userDao.getUserById(postToModify.getIdUser());
            Address address = addressDao.findAddressById(user.getIdAddress()); // Obtén la dirección usando AddressDao
            List<Post> posts = postDao.listPosts();
            List<Post> postsFromUser = new ArrayList<>();
            for (Post post : posts) {
                if (post.getIdUser() == postToModify.getIdUser()) {
                    postsFromUser.add(post);
                }
            }
            request.setAttribute("postsList", postsFromUser);
            request.setAttribute("user", user);
            request.setAttribute("userId", postToModify.getIdUser());
            request.setAttribute("address", address);
            RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("uploadPost.jsp");
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
