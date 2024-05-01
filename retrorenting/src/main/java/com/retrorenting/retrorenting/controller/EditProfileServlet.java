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
import java.util.List;
import model.Address;
import model.Post;
import model.User;
import model.persist.AddressDao;
import model.persist.ModelView;
import model.persist.UsersDao;

@WebServlet(name = "EditProfileServlet", urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {

    UsersDao userDao = new UsersDao();
    AddressDao addressDao = new AddressDao();
    ModelView MV = new ModelView();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

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

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
