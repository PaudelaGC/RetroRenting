<%-- 
    Document   : paymentOk
    Created on : 21 abr. 2024, 9:49:52
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
        <h1>El pago Fue confirmado</h1>
            <form action="RequestManagerServlet" method="get">
                <button type="submit">Volver</button>
            </form>
    </body>
</html>
