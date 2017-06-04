<%@page import="model.orderdetail"%>
<%@page import="sandwich.orderdetailSW"%>
<%@page import="model.order"%>
<%@page import="sandwich.orderSW"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width, initial-scale=1">   
        <link rel="shortcut icon" href="https://big-food.bizwebvietnam.net/favicon.ico" type="image/x-icon">
        <link href="css/bootstrap.mind472.css" rel="stylesheet" type="text/css"/>
        <link href="css/font-awesome.min58d8.css" rel="stylesheet" type="text/css"/>
        <link href="css/checkoutf4d8.css" rel="stylesheet" type="text/css"/>
        <link href="css/thankyou_v2.css" rel="stylesheet" type="text/css"/> 
        <title>Cảm ơn | Sandwich Chía Núi</title>
    </head>
    <body>
        <%
            NumberFormat format = new DecimalFormat("###,###");
            String id = "";
            orderSW orSW = new orderSW();
            order od = new order();
            if (request.getParameter("ID") != null) {
                id = request.getParameter("ID");
                od = orSW.getOrderDetail(Long.parseLong(id));
            }
        %>
        <div class="container">
            <div class="header">
                <div class="wrap">
                    <div class="shop logo  logo--left ">                    
                        <h1 class="shop__name">
                            <a href="index.jsp">
                                Sandwich Chía Núi
                            </a>
                        </h1>
                    </div>
                </div>
            </div>
            <div class="main">
                <div class="wrap clearfix">
                    <div class="row thankyou-infos">
                        <div class="col-md-7 thankyou-message">
                            <div class="thankyou-message-icon unprint">
                                <div class="icon icon--order-success svg">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="72px" height="72px">
                                    <g fill="none" stroke="#8EC343" stroke-width="2">
                                    <circle cx="36" cy="36" r="35" style="stroke-dasharray:240px, 240px; stroke-dashoffset: 480px;"></circle>
                                    <path d="M17.417,37.778l9.93,9.909l25.444-25.393" style="stroke-dasharray:50px, 50px; stroke-dashoffset: 0px;"></path>
                                    </g>
                                    </svg>
                                </div>
                            </div>
                            <div class="thankyou-message-text">
                                <h3>Cảm ơn bạn đã đặt hàng</h3>
                                <p>
                                    Một email xác nhận đã được gửi tới <%=od.getEmailkh()%>. Xin vui lòng kiểm tra email của bạn
                                </p>
                                <div style="font-style: italic;">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-12 order-info" define="{order_expand: false}">
                            <div class="order-summary order-summary--custom-background-color ">
                                <div class="order-summary-header summary-header--thin summary-header--border">
                                    <h2>
                                        <label class="control-label">Đơn hàng</label>
                                        #<%=od.getIDorder()%>
                                        <label class="control-label unprint">(<%=od.getSl()%>) sản phẩm</label>
                                    </h2>
                                    <a class="underline-none expandable expandable--pull-right mobile unprint" bind-event-click="toggle(this, &#39;.order-items&#39;)" bind-class="{open: order_expand}" href="javascript:void(0)">
                                        Xem chi tiết
                                    </a>
                                </div>
                                <div class="order-items mobile--is-collapsed" bind-class="{&#39;mobile--is-collapsed&#39;: !order_expand}">
                                    <div class="summary-body summary-section summary-product">
                                        <div class="summary-product-list">
                                            <ul class="product-list">
                                                <%
                                                    orderdetailSW danhmuc = new orderdetailSW();
                                                    for (orderdetail t : danhmuc.getListOrderdetailByIDOrder(od.getIDorder())) {%>
                                                <li class="product product-has-image clearfix">
                                                    <div class="product-thumbnail pull-left">
                                                        <div class="product-thumbnail__wrapper">
                                                            <img src="<%=t.getAnh()%>" alt="<%=t.getTensp()%>" class="product-thumbnail__image">
                                                        </div>
                                                        <span class="product-thumbnail__quantity unprint" aria-hidden="true"><%=t.getSl()%></span>
                                                    </div>
                                                    <div class="product-info pull-left">
                                                        <span class="product-info-name">
                                                            <strong><%=t.getTensp()%></strong>
                                                            <label class="print">x<%=t.getSl()%></label>
                                                        </span>
                                                    </div>
                                                    <strong class="product-price pull-right">
                                                        <%=format.format(t.getGia() * t.getSl())%>₫
                                                    </strong>
                                                </li>
                                                <%}%>                                             

                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="summary-section  border-top-none--mobile ">
                                    <div class="total-line total-line-subtotal clearfix">
                                        <span class="total-line-name pull-left">
                                            Tạm tính
                                        </span>
                                        <span class="total-line-subprice pull-right">
                                            <%=format.format(od.getTong())%>₫
                                        </span>
                                    </div>
                                    <div class="total-line total-line-shipping clearfix">
                                        <span class="total-line-name pull-left">
                                            Phí vận chuyển
                                        </span>
                                        <span class="pull-right">
                                            0₫
                                        </span>
                                    </div>
                                </div>
                                <div class="summary-section">
                                    <div class="total-line total-line-total clearfix">
                                        <span class="total-line-name total-line-name--bold pull-left">
                                            Tổng cộng
                                        </span>
                                        <span class="total-line-price pull-right">
                                            <%=format.format(od.getTong())%>₫
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-sm-12 customer-info">
                            <div class="shipping-info">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="order-summary order-summary--white no-border no-padding-top">
                                            <div class="order-summary-header">
                                                <h2>
                                                    <label class="control-label">Thông tin nhận hàng</label>
                                                </h2>
                                            </div>
                                            <div class="summary-section no-border no-padding-top">
                                                <p class="address-name">
                                                    <%=od.getTen()%>
                                                </p>
                                                <p class="address-address">
                                                    <%=od.getDiachi()%>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="order-summary order-summary--white no-border">
                                            <div class="order-summary-header">
                                                <h2>
                                                    <label class="control-label">Thông tin thanh toán</label>
                                                </h2>
                                            </div>
                                            <div class="summary-section no-border no-padding-top">
                                                <p class="address-name">
                                                    <%=od.getTenkh()%>
                                                </p>
                                                <p class="address-address">
                                                    <%=od.getDiachikh()%>
                                                </p>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6">
                                        <div class="order-summary order-summary--white no-border">
                                            <div class="order-summary-header">
                                                <h2>
                                                    <label class="control-label">Hình thức thanh toán</label>
                                                </h2>
                                            </div>
                                            <div class="summary-section no-border no-padding-top">
                                                <span><%=od.getTenpayment()%></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6">
                                        <div class="order-summary order-summary--white no-border">
                                            <div class="order-summary-header">
                                                <h2>
                                                    <label class="control-label">Hình thức vận chuyển</label>
                                                </h2>
                                            </div>
                                            <div class="summary-section no-border no-padding-top">
                                                <span>Giao hàng tận nơi - 40.000₫</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="order-success unprint">
                                <a href="index.jsp" class="btn btn-primary">
                                    Tiếp tục mua hàng
                                </a>
                                <a onclick="window.print()" class="nounderline print-link" href="javascript:void(0)">
                                    In 
                                </a>
                            </div>
                        </div>
                    </div>
                </div>              
            </div>
        </div>
        <script src="scripts/jquery-2.1.3.min.js" type="text/javascript"></script>
        <script src="scripts/twine.min.js" type="text/javascript"></script>
        <script src="scripts/checkoutcc2e.js" type="text/javascript"></script>  
        <script type="text/javascript">
        context = {}

        $(function () {
            Twine.reset(context).bind().refresh();
        });
    </script>
    </body>
</html>
