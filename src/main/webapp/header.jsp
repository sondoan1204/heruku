<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.information"%>
<%@page import="sandwich.informationSW"%>
<%@page import="model.customer"%>
<%@page import="java.util.Map"%>
<%@page import="model.item"%>
<%@page import="model.category"%>
<%@page import="sandwich.categorySW"%>
<%@page import="model.cart"%>
<%@page import="sandwich.productSW"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <%
            NumberFormat format = new DecimalFormat("###,###");
            productSW pd = new productSW();
            String category_id = "";
            if (request.getParameter("category") != null) {
                category_id = request.getParameter("category");
            }
            cart cart = (cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new cart();
                session.setAttribute("cart", cart);
            }
            customer users = null;
            if (session.getAttribute("user") != null) {
                users = (customer) session.getAttribute("user");
            }

            informationSW infoSw = new informationSW();
            information info = new information();
            info = infoSw.getInformationDetail();
        %>
        <%String a = request.getRequestURL().toString();%>
        <header class="header">
            <section class="topbar">
                <div class="container">
                    <div class="top-left hidden-xs hidden-sm ">
                        <p>Chào mừng bạn đến với <%=info.getSitename()%>!</p>
                    </div>
                    <div class="top-right">
                        <ul class="list-unstyled">
                            <li class="first"><a href="index.jsp"><span>Trang chủ</span></a></li>
                            <li class=""><a href="products-all.jsp"><span>Sản phẩm</span></a></li>
                            <li class=""><a href="tin-tuc.html"><span>Tin tức</span></a></li>
                            <li class=""><a href="gioi-thieu.html"><span>Liên hệ</span></a></li>
                                <% if (users == null) {%> 
                            <li class="last"><a href="login.jsp"><span>Tài khoản</span></a>
                                <ul class="list-unstyled top-account">
                                    <li><a href="login.jsp"><span>Đăng nhập</span></a></li>
                                    <li><a href="signup.jsp"><span>Đăng ký</span></a></li>
                                </ul>
                            </li>
                            <%} else {%>
                            <li class="last"><a href="account.jsp"><span><%=users.getTen()%></span></a>
                                <ul class="list-unstyled top-account">
                                    <li><a href="cart.jsp"><span>Giỏ hàng</span></a></li>
                                    <li>                                        
                                        <a href="logout.jsp"><span>Thoát</span></a>
                                    </li>
                                </ul>
                            </li>
                            <%}%>
                        </ul>					
                    </div>
                    <div class="cart-search hidden-sm hidden-md hidden-lg pull-right">
                        <div class="search-form">
                            <form action="index.jsp">
                                <div class="input-d">
                                    <input type="text" name="query" class="input-text" placeholder="Tìm kiếm...">
                                </div>
                                <button type="submit" class="s-btn">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <div class="cart-dropdown" id="cart-dropdown">
                            <a href="/cart" class="mini-cart a_hv_cart_dropdown click_to_cart" id="mini-cart" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-shopping-basket"></i>
                                <span class="cart-item-count"><%=cart.countItem()%></span>
                            </a>
                            <div id="cart-info-parent" class="dropdown-menu" style="display: none;">
                                <div id="cart-info">
                                    <div class="cart-content" id="cart-content">
                                        <%if (cart.totalCart() == 0) {%>
                                        <li><p>Không có sản phẩm nào trong giỏ hàng.</p></li>
                                            <%} else {%>
                                            <%for (Map.Entry<Long, item> list : cart.getCartItems().entrySet()) {%>
                                        <div class="control-container">
                                            <div class="row">
                                                <a class="cart-close" title="Xóa" href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getIDsp()%>&url=<%=a%>">
                                                    <img class="item-remove" src="images/itemclose.png">
                                                </a>
                                                <div class="col-md-10 cart-left">
                                                    <img src="images-product/<%=list.getValue().getProduct().getAnhbia()%>" alt="<%=list.getValue().getProduct().getTen()%>"/>                                                    
                                                </div>
                                                <div class="col-md-14 cart-right">
                                                    <div class="cart-title">
                                                        <a href="detail.jsp?product=<%=list.getValue().getProduct().getIDsp()%>">
                                                            <%=list.getValue().getProduct().getTen()%>
                                                        </a>
                                                    </div>
                                                    <div class="cart-price">
                                                        <i style="color:#636363;font-style: normal;"><%=list.getValue().getQuantity()%> x </i>
                                                        <%if (list.getValue().getProduct().getTTkm() == true) {%>
                                                        <%= format.format(list.getValue().getProduct().getGiakm())%>₫
                                                        <%} else {%>
                                                        <%= format.format(list.getValue().getProduct().getGia())%>₫
                                                        <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>                                        
                                        <div class="subtotal">
                                            <span class="cart-total-right">
                                                <i style="color:#c69c6d;font-style: normal;font-weight: bold;font-size: 16px;">TỔNG TIỀN:</i> <%=cart.totalCart()%>₫
                                            </span>
                                        </div>
                                        <div class="action">
                                            <a id="gocart" href="cart.jsp">Giỏ hàng</a>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="midheader">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3 col-sm-12 col-xs-12">
                            <div class="logo">
                                <a href="index.jsp">
                                    <img src="./images/logo.png" title="<%=info.getSitename()%>" alt="<%=info.getSitename()%>" style="height: 110px">
                                </a>
                            </div>
                        </div>
                        <div class="hidden-xs hidden-sm col-md-9 col-xs-12">
                            <div class="static">
                                <div class="static-p">
                                    <p class="static-title">Hotline:</p>
                                    <p class="static-info"><%=info.getHotline()%></p>
                                </div>								
                                <div class="static-e">
                                    <p class="static-title">Facebook:</p>
                                    <a href="<%=info.getLinkfb()%>">
                                        <p class="static-info"><%=info.getFacebook()%></p>
                                    </a>
                                </div>								
                                <div class="static-t">
                                    <p class="static-title">Open:</p>
                                    <p class="static-info"><%=info.getTimeopen()%></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="menubar">
                <div class="container">
                    <div class="menu hidden-sm hidden-xs">
                        <ul class="list-unstyled">
                            <li class="first ">
                                <a href="index.jsp"><span>Trang chủ</span></a>
                            </li>
                            <li class="">
                                <a href="#"><span>Giới thiệu</span></a>
                            </li>
                            <li class=" sub-menu"><a href="products-all.jsp"><span>Sản phẩm</span></a>
                                <ul class="list-unstyled">
                                    <% categorySW danhmuc = new categorySW();
                                        for (category c : danhmuc.getListCategory()) {
                                    %> 
                                    <li><a class="" href="products.jsp?category=<%=c.getCategoryID()%>"><span><%=c.getCategoryName()%>  </span></a></li>
                                        <%
                                            }
                                        %>
                                </ul>
                            </li>
                            <li class="">
                                <a href="#"><span>Khuyến mãi</span></a>
                            </li>
                            <li class="">
                                <a href="thegioi.jsp"><span>Tin tức</span></a>
                            </li>
                            <li class="last ">
                                <a href="contact.jsp"><span>Liên hệ</span></a>
                            </li>
                        </ul>
                    </div>
                    <div class="cart-search hidden-xs">
                        <div class="search-form">
                            <form action="SearchServlet" method="post">
                                <div class="input-d">
                                    <input type="text" name="query" class="input-text" placeholder="Tìm kiếm...">
                                </div>
                                <button type="submit" class="s-btn">
                                    <i class="fa fa-search"></i>
                                </button>
                            </form>
                        </div>
                        <div class="cart-dropdown" id="cart-dropdown">
                            <a href="#" class="mini-cart a_hv_cart_dropdown click_to_cart" id="mini-cart" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fa fa-shopping-basket"></i>
                                <span class="cart-item-count"><%=cart.countItem()%></span>
                            </a>
                            <div id="cart-info-parent" class="dropdown-menu" style="display: none;">
                                <div id="cart-info">
                                    <div class="cart-content" id="cart-content">  
                                        <%if (cart.totalCart() == 0) {%>
                                        <li><p>Không có sản phẩm nào trong giỏ hàng.</p></li>
                                            <%} else {%>
                                            <%for (Map.Entry<Long, item> list : cart.getCartItems().entrySet()) {%>
                                        <div class="control-container">
                                            <div class="row">
                                                <a class="cart-close" title="Xóa" href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getIDsp()%>&url=<%=a%>">
                                                    <img class="item-remove" src="images/itemclose.png">
                                                </a>
                                                <div class="col-md-10 cart-left">
                                                    <img src="images-product/<%=list.getValue().getProduct().getAnhbia()%>">
                                                </div>
                                                <div class="col-md-14 cart-right">
                                                    <div class="cart-title">
                                                        <a href="detail.jsp?product=1">
                                                            <%=list.getValue().getProduct().getTen()%>
                                                        </a>
                                                    </div>
                                                    <div class="cart-price">

                                                        <i style="color:#636363;font-style: normal;"><%=list.getValue().getQuantity()%> x </i>
                                                        <%if (list.getValue().getProduct().getTTkm() == true) {%>
                                                        <%= format.format(list.getValue().getProduct().getGiakm())%>₫
                                                        <%} else {%>
                                                        <%= format.format(list.getValue().getProduct().getGia())%>₫
                                                        <%}%>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <%}%>

                                        <div class="subtotal">
                                            <span class="cart-total-right">
                                                <i style="color:#c69c6d;font-style: normal;font-weight: bold;font-size: 16px;">TỔNG TIỀN:</i> <%= format.format(cart.totalCart())%>₫
                                            </span>
                                        </div>
                                        <div class="action">
                                            <a id="gocart" href="cart.jsp">Giỏ hàng</a>
                                        </div>
                                        <%}%>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mobile-menu hidden-lg hidden-md col-sm-12">
                        <div class="mb-menu-title">
                            <span>Menu</span>
                            <a href="javascript:void(0);" class="bars-navigation"><i class="fa fa-bars"></i></a>
                        </div>
                        <ul class="list-unstyled mobimenu" style="display: none">
                            <li class="first ">
                                <a href="index.jsp"><span>Trang chủ</span></a>
                            </li>
                            <li class="">
                                <a href="gioi-thieu.html"><span>Giới thiệu</span></a>
                            </li>
                            <li class=" sub-menu"><a href="products-all.jsp?&pages=1"><span>Sản phẩm</span></a>
                                <ul class="list-unstyled" style="display: none">
                                    <%
                                        for (category c : danhmuc.getListCategory()) {
                                    %> 
                                    <li><a class="" href="products.jsp?category=<%=c.getCategoryID()%>"><span><%=c.getCategoryName()%>  </span></a></li>
                                        <%
                                            }
                                        %> 
                                </ul>
                            </li>
                            <li class="">
                                <a href="san-pham-khuyen-mai.html"><span>Khuyến mãi</span></a>
                            </li>
                            <li class="">
                                <a href="tin-tuc.html"><span>Tin tức</span></a>
                            </li>
                            <li class="last ">
                                <a href="contact.jsp"><span>Liên hệ</span></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>
        </header>
    </body>
</html>
