<%-- 
    Document   : header
    Created on : 16 abr. 2024, 9:51:57
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<nav class="navbar navbar-expand-lg navbar-light ">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <form class="form-inline" action="home" method="get">
                    <button class="btn btn-link nav-link" type="submit"><i class="fas fa-home"></i> Home</button>
                </form>
            </li>
            <li class="nav-item">
                <%
                if (token != null && token.startsWith("Bearer ")) {
                    try {
                        session.setAttribute("token", token.substring(7));
                        String jwtToken = token.substring(7);
                        Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
                        String userId = claims.getSubject();
                        if(profile.equals("self")){
                %>
                <form class="form-inline" action="UserOptionsServlet" method="get">
                    <input type="hidden" name="userId" value="<%= userId%>">
                    <%
               }
                    %>
                    <form class="form-inline" action="UserProfileServlet" method="get">
                        <input type="hidden" name="userId" value="<%=userId%>">
                        <%
                            } catch (ExpiredJwtException expiredEx) {
                            expired = true;
                            response.getWriter().write("Your session expired.");
                        %>
                        <form class="form-inline" action="LoginServlet2" method="get">
                            <%
                            } catch (Exception e) {
                                response.getWriter().write("An error ocurred while loading this page.");
                            }
                        } else {%>
                            <form class="form-inline" action="LoginServlet2" method="get">
                                <% } %>
                                <button class="btn btn-link nav-link" type="submit"><i class="fas fa-user"></i>
                                    <% if (profile.equals("self")) { %>
                                    Opciones
                                    <% }else if(token != null && token.startsWith("Bearer ") && !expired){ %>
                                    Tu perfil
                                    <% } else{ %>
                                    Log in/Sign up
                                    <% } %>
                                </button>
                            </form>
                            </li>
                            <li class="nav-item">
                                <form class="form-inline" action="SearchServlet" method="get">
                                    <div class="row g-3 align-items-center">
                                        <div class="col-auto">
                                            <input type="text" class="form-control" name="query" placeholder="Search...">
                                        </div>
                                        <div class="col-auto">
                                            <button class="btn btn-primary" type="submit">Search</button>
                                        </div>
                                    </div>
                                </form>
                            </li>
                            </ul>
                            </div>
                            </nav>


