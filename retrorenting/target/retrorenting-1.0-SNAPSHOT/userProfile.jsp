<%-- 
    Document   : UserProfile
    Created on : 16 abr. 2024, 9:57:38
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>Perfil de Usuario</h2>

        <div>
          <p><strong>Nombre:</strong> Juan</p>
          <p><strong>Apellido:</strong> Pérez</p>
          <p><strong>Correo Electrónico:</strong> juan@example.com</p>
          <p><strong>Fecha de Nacimiento:</strong> 10 de Enero de 1990</p>
          <p><strong>Dirección:</strong> Calle Principal, 123, Escalera B, Piso 2, Puerta 4</p>
          <p><strong>Código Postal:</strong> 12345</p>
          <p><strong>Ciudad:</strong> Ciudad de Ejemplo</p>
          <p><strong>Región:</strong> Región de Ejemplo</p>
          <p><strong>País:</strong> País de Ejemplo</p>
           <form action="UploadPostServlet" method="get">
                <button type="submit">Publicar</button>
           </form>
        </div>
    </body>
</html>
