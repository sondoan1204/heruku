<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.products"%>
<%@page import="sandwich.productSW"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="sidebar-prod">
            <div class="module-title">
                <h2>Sản phẩm nổi bật</h2>
            </div>
            <div class="sidebar-prodcontent">
                <ul class="list-unstyled">
                    <%
                        NumberFormat format = new DecimalFormat("###,###");
                        productSW pd = new productSW();
                        int count = 0;
                        for (products p : pd.getListProductByTop()) {
                            count ++;
                            if(count > 5)
                            {break;}
                    %>
                    <li class="prod-list clearfix">
                        <a href="detail.jsp">
                            <img src="images-product/<%=p.getAnhbia()%>" alt="<%=p.getTen()%>">
                        </a>
                        <div class="prod-info">
                            <a href="detail.jsp"><h3><%=p.getTen()%></h3></a>

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
                                    <span><%= format.format(p.getGia())%>&#8363;</span>
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
