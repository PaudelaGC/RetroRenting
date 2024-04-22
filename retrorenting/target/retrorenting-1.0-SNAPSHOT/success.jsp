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
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Success</title>
    </head>
    <body>
        <h1>Bienvenido a la página de éxito</h1>
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

