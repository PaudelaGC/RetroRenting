<%-- 
    Document   : login
    Created on : 16 abr. 2024, 9:47:12
    Author     : Andy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
            <button type="submit">Ingresar</button>
            <button type="button" >Registrarse</button>
          </div>
        </form>
    </body>
</html>
