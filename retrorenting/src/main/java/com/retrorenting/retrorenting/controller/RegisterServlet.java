package com.retrorenting.retrorenting.controller;

import com.password4j.BcryptFunction;
import com.password4j.Hash;
import com.password4j.Password;
import com.password4j.types.Bcrypt;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import model.Address;
import model.Post;
import model.User;
import model.persist.UsersDao;
import model.persist.AddressDao;
import model.persist.PostsDao;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

    UsersDao userDao = new UsersDao();
    AddressDao addressDao = new AddressDao();
    PostsDao postDao = new PostsDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = request.getParameter("userId");
        String post = request.getParameter("postId");
        request.setAttribute("userId", user);
        request.setAttribute("postId", post);
        RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        boolean wrongRegister = false;
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = null;
        try {
            fechaNacimiento = dateFormat.parse(fechaNacimientoStr);
        } catch (ParseException e) {

        }
        java.sql.Date sqlDate = new java.sql.Date(fechaNacimiento.getTime());
        if (existingUser != -1) {
            request.setAttribute("emailError", "El correo electrónico ya está en uso");
            wrongRegister = true;
        }
        if (!isValidPassword(password)) {
            request.setAttribute("passwordError", "La contaseña debe contener una mayúscula, una minúscula, un número, un carácter especial y mínimo 8 carácteres");
            wrongRegister = true;
        }
        if (!isUserOver18(fechaNacimiento)) {
            request.setAttribute("dateError", "Debes ser mayor de 18 años para crear una cuenta");
            wrongRegister = true;
        }
        BcryptFunction bcrypt = BcryptFunction.getInstance(Bcrypt.B, 12);
        Hash hash = Password.hash(password)
                .with(bcrypt);
        String hashedPassword = hash.getResult();
        String user = request.getParameter("userId");
        String postId = request.getParameter("postId");
        if (!wrongRegister) {
            Address newAddress = new Address(existingUser, calle, numero, bloque, puerta, piso, codigoPostal, ciudad, estado, pais);
            int idAddress = addressDao.addAddress(newAddress);
            User newUser = new User(nombre, apellido, email, hashedPassword, sqlDate, idAddress);
            userDao.addUser(newUser);
            TokenService tokenService = new TokenService();
            String token = tokenService.createToken(Integer.toString(userDao.searchUserByEmail(email)));
            response.addHeader("Authorization", "Bearer " + token);
            response.getWriter().write(token);
            if (user.length() != 0) {
                Post selectedPost = postDao.findPostById(Integer.parseInt(postId));
                User userToLoad = userDao.getUserById(Integer.parseInt(user));
                Address address = addressDao.findAddressById(userToLoad.getIdAddress());
                List<Post> posts = postDao.listPosts();
                List<Post> postsFromUser = new ArrayList<>();
                for (Post post : posts) {
                    if (post.getIdUser() == Integer.parseInt(user)) {
                        postsFromUser.add(post);
                    }
                }
                request.setAttribute("postsList", postsFromUser);
                request.setAttribute("post", selectedPost);
                request.setAttribute("user", userToLoad);
                request.setAttribute("address", address);
                request.setAttribute("userId", user);
                RequestDispatcher dispatcher = request.getRequestDispatcher("userProfile.jsp");
                dispatcher.forward(request, response);
            } else if (postId.length() != 0) {
                Post selectedPost = postDao.findPostById(Integer.parseInt(postId));
                request.setAttribute("post", selectedPost);
                RequestDispatcher dispatcher = request.getRequestDispatcher("paymentForm.jsp");
                dispatcher.forward(request, response);
            } else {
                List<Post> posts = postDao.listPosts();
                request.setAttribute("postsList", posts);
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
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        cal.add(Calendar.YEAR, -18);
        Date dateMinus18Years = cal.getTime();
        return fechaNacimiento.before(dateMinus18Years);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
