<%-- 
    Document   : header
    Created on : 16 abr. 2024, 9:51:57
    Author     : 39348
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RetroRentingHome</title>
    </head>
    <body>
        <h1>RetroRenting</h1>
        <nav>
            <ul>
                <li>
                    <form action="home" method="get">
                        <button type="submit">Home</button>
                    </form>
                </li>
                <li>
                    <form action="LoginServlet" method="get">
                        <button type="submit">Login</button>
                    </form>
                </li>
                 
                <li>
                    <form action="SearchServlet" method="get">
                        <input type="text" name="query" placeholder="Search...">
                        <button type="submit">Search</button>
                    </form>
                </li>
            </ul>
        </nav>
    </body>
</html>
