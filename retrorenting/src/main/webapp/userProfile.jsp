<%-- 
    Document   : UserProfile
    Created on : 16 abr. 2024, 9:57:38
    Author     : 39348
--%>

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
    <h2 class="mb-4">Perfil de Usuario</h2>

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
<!--                        <form action="EditProfileServlet" method="get">
                            <input type="hidden" name="userId" value="<%= userId%>">
                            <button type="submit" class="btn btn-secondary me-3">Editar Mi Perfil</button>
                        </form>
                        <form action="RequestManagerServlet" method="get">
                            <input type="hidden" name="userId" value="<%= userId%>">
                            <button type="submit" class="btn btn-info me-3">Ver Peticiones</button>
                        </form>-->
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
            <p><span style="color: red;">You can't modify posts that have been already accepted!</span></p>
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
                                response.getWriter().write("Your session expired.");
                            } catch (Exception e) {
                                response.getWriter().write("An error ocurred while loading this page.");
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

<!--     Botón que activa el modal de cierre de sesión 
    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#logoutModal">
        CERRAR SESIÓN
    </button>

     Modal para logout 
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">Confirmación de cierre de sesión</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>¿Estas seguro de que quieres cerrar sesion?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <form action="SignOutServlet" method="get">
                        <button type="submit" class="btn btn-primary">Si</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

     Botón que activa el modal de eliminación de cuenta 
    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteAccountModal">
        ELIMINAR CUENTA
    </button>

     Modal para eliminación de cuenta 
    <div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteAccountModalLabel">Confirmación de Eliminación de Cuenta</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Por favor, escribe "BORRAR CUENTA" para confirmar la eliminación de tu cuenta.</p>
                    <input type="text" id="confirmationInput" class="form-control" placeholder="Escribe aquí">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                     Formulario que será enviado si la confirmación es correcta 
                    <form id="deleteForm" action="DeletedAccountServlet" method="post" style="display: none;">
                        <input type="hidden" name="userId" value="<%= userId %>">
                        <button type="submit" class="btn btn-danger">Confirmar Eliminación</button>
                    </form>
                    <button type="button" class="btn btn-danger" onclick="confirmDeletion()">Confirmar Eliminación</button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function confirmDeletion() {
            var confirmationText = document.getElementById('confirmationInput').value;
            if (confirmationText === "BORRAR CUENTA") {
                // Si la frase es correcta, envía el formulario de eliminación
                document.getElementById('deleteForm').submit();
            } else {
                alert('La frase ingresada es incorrecta.');
            }
        }
    </script>
</div>-->
<jsp:include page="footer.jsp" />
</body>
</html>
