<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<%@ include file="header.jsp" %>
<body>
    
    <%@ include file="nav.jsp" %>
    <section class="container">
        <h2>Publicaciones</h2>
        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3">
            <% for (int i = 1; i <= 6; i++) { %>
                <div class="col">
                    <div class="card" style="width: 18rem;">
                        <img src="css/images/retrorentingIcon.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title">Publicación <%= i %></h5>
                            <p class="card-text">Pequeña descripción</p>
                            <form action="ViewPostServlet" method="get">
                                <button type="submit" class="btn btn-primary">Ver Publicación</button>
                            </form>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    </section>
    <%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>