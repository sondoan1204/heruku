<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URL"%>
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
        <title>Tất cả sản phẩm | Big food</title>
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
            NumberFormat format = new DecimalFormat("###,###");
            productSW pd = new productSW();
            cart cart = (cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new cart();
                session.setAttribute("cart", cart);
            }
            int pages = 1, firstResult = 0, maxResult = 0, total = 0;
            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }

            total = pd.countProduct();
            if (total <= 9) {
                firstResult = 0;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 9;
                maxResult = 9;
            }

            ArrayList<products> listProduct = pd.getListProduct(firstResult, maxResult);                    
        %>
        <%String a = request.getRequestURL().toString();%>
        <jsp:include page="header.jsp"></jsp:include>
            <section class="sub-top-bn">
                <h1>Danh sách sản phẩm</h1>
            </section>
            <section class="bcrumb">
                <div class="container">
                    <ul class="breadcrumb">
                        <li>
                            <a title="Trở lại trang chủ" href="index.jsp" >Trang chủ</a>
                        </li>
                        <li class="active">Sản phẩm</li>
                    </ul>
                </div>
            </section>
            <section class="content">
                <div class="container">
                    <div class="content row">
                        <div class="col-md-9 col-md-push-3 center-site">
                            <div class="center">
                                <div class="toolbar">
                                    <div class="soft">   
                                        <label>Sắp xếp theo</label>                         
                                        <select class="sort-by">
                                            <option value="default">Mặc định</option>
                                            <option value="price-asc">Giá tăng dần</option>
                                            <option value="price-desc">Giá giảm dần</option>
                                            <option value="alpha-asc">Từ A-Z</option>
                                            <option value="alpha-desc">Từ Z-A</option>
                                            <option value="created-desc">Mới đến cũ</option>
                                            <option value="created-asc">Cũ đến mới</option>
                                        </select>
                                    </div>
                                    <div class="soft">   
                                        <label>Hiển thị</label>                         
                                        <select onchange="location = this.options[this.selectedIndex].value;" class="sort">
                                            <option value="default">15</option>
                                            <option value="/collections/san-pham-khuyen-mai?view=18"><a href="index.jsp">18</a></option>
                                            <option value="/collections/san-pham-khuyen-mai?view=21"><a href="index.jsp">21</a></option>
                                        </select>
                                    </div>
                                    <div class="button-group view display" data-toggle="buttons-radio">
                                        <a id="grid" class="active" rel="tooltip" title="Dạng Lưới" onclick="display('grid');"><i class="fa fa-th-large"></i></a>
                                        <a id="list" class="" rel="tooltip" title="Dạng Danh Sách" onclick="display('list');"><i class="fa fa-th-list"></i></a>
                                    </div>
                                </div>
                                <div class="collect-grid">
                                    <div class="row">
                                    <%
                                        for (products p : listProduct) {
                                    %>
                                    <div class="col-md-4 col-sm-6 col-xs-12">
                                        <div class="product-grid">
                                            <div class="feature-img">
                                                <a href="chi-tiet-<%=p.getIDsp()%>">
                                                    <img src="<%=p.getAnhbia()%>" alt="<%=p.getTen()%>" class="img-responsive">
                                                </a>
                                                    <div class="grid-action-box">
                                                        <a href='CartServlet?command=plus&productID=<%=p.getIDsp()%>' class="btn btn-primary ">Mua hàng</a>
                                                    </div>
                                            </div>
                                            <div class="prod-info">

                                                <% if (p.getTTkm() == true) {%>
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

                                                <a href="chi-tiet-<%=p.getIDsp()%>">
                                                    <h3><%=p.getTen()%></h3>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>							
                                </div>
                            </div>
                            <div class="collect-list">
                                <%
                                    for (products p : listProduct) {
                                %>                                  

                                <div class="product-grid clearfix">
                                    <div class="feature-img">
                                        <a href="chi-tiet-san-pham-<%=p.getIDsp()%>">
                                            <img src="<%=p.getAnhbia()%>" alt="<%=p.getTen()%>" class="img-responsive">
                                        </a>
                                    </div>
                                    <div class="prod-info">
                                        <a href="chi-tiet-<%=p.getIDsp()%>">
                                            <h3><%=p.getTen()%></h3>
                                        </a>
                                        <div class="desc">
                                            <p> <%=p.getMotangan()%></p>
                                        </div>
                                        <%if (p.getTTkm() == true) {%>
                                        <div class="price-box">
                                            <p class="special-price">
                                                <span><%= format.format(p.getGia())%>&#8363;</span>
                                            </p>
                                            <p class="old-price">
                                                <span><%= format.format(p.getGiakm()) %>&#8363;</span>
                                            </p>
                                        </div>
                                        <%} else {%>  
                                        <div class="price-box">
                                            <p class="special-price">
                                                <span><%= format.format(p.getGia())%>&#8363;</span>
                                            </p>
                                        </div>
                                        <%}%>
                                        <div class="action-box">
                                            
                                                <button type="submit" onclick="window.location.href='CartServlet?command=plus&productID=<%=p.getIDsp()%>'" title="Mua hàng" class="list-add-cart add-to-cart">				
                                                    <span>Mua hàng</span>
                                                </button>		
                                            

                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="pages">
                                <ul class="list-unstyled">
                                    <%
                                        int n = 0;
                                        if (total == 9 || total <= 9) {
                                            n = 0;
                                        } else {
                                            n = total / 9;
                                        }
                                        for (int i = 1; i <= n + 1; i++) {
                                            if (pages == i) {%>
                                    <li class="current"><%=i%></li>
                                        <%} else {
                                        %>                                    
                                    <li class="arrow"><a href="products-all.jsp?&pages=<%=i%>"><%=i%></a></li>
                                        <%}
                                        }%>
                                </ul>
                            </div>
                        </div>

                    </div>
                    <div class="col-md-3 col-md-pull-9 left-sidebar">
                        <jsp:include page="danhmucsanpham.jsp"></jsp:include>
                        <jsp:include page="sanphamnoibat.jsp"></jsp:include>
                        <jsp:include page="sanphamkhuyenmai.jsp"></jsp:include>
                        </div>
                    </div>
                </div>			
            </section>

            <script type="text/javascript">
                function display(view) {
                    if (view == 'grid') {
                        $('.collect-grid').show();
                        $('.collect-list').hide();
                        $('.display').html('<a class="active" id="grid" rel="tooltip" title="Dạng Lưới" onclick="display(\'grid\');loadisotope();"><i class="fa fa-th-large"></i></a> <a id="list" rel="tooltip" title="Dạng Danh sách" onclick="display(\'list\');"><i class="fa fa-th-list"></i></a>');
                        localStorage.setItem('display', 'grid');
                    } else {
                        $('.collect-grid').hide();
                        $('.collect-list').show();
                        $('.display').html('<a id="grid" rel="tooltip" title="Dạng Lưới" onclick="display(\'grid\');loadisotope();"><i class="fa fa-th-large"></i></a> <a class="active" id="list" rel="tooltip" title="Dạng Danh sách" onclick="display(\'list\');"><i class="fa fa-th-list"></i></a>');
                        localStorage.setItem('display', 'list');
                    }
                }
                if (localStorage.getItem('display') == 'list') {
                    display('list');
                } else {
                    display('grid');
                }
            </script>
        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="copyright.jsp"></jsp:include>
        <script src='./scripts/bootstrap.minefbf.js' type='text/javascript'></script>
        <script src='./scripts/owl.carouselefbf.js' type='text/javascript'></script>
        <script src='./scripts/main-scriptefbf.js' type='text/javascript'></script>
        <script src='./scripts/componentsefbf.js' type='text/javascript'></script>
        <script src='./scripts/appefbf.js' type='text/javascript'></script>
        <script src='./scripts/ajax-cartefbf.js' type='text/javascript'></script>

    </body>
</html>
