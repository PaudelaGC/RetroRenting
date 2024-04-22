<%-- 
    Document   : uploadPost
    Created on : 16 abr. 2024, 10:21:14
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <jsp:include page="header.jsp" />   
        <jsp:include page="nav.jsp" />
        <h2>Editar Publicación</h2>

        <form action="/guardar_edicion" method="post">
          <div>
            <label for="titulo">Título:</label>
            <input type="text" id="titulo" name="titulo" value="Título de la Publicación Actual" required>
          </div>
          <div>
            <label for="descripcion">Descripción:</label>
            <textarea id="descripcion" name="descripcion" required>Descripción de la Publicación Actual</textarea>
          </div>
          <div>
            <label for="precio">Precio:</label>
            <input type="text" id="precio" name="precio" value="50" required>
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
          <button type="submit">Guardar Cambios</button>
        </form>
         <jsp:include page="footer.jsp" />
    </body>
</html>
