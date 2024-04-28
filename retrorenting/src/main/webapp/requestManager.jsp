<%-- 
    Document   : requestManager
    Created on : 16 abr. 2024, 10:18:13
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts, io.jsonwebtoken.ExpiredJwtException" %>
<%@ page import="java.util.Date" %>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<div class="container mt-4">
    <h2>Lista de Peticiones</h2>
    <section>
        <h3>Peticiones Recibidas</h3>
        <ul class="list-group mb-4">
            <c:if test="${othersRequests == null}">
                <p>No tienes peticiones recibidas por el momento.</p>
            </c:if>
            <c:forEach items="${othersRequests}" var="request">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div>
                        <span class="info">Título del ítem:</span> ${request['itemTitle']} <!-- Título del ítem -->
                    </div>
                    <div>
                        <span class="info">Solicitante:</span> ${request['userRequester']} <!-- Quién lo pide -->
                    </div>
                    <div>
                        <span class="info">Fecha de la petición:</span> ${request['date']} <!-- Fecha de la petición -->
                    </div>
                    <div>
                        <form action="RequestManagerServlet" method="post" class="d-inline">
                            <input type="hidden" name="accept" value="${request['id']}">
                            <input type="hidden" name="userId" value="${userId}">
                            <button type="submit" class="btn btn-success btn-sm">Aceptar</button>
                        </form>
                        <form action="RequestManagerServlet" method="post" class="d-inline">
                            <input type="hidden" name="deny" value="${request['id']}">
                            <input type="hidden" name="userId" value="${userId}">
                            <button type="submit" class="btn btn-danger btn-sm">Rechazar</button>
                        </form>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </section>
    <section>
        <h3>Peticiones Enviadas</h3>
        <ul class="list-group">
            <c:if test="${myRequests == null}">
                <p>No tienes peticiones recibidas por el momento.</p>
            </c:if>
            <c:forEach items="${myRequests}" var="request">
                <li class="list-group-item d-flex justify-content-between align-items-center" >
                    <span class="info">Título del ítem: ${request['itemTitle']}</span>  <span class="fw-bold">Estado: ${request['status']}</span>
                    <form action="RequestManagerServlet" method="post">
                        <c:if test = "${request['status'] eq 'Accepted'}">
                            <input type="hidden" name="pay" value="${request['id']}">
                            <input type="hidden" name="userId" value="${userId}">
                            <button type="submit" class="btn btn-primary btn-sm">Pagar</button>
                        </c:if>
                    </form>
                </li>
            </c:forEach>
        </ul>
    </section>
    <div class="mt-4">
        <form action="UserProfileServlet" method="get">
            <input type="hidden" name="profile" value="self">

            <button type="submit" class="btn btn-secondary">Atrás</button>
        </form>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>
