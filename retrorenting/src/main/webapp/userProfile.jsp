<%-- 
    Document   : UserProfile
    Created on : 16 abr. 2024, 9:57:38
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<% String userId = request.getParameter("userId");%>
<div class="container mt-5">
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

    <!-- Botón que activa el modal de cierre de sesión -->
    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#logoutModal">
        CERRAR SESIÓN
    </button>

    <!-- Modal para logout -->
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">Confirmación de cierre de sesión</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>¿Estas seguro de que quieres cerrar sesion?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <form action="SignOutServlet" method="get">
                        <button type="submit" class="btn btn-primary">Si</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Botón que activa el modal de eliminación de cuenta -->
    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteAccountModal">
        ELIMINAR CUENTA
    </button>

    <!-- Modal para eliminación de cuenta -->
    <div class="modal fade" id="deleteAccountModal" tabindex="-1" aria-labelledby="deleteAccountModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteAccountModalLabel">Confirmación de Eliminación de Cuenta</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Por favor, escribe "BORRAR CUENTA" para confirmar la eliminación de tu cuenta.</p>
                    <input type="text" id="confirmationInput" class="form-control" placeholder="Escribe aquí">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <!-- Formulario que será enviado si la confirmación es correcta -->
                    <form id="deleteForm" action="DeletedAccountServlet" method="post" style="display: none;">
                        <input type="hidden" name="userId" value="<%= userId %>">
                        <button type="submit" class="btn btn-danger">Confirmar Eliminación</button>
                    </form>
                    <button type="button" class="btn btn-danger" onclick="confirmDeletion()">Confirmar Eliminación</button>
                </div>
            </div>
        </div>
    </div>

    <script>
    function confirmDeletion() {
        var confirmationText = document.getElementById('confirmationInput').value;
        if(confirmationText === "BORRAR CUENTA") {
            // Si la frase es correcta, envía el formulario de eliminación
            document.getElementById('deleteForm').submit();
        } else {
            alert('La frase ingresada es incorrecta.');
        }
    }
    </script>
</div>

<jsp:include page="footer.jsp" />
</body>
</html>
