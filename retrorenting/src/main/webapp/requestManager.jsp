<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts, io.jsonwebtoken.ExpiredJwtException" %>
<%@ page import="java.util.Date" %>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<div class="container mt-4 antesFooter">
    <h1 class="text-center">Lista de Peticiones</h1>
    <section>
        <h2>Peticiones Recibidas</h2>
        <ul class="list-group mb-4">
            <c:if test="${othersRequests == null}">
                <p>No tienes peticiones recibidas por el momento.</p>
            </c:if>
            <c:forEach items="${othersRequests}" var="request">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div>
                        <span class="info">Título del ítem:</span> ${request['itemTitle']}
                    </div>
                    <div>
                        <span class="info">Solicitante:</span> ${request['userRequester']}
                    </div>
                    <div>
                        <span class="info">Fecha de la petición:</span> ${request['date']}
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
        <h2>Peticiones Enviadas</h2>
        <ul class="list-group">
            <c:if test="${myRequests == null}">
                <p>No tienes peticiones recibidas por el momento.</p>
            </c:if>
            <c:forEach items="${myRequests}" var="request">
                <li class="list-group-item d-flex justify-content-between align-items-center">
                    <div>
                        <span class="info">Título del ítem: ${request['itemTitle']}</span>
                    </div>
                    <div class="d-flex align-items-center">
                        <form action="RequestManagerServlet" method="post">
                            <c:if test="${request['status'] eq 'Accepted'}">
                                <input type="hidden" name="pay" value="${request['id']}">
                                <input type="hidden" name="userId" value="${userId}">
                                <button type="submit" class="btn btn-primary btn-sm me-2">Pagar</button>
                            </c:if>
                        </form>
                        <span style="margin-left: 10px;">Estado: ${request['status']}</span>
                    </div>
                </li>
            </c:forEach>
        </ul>
    </section>
    <div class="mt-4">
        <form action="UserProfileServlet" method="get">
            <input type="hidden" name="userId" value="${userId}">
            <button type="submit" class="btn btn-secondary">Atrás</button>
        </form>
    </div>
</div>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<jsp:include page="footer.jsp" />
</body>
</html>
