<%-- 
    Document   : logingoogle
    Created on : Dec 14, 2016, 11:28:31 PM
    Author     : SONPC
--%>

<%@page import="model.GooglePojo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
       
        <link href="${root}/admin/css_login/animate-custom.css" rel="stylesheet" type="text/css"/>
        <link href="${root}/admin/css_login/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" type="text/css" media="all">
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700" 		  type="text/css" media="all">
    </head>
    <body>
        <script>
            (adsbygoogle = window.adsbygoogle || []).push({});
        </script>
        <h1 class="w3layouts agileits">ADMIN SIGN IN FORM</h1>
        <div class="container w3layouts agileits">
            <div class="content-left w3layouts agileits">
                <img src="${root}/admin/images_login/background.jpg" alt="W3layouts Agileits">
                <p>Plan your next dream trip. Select your destination and leave the rest to us.</p>
                <a class="more w3layouts agileits" href="#">LEARN MORE</a>
                <div class="list w3layouts agileits">
                    <ul class="w3layouts agileits">
                        <li class="w3layouts agileits"><a href="#">About</a></li>
                        <li class="li2 w3layouts agileits"><a href="#">Terms Of Use</a></li>
                        <li class="w3layouts agileits"><a href="#">Contact</a></li>
                    </ul>
                </div>
            </div>
            <div class="content-right w3layouts agileits">
                <section>
                    <div id="container_demo">
                        <a class="hiddenanchor w3layouts agileits" id="tologin"></a>
                        <a class="hiddenanchor w3layouts agileits" id="toregister"></a>
                        <div id="wrapper">
                            <div id="login" class="animate w3layouts agileits form">
                                <h2 class="w3layouts agileits">Sign In</h2>
                                <form  action="#" autocomplete="on" method="post">
                                    <label>E-mail</label>
                                    <input type="text" Name="Userame" required="">
                                    <label>Password</label>
                                    <input type="password" Name="Password" required="">
                                    <div class="send-button w3layouts agileits">
                                        <p><a href="#">Forgot Password?</a></p>
                                        <form>
                                            <input type="submit" value="SIGN IN">
                                        </form>
                                        <div class="clear"></div>
                                    </div>
                                    <p class="change_link w3layouts agileits">
                                        Don't have an account? <a href="#toregister" class="to_register">Sign Up!</a>
                                    </p>
                                    <div class="clear"></div>
                                </form>
                                <div class="clear"></div>
                            </div>
                            <%  String AUTH = "auth";
                                GooglePojo gp = (GooglePojo) request.getAttribute(AUTH);%>
                            <div id="register" class="animate w3layouts agileits form">
                                <h2>Sign up with <%=gp.getName()%></h2>
                                <form  action="${root}/AdminServlet"  method="post" style="text-align: center;">
                                    <img src="<%=gp.getPicture()%>" style="width: 371px; height: 100%" >
                                    <input type="hidden" Name="ten" value="<%=gp.getName()%>">
                                    <input type="hidden" Name="Anhdaidien" value="<%=gp.getPicture()%>">
                                    <input type="hidden" Name="Idgit" value="<%=gp.getId()%>">
                                    <input type="hidden" Name="Email" value="<%=gp.getEmail()%>">
                                    <input type="hidden" Name="User" value="">
                                    <div class="send-button w3layouts agileits">
                                        <input type="hidden" name="command" value="insert">
                                        <input type="submit" value="SIGN UP">
                                    </div>
                                </form>
                                <p class="change_link w3layouts agileits">
                                    Already a member? <a href="#tologin" class="to_register">Sign In</a>
                                </p>
                                <div class="clear"></div>
                                </form>
                            </div>
                            <div class="clear"></div>
                        </div>
                    </div>
                </section>
            </div>
            <div class="clear"></div>
        </div>
    </body>
</html>
