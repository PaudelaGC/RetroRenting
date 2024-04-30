<%-- 
    Document   : modifyPost
    Created on : 19 abr. 2024, 15:00:00
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar si se enviaron mensajes de error desde el servlet
    String denied1 = (String) request.getAttribute("denied1");
    String denied2 = (String) request.getAttribute("denied2");
    if (denied1 == null) {
        denied1 = "null";
    }
    if (denied2 == null) {
        denied2 = "null";
    }
%>


<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<div class="container mt-4">
    <h1>Modificar Publicación</h1>
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
        <input type="hidden" name="postId" value="${post.id}">
        <button type="submit" class="btn btn-primary">Guardar Cambios</button>
    </form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>

