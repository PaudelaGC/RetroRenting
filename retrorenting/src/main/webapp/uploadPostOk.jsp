<%-- 
    Document   : uploadPostOk
    Created on : 22 abr. 2024, 10:17:58
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
        <h1>La Publicacion se subio correctamente</h1>
         <form action="UserProfileServlet" method="get">
                <button type="submit">Volver</button>
        </form>
        <jsp:include page="footer.jsp" />
    </body>
</html>
