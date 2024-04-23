<%-- 
    Document   : header
    Created on : 16 abr. 2024, 9:51:57
    Author     : 39348
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts" %>
<%@ page import="java.util.Date" %>
<%
    String token = response.getHeader("Authorization");
    if(token != null){
    session.setAttribute("token", token.substring(7));
    }
%>
<nav>
    <ul>
        <li>
            <form action="HomeServlet" method="get">
                <button type="submit">Home</button>
            </form>
        </li>
        <li>
            <%
                if (token != null && token.startsWith("Bearer ")) {
                    try {
                        session.setAttribute("token", token.substring(7));
                        String jwtToken = token.substring(7);
                        Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
                        String userId = claims.getSubject();
            %>
            <form action="UserProfileServlet" method="get">
                <%
        } catch (Exception e) {
            response.getWriter().write("An error ocurred while loading this page.");
        }
    } else {
                %>
                <form action="LoginServlet" method="get">
                    <% }%>
                    <button type="submit">Login</button>
                </form>
        </li>

        <li>
            <form action="SearchServlet" method="get">
                <input type="text" name="query" placeholder="Search...">
                <button type="submit">Search</button>
            </form>
        </li>
    </ul>
</nav>
