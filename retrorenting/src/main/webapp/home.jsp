<%-- 
    Document   : home
    Created on : 18 mar 2024, 13:48:38
    Author     : Mati
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="io.jsonwebtoken.Claims, io.jsonwebtoken.Jwts" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.retrorenting.retrorenting.configuration.db.DbConnect" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        <% 
        try {
            Connection connection = DbConnect.getConnection();
            if (connection != null) {
                // Si la conexión se establece correctamente, ciérrala inmediatamente
                connection.close();
                out.println("Connected to the database successfully!");
            } else {
                out.println("Failed to connect to the database.");
            }
        } catch (SQLException ex) {
            // Maneja cualquier excepción que ocurra durante la conexión a la base de datos
            out.println("Error connecting to the database: " + ex.getMessage());
        }
    %>
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
