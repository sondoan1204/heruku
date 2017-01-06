<%-- 
    Document   : ChonLogin
    Created on : Dec 15, 2016, 12:07:06 AM
    Author     : SONPC
--%>

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
        <link href="${root}/admin/css/mdb.min.css" rel="stylesheet" type="text/css"/>
        <link href="${root}/admin/css/mdb.css" rel="stylesheet" type="text/css"/>
        <script src="${root}/admin/js/tether.min.js" type="text/javascript"></script>
        <script src="${root}/admin/js/tether.js" type="text/javascript"></script>
        <script src="${root}/admin/js/mdb.min.js" type="text/javascript"></script>
        <script src="${root}/admin/js/mdb.js" type="text/javascript"></script>
        <script src="${root}/admin/js/jquery-3.1.1.min.js" type="text/javascript"></script>
        <script src="${root}/admin/js/jquery-3.1.1.js" type="text/javascript"></script>
        <script src="${root}/admin/js/jquery-2.2.3.min.js" type="text/javascript"></script>
        <script src="${root}/admin/js/jquery-2.2.3.js" type="text/javascript"></script>
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
                           
                            <div id="register" class="animate w3layouts agileits form">
                                <h2>Sign up with </h2>
                                <form  action="#"  method="post" style="text-align: center;">

                                    <div  >
                                        <img src="images_login/GitHub-Mark-64px.png" alt=""/>
                                        <img src="images_login/GitHub-Mark-Light-64px.png" alt=""/>
                                        <a href="https://github.com/login/oauth/authorize?client_id=02edf4e25d434e53b086&redirect_uri=http://localhost:8080/ShopSW/Oauth2git&scope=user"><img src="images_login/GitHub_Logo.png" style="width: 200px;height: 100%"/></a>
                                    </div>
                                    <div >
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8080/ShopSW/OAuth2Callback&response_type=code&client_id=1072517011559-98o65aqld7in2j3du772p3uio5le3a2i.apps.googleusercontent.com&approval_prompt=force">
                                            <img src="images_login/new-google-favicon-logo.png" style="width: 100px;height: 100%"/>
                                            
                                        </a>  
                                        
                                    </div>
                                    
                                  
                                   
                                    
                                    <input type="text" Name="Email" required="">
                                   
                                    <input type="password" Name="Password" required="">
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