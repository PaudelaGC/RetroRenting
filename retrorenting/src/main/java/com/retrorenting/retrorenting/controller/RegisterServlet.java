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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import model.Address;
import model.User;
import model.persist.UsersDao;
import model.persist.AddressDao;

/**
 *
 * @author 39348
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        String user = request.getParameter("usuario_id");
        String post = request.getParameter("publicacion_id");
        request.setAttribute("usuario_id", user);
        request.setAttribute("publicacion_id", post);
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
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
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String fechaNacimientoStr = request.getParameter("fecha_nacimiento");
        String calle = request.getParameter("calle");
        String numero = request.getParameter("numero");
        String bloque = request.getParameter("bloque");
        String puerta = request.getParameter("puerta");
        String piso = request.getParameter("piso");
        String codigoPostal = request.getParameter("codigo_postal");
        String ciudad = request.getParameter("ciudad");
        String estado = request.getParameter("estado");
        String pais = request.getParameter("pais");
        Integer existingUser = userDao.searchUserByEmail(email);
        System.out.println(existingUser);
        boolean wrongRegister = false;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = null;
        try {
            fechaNacimiento = dateFormat.parse(fechaNacimientoStr);
        } catch (ParseException e) {
            e.printStackTrace(); // Manejar el error en caso de que la fecha no se pueda analizar correctamente
        }
        java.sql.Date sqlDate = new java.sql.Date(fechaNacimiento.getTime());
        if (existingUser != -1) {
            request.setAttribute("emailError", "El correo electrónico ya está en uso");
            wrongRegister = true;
        } else if (!isValidPassword(password)) {
            request.setAttribute("passwordError", "La contaseña debe contener una mayúscula, una minúscula, un número, un carácter especial y mínimo 8 carácteres");
            wrongRegister = true;
        } else if (!isUserOver18(fechaNacimiento)) {
            request.setAttribute("dateError", "Debes ser mayor de 18 años para crear una cuenta");
            wrongRegister = true;
        }
        String user = request.getParameter("usuario_id");
        String post = request.getParameter("publicacion_id");
        if (!wrongRegister) {
            User newUser = new User(nombre, apellido, email, password, sqlDate);
            userDao.addUser(newUser);
            Address newAddress = new Address(existingUser, calle, numero, bloque, puerta, piso, codigoPostal, ciudad, estado, pais);
            addressDao.addAddress(newAddress);
            TokenService tokenService = new TokenService();
            String token = tokenService.createToken(Integer.toString(newUser.getId()));
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
            if (user.length() != 0) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("userPostProfile.jsp");
                dispatcher.forward(request, response);
            } else if (post.length() != 0) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("paymentForm.jsp");
                dispatcher.forward(request, response);
            } else {
                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
            dispatcher.forward(request, response);
        }
    }

    private boolean isValidPassword(String password) {
        return password.matches("^(?=.*[A-Z])(?=.*[a-z])(?=.*\\d)(?=.*[@#$%^&+=])(?=\\S+$).{8,}$");
    }

    private boolean isUserOver18(Date fechaNacimiento) {
        // Obtener la fecha actual
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());

        // Restar 18 años a la fecha actual
        cal.add(Calendar.YEAR, -18);
        Date dateMinus18Years = cal.getTime();

        // Comparar la fecha de nacimiento con la fecha hace 18 años
        return fechaNacimiento.before(dateMinus18Years);
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
