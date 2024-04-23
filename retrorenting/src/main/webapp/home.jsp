<%-- 
    Document   : home
    Created on : 18 mar 2024, 13:48:38
    Author     : Mati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <jsp:include page="header.jsp" />
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
          <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>          
    </body>
