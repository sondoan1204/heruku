<%-- 
    Document   : loginfb
    Created on : Dec 15, 2016, 11:38:56 PM
    Author     : SONPC
--%>

<%@page import="model.FaceBookPojo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <title>Travel Agency Sign In Form A Flat Responsive Widget Template :: W3layouts</title>

        <!-- Meta-Tags -->
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //Meta-Tags -->

        <!-- Custom-Styleheet-Links -->
        <link href="${root}/admin/css_login/animate-custom.css" rel="stylesheet" type="text/css"/>
        <link href="${root}/admin/css_login/style.css" rel="stylesheet" type="text/css"/>
        <!-- //Custom-Styleheet-Links -->

        <!-- Fonts -->
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" type="text/css" media="all">
        <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Montserrat:400,700" 		  type="text/css" media="all">
        <!-- //Fonts -->

    </head>
    <!-- //Head -->



    <!-- Body -->
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
                                <!--                                <div class="social-icons w3layouts agileits">
                                                                    <p>OR USE YOUR SOCIAL ACCOUNTS</p>
                                                                    <ul>
                                                                        <li class="fb w3ls w3layouts agileits"><a href="#"><span class="icons w3layouts agileits"></span><span class="text w3layouts agileits">Facebook</span></a></li>
                                                                        <li class="twt w3ls w3layouts agileits"><a href="#"><span class="icons w3layouts agileits"></span><span class="text w3layouts agileits">Twitter</span></a></li>
                                                                        <div class="clear"></div>
                                                                    </ul>
                                                                </div>-->
                                <div class="clear"></div>
                            </div>
                            <%  String AUTH = "auth";
                                 FaceBookPojo fp = (FaceBookPojo)request.getAttribute(AUTH);%>
                            <div id="register" class="animate w3layouts agileits form">
                                <h2>Sign up with <%=fp.getName()%></h2>
                                <form  action="${root}/AdminServlet"  method="post" style="text-align: center;">

                                    <img src="http://graph.facebook.com/<%=fp.getId()%>/picture" style="width: 371px; height: 100%" />
                                    <!--									<label>Name</label>-->
                                    <input type="hidden" Name="ten" value="<%=fp.getName()%>">
                                    <input type="hidden" Name="Anhdaidien" value="http://graph.facebook.com/<%=fp.getId()%>/picture">
                                    <input type="hidden" Name="Idgit" value="<%=fp.getId()%>">
                                    <input type="hidden" Name="Email" value="<%=fp.getEmail()%>">
                                    <input type="hidden" Name="User" value="">
                                    
                                    <!--									<label>Phone Number</label>
                                                                                                            <input type="text" class="phone w3layouts agileits" Name="Phone Number" required="">
                                                                                                            <label>E-mail</label>
                                                                                                            <input type="text" Name="Email" required="">-->
                                    <!--									<label>Password</label>
                                                                                                            <input type="password" Name="Password" required="">-->
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

        <div class="footer w3layouts agileits">
            <p> &copy; 2016 Sơn Đoàn <a href="http://w3layouts.com" target="_blank">W3layouts</a></p>
        </div>

    </body>
</html>