<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.cart"%>
<%@page import="model.products"%>
<%@page import="sandwich.productSW"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="vi">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Trang chủ | Sandwich Chía Núi</title>
        
        <meta property="og:title" content="Web đồ án JSP của Voi Ăn Gà">
        <meta property="og:description" content="SANDWICH CHÍA NÚI mong muốn mang món Sandwich Truyền thống đã bị lãng quên bấy lâu đến mọi đối tượng khách hàng , đây hoàn toàn là một món ăn không thể bỏ qua đối với một người yêu fastfood như bạn !!!">
        <meta property="og:url" content="https://www.facebook.com/minhduc.271293">
        <meta property="og:site_name" content="Web đồ án JSP của Voi Ăn Gà">
        <meta property="og:image" content="http://sandwichchianui.jelastic.skali.net/images/logo.png">
        <!-- *** Site Style ***-->
        <link href='css/bootstrapefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/font-awesomeefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/owl.carouselefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/owl.transitionsefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/css-main-stylesefbf.css' rel='stylesheet' type='text/css' />
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,700&amp;subset=latin,vietnamese' rel='stylesheet' type='text/css'>
        <script src='scripts/jquery-1.9.1.minefbf.js' type='text/javascript'></script>
    </head>
    <body>
        <%            
            cart cart = (cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new cart();
                session.setAttribute("cart", cart);
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <h1 style="display:none;">Sandwich Chía Núi</h1>
        <jsp:include page="slider.jsp"></jsp:include>
            <!-- nội dung content -->
            <section class="content">
                <div class="container">
                    <!--<div class="mid-banner row">
                        <div class="col-md-4 banner-l hidden-sm col-xs-12 em-effect06">
                            <a href="#" class="em-eff06-03" title="Baner trái">
                                <img src="./images/banner-3839b.jpg" alt="Baner trái">
                            </a>
                        </div>
                        <div class="col-md-8 banner-r col-sm-12 col-xs-12 em-effect06">
                            <a href="#" class="em-eff06-03" title="Banner phải">
                                <img src="./images/banner-4839b.jpg" alt="Banner phải">
                            </a>
                        </div>
                    </div>-->
                    <div class="content row">
                        <div class="col-md-3 left-sidebar">
                        <jsp:include page="danhmucsanpham.jsp"></jsp:include>
                        <jsp:include page="sanphamhot.jsp"></jsp:include>
                        <jsp:include page="sanphamkhuyenmai.jsp"></jsp:include>
                        </div>
                        <div class="col-md-9 center-site">
                            <div class="center">
                                <div class="prod-coll-1">
                                    <div class="module-title">
                                        <h2>Sản phẩm nổi bật</h2>
                                    </div>
                                    <div class="prod-coll-1-owl">
                                    <%
                                        NumberFormat format = new DecimalFormat("###,###");
                                        productSW pd = new productSW();
                                        String a = request.getRequestURI() + "?" + request.getQueryString();
                                        String q = a.replace('&', '+');
                                        int count = 0;
                                        for (products p : pd.getListProductByTop()) {
                                            if (count % 6 == 0) {
                                    %>
                                    <div class="row">
                                        <%
                                            }
                                        %>
                                        <div class="col-sm-4 col-xs-6 col-xs-small-1">
                                            <div class="product-grid">
                                                <div class="feature-img">
                                                    <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                                        <img src="images-product/<%=p.getAnhbia()%>" alt="<%=p.getTen()%>" class="img-responsive">
                                                    </a>
                                                    <div class="grid-action-box">
                                                        <a href='CartServlet?command=plus&productID=<%=p.getIDsp()%>&url=<%=q%>' class="btn btn-primary ">Mua hàng</a>
                                                    </div>
                                                </div>
                                                <div class="prod-info">
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
                                                    <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                                        <h3><%=p.getTen()%></h3>
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            count++;
                                            if (count % 6 == 0) { %>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>
                                </div>
                            </div>
                        </div>	
                        <!--<div class="center-mid-banner effect-img">
                            <a href="#">
                                <img class="center-mid-banner-img" src="./images/mid-banner839b.jpg" alt="Mid banner">
                            </a>
                        </div>-->
                        <div class="prod-coll-1 left15">
                            <div class="module-title">
                                <h2>Sản phẩm mới</h2>
                            </div>
                            <div class="row">
                                <div class="prod-coll-2-owl">
                                    <%
                                        for (products p : pd.getListProductByNew()) {
                                    %>
                                    <div class="col-md-12">
                                        <div class="product-grid">
                                            <div class="feature-img">
                                                <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                                    <img src="images-product/<%=p.getAnhbia()%>" alt="<%=p.getTen()%>" class="img-responsive">
                                                </a>
                                                <div class="grid-action-box">
                                                    <a href='CartServlet?command=plus&productID=<%=p.getIDsp()%>&url=<%=q%>' class="btn btn-primary ">Mua hàng</a>
                                                </div>
                                            </div>
                                            <div class="prod-info">

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

                                                <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                                    <h3><%=p.getTen()%></h3>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>	
                        <!--<div class="bottom-mid-banner">
                            <div class="row">
                                <div class="bottom-bn-left col-sm-6">
                                    <a href="#">
                                        <img src="./images/banner-1839b.jpg" alt="banner trái">
                                    </a>
                                </div>
                                <div class="bottom-bn-right col-sm-6">
                                    <a href="#">
                                        <img src="./images/banner-2839b.jpg" alt="banenr phải">
                                    </a>
                                </div>
                            </div>
                        </div>-->
                        <div class="prod-coll-1 left15">
                            <div class="module-title">
                                <h2>Sản phẩm trong tuần</h2>
                            </div>
                            <div class="row">
                                <div class="prod-coll-3-owl">							
                                    <%
                                        for (products p : pd.getListProductByTopweek()) {
                                    %>
                                    <div class="col-md-12">
                                        <div class="product-grid">
                                            <div class="feature-img">
                                                <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                                    <img src="images-product/<%=p.getAnhbia()%>" alt="<%=p.getTen()%>" class="img-responsive">
                                                </a>
                                                <div class="grid-action-box">
                                                    <a href='CartServlet?command=plus&productID=<%=p.getIDsp()%>&url=<%=q%>' class="btn btn-primary addtocart">Mua hàng</a>
                                                </div>
                                            </div>
                                            <div class="prod-info">
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
                                                <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                                    <h3><%=p.getTen()%></h3>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                </div>
                            </div>
                        </div>	
                    </div>
                </div>
            </div>
        </div>			
    </section>
    <jsp:include page="brand.jsp"></jsp:include>
    <jsp:include page="footer.jsp"></jsp:include>
    <jsp:include page="copyright.jsp"></jsp:include>
    <script src='scripts/bootstrap.minefbf.js' type='text/javascript'></script>
    <script src='scripts/owl.carouselefbf.js' type='text/javascript'></script>
    <script src='scripts/main-scriptefbf.js' type='text/javascript'></script>
    <script src='scripts/componentsefbf.js' type='text/javascript'></script>
    <script src='scripts/appefbf.js' type='text/javascript'></script>
    <script src='scripts/ajax-cartefbf.js' type='text/javascript'></script>
    
</body>
</html>
