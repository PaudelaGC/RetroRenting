<%-- 
    Document   : detalleProducto
    Created on : 16 abr. 2024, 9:51:26
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <jsp:include page="header.jsp" />   
        <jsp:include page="nav.jsp" />

        <h2>Registro de Usuario</h2>

        <form action="RegisterServlet" method="post">
            <div>
                <label for="nombre">Nombre:</label>
                <input type="text" id="nombre" name="nombre" required>
            </div>
            <div>
                <label for="apellido">Apellido:</label>
                <input type="text" id="apellido" name="apellido" required>
            </div>
            <div>
                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <label for="fecha_nacimiento">Fecha de Nacimiento:</label>
                <input type="date" id="fecha_nacimiento" name="fecha_nacimiento" required>
            </div>
            <div>
        <label for="direccion">Dirección:</label>
        <div>
        <input type="text" id="calle" name="calle" placeholder="Calle" required>
        <input type="text" id="numero" name="numero" placeholder="Número" required>
        <input type="text" id="bloque" name="bloque" placeholder="Bloque">
        <input type="text" id="puerta" name="puerta" placeholder="Puerta">
        <input type="text" id="piso" name="piso" placeholder="Piso">
    </div>
      </div>

            <div>
                <label for="codigo_postal">Código Postal:</label>
                <input type="text" id="codigo_postal" name="codigo_postal" required>
            </div>
            <div>
                <label for="ciudad">Ciudad:</label>
                <input type="text" id="ciudad" name="ciudad" required>
            </div>
            <div>
                <label for="region">Estado:</label>
                <input type="text" id="estado" name="estado">
            </div>
            <div>
                <label for="pais">País:</label>
                <input type="text" id="pais" name="pais" required>
            </div>
            <input type="hidden" name="publicacion_id" value="${publicacion_id}">
            <input type="hidden" name="usuario_id" value="${usuario_id}">
            <button type="submit">Registrarse</button>
        </form>
        <form action="LoginServlet" method="get">
            <input type="hidden" name="publicacion_id" value="${publicacion_id}">
            <input type="hidden" name="usuario_id" value="${usuario_id}">
            <button type="submit">Atrás</button>

        </form>
        <jsp:include page="footer.jsp" />

    </body>
</html>
