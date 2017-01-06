<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.order"%>
<%@page import="sandwich.orderSW"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.customer"%>
<%@page import="model.cart"%>
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
        <title>Tài khoản | Sandwich Chía Núi</title>
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
            customer users = (customer) session.getAttribute("user");
            if (users == null) {
                response.sendRedirect("login.jsp");
            }
            cart cart = (cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new cart();
                session.setAttribute("cart", cart);
            }

            NumberFormat format = new DecimalFormat("###,###");
            if (session.getAttribute("user") != null) {
                users = (customer) session.getAttribute("user");
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <section class="sub-top-bn">
                <h1>Trang khách hàng</h1>
            </section>
            <section class="bcrumb">
                <div class="container">
                    <ul class="breadcrumb">
                        <li>
                            <a title="Trở lại trang chủ" href="index.jsp">Trang chủ</a>
                        </li>	
                        <li class="active">Trang khách hàng</li>	
                    </ul>
                </div>
            </section>
            <section class="content">
                <div class="container">
                    <div class="col-main">
                        <div class="col-md-3 col-xs-12">
                            <div class="customer-login">
                                <div class="page-title">
                                    <h2>Thông tin tài khoản</h2>
                                </div>
                                <div class="cus-info-content">
                                    <p class="cus-name"><i class="fa fa-user"></i>  
                                    <%if (users != null) {%>
                                    <%=users.getTen()%><%} else {%>
                                    <%}%>
                                    <span>
                                        <a href="logout.jsp" id="customer_logout_link">(Thoát)</a>
                                    </span>
                                </p>
                                <p class="cus-mail"><i class="fa fa-envelope-o"></i><%if (users != null) {%><%=users.getEmail()%><%} else {%>
                                    <%}%></p>

                                <p class="cus-add"><i class="fa fa-map-marker"></i> Địa chỉ: <%if (users != null) {%><%=users.getDiachi()%><%} else {%>
                                    <%}%>
                                </p>
                                <p class="cus-phone"><i class="fa fa-phone"></i> Số điện thoại: <%if (users != null) {%><%=users.getDT()%><%} else {%>
                                    <%}%></p>

                                <a href="#" class="addresses-btn">
                                    <span>Xem chi tiết</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-xs-12">
                        <div class="cus-order-info">
                            <div class="page-title">
                                <h2>Lịch sử đơn đặt hàng</h2>
                            </div>
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th>Đơn hàng</th>
                                            <th>ngày</th>
                                            <th>Trạng thái thanh toán</th>
                                            <th>Trạng thái hoàn thành</th>
                                            <th>Tổng tiền</th>
                                        </tr>
                                    </thead>
                                    <tbody>	
                                        
                                        <%
                                            orderSW danhmuc = new orderSW();
                                            long i = 0;
                                            if(users !=null)
                                            {
                                                 i = users.getIDcus();
                                            }
                                            for (order t : danhmuc.getListOrderByIDUser(i)) {
                                        %>
                                        <tr>
                                            <td><a href="">#<%=t.getIDorder()%></a></td>
                                            <td><%=new SimpleDateFormat("dd/MM/yyyy").format(t.getNgay())%></td>
                                            <%if (t.getIDpay() == 2) {%>
                                            <td>
                                                <%=t.getTenpayment()%>	<br> Mã giao dịch: <a href="">#<%=t.getTx()%></a>								
                                            </td>
                                            <%} else {%>
                                            <td>
                                                <%=t.getTenpayment()%>									
                                            </td>
                                            <%}%>
                                            <td>
                                                <%=t.getTenorder()%>									
                                            </td>
                                            <td><%=format.format(t.getTong())%>₫</td>
                                        </tr>	
                                        <%}%>
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="footer.jsp"></jsp:include>
        <jsp:include page="copyright.jsp"></jsp:include>
        <script src='scripts/option-selectors58d8.js' type='text/javascript'></script>
        <script src='scripts/bootstrap.minefbf.js' type='text/javascript'></script>
        <script src='scripts/owl.carouselefbf.js' type='text/javascript'></script>
        <script src='scripts/main-scriptefbf.js' type='text/javascript'></script>
        <script src='scripts/componentsefbf.js' type='text/javascript'></script>
        <script src='scripts/appefbf.js' type='text/javascript'></script>
        <script src='scripts/api.jquery58d8.js' type='text/javascript'></script>
        <script src='scripts/ajax-cartefbf.js' type='text/javascript'></script> 
    </body>
</html>
