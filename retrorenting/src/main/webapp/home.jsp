<%-- 
    Document   : home
    Created on : 18 mar 2024, 13:48:38
    Author     : Mati
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <div>
            <h2>Publicaciones</h2>
            <%--Este div como el resto los traeremos desde la base de datos --%>
               <div class="publicacion">
                <img src="ruta_de_la_imagen.jpg" alt="Imagen de la publicación">
                <h3>Publicacion 1</h3>
                <form action="ViewPostServlet" method="get">
                    <%--<input type="hidden" name="publicacion_id" value="id_de_la_publicacion">--%>
                  <button type="submit">Ver Publicación</button>
                </form>
              </div>
            
        </div>
         <jsp:include page="footer.jsp" />
    </body>
</html>
