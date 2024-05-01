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
<div class="container mt-4">
    <h1 class="text-center mb-4">Formulario de Pago</h1>
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
                <div class="mb-3">
                    <label for="card_number" class="form-label">Número de Tarjeta:</label>
                    <input type="text" class="form-control" id="card_number" name="card_number" pattern="[0-9]{16}" title="Debe tener 16 dígitos" required>
                </div>
                <div class="mb-3">
                    <label for="expiry_date" class="form-label">Fecha de Expiración:</label>
                    <input type="text" class="form-control" id="expiry_date" name="expiry_date" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/([0-9]{2})" title="Formato válido: MM/YY" required>
                </div>
                <div class="mb-3">
                    <label for="cvv" class="form-label">CVV:</label>
                    <input type="text" class="form-control" id="cvv" name="cvv" pattern="[0-9]{3,4}" title="Debe tener 3 o 4 dígitos" required>
                </div>
                <button type="submit" class="btn btn-primary">Realizar Petición</button>
                <% if(!denied1.equals("null")){ %>
                <p><span style="color: red;"><%= denied1 %></span></p>
                    <% } %>
                    <% if(!denied2.equals("null")){ %>
                <p><span style="color: red;"><%= denied2 %></span></p>
                    <% } %>
            </form>
            <form action="ViewPostServlet" method="get" class="antesFooter">
                <input type="hidden" name="postId" value="${post.id}">
                <button type="submit" class="btn btn-secondary" style ="margin-bottom:20px;">Atrás</button>
            </form>
           </div>
        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        </body>
        </html>
