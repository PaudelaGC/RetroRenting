<%-- 
    Document   : userOptions
    Created on : 1 may. 2024, 12:03:07
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />   
<jsp:include page="nav.jsp" />
<% 
                String userId = request.getParameter("userId");
                String token = response.getHeader("Authorization");
                String denied = (String) request.getAttribute("denied");
                if(denied == null){
                denied = "null";
                }
                boolean expired = false;
%>

<div class="container divUserOptions">
            <h1 class="text-center">Opciones</h1>
            <form action="EditProfileServlet" method="get">
                <input type="hidden" name="userId" value="<%= userId%>">
                <button type="submit" class="btn btn-secondary me-3">Editar Mi Perfil</button>
            </form>
            <form action="RequestManagerServlet" method="get">
                            <input type="hidden" name="userId" value="<%= userId%>">
                            <button type="submit" class="btn btn-info me-3">Ver Peticiones</button>
            </form>
            <form action="SignOutServlet" method="get">
                <button type="submit" class="btn btn-danger me-3">CERRAR SESION</button>
            </form>
            <form action="DeletedAccountServlet" method="post">
                <button type="submit" class="btn btn-danger">ELIMINAR CUENTA</button>
                <input type="hidden" name="userId" value="<%= userId %>">
            </form>
    
</div>
    <jsp:include page="footer.jsp" />
    </body>
</html>
