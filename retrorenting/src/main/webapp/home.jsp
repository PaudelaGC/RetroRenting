<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="date" class="java.util.Date" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RetroRenting</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    </head>
    <body>
        <%@ include file="header.jsp" %>
        <%@ include file="nav.jsp" %>
        <section class="container">
            <h2>Publicaciones</h2>
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
                <c:forEach items="${postsList}" var="object">
                    <div class="col">
                        <div class="card" style="width: 18rem; ${object.available ? '' : 'filter: grayscale(100%);'}">
                            <img src="css/images/retrorentingIcon.jpg" class="card-img-top" style="${object.available ? '' : 'filter: grayscale(100%);'}" alt="...">
                            <div class="card-body">
                                <h5 class="card-title">${object.title}</h5>
                                <p class="card-text">${object.price}€</p>
                                <p class="card-text">${object.duration} dias</p>
                                <form action="ViewPostServlet" method="get">
                                    <input type="hidden" name="postId" value="${object.id}">
                                    <c:choose>
                                        <c:when test="${object.available}">
                                            <button type="submit" class="btn btn-primary">Ver Publicación</button>
                                        </c:when>
                                        <c:otherwise>
                                            <span>No disponible</span>
                                            <p class="card-text">Fecha de devolución: <fmt:formatDate value="${object.lastReturnDate}" pattern="dd-MM-yyyy" /></p>
                                        </c:otherwise>
                                    </c:choose>
                                </form>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </section>
        <%@ include file="footer.jsp" %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
