<%-- 
    Document   : logout
    Created on : Jun 15, 2022, 3:59:05 PM
    Author     : Archana
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            session.invalidate();
        %>
        <script>
            window.location="login.html";
            </script>
    </body>
</html>
