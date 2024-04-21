<%-- 
    Document   : uploadPost
    Created on : 19 abr. 2024, 14:24:17
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
        <h1>Subir Publicacion</h1>
        <form action="UploadPost" method="post">
        <div>
          <label for="titulo">Título:</label>
          <input type="text" id="titulo" name="titulo" placeholder="Ingrese el título" required>
        </div>
        <div>
          <label for="descripcion">Descripción:</label>
          <textarea id="descripcion" name="descripcion" placeholder="Ingrese la descripción" required></textarea>
        </div>
        <div>
          <label for="precio">Precio:</label>
          <input type="text" id="precio" name="precio" placeholder="Ingrese el precio" required>
        </div>
        <div>
          <label for="periodo">Periodo:</label>
          <select id="periodo" name="periodo" required>
            <option value="diario">Diario</option>
            <option value="semanal">Semanal</option>
            <option value="mensual">Mensual</option>
            <option value="anual">Anual</option>
          </select>
        </div>
        <div>
          <label for="disponibilidad">Disponibilidad:</label>
          <select id="disponibilidad" name="disponibilidad" required>
            <option value="si">Si</option>
            <option value="no">No</option>
          </select>
        </div>
        <button type="submit">Subir Publicación</button>
      </form>

    </body>
</html>
