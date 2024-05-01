/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.retrorenting.retrorenting.controller;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
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

/**
 *
 * @author Mi Pc
 */
@WebServlet(name = "DeletePostServlet", urlPatterns = {"/DeletePostServlet"})
public class DeletePostServlet extends HttpServlet {

    ModelView MV = new ModelView();
    RequestsDao requestDao = new RequestsDao();
    PostsDao postDao = new PostsDao();
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

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeletePostServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeletePostServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
