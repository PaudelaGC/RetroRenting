/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.retrorenting.retrorenting.controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Address;
import model.User;
import model.persist.AddressDao;
import model.persist.UsersDao;

/**
 *
 * @author 39348
 */
@WebServlet(name = "UserProfileServlet", urlPatterns = {"/UserProfileServlet"})
public class UserProfileServlet extends HttpServlet {

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
        HttpSession session = request.getSession();

        // Obtención del parámetro 'profile' y manejo de la sesión/token
        String profile = request.getParameter("profile");
        if (profile != null && profile.equals("self")) {
            request.setAttribute("profile", profile);
        }
        String token = (String) session.getAttribute("token");
        if (token != null) {
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
        }

        // Obtención del ID del usuario desde los parámetros o desde el token si es necesario
        String userIdStr = request.getParameter("userId"); // Obtener el userId como parámetro

        int userId;
        try {
            userId = Integer.parseInt(userIdStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("login.jsp"); // Redirigir si el ID no es válido
            return;
        }

        // Búsqueda del usuario en la base de datos
        UsersDao userDao = new UsersDao();
        User user = userDao.getUserById(userId);

        if (user != null) {
            AddressDao addressDao = new AddressDao();
            Address address = addressDao.findAddressById(user.getIdAddress()); // Obtén la dirección usando AddressDao
            
            request.setAttribute("user", user);
            request.setAttribute("address", address); // Envía el objeto Address como un atributo separado

        } else {
            request.setAttribute("errorMessage", "Usuario no encontrado.");
            response.sendRedirect("login.jsp"); // Redirigir si el usuario no se encuentra
            return;
        }

    // Enviar a la página de perfil
    RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
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
