<%-- 
    Document   : uploadPost
    Created on : 19 abr. 2024, 14:24:17
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

        <jsp:include page="header.jsp" />
        <jsp:include page="nav.jsp" />
        <div class="container mt-4">
            <h1>Subir Publicación</h1>
            <form action="UploadPostOkServlet" method="post">
                <div class="mb-3">
                    <label for="titulo" class="form-label">Título:</label>
                    <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Ingrese el título" required>
                </div>
                <div class="mb-3">
                    <label for="descripcion" class="form-label">Descripción:</label>
                    <textarea class="form-control" id="descripcion" name="descripcion" placeholder="Ingrese la descripción" required></textarea>
                </div>
                <div class="mb-3">
                    <label for="precio" class="form-label">Precio:</label>
                    <input type="text" class="form-control" id="precio" name="precio" placeholder="Ingrese el precio" required>
                </div>
                <div class="mb-3">
                    <label for="periodo" class="form-label">Periodo:</label>
                    <select class="form-select" id="periodo" name="periodo" required>
                        <option value="diario">Diario</option>
                        <option value="semanal">Semanal</option>
                        <option value="mensual">Mensual</option>
                        <option value="anual">Anual</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="disponibilidad" class="form-label">Disponibilidad:</label>
                    <select class="form-select" id="disponibilidad" name="disponibilidad" required>
                        <option value="si">Sí</option>
                        <option value="no">No</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Subir Publicación</button>
            </form>
        </div>
        <jsp:include page="footer.jsp" />

    </body>
</html>
