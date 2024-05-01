<%-- 
    Document   : success
    Created on : 19 abr 2024, 13:33:07
    Author     : Mati
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts" %>
<%@ page import="java.util.Date" %>
<%
    String token = response.getHeader("Authorization");
    if (token != null && token.startsWith("Bearer ")) {
        try {
            String jwtToken = token.substring(7);
            Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
            String userId = claims.getSubject();
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
        <h1 class="text-center">Bienvenido a la página de éxito</h1>
        <jsp:include page="footer.jsp" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
<%
        } catch (Exception e) {
            response.getWriter().write("An error ocurred while loading this page.");
        }
    } else {
            response.getWriter().write("Authorization error: no token recieved.");
    }
%>

