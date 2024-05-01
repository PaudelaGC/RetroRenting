<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String emailError = (String) request.getAttribute("emailError");
    String dateError = (String) request.getAttribute("dateError");
    String passwordError = (String) request.getAttribute("passwordError");
    if(emailError == null){
    emailError = "null";
    }
    if(dateError == null){
    dateError = "null";
    }
    if(passwordError == null){
    passwordError = "null";
    }
%>
<jsp:include page="header.jsp" />   
<jsp:include page="nav.jsp" />

<div class="container antesFooter">
    <h2 class="mt-5 mb-4">Registro de Usuario</h2>

    <form action="RegisterServlet" method="post">
        <div class="mb-3">
            <label for="nombre" class="form-label">Nombre:</label>
            <input type="text" class="form-control" id="nombre" name="nombre" required>
        </div>
        <div class="mb-3">
            <label for="apellido" class="form-label">Apellido:</label>
            <input type="text" class="form-control" id="apellido" name="apellido" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Correo Electrónico:</label>
            <input type="email" class="form-control" id="email" name="email" required>
            <% if(!emailError.equals("null")){ %>
            <p><span style="color: red;"><%= emailError %></span></p>
                <% } %>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Contraseña:</label>
            <input type="password" class="form-control" id="password" name="password" required>
            <% if(!passwordError.equals("null")){ %>
            <p><span style="color: red;"><%= passwordError %></span></p>
                <% } %>
        </div>
        <div class="mb-3">
            <label for="fecha_nacimiento" class="form-label">Fecha de Nacimiento:</label>
            <input type="date" class="form-control" id="fecha_nacimiento" name="fecha_nacimiento" required>
            <% if(!dateError.equals("null")){ %>
            <p><span style="color: red;"><%= dateError %></span></p>
                <% } %>
        </div>
        <div class="mb-3">
            <label for="calle" class="form-label">Calle:</label>
            <input type="text" class="form-control" id="calle" name="calle" placeholder="Calle" required>
        </div>
        <div class="row mb-3">
            <div class="col">
                <label for="numero" class="form-label">Número:</label>
                <input type="text" class="form-control" id="numero" name="numero" placeholder="Número" required>
            </div>
            <div class="col">
                <label for="bloque" class="form-label">Bloque:</label>
                <input type="text" class="form-control" id="bloque" name="bloque" placeholder="Bloque">
            </div>
            <div class="col">
                <label for="puerta" class="form-label">Puerta:</label>
                <input type="text" class="form-control" id="puerta" name="puerta" placeholder="Puerta">
            </div>
            <div class="col">
                <label for="piso" class="form-label">Piso:</label>
                <input type="text" class="form-control" id="piso" name="piso" placeholder="Piso">
            </div>
        </div>
        <div class="mb-3">
            <label for="codigo_postal" class="form-label">Código Postal:</label>
            <input type="text" class="form-control" id="codigo_postal" name="codigo_postal" required>
        </div>
        <div class="mb-3">
            <label for="ciudad" class="form-label">Ciudad:</label>
            <input type="text" class="form-control" id="ciudad" name="ciudad" required>
        </div>
        <div class="mb-3">
            <label for="estado" class="form-label">Estado:</label>
            <input type="text" class="form-control" id="estado" name="estado">
        </div>
        <div class="mb-3">
            <label for="pais" class="form-label">País:</label>
            <input type="text" class="form-control" id="pais" name="pais" required>
        </div>
        <input type="hidden" name="postId" value="${postId}">
        <input type="hidden" name="userId" value="${userId}">
        <button type="submit" class="btn btn-primary">Registrarse</button>
    </form>

    <form action="LoginServlet" method="get">
        <input type="hidden" name="postId" value="${postId}">
        <input type="hidden" name="userId" value="${userId}">
        <button type="submit" class="btn btn-secondary mt-3">Atrás</button>
    </form>
</div>

<jsp:include page="footer.jsp" />


</body>
</html>
