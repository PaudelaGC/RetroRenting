<%-- 
    Document   : header
    Created on : 16 abr. 2024, 9:51:57
    Author     : 39348
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts, io.jsonwebtoken.ExpiredJwtException" %>
<%@ page import="java.util.Date" %>
<%
    String token = response.getHeader("Authorization");
    boolean expired = false;
    String profile = (String) request.getAttribute("profile");
    if(profile == null){
    profile = "";
    }
%>
<nav>
    <ul>
        <li>
            <form action="home" method="get">
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
                        if(profile.equals("self")){
            %>
            <form action="EditProfileServlet" method="get">
                <%
           }
                %>
                <form action="UserProfileServlet" method="get">
                    <input type="hidden" name="profile" value="self">
                    <%
                        } catch (ExpiredJwtException expiredEx) {
                        expired = true;
                    %>
                    <form action="LoginServlet" method="get">
                        <%
                        } catch (Exception e) {
                            response.getWriter().write("An error ocurred while loading this page.");
                        }
                    } else {%>
                        <form action="LoginServlet" method="get">
                            <% } %>
                            <button type="submit">
                                <% if (profile.equals("self")) { %>
                                Opciones
                                <% }else if(token != null && token.startsWith("Bearer ") && !expired){ %>
                                Perfil
                                <% } else{ %>
                                Log in/Sign up
                                <% } %>
                            </button>
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
