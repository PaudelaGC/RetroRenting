<%-- 
    Document   : UserProfile
    Created on : 16 abr. 2024, 9:57:38
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<h1 class="text-center">Perfil de Usuario QUE ALQUILA</h1>

<div  class ="antesFooter">
    <p><strong>Nombre:</strong> Ricardo</p>
    <p><strong>Apellido:</strong> Sanchez</p>
    <p><strong>Correo Electrónico:</strong> ricardo@example.com</p>
    <p><strong>Fecha de Nacimiento:</strong> 10 de Marzo de 1990</p>
    <p><strong>Dirección:</strong> Calle Principal, 432, Escalera A, Piso 2, Puerta 4</p>
    <p><strong>Código Postal:</strong> 1704</p>
    <p><strong>Ciudad:</strong> Ciudad de Ejemplo</p>
    <p><strong>Región:</strong> Región de Ejemplo</p>
    <p><strong>País:</strong> País de Ejemplo</p>
    <form action="ViewPostServlet" method="get">
    <input type="hidden" name="postId" value="${post.id}">
        <button type="submit">Volver</button>
    </form>

</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
