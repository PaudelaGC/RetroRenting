<%-- 
    Document   : payForm
    Created on : 16 abr. 2024, 9:59:17
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts, io.jsonwebtoken.ExpiredJwtException" %>
<%@ page import="java.util.Date" %>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<% String token = response.getHeader("Authorization"); 
   boolean expired = false; 
    String denied1 = (String) request.getAttribute("denied1");
    String denied2 = (String) request.getAttribute("denied2");
    if(denied1 == null){
    denied1 = "null";
    }
    if(denied2 == null){
    denied2 = "null";
    }
%>
<h1>Formulario de Pago</h1>
<%
        if (token != null && token.startsWith("Bearer ")) {
            try {
                session.setAttribute("token", token.substring(7));
                String jwtToken = token.substring(7);
                Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
                String userId = claims.getSubject();
%>
<form action="RequestManagerServlet" method="post">
    <input type="hidden" name="postId" value="${post.id}">
    <input type="hidden" name="userId" value="<%= userId %>">
    <%
            } catch (ExpiredJwtException expiredEx) {
            expired = true;
            response.getWriter().write("Your session expired.");
    %>
    <form action="ViewPostServlet" method="get">
        <input type="hidden" name="postId" value="${post.id}">
        <%
                } catch (Exception e) {
                    response.getWriter().write("An error ocurred while loading this page.");
                }
            } else {%>
        <form action="ViewPostServlet" method="get">
            <input type="hidden" name="postId" value="${post.id}">
            <% } %>
            <div>
                <label for="card_number">Número de Tarjeta:</label>
                <input type="text" id="card_number" name="card_number" pattern="[0-9]{16}" title="Debe tener 16 dígitos" required>
            </div>
            <div>
                <label for="expiry_date">Fecha de Expiración:</label>
                <input type="text" id="expiry_date" name="expiry_date" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/([0-9]{2})" title="Formato válido: MM/YY" required>
            </div>
            <div>
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" pattern="[0-9]{3,4}" title="Debe tener 3 o 4 dígitos" required>
            </div>
            <button type="submit">Realizar Petición</button>
            <% if(!denied1.equals("null")){ %>
            <p><span style="color: red;"><%= denied1 %></span></p>
                <% } %>
                <% if(!denied2.equals("null")){ %>
            <p><span style="color: red;"><%= denied2 %></span></p>
                <% } %>
        </form>
        <form action="ViewPostServlet" method="get">
            <input type="hidden" name="postId" value="${post.id}">
            <button type="submit">Atrás</button>
        </form>
        <jsp:include page="footer.jsp" />
        </body>
        </html>
