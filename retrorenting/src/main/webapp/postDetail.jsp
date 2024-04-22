<%-- 
    Document   : detalleProducto
    Created on : 16 abr. 2024, 9:51:26
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
        <h2>Publicación</h2>

        <div>
          <h3>Título de la Publicación</h3>
          <img src="imagen.jpg" alt="Imagen de la Publicación" width="200">
          <p>Descripción: Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed et justo nec nulla vulputate consectetur sit amet non massa.</p>
          <p>Precio: $50</p>
          <p>Periodo: Mensual</p>
          <p>Disponibilidad: Si</p>
        </div>


          <jsp:include page="footer.jsp" />
    </body>
</html>
