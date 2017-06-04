<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page import="model.item"%>
<%@page import="model.cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="vi">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Giỏ hàng | Sandwich Chía Núi</title>
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
            cart cart = (cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new cart();
                session.setAttribute("cart", cart);
            }
            String a = request.getRequestURL().toString();
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <h1 style="display:none;">Big Food</h1>
            <section class="sub-top-bn">
                <h1>Giỏ hàng</h1>
            </section>
            <section class="bcrumb">
                <div class="container">
                    <ul class="breadcrumb">
                        <li>
                            <a title="Trở lại trang chủ" href="/">Trang chủ</a>
                        </li>
                        <li class="active">Giỏ hàng</li>
                    </ul>
                </div>
            </section>
            <section class="content cart">
                <div class="container">
                    <div class="cart">
                        <div class="page-title">
                            <h2>GIỎ HÀNG</h2>
                        </div>
                    <%if (cart.totalCart() == 0) {%>
                    <p>Không có sản phẩm nào trong giỏ hàng.</p>
                    <%} else {%>
                    <div class="hidden-xs" >
                        <fieldset class="table-responsive">
                            <table id="shopping-cart-table" class="data-table cart-table">
                                <colgroup>
                                    <col width="1">
                                    <col width="1">
                                    <col width="1">
                                    <col width="1">
                                    <col width="1">
                                    <col width="1">
                                </colgroup>
                                <thead>
                                    <tr class="first last">
                                        <th rowspan="1">Hình ảnh</th>
                                        <th rowspan="1"><span class="nobr">Tên sản phẩm</span></th>
                                        <th class="a-center" colspan="1"><span class="nobr">Giá</span></th>
                                        <th rowspan="1" class="a-center">Số lượng</th>
                                        <th class="a-center" colspan="1">Tổng tiền</th>
                                        <th rowspan="1" class="a-center">Xóa</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr class="first last">
                                        <td colspan="50" class="a-right last">
                                            <button type="button" class="btn-cart btn-continue" onclick="window.location.href = 'index.jsp'">
                                                <span>Tiếp tục mua sắm</span>
                                            </button>
                                            <button type="submit" class="btn-cart btn-update">
                                                <span>Cập nhật</span>
                                            </button>
                                            <button type="button" onclick="window.location.href = 'CartServlet?command=delete&url=<%=a%>'" class="btn-cart btn-empty" id="empty_cart_button">
                                                <span>Xóa giỏ hàng</span>
                                            </button>                                              
                                        </td>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <%for (Map.Entry<Long, item> list : cart.getCartItems().entrySet()) {%>
                                <form action="CartServlet?command=update&productID=<%=list.getValue().getProduct().getIDsp()%>&url=<%=a%>" method="post">
                                    <tr class="first">
                                        <td>
                                            <a href="chi-tiet-<%=list.getValue().getProduct().getIDsp()%>" title="<%=list.getValue().getProduct().getTen()%>" class="product-image">
                                                <img alt="<%=list.getValue().getProduct().getTen()%>" src="<%=list.getValue().getProduct().getAnhbia()%>" width="150" height="150">
                                            </a>
                                        </td>
                                        <td>
                                            <h2 class="product-name">
                                                <a href="chi-tiet-<%=list.getValue().getProduct().getIDsp()%>"><%=list.getValue().getProduct().getTen()%></a>
                                            </h2>
                                        </td>
                                        <td class="a-right">
                                            <span class="cart-price">
                                                <span class="price">
                                                    <%if (list.getValue().getProduct().getTTkm() == true) {%>
                                                    <%=format.format(list.getValue().getProduct().getGiakm())%>₫
                                                    <%} else {%>
                                                    <%=format.format(list.getValue().getProduct().getGia())%>₫
                                                    <%}%>
                                                </span>                
                                            </span>
                                        </td>
                                        <!-- inclusive price starts here -->
                                        <td class="a-center">
                                            <input type="text" class="bizwebinput input-text qty cart_qty form-control mod input-control" maxlength="12" min="1" size="4" title="Số lượng" name="soluong" value="<%=list.getValue().getQuantity()%>" onpaste="return false;" onkeypress="validate(event)">
                                        </td>
                                        <!--Sub total starts here -->
                                        <td class="a-right">
                                            <span class="cart-price">
                                                <span class="price">
                                                    <%if (list.getValue().getProduct().getTTkm() == true) {%>
                                                    <%=format.format(list.getValue().getProduct().getGiakm() * list.getValue().getQuantity())%>₫
                                                    <%} else {%>
                                                    <%=format.format(list.getValue().getProduct().getGia() * list.getValue().getQuantity())%>₫
                                                    <%}%>
                                                </span>                            
                                            </span>
                                        </td>
                                        <td class="a-center last">
                                            <button type="submit" class="btn btn-link" >
                                                <i class="fa fa-check fa-2x"></i>
                                            </button> | 
                                            <button type="button" onclick="window.location.href = 'CartServlet?command=remove&productID=<%=list.getValue().getProduct().getIDsp()%>&url=<%=a%>'" class="btn btn-link" >
                                                <i class="fa fa-trash fa-2x"></i>
                                            </button>
                                        </td>
                                    </tr>
                                </form>
                                <%}%>
                                </tbody>
                            </table>
                        </fieldset>
                    </div>
                    <form action="/cart" method="post" id="cart_form" class="clearfix hidden-sm hidden-md hidden-lg small_screen_form">			
                        <ul class="cart_collection">
                            <%for (Map.Entry<Long, item> list : cart.getCartItems().entrySet()) {%>
                            <li class="cart_collection-item avatar">
                                <img alt="<%=list.getValue().getProduct().getTen()%>" src="<%=list.getValue().getProduct().getAnhbia()%>" class="circle img-responsive">
                                <a href="chi-tiet-<%=list.getValue().getProduct().getIDsp()%>" title="<%=list.getValue().getProduct().getTen()%>"><%=list.getValue().getProduct().getTen()%></a>
                                <p>
                                    <%if (list.getValue().getProduct().getTTkm() == true) {%>
                                    <%=format.format(list.getValue().getProduct().getGiakm())%>₫
                                    <%} else {%>
                                    <%=format.format(list.getValue().getProduct().getGia())%>₫
                                    <%}%><br>
                                    <input type="number" class="bizwebinput small_input form-control mod input-control" min="1" name="soluong" value="<%=list.getValue().getQuantity()%>" onpaste="return false;" onkeypress="validate(event)">
                                    <%if (list.getValue().getProduct().getTTkm() == true) {%>
                                    <%=format.format(list.getValue().getProduct().getGiakm() * list.getValue().getQuantity())%>₫
                                    <%} else {%>
                                    <%=format.format(list.getValue().getProduct().getGia() * list.getValue().getQuantity())%>₫
                                    <%}%>
                                </p>
                                <a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getIDsp()%>&url=<%=a%>" class="secondary-content cart_item_close">X</a>
                            </li>
                            <%}%>
                        </ul>
                        <!-- FOTTER-->
                        <div class="cart_option_btn btn-group pull-right">
                            <button type="button" class="btn btn-cart" onclick="window.location.href = 'index.jsp'">
                                <span>Tiếp tục mua sắm</span>
                            </button>
                            <button type="submit" class="btn btn-cart">
                                <span>Cập nhật</span>
                            </button>
                            <button type="button" onclick="window.location.href = 'CartServlet?command=delete&url=<%=a%>'" class="btn btn-cart" id="empty_cart_button">
                                <span>Xóa giỏ hàng</span>
                            </button>    
                        </div>
                    </form>
                    <div class="cart-collaterals row">
                        <div class="col-1 col-xs-12 col-sm-6 col-md-4">
                        </div>
                        <div class="col-2 col-xs-12 col-sm-6 col-md-4">
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-4 ">
                            <div class="totals">
                                <table id="shopping-cart-totals-table">
                                    <colgroup>
                                        <col>
                                        <col width="1">
                                    </colgroup>
                                    <tfoot>
                                        <tr>
                                            <td style="" class="a-right" colspan="1">
                                                <strong>Tổng tiền</strong>
                                            </td>
                                            <td style="" class="a-right">
                                                <strong><span class="price"><%=format.format(cart.totalCart())%>₫</span></strong>
                                            </td>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    </tbody>
                                </table>
                                <ul class="checkout-types">
                                    <li>    
                                        <button type="button" class="btn-checkout" onclick="window.location.href = 'checkout.jsp'">
                                            <span>Thanh toán</span>
                                        </button>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <%}%>
                </div>
            </div>
        </section>         
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
