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
                request.setAttribute("denied", "You can't modify posts that have been already accepted by you!");
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
            RequestDispatcher dispatcher = request.getRequestDispatcher("viewProfile.jsp");
            dispatcher.forward(request, response);
        } else {
            Post postToModify = postDao.findPostById(postId);
            request.setAttribute("title", postToModify.getTitle());
            request.setAttribute("description", postToModify.getDescription());
            request.setAttribute("price", (double) postToModify.getPrice());
            request.setAttribute("duration", postToModify.getDuration());
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
        processRequest(request, response);
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
