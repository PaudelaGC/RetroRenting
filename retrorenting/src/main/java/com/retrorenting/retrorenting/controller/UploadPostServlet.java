/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import model.persist.AddressDao;
import model.persist.ModelView;
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
    ModelView MV = new ModelView();

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
        request.setAttribute("userId", Integer.valueOf(request.getParameter("userId")));
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
        String selfUserId = "";
        boolean denied = false;
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
            Post newPost = new Post(userIdInt, title, description, Double.parseDouble(price), Integer.parseInt(duration));
            postDao.addPost(newPost);
            Address address = addressDao.findAddressById(userDao.getUserById(userIdInt).getIdAddress());
            List<Post> posts = MV.listPostsByUser(userIdInt);
            if (selfUserId.equals(userId)) {
                request.setAttribute("profile", "self");
            }
            request.setAttribute("postsList", posts);
            request.setAttribute("user", userDao.getUserById(userIdInt));
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
