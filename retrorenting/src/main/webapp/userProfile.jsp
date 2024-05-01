<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts, io.jsonwebtoken.ExpiredJwtException" %>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<% 
                String userId = request.getParameter("userId");
                String token = response.getHeader("Authorization");
                String denied = (String) request.getAttribute("denied");
                if(denied == null){
                denied = "null";
                }
                boolean expired = false;
%>
<div class="container mt-5 antesFooter">
    <h1 class="mb-4 text-center">Perfil de Usuario</h1>

    <div class="card">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="css/images/default.png" class="img-fluid" alt="Imagen de perfil">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <p class="card-text"><strong>Nombre:</strong> ${user.name}</p>
                    <p class="card-text"><strong>Apellido:</strong> ${user.surname}</p>
                    <p class="card-text"><strong>Ciudad:</strong> ${address.city}</p>
                    <p class="card-text"><strong>País:</strong> ${address.country}</p>
                    <div class="mt-4">
                        <% 
                        if (token != null && token.startsWith("Bearer ")) {
                            try {
                                session.setAttribute("token", token.substring(7));
                                String jwtToken = token.substring(7);
                                Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
                                String selfUserId = claims.getSubject();
                                if(selfUserId.equals(userId)){
                        %>
                        <form action="UploadPostServlet" method="get">
                            <input type="hidden" name="userId" value="<%= userId%>">
                            <button type="submit" class="btn btn-primary me-3">Publicar</button>
                        </form>
                        <%      }
                            } catch (ExpiredJwtException expiredEx) {
                                expired = true;
                                response.getWriter().write("Your session expired.");
                            } catch (Exception e) {
                                response.getWriter().write("An error ocurred while loading this page.");
                            }
                        }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <section class="container">
            <h2>Publicaciones</h2>
            <% if(!denied.equals("null")){ %>
            <p><span style="color: red;">¡No puedes modificar publicaciones con peticiones aceptadas!</span></p>
            <% } %>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
                <c:if test="${postsList eq '[]'}">
                    <p>No hay publicaciones por el momento.</p>
                </c:if>
                <c:forEach items="${postsList}" var="object">
                    <div class="col">
                        <div class="card" style="width: 18rem; ${object.available ? '' : 'filter: grayscale(100%);'}">
                            <img src="css/images/${object.image}" class="card-img-top" style="${object.available ? '' : 'filter: grayscale(100%);'}" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${object.title}</h5>
                                <p class="card-text">${object.price}€</p>
                                <p class="card-text">${object.duration} dias</p>
                                <% 
                                if (token != null && token.startsWith("Bearer ")) {
                                    try {
                                        session.setAttribute("token", token.substring(7));
                                        String jwtToken = token.substring(7);
                                        Claims claims = Jwts.parser().setSigningKey("83ykdhjflkdlDH338JDLHD23Djk$32234").parseClaimsJws(jwtToken).getBody();
                                        String selfUserId = claims.getSubject();
                                        if(selfUserId.equals(userId)){
                                %>
                                <form action="UpdatePostServlet" method="get">
                                    <input type="hidden" name="postId" value="${object.id}">
                                    <input type="hidden" name="userId" value="<%= selfUserId %>">
                                    <button type="submit" class="btn btn-primary">Editar publicación</button>
                                </form>
                                <%  } else { %>
                                <form action="ViewPostServlet" method="get">
                                    <input type="hidden" name="postId" value="${object.id}">
                                    <c:choose>
                                        <c:when test="${object.available}">
                                            <button type="submit" class="btn btn-primary">Ver publicación</button>
                                        </c:when>
                                        <c:otherwise>
                                            <span>No disponible</span>
                                            <p class="card-text">Fecha de devolución: <fmt:formatDate value="${object.lastReturnDate}" pattern="dd-MM-yyyy" /></p>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                                <%
                                    }
                            } catch (ExpiredJwtException expiredEx) {
                                expired = true;
                                response.getWriter().write("Tu sesión ha expirado.");
                            } catch (Exception e) {
                                response.getWriter().write("Ha ocurrido un error mientras se cargaba la página.");
                            }
                        }
                                %>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
