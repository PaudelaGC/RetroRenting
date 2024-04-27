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
        <h1>${post.title}</h1>
        <div>
            <h2>Usuario: ${user.name} ${user.surname}</h2>
            <p>${post.description}</p>
            <p>${post.price}€</p>
            <p>${post.duration} días</p>
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

                <input type="hidden" name="usuario_id" value="${user.id}">
                <%
                } catch (Exception e) {
                    response.getWriter().write("An error ocurred while loading this page.");
                }
            } else {%>
                <form action="LoginServlet" method="get">

                    <input type="hidden" name="usuario_id" value="${user.id}">
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

                <input type="hidden" name="publicacion_id" value="${post.id}">
                <%
                } catch (Exception e) {
                    response.getWriter().write("An error ocurred while loading this page.");
                }
            } else {%>
                <form action="LoginServlet" method="get">

                    <input type="hidden" name="publicacion_id" value="${post.id}">
                    <% } %>
                    <button type="submit">Solicitar</button>
                </form>
                <jsp:include page="footer.jsp" />
                </body>
                </html>
