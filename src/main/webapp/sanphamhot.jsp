<%@page import="model.products"%>
<%@page import="sandwich.productSW"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="sidebar-prod hidden-sm hidden-xs">
            <div class="module-title">
                <h2>Sản phẩm hot</h2>
            </div>
            <div class="sidebar-prodcontent">
                <ul class="list-unstyled">
                    <%
                        NumberFormat format = new DecimalFormat("###,###");
                        productSW pd = new productSW();
                        int count = 0;
                        for (products p : pd.getListProductByHot()) {
                            count ++;
                            if(count > 5)
                            {break;}
                    %>
                    <li class="prod-list clearfix">
                        <a href="chi-tiet-<%=p.getIDsp()%>">
                            <img src="<%=p.getAnhbia()%>" alt="<%=p.getTen()%>">
                        </a>
                        <div class="prod-info">
                            <a href="chi-tiet-<%=p.getIDsp()%>"><h3><%=p.getTen()%></h3></a>

                            <%if (p.getTTkm() == true) {%>
                            <div class="price-box">
                                <p class="special-price">
                                    <span><%= format.format(p.getGiakm()) %>&#8363;</span>
                                </p>
                                <p class="old-price">
                                    <span><%= format.format(p.getGia())%>&#8363;</span>
                                </p>
                            </div>
                            <%} else {%>  
                            <div class="price-box">
                                <p class="special-price">
                                    <span><%=format.format(p.getGia())%>&#8363;</span>
                                </p>
                            </div>
                            <%}%>

                        </div>										
                    </li>
                    <%
                        }
                    %>
                </ul>
            </div>
                
        </div>
    </body>
</html>
