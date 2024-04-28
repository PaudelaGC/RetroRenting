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
import model.Post;
import model.Request;
import model.persist.PostsDao;
import model.persist.RequestsDao;
import java.util.HashMap;
import java.util.Map;
import model.persist.StatusDao;
import model.persist.UsersDao;

/**
 *
 * @author 39348
 */
@WebServlet(name = "RequestManagerServlet", urlPatterns = {"/RequestManagerServlet"})
public class RequestManagerServlet extends HttpServlet {

    RequestsDao requestDao = new RequestsDao();
    PostsDao postDao = new PostsDao();
    StatusDao statusDao = new StatusDao();
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("requestManager.jsp");
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
        int userId = Integer.parseInt(request.getParameter("userId"));
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        List<Request> allRequests = requestDao.listRequests();
        List<Map<String, Object>> myRequests = new ArrayList<>();
        List<Map<String, Object>> othersRequests = new ArrayList<>();
        for (Request requestEntry : allRequests) {
            Map<String, Object> requestSummary = new HashMap<>();
            requestSummary.put("id", requestEntry.getId());
            requestSummary.put("status", statusDao.findStatusById(requestEntry.getIdStatus()).getName());
            requestSummary.put("userRequester", userDao.searchUser(requestEntry.getIdUser()).getName());
            requestSummary.put("itemTitle", postDao.findPostById(requestEntry.getIdPost()).getTitle());
            requestSummary.put("propietary", userDao.searchUser(postDao.findPostById(requestEntry.getIdPost()).getIdUser()).getName());
            requestSummary.put("date", requestEntry.getRequestDate());
            if (requestEntry.getIdUser() == userId) {
                myRequests.add(requestSummary);
            } else if (userId == userDao.searchUser(postDao.findPostById(requestEntry.getIdPost()).getIdUser()).getId() && requestSummary.get("status").equals("Pending")) {
                othersRequests.add(requestSummary);
            }
        }
        if (othersRequests.isEmpty()) {
            othersRequests = null;
        }
        if (myRequests.isEmpty()) {
            myRequests = null;
        }
        request.setAttribute("othersRequests", othersRequests);
        request.setAttribute("myRequests", myRequests);
        RequestDispatcher dispatcher = request.getRequestDispatcher("requestManager.jsp");
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
        int requesterId = Integer.parseInt(request.getParameter("userId"));
        int postId = Integer.parseInt(request.getParameter("postId"));
        boolean denied = false;
        List<Request> requestList = requestDao.listRequests();
        Post post = postDao.findPostById(postId);
        if (post.getIdUser() == requesterId) {
            denied = true;
            request.setAttribute("denied1", "You can't request your own product!");
        }
        for (Request requestEntry : requestList) {
            if (requestEntry.getIdUser() == requesterId && requestEntry.getIdPost() == postId && (requestEntry.getIdStatus() == 1 || requestEntry.getIdStatus() == 3)) {
                denied = true;
                request.setAttribute("denied2", "There is already a pending request!");
            }
        }
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        if (!denied) {
            List<Request> allRequests = requestDao.listRequests();
            List<Map<String, Object>> myRequests = new ArrayList<>();
            List<Map<String, Object>> othersRequests = new ArrayList<>();
            for (Request requestEntry : allRequests) {
                Map<String, Object> requestSummary = new HashMap<>();
                requestSummary.put("id", requestEntry.getId());
                requestSummary.put("status", statusDao.findStatusById(requestEntry.getIdStatus()).getName());
                requestSummary.put("userRequester", userDao.searchUser(requestEntry.getIdUser()).getName());
                requestSummary.put("itemTitle", postDao.findPostById(requestEntry.getIdPost()).getTitle());
                requestSummary.put("propietary", userDao.searchUser(postDao.findPostById(requestEntry.getIdPost()).getIdUser()).getName());
                requestSummary.put("date", requestEntry.getRequestDate());
                if (requestEntry.getIdUser() == requesterId) {
                    myRequests.add(requestSummary);
                } else if (requesterId == userDao.searchUser(postDao.findPostById(requestEntry.getIdPost()).getIdUser()).getId() && requestSummary.get("status").equals("Pending")) {
                    othersRequests.add(requestSummary);
                }
            }
            if (othersRequests.isEmpty()) {
                othersRequests = null;
            }
            if (myRequests.isEmpty()) {
                myRequests = null;
            }
            request.setAttribute("othersRequests", othersRequests);
            request.setAttribute("myRequests", myRequests);
            Request newRequest = new Request(requesterId, postId);
            requestDao.addRequest(newRequest);
            RequestDispatcher dispatcher = request.getRequestDispatcher("requestManager.jsp");
            dispatcher.forward(request, response);
        } else {
            request.setAttribute("post", post);
            RequestDispatcher dispatcher = request.getRequestDispatcher("paymentForm.jsp");
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
