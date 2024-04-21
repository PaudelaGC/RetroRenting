<%-- 
    Document   : viewPost
    Created on : 20 abr. 2024, 16:02:53
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
        <h1>Titulo de publicacion</h1>
        <div>
            <h2>Título de la Publicación</h2>
            <p>Descripción de la publicación simulada.</p>
            <p>Precio: $50</p>
            <p>Periodo: Mensual</p>
            <p>Disponibilidad: Si</p>
        </div>
        <form action="ViewProfileUserServlet" method="get">
            <%--<input type="hidden" name="usuario_id" value="id_del_usuario">--%>
            <button type="submit">Ver Perfil del Usuario</button>
        </form>
        <form action="PaymentFormServlet" method="get">
            <%--<input type="hidden" name="publicacion_id" value="id_de_la_publicacion">--%>
            <button type="submit">Solicitar</button>
        </form>
    </body>
</html>
