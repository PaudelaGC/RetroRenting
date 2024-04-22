<%-- 
    Document   : successRegistrationToDelete
    Created on : 19 abr. 2024, 13:06:50
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
        <h1>Se ha registrado de manera exitosa</h1>
        <form action="UserProfileServlet" method="get">
                <button type="submit">Ver Mi Perfil</button>
        </form>
         <jsp:include page="footer.jsp" />
    </body>
</html>
