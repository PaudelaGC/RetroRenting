<%-- 
    Document   : profileEditedOk.jsp
    Created on : 21 abr. 2024, 9:24:02
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
        <h1>El perfil se edito correctamente</h1>
            <form action="UserProfileServlet" method="get">
                <button type="submit">Volver</button>
            </form>
              <jsp:include page="footer.jsp" />
    </body>
</html>
