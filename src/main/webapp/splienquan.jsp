
<%@page import="sandwich.productSW"%>
<%@page import="model.products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            productSW pd = new productSW();
            String category_id = "";
            if (request.getParameter("category") != null) {
                category_id = request.getParameter("category");
            }
        %>
        <div class="prod-coll-1 left15 related_product_owl">
            <div class="module-title">
                <h2>Sản phẩm liên quan</h2>
            </div>
            <div class="row">
                <div class="prod-coll-4-owl">	
                    <%                
                        for (products p : pd.getListProductByLienquan(Long.parseLong(category_id))) {
                    %>
                    <div class="col-md-12">
                        <div class="product-grid">
                            <div class="feature-img">
                                <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                    <img src="<%=p.getAnhbia()%>" alt="<%=p.getTen()%>" class="img-responsive">
                                </a>
                                <div class="grid-action-box">
                                    <form action="" class="product_item_form" method="post">	
                                        <input type="hidden" name="variantId" value="2099142" />
                                        <button type="submit" title="Mua hàng" class="list-add-cart add-to-cart">				
                                            <span>Mua hàng</span>
                                        </button>		
                                    </form>
                                </div>
                            </div>
                            <div class="prod-info">

                                <%if (p.getTTkm() == true) {%>
                                <div class="price-box">
                                    <p class="special-price">
                                        <span><%=p.getGiakm()%>&#8363;</span>
                                    </p>
                                    <p class="old-price">
                                        <span><%=p.getGia()%>&#8363;</span>
                                    </p>
                                </div>
                                <%} else {%>  
                                <div class="price-box">
                                    <p class="special-price">
                                        <span><%=p.getGia()%>&#8363;</span>
                                    </p>
                                </div>
                                <%}%>

                                <a href="detail.jsp">
                                    <h3><%=p.getTen()%></h3>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </div>
    </body>
</html>
