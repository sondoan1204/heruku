<%-- 
    Document   : textgit
    Created on : Dec 14, 2016, 12:59:55 AM
    Author     : SONPC
--%>

<%@page import="model.GithubPojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>DEMO - Login With Google using Java</title>
<link href='/css/bootstrap.min.css' rel='stylesheet' type='text/css'/>
</head>
<body>

<div style="width:730px;margin:auto">
<script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<!-- demos -->
<ins class="adsbygoogle"
     style="display:inline-block;width:728px;height:90px"
     data-ad-client="ca-pub-4537529140156254"
     data-ad-slot="4444050329"></ins>
<script>
(adsbygoogle = window.adsbygoogle || []).push({});
</script>
</div>
<%GithubPojo gp = (GithubPojo)request.getAttribute("auth"); %>
<div style="width:400px;margin:auto;padding-top:30px;">
  <table class="table table-bordered">
    <tr>
      <td>Pic</td>
      <td><img src="<%=gp.getAvatar_url()%>"/></td>
    </tr>
    <tr>
      <td>User ID</td>
      <td><%=gp.getId()%></td>
    </tr>
    <tr>
      <td>Name</td>
      <td><%=gp.getName()%></td>
    </tr>
    <tr>
      <td>Followers</td>
      <td><%=gp.getFollowers()%></td>
    </tr>
    <tr>
      <td>Following</td>
      <td><%=gp.getFollowing()%></td>
    </tr>
    <tr>
      <td>Login</td>
      <td><%=gp.getLogin()%></td>
    </tr>
  </table> 
</div>

</body>
</html>
