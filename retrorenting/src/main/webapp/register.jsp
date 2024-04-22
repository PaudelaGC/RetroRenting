<%-- 
    Document   : detalleProducto
    Created on : 16 abr. 2024, 9:51:26
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            <textarea id="direccion" name="direccion" required></textarea>
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
            <label for="region">Región:</label>
            <input type="text" id="region" name="region">
          </div>
          <div>
            <label for="pais">País:</label>
            <input type="text" id="pais" name="pais" required>
          </div>
          <button type="submit">Registrarse</button>
        </form>
        <form action="LoginServlet" method="get">
            
            <button type="submit">Atrás</button>
            
        </form>

    </body>
</html>
