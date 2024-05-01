<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String denied = (String) request.getAttribute("denied");
    if(denied == null){
    denied = "null";
    }
%>
<jsp:include page="header.jsp" />
<jsp:include page="nav.jsp" />

<div class="container mt-5 antesFooter">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <h1 class="text-center mb-4">Iniciar Sesion</h1>
            <form action="LoginServlet2" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Correo Electrónico:</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Contraseña:</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <div class="text-center">
                    <input type="hidden" name="postId" value="${postId}">
                    <input type="hidden" name="userId" value="${userId}">
                    <button type="submit" class="btn btn-primary">Ingresar</button>
                    <% if(!denied.equals("null")){ %>
                    <p><span style="color: red;">Correo o contraseña incorrectos</span></p>
                    <% } %>
                </div>
            </form>
            <form action="RegisterServlet" method="get">
                <div class="text-center mt-3">
                    <input type="hidden" name="postId" value="${postId}">
                    <input type="hidden" name="userId" value="${userId}">
                    <button type="submit" class="btn btn-secondary">Registrarse</button>
                </div>
            </form>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>

</html>
