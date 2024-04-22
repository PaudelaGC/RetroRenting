<%-- 
    Document   : requestDenied
    Created on : 21 abr. 2024, 10:04:56
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
       <h1>La peticion id Fue Rechazada</h1>
         <form action="RequestManagerServlet" method="get">
                <button type="submit">Volver</button>
         </form>
    </body>
</html>
