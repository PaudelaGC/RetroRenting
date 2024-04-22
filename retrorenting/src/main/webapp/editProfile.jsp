<%-- 
    Document   : editProfile
    Created on : 16 abr. 2024, 9:58:04
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <h1>Editar Perfil</h1>
         <h2>Editar Perfil</h2>

        <form action="SaveProfileEditedServlet" method="post">
            <div>
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" value="Juan" required>
            </div>
            <div>
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" value="Pérez" required>
            </div>
            <div>
                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" value="juan@example.com" required>
            </div>
            <div>
                <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" value="1990-01-10" required>
            </div>
            <div>
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" value="Calle Principal, 123, Escalera B, Piso 2, Puerta 4" required>
            </div>
            <div>
                <label for="codigo_postal">Código Postal:</label>
                <input type="text" id="codigo_postal" name="codigo_postal" value="12345" required>
            </div>
            <div>
                <label for="ciudad">Ciudad:</label>
                <input type="text" id="ciudad" name="ciudad" value="Ciudad de Ejemplo" required>
            </div>
            <div>
                <label for="region">Región:</label>
                <input type="text" id="region" name="region" value="Región de Ejemplo">
            </div>
            <div>
                <label for="pais">País:</label>
                <input type="text" id="pais" name="pais" value="País de Ejemplo" required>
            </div>
            <button type="submit">Guardar Cambios</button>
        </form>
        <jsp:include page="footer.jsp" />
    </body>
</html>
