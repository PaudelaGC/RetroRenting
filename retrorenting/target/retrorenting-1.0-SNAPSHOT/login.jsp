<%-- 
    Document   : login
    Created on : 16 abr. 2024, 9:47:12
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    </body>
    
</html>