<%-- 
    Document   : logout
    Created on : 24 abr 2024, 10:13:04
    Author     : Mati
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
        <h1 class="text-center">Has cerrado tu sessión correctamente</h1>
        <form action="home" method="get">
            <button type="submit">Home</button>
        </form>
    </body>
</html>

