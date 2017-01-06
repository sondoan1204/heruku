<%@page import="sandwich.slideSW"%>
<%@page import="model.slide"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <section class="slider">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> 
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <%
                        slideSW pd = new slideSW();
                        int y = 0;
                        for (slide p : pd.getSlide()) {
                            if (y == 0) {%>
                    <li data-target="#carousel-example-generic" data-slide-to="<%=y%>" class="active"></li>
                        <%} else {%>
                    <li data-target="#carousel-example-generic" data-slide-to="<%=y%>"></li>
                    <%}
                            y++;
                        }%>
                </ol>
                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <%
                       
                        int x = 0;
                        for (slide p : pd.getSlide()) {
                            if (x == 0) {%>
                    <div class="item active">
                        <center>
                            <a href="<%=p.getLink()%>">
                                <img src="./images/<%=p.getAnh()%>" alt="<%=p.getMota()%>">	      		
                            </a>
                        </center>
                    </div> 
                    <%} else {
                    %>
                    <div class="item">
                        <center>
                            <a href="<%=p.getLink()%>">
                                <img src="./images/<%=p.getAnh()%>" alt="<%=p.getMota()%>">	      		
                            </a>
                        </center>
                    </div>
                    <%}
                            x++;
                        }
                    %>
                    		    
                </div>
                <!-- Controls -->
                <a class="left-slide" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="fa fa-angle-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right-slide" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="fa fa-angle-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </section>
    </body>
</html>
