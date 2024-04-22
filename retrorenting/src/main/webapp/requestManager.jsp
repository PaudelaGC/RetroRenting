<%-- 
    Document   : requestManager
    Created on : 16 abr. 2024, 10:18:13
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
        <jsp:include page="nav.jsp" />
        <h2>Lista de Peticiones</h2>
        <section>
            <h3>Peticiones Recibidas</h3>
              <ul id="lista-peticiones">
              <li>
                <span>Petición 1</span>
                <form action="RequestOkServlet" method="get">
                       <button type="submit">Aceptar</button>
                </form>
             
                 <form action="RequestDeniedServlet" method="get">
                       <button type="submit">Rechazar</button>
                </form>
              </li>
              <li>
                <span>Petición 2</span>
                <form action="RequestOkServlet" method="get">
                       <button type="submit">Aceptar</button>
                </form>
             
                 <form action="RequestDeniedServlet" method="get">
                       <button type="submit">Rechazar</button>
                </form>
              </li>
              <li>
                <span>Petición 3</span>
                <form action="RequestOkServlet" method="get">
                       <button type="submit">Aceptar</button>
                </form>
             
                 <form action="RequestDeniedServlet" method="get">
                       <button type="submit">Rechazar</button>
                </form>
              </li>
            </ul>
            
        </section>
        <section>
            <h3>Peticiones Enviadas</h3>
              <ul id="lista-peticiones">
              <li>
                <span>Petición 1</span>
                 <span>Estado: Pendiente</span>
              </li>
              <li>
                <span>Petición 2</span>
                <span>Estado: Confirmada</span>
                <form action="PaymentOkServlet">
                    <button type="submit">Pagar</button>
                    
                </form>
                
              </li>
            </ul>
            
        </section>
   
        
        
        <form action="UserProfileServlet" method="get">
             <button type="submit">Atrás</button>
        </form>
    </body>
</html>
