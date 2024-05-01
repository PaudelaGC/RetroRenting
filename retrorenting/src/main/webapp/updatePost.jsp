<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String denied1 = (String) request.getAttribute("denied1");
    String denied2 = (String) request.getAttribute("denied2");
    String userId = request.getParameter("userId");
    if (denied1 == null) {
        denied1 = "null";
    }
    if (denied2 == null) {
        denied2 = "null";
    }
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<div class="container mt-4 antesFooter">
    <h1 class="text-center">Modificar Publicación</h1>
    <form action="UpdatePostServlet" method="post">
        <div class="mb-3">
            <label for="title" class="form-label">Título:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="${post.title}" >
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Descripción:</label>
            <textarea class="form-control" id="description" name="description" placeholder="${post.description}" ></textarea>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Precio:</label>
            <input type="text" class="form-control" id="price" name="price" placeholder="${post.price}" >
            <% if(!denied1.equals("null")){ %>
            <p><span style="color: red;"><%= denied1 %></span></p>
                <% } %>
        </div>
        <div class="mb-3">
            <label for="duration" class="form-label">Duración (en días):</label>
            <input type="text" class="form-control" id="duration" name="duration" placeholder="${post.duration}" >
            <% if(!denied2.equals("null")){ %>
            <p><span style="color: red;"><%= denied2 %></span></p>
                <% } %>
        </div>
        <div>
            <input type="hidden" name="postId" value="${post.id}">
            <input type="hidden" name="userId" value="<%= userId %>">
            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
        </div>
    </form>
    <button type="submit" class="btn btn-primary" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#logoutModal">ELIMINAR PUBLICACIÓN</button>
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">Confirma la eliminación de la publicación</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>¿Estas seguro de que quieres eliminar esta publicación?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                    <form action="DeletePostServlet" method="post">
                        <input type="hidden" name="postId" value="${post.id}">
                        <input type="hidden" name="userId" value="<%= userId %>">
                        <button type="submit" class="btn btn-primary">Si</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

