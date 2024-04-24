<%-- 
    Document   : detalleProducto
    Created on : 16 abr. 2024, 9:51:26
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
<jsp:include page="header.jsp" />   
<jsp:include page="nav.jsp" />

<div class="container">
  <h2 class="mt-5 mb-4">Registro de Usuario</h2>

  <form action="RegisterServlet" method="post">
    <div class="mb-3">
      <label for="nombre" class="form-label">Nombre:</label>
      <input type="text" class="form-control" id="nombre" name="nombre" required>
    </div>
    <div class="mb-3">
      <label for="apellido" class="form-label">Apellido:</label>
      <input type="text" class="form-control" id="apellido" name="apellido" required>
    </div>
    <div class="mb-3">
      <label for="email" class="form-label">Correo Electrónico:</label>
      <input type="email" class="form-control" id="email" name="email" required>
    </div>
    <div class="mb-3">
      <label for="password" class="form-label">Contraseña:</label>
      <input type="password" class="form-control" id="password" name="password" required>
    </div>
    <div class="mb-3">
      <label for="fecha_nacimiento" class="form-label">Fecha de Nacimiento:</label>
      <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required>
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
      <input type="text" class="form-control" id="codigo_postal" name="codigo_postal" required>
    </div>
    <div class="mb-3">
      <label for="ciudad" class="form-label">Ciudad:</label>
      <input type="text" class="form-control" id="ciudad" name="ciudad" required>
    </div>
    <div class="mb-3">
      <label for="estado" class="form-label">Estado:</label>
      <input type="text" class="form-control" id="estado" name="estado">
    </div>
    <div class="mb-3">
      <label for="pais" class="form-label">País:</label>
      <input type="text" class="form-control" id="pais" name="pais" required>
    </div>
    <button type="submit" class="btn btn-primary">Registrarse</button>
  </form>
  
  <form action="LoginServlet" method="get">
    <button type="submit" class="btn btn-secondary mt-3">Atrás</button>
  </form>
</div>

<jsp:include page="footer.jsp" />


=======
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
>>>>>>> main

    </body>
</html>
