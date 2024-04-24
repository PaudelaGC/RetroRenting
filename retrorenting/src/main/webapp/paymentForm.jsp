<%-- 
    Document   : payForm
    Created on : 16 abr. 2024, 9:59:17
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
        <h1>Formulario de Pago</h1>

        <form action="RequestPaymentProcessServlet" method="post">
          <div>
            <label for="card_number">Número de Tarjeta:</label>
            <input type="text" id="card_number" name="card_number" pattern="[0-9]{16}" title="Debe tener 16 dígitos" required>
          </div>
          <div>
            <label for="expiry_date">Fecha de Expiración:</label>
            <input type="text" id="expiry_date" name="expiry_date" placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/([0-9]{2})" title="Formato válido: MM/YY" required>
          </div>
          <div>
            <label for="cvv">CVV:</label>
            <input type="text" id="cvv" name="cvv" pattern="[0-9]{3,4}" title="Debe tener 3 o 4 dígitos" required>
          </div>
          <button type="submit">Realizar Petición</button>
        </form>
        <form action="ViewPostServlet" method="get">
             <button type="submit">Atrás</button>
        </form>
          <jsp:include page="footer.jsp" />
    </body>
</html>
