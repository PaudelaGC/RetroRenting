<%-- 
    Document   : requestSavedSauccess
    Created on : 20 abr. 2024, 16:36:41
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
        <h1>SU peticion fue enviada con éxito</h1>
        <form action="HomeServlet" method="get">
                <button type="submit">Volver</button>
        </form>
         <jsp:include page="footer.jsp" />
    </body>
</html>