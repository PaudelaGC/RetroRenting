<%-- 
    Document   : UserProfile
    Created on : 16 abr. 2024, 9:57:38
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<% String userId = request.getParameter("userId");%>
<div class="container mt-5 antesFooter">
    <h2 class="mb-4">Perfil de Usuario</h2>

    <div class="card">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="css/images/messi.jpeg" class="img-fluid" alt="Imagen de perfil">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <p class="card-text"><strong>Nombre:</strong> ${user.name}</p>
                    <p class="card-text"><strong>Apellido:</strong> ${user.surname}</p>
                    <p class="card-text"><strong>Ciudad:</strong> ${address.city}</p>
                    <p class="card-text"><strong>País:</strong> ${address.country}</p>


                    <div class="mt-4">
                        <form action="UploadPostServlet" method="get">
                            <button type="submit" class="btn btn-primary me-3">Publicar</button>
                        </form>
                        <form action="EditProfileServlet" method="get">
                            <input type="hidden" name="userId" value="<%= userId%>">
                            <button type="submit" class="btn btn-secondary me-3">Editar Mi Perfil</button>
                        </form>
                        <form action="RequestManagerServlet" method="get">
                            <input type="hidden" name="userId" value="<%= userId%>">
                            <button type="submit" class="btn btn-info me-3">Ver Peticiones</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-4">
        <form action="SignOutServlet" method="get">
            <button type="submit" class="btn btn-danger me-3">CERRAR SESION</button>
        </form>
        <form action="DeletedAccountServlet" method="post">
            <button type="submit" class="btn btn-danger">ELIMINAR CUENTA</button>
            <input type="hidden" name="userId" value="<%= userId %>">
        </form>
    </div>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
