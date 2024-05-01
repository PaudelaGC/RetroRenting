<%-- 
    Document   : editProfile
    Created on : 16 abr. 2024, 9:58:04
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<% String userId = request.getParameter("userId"); %>
<div class="container mt-4 antesFooter">
    <h1 class="text-center">Editar Perfil</h1>
    <form action="EditProfileServlet" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Nombre:</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="${user.name}" >
        </div>
        <div class="mb-3">
            <label for="surname" class="form-label">Apellido:</label>
            <input type="text" class="form-control" id="surname" name="surname" placeholder="${user.surname}" >
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Correo Electrónico:</label>
            <input disabled type="email" class="form-control" id="email" name="email" placeholder="${user.email}" >
        </div>
        <div class="mb-3">
            <label for="birthdate" class="form-label">Fecha de Nacimiento:</label>
            <input disabled type="date" class="form-control" id="birthdate" name="birthdate" placeholder="${user.birthdate}" >
        </div>
        <div class="mb-3">
            <label for="street" class="form-label">Calle:</label>
            <input type="text" class="form-control" id="street" name="street" placeholder="${address.street}" >
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="number" class="form-label">Número:</label>
                <input type="text" class="form-control" id="number" name="number" placeholder="${address.number}" >
            </div>
            <div class="col">
                <label for="block" class="form-label">Bloque:</label>
                <input type="text" class="form-control" id="block" name="block" placeholder="${address.block}">
            </div>
            <div class="col">
                <label for="door" class="form-label">Puerta:</label>
                <input type="text" class="form-control" id="door" name="door" placeholder="${address.door}">
            </div>
            <div class="col">
                <label for="floor" class="form-label">Piso:</label>
                <input type="text" class="form-control" id="floor" name="floor" placeholder="${address.floor}">
            </div>
        </div>
        <div class="mb-3">
            <label for="postalCode" class="form-label">Código Postal:</label>
            <input type="text" class="form-control" id="postalCode" name="postalCode" placeholder="${address.postalCode}" >
        </div>
        <div class="mb-3">
            <label for="city" class="form-label">Ciudad:</label>
            <input type="text" class="form-control" id="city" name="city" placeholder="${address.city}" >
        </div>
        <div class="mb-3">
            <label for="state" class="form-label">Región:</label>
            <input type="text" class="form-control" id="state" name="state" placeholder="${address.state}">
        </div>
        <div class="mb-3">
            <label for="country" class="form-label">País:</label>
            <input type="text" class="form-control" id="country" name="country" placeholder="${address.country}" >
        </div>
        <input type="hidden" name="userId" value="<%= userId%>">
        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
    </form>
</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>