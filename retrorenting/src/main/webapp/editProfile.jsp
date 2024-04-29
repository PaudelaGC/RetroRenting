<%-- 
    Document   : editProfile
    Created on : 16 abr. 2024, 9:58:04
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
        <div class="container mt-4 antesFooter">
            <h1>Editar Perfil</h1>
            <form action="SaveProfileEditedServlet" method="post">
                <div class="mb-3">
                    <label for="nombre" class="form-label">Nombre:</label>
                    <input type="text" class="form-control" id="nombre" name="nombre" value="Juan" required>
                </div>
                <div class="mb-3">
                    <label for="apellido" class="form-label">Apellido:</label>
                    <input type="text" class="form-control" id="apellido" name="apellido" value="Pérez" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico:</label>
                    <input disabled type="email" class="form-control" id="email" name="email" value="juan@example.com" required>
                </div>
                <div class="mb-3">
                    <label for="fecha_nacimiento" class="form-label">Fecha de Nacimiento:</label>
                    <input disabled type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" value="1990-01-10" required>
                </div>
                <div class="mb-3">
            <label for="calle" class="form-label">Calle:</label>
            <input type="text" class="form-control" id="calle" name="calle" placeholder="Calle" required>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="numero" class="form-label">Número:</label>
                <input type="text" class="form-control" id="numero" name="numero" placeholder="Número" required>
            </div>
            <div class="col">
                <label for="bloque" class="form-label">Bloque:</label>
                <input type="text" class="form-control" id="bloque" name="bloque" placeholder="Bloque">
            </div>
            <div class="col">
                <label for="puerta" class="form-label">Puerta:</label>
                <input type="text" class="form-control" id="puerta" name="puerta" placeholder="Puerta">
            </div>
            <div class="col">
                <label for="piso" class="form-label">Piso:</label>
                <input type="text" class="form-control" id="piso" name="piso" placeholder="Piso">
            </div>
        </div>
                <div class="mb-3">
                    <label for="codigo_postal" class="form-label">Código Postal:</label>
                    <input type="text" class="form-control" id="codigo_postal" name="codigo_postal" value="12345" required>
                </div>
                <div class="mb-3">
                    <label for="ciudad" class="form-label">Ciudad:</label>
                    <input type="text" class="form-control" id="ciudad" name="ciudad" value="Ciudad de Ejemplo" required>
                </div>
                <div class="mb-3">
                    <label for="region" class="form-label">Región:</label>
                    <input type="text" class="form-control" id="region" name="region" value="Región de Ejemplo">
                </div>
                <div class="mb-3">
                    <label for="pais" class="form-label">País:</label>
                    <input type="text" class="form-control" id="pais" name="pais" value="País de Ejemplo" required>
                </div>
                <button type="submit" class="btn btn-primary">Guardar Cambios</button>
            </form>
        </div>
        <jsp:include page="footer.jsp" />
    </body>
</html>
