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
                    <p class="card-text"><strong>Nombre:</strong> Lionel</p>
                    <p class="card-text"><strong>Apellido:</strong> Messi</p>
                    <p class="card-text"><strong>Correo Electrónico:</strong> juan@example.com</p>
                    <p class="card-text"><strong>Fecha de Nacimiento:</strong> 10 de Enero de 1990</p>
                    <p class="card-text"><strong>Dirección:</strong> Calle Principal, 123, Escalera B, Piso 2, Puerta 4</p>
                    <p class="card-text"><strong>Código Postal:</strong> 12345</p>
                    <p class="card-text"><strong>Ciudad:</strong> Ciudad de Ejemplo</p>
                    <p class="card-text"><strong>Región:</strong> Región de Ejemplo</p>
                    <p class="card-text"><strong>País:</strong> País de Ejemplo</p>

                    <div class="mt-4">
                        <form action="UploadPostServlet" method="get">
                            <button type="submit" class="btn btn-primary me-3">Publicar</button>
                        </form>
                        <form action="EditProfileServlet" method="get">
                            <input type="hidden" name="userId" value="<%= userId%>">
                            <button type="submit" class="btn btn-secondary me-3">Editar Mi Perfil</button>
                        </form>
                        <form action="RequestManagerServlet" method="get">
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
