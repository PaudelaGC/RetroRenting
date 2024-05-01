<%-- 
    Document   : requestDenied
    Created on : 21 abr. 2024, 10:04:56
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
       <h1 class="text-center">La peticion id Fue Rechazada</h1>
         <form action="RequestManagerServlet" method="get">
                <button type="submit">Volver</button>
         </form>
         <jsp:include page="footer.jsp" />
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
