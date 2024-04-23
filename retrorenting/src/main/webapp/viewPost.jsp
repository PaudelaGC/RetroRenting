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
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <h1>Titulo de publicacion</h1>
        <div>
            <h2>Título de la Publicación</h2>
            <p>Descripción de la publicación simulada.</p>
            <p>Precio: $50</p>
            <p>Periodo: Mensual</p>
            <p>Disponibilidad: Si</p>
        </div>
        <%
                if (token != null && token.startsWith("Bearer ")) {
                    try {
                        session.setAttribute("token", token.substring(7));
                        String jwtToken = token.substring(7);
                        Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
                        String userId = claims.getSubject();
        %>
        <form action="ViewProfileUserServlet" method="get">
            <%
                    } catch (ExpiredJwtException expiredEx) {
                    expired = true;
            %>
            <form action="LoginServlet" method="get">

                <input type="hidden" name="usuario_id" value="id_del_usuario">
                <%
                } catch (Exception e) {
                    response.getWriter().write("An error ocurred while loading this page.");
                }
            } else {%>
                <form action="LoginServlet" method="get">

                    <input type="hidden" name="usuario_id" value="id_del_usuario">
                    <% } %>
                    <button type="submit">Ver Perfil del Usuario</button>
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
                    <%
                    } catch (ExpiredJwtException expiredEx) {
                    expired = true;
            %>
            <form action="LoginServlet" method="get">

                <input type="hidden" name="publicacion_id" value="id_de_publicacion">
                <%
                } catch (Exception e) {
                    response.getWriter().write("An error ocurred while loading this page.");
                }
            } else {%>
                <form action="LoginServlet" method="get">

                    <input type="hidden" name="publicacion_id" value="id_de_publicacion">
                    <% } %>
                    <button type="submit">Solicitar</button>
                </form>
                <jsp:include page="footer.jsp" />
                </body>
                </html>
