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
import model.User;
import model.persist.AddressDao;
import model.persist.ModelView;
import model.persist.UsersDao;

/**
 *
 * @author 39348
 */
@WebServlet(name = "EditProfileServlet", urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {

    UsersDao userDao = new UsersDao();
    AddressDao addressDao = new AddressDao();
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
        HttpSession session = request.getSession();
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }
        String userId = request.getParameter("userId");
        User user = userDao.getUserById(Integer.parseInt(userId));
        Address address = addressDao.findAddressById(user.getIdAddress());
        request.setAttribute("userId", userId);
        request.setAttribute("user", user);
        request.setAttribute("address", address);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editProfile.jsp");
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
        request.setAttribute("userId", userId);
        User userToEdit = userDao.getUserById(Integer.parseInt(userId));
        Address addressFromUser = addressDao.findAddressById(userToEdit.getIdAddress());
        if (!request.getParameter("name").equals("")) {
            userToEdit.setName(request.getParameter("name"));
        }
        if (!request.getParameter("surname").equals("")) {
            userToEdit.setSurname(request.getParameter("surname"));
        }
        if (!request.getParameter("street").equals("")) {
            addressFromUser.setStreet(request.getParameter("street"));
        }
        if (!request.getParameter("number").equals("")) {
            addressFromUser.setNumber(request.getParameter("number"));
        }
        if (!request.getParameter("block").equals("")) {
            addressFromUser.setBlock(request.getParameter("block"));
        }
        if (!request.getParameter("door").equals("")) {
            addressFromUser.setDoor(request.getParameter("door"));
        }
        if (!request.getParameter("floor").equals("")) {
            addressFromUser.setFloor(request.getParameter("floor"));
        }
        if (!request.getParameter("postalCode").equals("")) {
            addressFromUser.setPostalCode(request.getParameter("postalCode"));
        }
        if (!request.getParameter("city").equals("")) {
            addressFromUser.setCity(request.getParameter("city"));
        }
        if (!request.getParameter("state").equals("")) {
            addressFromUser.setState(request.getParameter("state"));
        }
        if (!request.getParameter("country").equals("")) {
            addressFromUser.setCountry(request.getParameter("country"));
        }
        if (selfUserId.equals(userId)) {
            request.setAttribute("profile", "self");
        }
        userDao.editUser(userToEdit);
        addressDao.updateAddress(addressFromUser);
        List<Post> posts = MV.listPostsByUser(Integer.parseInt(userId));
        if (selfUserId.equals(userId)) {
            request.setAttribute("profile", "self");
        }
        request.setAttribute("postsList", posts);
        request.setAttribute("user", userToEdit);
        request.setAttribute("userId", userId);
        request.setAttribute("address", addressFromUser);
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
