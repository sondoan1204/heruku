<%-- 
    Document   : google
    Created on : Dec 14, 2016, 10:23:14 PM
    Author     : SONPC
--%>

<%@page import="model.GooglePojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%  String AUTH = "auth";
            GooglePojo gp = (GooglePojo)request.getAttribute(AUTH); %>
<div style="width:400px;margin:auto;padding-top:30px;">
  <table class="table table-bordered">
    <tr>
      <td>User ID</td>
      <td><%=gp.getId()%></td>
    </tr>
    <tr>
      <td>Name</td>
      <td><%=gp.getName()%></td>
    </tr>
    <tr>
      <td>Email</td>
      <td><%=gp.getEmail()%></td>
    </tr>
    <tr>
      <td>dad</td>
      <td><%=gp.getGiven_name()%></td>
    </tr>
    <tr>
      <td>hih</td>
      <td> </td>
    </tr>
    
    
  </table> 
    <img src="<%=gp.getPicture()%>" >
</div>
    </body>
</html>
