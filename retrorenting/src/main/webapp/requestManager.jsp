<%-- 
    Document   : requestManager
    Created on : 16 abr. 2024, 10:18:13
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
            <jsp:include page="header.jsp" />
            <jsp:include page="nav.jsp" />
           <div class="container mt-4">
               <h2>Lista de Peticiones</h2>
               <section>
                   <h3>Peticiones Recibidas</h3>
                   <ul class="list-group mb-4">
                       <li class="list-group-item d-flex justify-content-between align-items-center">
                           Petición 1
                           <div>
                               <form action="RequestOkServlet" method="get" class="d-inline">
                                   <button type="submit" class="btn btn-success btn-sm">Aceptar</button>
                               </form>
                               <form action="RequestDeniedServlet" method="get" class="d-inline">
                                   <button type="submit" class="btn btn-danger btn-sm">Rechazar</button>
                               </form>
                           </div>
                       </li>
                       <li class="list-group-item d-flex justify-content-between align-items-center">
                           Petición 2
                           <div>
                               <form action="RequestOkServlet" method="get" class="d-inline">
                                   <button type="submit" class="btn btn-success btn-sm">Aceptar</button>
                               </form>
                               <form action="RequestDeniedServlet" method="get" class="d-inline">
                                   <button type="submit" class="btn btn-danger btn-sm">Rechazar</button>
                               </form>
                           </div>
                       </li>
                       <li class="list-group-item d-flex justify-content-between align-items-center">
                           Petición 3
                           <div>
                               <form action="RequestOkServlet" method="get" class="d-inline">
                                   <button type="submit" class="btn btn-success btn-sm">Aceptar</button>
                               </form>
                               <form action="RequestDeniedServlet" method="get" class="d-inline">
                                   <button type="submit" class="btn btn-danger btn-sm">Rechazar</button>
                               </form>
                           </div>
                       </li>
                   </ul>
               </section>
               <section>
                   <h3>Peticiones Enviadas</h3>
                   <ul class="list-group">
                       <li class="list-group-item d-flex justify-content-between align-items-center" >
                           Petición 1 - <span class="fw-bold">Estado: Pendiente</span>
                           <form action="PaymentOkServlet">
                               <button type="submit" class="btn btn-primary btn-sm" style="visibility: hidden;">Pagar</button>
                           </form>
                       </li>
                       <li class="list-group-item d-flex justify-content-between align-items-center">
                           Petición 2 - <span class="fw-bold">Estado: Confirmada</span>
                           <form action="PaymentOkServlet">
                               <button type="submit" class="btn btn-primary btn-sm">Pagar</button>
                           </form>
                       </li>
                   </ul>
               </section>

               <div class="mt-4">
                   <form action="UserProfileServlet" method="get">
                               <input type="hidden" name="profile" value="self">

                       <button type="submit" class="btn btn-secondary">Atrás</button>
                   </form>
               </div>
           </div>
           <jsp:include page="footer.jsp" />
    </body>
</html>
