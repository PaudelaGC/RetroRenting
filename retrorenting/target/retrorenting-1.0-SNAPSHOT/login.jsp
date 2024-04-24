<%-- 
    Document   : login
    Created on : 16 abr. 2024, 9:47:12
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<<<<<<< HEAD
        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
        <div class="container mt-5">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        
                        <h1 class="text-center mb-4">Iniciar Sesión</h1>
                        <form action="UserProfileServlet" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Correo Electrónico:</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Contraseña:</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Ingresar</button>
                            </div>
                        </form>
                        <form action="RegisterServlet" method="get">
                            <div class="text-center mt-3">
                                <button type="submit" class="btn btn-secondary">Registrarse</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
          <jsp:include page="footer.jsp" />
=======
<!DOCTYPE html>
<html>
    <head>
<!DOCTYPE html>
<html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="nav.jsp" />
        
                <h1>${nyname}</h1>
        <h1>Login</h1>
        <h2>Iniciar Sesión</h2>

        <form action="LoginServlet" method="post">
            <div>
                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div>
                <input type="hidden" name="publicacion_id" value="${publicacion_id}">
                <input type="hidden" name="usuario_id" value="${usuario_id}">
                <button type="submit">Ingresar</button>
            </div>
        </form>

        <form action="RegisterServlet" method="get">
            <div>
                <input type="hidden" name="publicacion_id" value="${publicacion_id}">
                <input type="hidden" name="usuario_id" value="${usuario_id}">
                <button type="submit">Registrarse</button>
            </div>
        </form>
        <jsp:include page="footer.jsp" />
>>>>>>> main
    </body>

</html>
