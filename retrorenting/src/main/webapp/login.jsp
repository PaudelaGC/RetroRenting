<%-- 
    Document   : login
    Created on : 16 abr. 2024, 9:47:12
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
        <h1>Login</h1>
        <h2>Iniciar Sesión</h2>

            <form action="UserProfileServlet" method="post">
              <div>
                <label for="email">Correo Electrónico:</label>
                <input type="email" id="email" name="email" required>
              </div>
              <div>
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
              </div>
              <div>
                <button type="submit">Ingresar</button>
              </div>
            </form>

            <form action="RegisterServlet" method="get">
              <div>
                <button type="submit">Registrarse</button>
              </div>
            </form>
          <jsp:include page="footer.jsp" />
    </body>
    
</html>
