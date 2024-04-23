<%-- 
    Document   : header
    Created on : 16 abr. 2024, 9:51:57
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
       
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <form class="form-inline" action="home" method="get">
                    <button class="btn btn-link nav-link" type="submit"><i class="fas fa-home"></i> Home</button>
                </form>
            </li>
            <li class="nav-item">
                <form class="form-inline" action="LoginServlet" method="get">
                    <button class="btn btn-link nav-link" type="submit"><i class="fas fa-user"></i> Perfil</button>
                </form>
            </li>
            <li class="nav-item">
                <form class="form-inline" action="SearchServlet" method="get">
                    <div class="row g-3 align-items-center">
                        <div class="col-auto">
                            <input type="text" class="form-control" name="query" placeholder="Search...">
                        </div>
                        <div class="col-auto">
                            <button class="btn btn-primary" type="submit">Search</button>
                        </div>
                    </div>
                </form>
            </li>
        </ul>
    </div>
</nav>

    
