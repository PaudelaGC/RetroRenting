<%-- 
    Document   : viewPost
    Created on : 20 abr. 2024, 16:02:53
    Author     : 39348
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts, io.jsonwebtoken.ExpiredJwtException" %>
<%@ page import="java.util.Date" %>
<%
    String token = response.getHeader("Authorization");
    boolean expired = false;
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<div class=" container antesFooter mt-5">
    <h1 class="text-center">${post.title}</h1>
    <div class="card_post_info card d-flex flex-column justify-content-center align-items-center"> <!-- Agregamos clases flex para centrar vertical y horizontalmente -->

            <div class=" container mt-5 mb-4">
                <h2>Usuario: ${user.name} ${user.surname}</h2>
                <p>${post.description}</p>
                <p>${post.price}€</p>
                <p>${post.duration} días</p>
                <img src="css/images/${post.image}" alt="imagen del Producto" class="img-fluid"> <!-- Agregamos la clase img-fluid para que la imagen sea responsiva -->
            </div>
        
    </div>

<%
        if (token != null && token.startsWith("Bearer ")) {
            try {
                session.setAttribute("token", token.substring(7));
                String jwtToken = token.substring(7);
                Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
                String userId = claims.getSubject();
%>
<form action="UserProfileServlet" method="get">
    <input type="hidden" name="userId" value="${user.id}">
    <input type="hidden" name="postId" value="${post.id}">
    <%
            } catch (ExpiredJwtException expiredEx) {
            expired = true;
            response.getWriter().write("Your session expired.");
    %>
    <form action="LoginServlet2" method="get">
        <input type="hidden" name="postId" value="${post.id}">
        <input type="hidden" name="userId" value="${user.id}">
        <%
        } catch (Exception e) {
            response.getWriter().write("An error ocurred while loading this page.");
        }
    } else {%>
        <form style="margin-left: 30px; display: inline-block;" action="LoginServlet2" method="get">
            <input type="hidden" name="postId" value="${post.id}">
            <input type="hidden" name="userId" value="${user.id}">
            <% } %>
            <button type="submit" class="btn btn-primary">Ver Perfil del Usuario</button>
        </form>
        <%
    if (token != null && token.startsWith("Bearer ")) {
        try {
            session.setAttribute("token", token.substring(7));
            String jwtToken = token.substring(7);
            Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
            String userId = claims.getSubject();
        %>
        <form action="PaymentFormServlet" method="get">
            <input type="hidden" name="postId" value="${post.id}">

                <% } catch (ExpiredJwtException expiredEx) {
                expired = true; response.getWriter().write("Your session expired.");
                %>
                <form action="LoginServlet2" method="get">

                <input type="hidden" name="postId" value="${post.id}">
                <%
                } catch (Exception e) {
                    response.getWriter().write("An error ocurred while loading this page.");
                }
            } else {%>
                <form  style="display: inline-block;" action="LoginServlet2" method="get">

                    <input type="hidden" name="postId" value="${post.id}">
                    <% } %>
                    <button type="submit" class="btn btn-primary">Solicitar</button>
                </form>
                </div>
                </div>
                <jsp:include page="footer.jsp" />
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
                </body>
                </html>

