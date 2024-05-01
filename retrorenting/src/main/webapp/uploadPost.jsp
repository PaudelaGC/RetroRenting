<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  String userId = request.getParameter("userId");
    String denied1 = (String) request.getAttribute("denied1");
    String denied2 = (String) request.getAttribute("denied2");
    if(denied1 == null){
    denied1 = "null";
    }
    if(denied2 == null){
    denied2 = "null";
    }%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />
<div class="container mt-4 antesFooter">
    <h1 class="text-center">Subir Publicación</h1>
    <form action="UploadPostServlet" method="post">
        <div class="mb-3">
            <label for="title" class="form-label">Título:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Ingrese el título" required>
        </div>
        <div class="mb-3">
            <label for="description" class="form-label">Descripción:</label>
            <textarea class="form-control" id="description" name="description" placeholder="Ingrese la descripción" required></textarea>
        </div>
        <div class="mb-3">
            <label for="price" class="form-label">Precio:</label>
            <input type="text" class="form-control" id="price" name="price" placeholder="Ingrese el precio" required>
            <% if(!denied1.equals("null")){ %>
            <p><span style="color: red;"><%= denied1 %></span></p>
                <% } %>
        </div>
        <div class="mb-3">
            <label for="duration" class="form-label">Duracion (en días):</label>
            <input type="text" class="form-control" id="duration" name="duration" placeholder="Ingrese la duracion del alquiler" required>
            <% if(!denied2.equals("null")){ %>
            <p><span style="color: red;"><%= denied2 %></span></p>
                <% } %>
        </div>
        <input type="hidden" name="userId" value="<%= userId%>">
        <button type="submit" class="btn btn-primary">Subir Publicación</button>
    </form>
</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</body>
</html>
