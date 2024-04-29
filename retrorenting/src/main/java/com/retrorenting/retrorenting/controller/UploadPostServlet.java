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
import model.persist.AddressDao;
import model.persist.PostsDao;
import model.persist.UsersDao;

/**
 *
 * @author 39348
 */
@WebServlet(name = "UploadPostServlet", urlPatterns = {"/UploadPostServlet"})
public class UploadPostServlet extends HttpServlet {
    
    PostsDao postDao = new PostsDao();
    AddressDao addressDao = new AddressDao();
    UsersDao userDao = new UsersDao();

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
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        request.setAttribute("userId", Integer.parseInt(request.getParameter("userId")));
        RequestDispatcher dispatcher = request.getRequestDispatcher("uploadPost.jsp");
        dispatcher.forward(request, response);
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
        processRequest(request, response);
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
        boolean denied = false;
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        int userId = Integer.parseInt(request.getParameter("userId"));
        request.setAttribute("userId", userId);
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String duration = request.getParameter("duration");
        if (Double.parseDouble(price) < 1) {
            denied = true;
            request.setAttribute("denied1", "El precio debe ser como mínimo 1€!");
        }
        if (Integer.parseInt(duration) < 1) {
            denied = true;
            request.setAttribute("denied2", "La duración del alquilar debe ser como mínimo 1 dia!");
        }
        if (denied) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("uploadPost.jsp");
            dispatcher.forward(request, response);
        } else {
            Post newPost = new Post(userId, title, description, Double.parseDouble(price), Integer.parseInt(duration));
            postDao.addPost(newPost);
            Address address = addressDao.findAddressById(userId);
            List<Post> posts = postDao.listPosts();
            List<Post> postsFromUser = new ArrayList<>();
            for(Post post : posts){
                if(post.getIdUser() == userId){
                    postsFromUser.add(post);
                }
            }
            request.setAttribute("postsList", postsFromUser);
            request.setAttribute("user", userDao.getUserById(userId));
            request.setAttribute("address", address);
            RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
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
