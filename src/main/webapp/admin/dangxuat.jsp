<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
        session.invalidate();
        response.sendRedirect("dangnhap.jsp");
        %>
    </body>
</html>
