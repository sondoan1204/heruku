<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.customer"%>
<%@page import="java.util.Map"%>
<%@page import="model.cart"%>
<%@page import="model.item"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
            <meta name="viewport" content="width=device-width, initial-scale=1">       
                <link href="css/bootstrap.mind472.css" rel="stylesheet" type="text/css"/>
                <link href="css/nprogress58d8.css" rel="stylesheet" type="text/css"/>
                <link href="css/font-awesome.min58d8.css" rel="stylesheet" type="text/css"/>
                <link href="css/checkoutf4d8.css" rel="stylesheet" type="text/css"/>
                <title>Big Food - Thanh toán đơn hàng</title>	
                </head>
                <body class="body--custom-background-color ">   
                    <%
                        NumberFormat format = new DecimalFormat("###,###");
                        customer users = (customer) session.getAttribute("user");
                        if (users == null) {
                            response.sendRedirect("login.jsp");

                        }
                        cart cart = (cart) session.getAttribute("cart");
                        if (cart == null) {
                            cart = new cart();
                            session.setAttribute("cart", cart);
                        }

                    %>
                    
                        <div context="checkout" define='{checkout: new Bizweb.Checkout(this,{  })}' class="container checkout">
                            <div class="header">
                                <div class="wrap">
                                    <div class="shop logo  logo--left ">                        
                                        <h1 class="shop__name">
                                            <a href="index.jsp">
                                                Big Food
                                            </a>
                                        </h1>                        
                                    </div>
                                </div>
                            </div>
                            <div class="main">
                                <div class="wrap clearfix">
                                    <div class="row">
                                        <div class="col-md-4 col-sm-12 order-info" define="{order_expand: false}">
                                            <div class="order-summary order-summary--custom-background-color ">
                                                <div class="order-summary-header summary-header--thin summary-header--border">
                                                    <h2>
                                                        <label class="control-label">Đơn hàng</label>
                                                        <label class="control-label">(<%=cart.countItem()%>)</label>
                                                    </h2>
                                                    <a class="underline-none expandable expandable--pull-right mobile" bind-event-click="toggle(this, '.order-items')" bind-class="{open: order_expand}" href="javascript:void(0)">
                                                        Xem chi tiết
                                                    </a>
                                                </div>
                                                <div class="order-items mobile--is-collapsed" bind-class="{'mobile--is-collapsed': !order_expand}">
                                                    <div class="summary-body summary-section summary-product" >
                                                        <div class="summary-product-list">
                                                            <ul class="product-list">
                                                                <%for (Map.Entry<Long, item> list : cart.getCartItems().entrySet()) {%>
                                                                <li class="product product-has-image clearfix">
                                                                    <div class="product-thumbnail pull-left">
                                                                        <div class="product-thumbnail__wrapper">                                                                
                                                                            <img src='images-product/<%=list.getValue().getProduct().getAnhbia()%>' alt='<%=list.getValue().getProduct().getTen()%>' class='product-thumbnail__image' />
                                                                        </div>
                                                                        <span class="product-thumbnail__quantity" aria-hidden="true"><%=list.getValue().getQuantity()%></span>
                                                                    </div>
                                                                    <div class="product-info pull-left">
                                                                        <span class="product-info-name">
                                                                            <strong><%=list.getValue().getProduct().getTen()%></strong>
                                                                        </span>                                                      

                                                                    </div>
                                                                    <strong class="product-price pull-right">
                                                                        <%
                                                                            if (list.getValue().getProduct().getTTkm() == true) {%>
                                                                        <%=format.format(list.getValue().getProduct().getGiakm() * list.getValue().getQuantity())%>&#8363;
                                                                        <%} else {%>
                                                                        <%=format.format(list.getValue().getProduct().getGia() * list.getValue().getQuantity())%>&#8363;
                                                                        <%}%>
                                                                    </strong>
                                                                </li>
                                                                <%}%>
                                                            </ul>
                                                        </div>
                                                    </div>

                                                </div>
                                                <div class="summary-section border-top-none--mobile">
                                                    <div class="total-line total-line-subtotal clearfix">
                                                        <span class="total-line-name pull-left">
                                                            Tạm tính
                                                        </span>
                                                        <span class="total-line-subprice pull-right">
                                                            <%=format.format(cart.totalCart())%>&#8363;
                                                        </span>
                                                    </div>
                                                    <div class="total-line total-line-shipping clearfix">
                                                        <span class="total-line-name pull-left">
                                                            Phí vận chuyển
                                                        </span>
                                                        <span class="total-line-shipping pull-right">                                            
                                                            Miễn phí vận chuyển                                            
                                                        </span>
                                                    </div>
                                                    <div class="total-line total-line-total clearfix">
                                                        <span class="total-line-name pull-left">
                                                            Tổng cộng
                                                        </span>
                                                        <span class="total-line-price pull-right">
                                                            <%=format.format(cart.totalCart())%>&#8363;
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group clearfix hidden-sm hidden-xs">
                                                <input class="btn btn-primary col-md-12 mt10 btn-checkout" type="button" bind-event-click="paymentCheckout()" value="ĐẶT HÀNG" />

                                            </div>
                                                        <div style="text-align: center;" class="form-group clearfix hidden-sm hidden-xs"> ----hoặc---- <br>
                                                            <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">
                                                <!-- Identify your business so that you can collect the payments. -->
                                                <input type="hidden" name="business" value="sondoan1204@gmail.com">
                                                    <input type="hidden" name="return" value="http://localhost:8080/Sandwich/CheckOutServlet?sontung=online" />
                                                    <!-- Specify a Buy Now button. -->
                                                    <input type="hidden" name="cmd" value="_xclick">
                                                        <%if (users != null) {%>
                                                        <input type="hidden" name="item_name" value="<%=users.getTen()%>-<%=users.getDT()%>-<%=users.getEmail()%>">
                                                        <%} else {%>
                                                            <input type="hidden" name="item_name" value="0">
                                                                <%}%>
                                                                <input type="hidden" name="amount" value="<%= (double) Math.round((cart.totalCart() / 22000) * 100) / 100%>">
                                                                    <input type="hidden" name="currency_code" value="USD">
                                                                        <input type="hidden" name="item_number" value="<%=cart.countItem()%>">
                                                                            <INPUT TYPE="hidden" name="charset" value="utf-8">
                                                                                <!-- Display the payment button. -->
                                                                                <input type="image" name="submit" border="0"
                                                                                       src="images/paypal.png" alt="PayPal">
                                                                                    </form></div>
                                            <div class="form-group has-error">
                                                <div class="help-block ">
                                                    <ul class="list-unstyled">

                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                                        <form method="post" action="CheckOutServlet" data-toggle="validator" class="formCheckout">
                                        <div class="col-md-4 col-sm-12 customer-info">
                                            <div define="{billing_address: {},billing_expand:true}" class="form-group m0">
                                                <h2>
                                                    <label class="control-label">Thông tin mua hàng</label>
                                                </h2>
                                            </div>  
                                            <hr class="divider">
                                                <div class="form-group" bind-class="{'has-error' : invalidEmail}">
                                                    <%if (users != null) {%>
                                                    <input data-error="Vui lòng nhập email đúng định dạng"  required  name="Email"    type="email" class="form-control" placeholder="Email" pattern="^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" value="<%=users.getEmail()%>"/>
                                                    <%} else {%>
                                                    <input data-error="Vui lòng nhập email đúng định dạng"  required  name="Email"    type="email" class="form-control" placeholder="Email" pattern="^([a-zA-Z0-9_\-\.\+]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"/>
                                                    <%}%>
                                                    <div class="help-block with-errors">
                                                    </div>
                                                </div>                            
                                                <div class="billing">
                                                    <div>
                                                        <div class="form-group">
                                                            <%if (users != null) {%>
                                                            <input data-error="Vui lòng nhập họ tên" required bind="billing_address.full_name" name="BillingAddress.LastName" class="form-control" placeholder="Họ và tên" value="<%=users.getTen()%>"/>
                                                            <%} else {%>
                                                            <input data-error="Vui lòng nhập họ tên" required bind="billing_address.full_name" name="BillingAddress.LastName" class="form-control" placeholder="Họ và tên"/>
                                                            <%}%>
                                                            <div class="help-block with-errors"></div>
                                                        </div>                                    
                                                        <div class="form-group">
                                                            <%if (users != null) {%>
                                                            <input  bind="billing_address.phone" name="BillingAddress.Phone" class="form-control" placeholder="Số điện thoại"  data-error="Vui lòng nhập số điện thoại" value="<%=users.getDT()%>" />
                                                            <%} else {%>
                                                            <input  bind="billing_address.phone" name="BillingAddress.Phone" class="form-control" placeholder="Số điện thoại"  data-error="Vui lòng nhập số điện thoại" />
                                                            <%}%>
                                                            <div class="help-block with-errors"></div>
                                                        </div>     
                                                        <div class="form-group">
                                                            <%if (users != null) {%>
                                                            <input  bind="billing_address.address1" name="BillingAddress.Address1" class="form-control" placeholder="Địa chỉ" value="<%=users.getDiachi()%>"/>
                                                            <%} else {%>
                                                            <input  bind="billing_address.address1" name="BillingAddress.Address1" class="form-control" placeholder="Địa chỉ" />
                                                            <%}%>
                                                            <div class="help-block with-errors"></div>
                                                        </div>                                         
                                                        <hr class="divider" />
                                                    </div>
                                                </div>
                                                <div bind-show="otherAddress" define="{shipping_address: {}, shipping_expand:true,show_district:  true }" class="shipping">
                                                    <div class="form-group">
                                                        <a class="underline-none expandable" bind-event-click="shipping_expand = !shipping_expand" bind-class="{open: shipping_expand}" href="javascript:void(0)">
                                                            Thông tin nhận hàng
                                                        </a>
                                                    </div>
                                                    <div bind-show="shipping_expand || !otherAddress">
                                                        <div class="form-group">
                                                            <input data-error="Vui lòng nhập họ tên" required bind="shipping_address.full_name" name="shipten" class="form-control" placeholder="Họ và tên"/>
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <input  bind="shipping_address.phone" name="shipdt" class="form-control" placeholder="Số điện thoại" />
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                        <div class="form-group">
                                                            <input  bind="shipping_address.address1" name="shipdiachi" class="form-control" placeholder="Địa chỉ" />
                                                            <div class="help-block with-errors"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <textarea name="note" value="" class="form-control" placeholder="Ghi chú"></textarea>
                                                </div>
                                                <div class="form-group">
                                                    <div class="checkbox">
                                                        <label>
                                                            <div bind-class="{'checked' : otherAddress}" class="icheckbox_square" style="position: relative;">
                                                                <input bind-event-change="changeOtherAddress(this)" bind="otherAddress" type="checkbox" name="otherAddress"  value="false"  class="icheck square" style="position: absolute; opacity: 0;" />
                                                                <ins class="iCheck-helper" style="position: absolute; top: 0%; left: 0%; display: block; width: 100%; height: 100%; margin: 0px; padding: 0px; background: none repeat scroll 0% 0% rgb(255, 255, 255); border: 0px none; opacity: 0;"></ins>
                                                            </div>
                                                            Giao hàng đến địa chỉ khác
                                                        </label>
                                                    </div>
                                                </div>
                                        </div>
                                                            
                                        <div class="col-md-4 col-sm-12">
                                            <div class="shipping-method">
                                                <div class="form-group">
                                                    <h2>
                                                        <label class="control-label">Vận chuyển</label>
                                                    </h2>
                                                    <div class="next-select__wrapper">
                                                        <select class="form-control next-select" name="payment">
                                                            <option value="1">Giao hàng tận nơi</option>
                                                            <option value="2">Thanh toán online</option>
                                                        </select>
                                                        <span class="next-icon next-icon--size-12">
                                                            <img src="images/angle-down58d8.png" alt="" class="img-responsive"/>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>                            
                                            <div class="form-group clearfix hidden-md hidden-lg">
                                                <input class="btn btn-primary col-md-12 mt10 btn-checkout" type="button" value="ĐẶT HÀNG" />
                                            </div>
                                            </form>
                                            
                                                                                    </div>
                                                            
                                                                                    </div>
                                                            
                                                                                    </div>
                                                                                    </div>            
                                                                                    </div>



                                                                                    <script src="scripts/jquery-2.1.3.min58d8.js" type="text/javascript"></script>
                                                                                    <script src="scripts/bootstrap.min58d8.js" type="text/javascript"></script>
                                                                                    <script src="scripts/twine.min58d8.js" type="text/javascript"></script>
                                                                                    <script src="scripts/validator.min58d8.js" type="text/javascript"></script>
                                                                                    <script src="scripts/nprogress58d8.js" type="text/javascript"></script>
                                                                                    <script src="scripts/money-helper58d8.js" type="text/javascript"></script>
                                                                                    <script src="scripts/checkoutcc2e.js" type="text/javascript"></script>
                                                                                    <script type="text/javascript">
                                                                                        $(document).ajaxStart(function () {
                                                                                            NProgress.start();
                                                                                        });
                                                                                        $(document).ajaxComplete(function () {
                                                                                            NProgress.done();
                                                                                        });

                                                                                        context = {}

                                                                                        $(function () {
                                                                                            Twine.reset(context).bind().refresh();
                                                                                        });

                                                                                        $(document).ready(function () {

                                                                                            $("#customer-address").trigger("change");

                                                                                            $("select[name='BillingProvinceId']").trigger("change");
                                                                                            $("select[name='ShippingProvinceId']").trigger("change");
                                                                                            Twine.context(document.body).checkout.caculateShippingFee();
                                                                                        });
                                                                                    </script>
                                                                                    </body>
                                                                                    </html>