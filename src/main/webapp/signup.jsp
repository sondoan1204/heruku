<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="vi">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Đăng ký | Big food</title>
        <!-- *** Site Style ***-->
        <link href='css/bootstrapefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/font-awesomeefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/owl.carouselefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/owl.transitionsefbf.css' rel='stylesheet' type='text/css' />
        <link href='css/css-main-stylesefbf.css' rel='stylesheet' type='text/css' />
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,700&amp;subset=latin,vietnamese' rel='stylesheet' type='text/css'>
        <script src='scripts/jquery-1.9.1.minefbf.js' type='text/javascript'></script>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script> 
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;

                $("#email").keyup(function (e) {
                    clearTimeout(x_timer);
                    var email_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_email_ajax(email_name);
                    }, 1000);
                });
                function check_email_ajax(email) {
                    $("#email-result").html('<img src="images/loading.gif" />');
                    $.post('CheckEmailServlet', {'email': email}, function (data) {
                        $("#email-result").html(data);
                    });
                }
            });
        </script> 
        <script type="text/javascript">
            $(document).ready(function () {
                var x_timer;
                $("#user").keyup(function (e) {
                    clearTimeout(x_timer);
                    var user_name = $(this).val();
                    x_timer = setTimeout(function () {
                        check_username_ajax(user_name);
                    }, 1000);
                });
                function check_username_ajax(user) {
                    $("#user-result").html('<img src="images/loading.gif" />');
                    $.post('CheckUserServlet', {'user': user}, function (data) {
                        $("#user-result").html(data);
                    });
                }
            });
        </script>
        <!--google recapcha v2-->
        <script src='https://www.google.com/recaptcha/api.js'></script>
    </head>
    <body>


        <section class="sub-top-bn">
            <h1>Đăng ký tài khoản</h1>
        </section>
        <section class="bcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a title="Trở lại trang chủ" href="index.jsp" >Trang chủ</a>
                    </li>
                    <li class="active">Đăng ký tài khoản</li>
                </ul>
            </div>
        </section>
        <section class="content">
            <div class="container">
                <div class="col-main">
                    <div class="account-create">				
                        <form accept-charset='UTF-8' action='UsersServlet' id='customer_register' method='post'>
                            <input name='FormType' type='hidden' value='customer_register' />
                            <input name='utf8' type='hidden' value='true' /> 
                            <div class="fieldset">
                                <div class="page-title">
                                    <h2>THÔNG TIN CÁ NHÂN</h2>
                                </div>
                                <ul class="form-list">
                                    <li class="fields">
                                        <div class="row customer-name-middlename">
                                            <div class=" col-md-6  name-lastname">
                                                <label for="name" class="required">Họ và tên</label>
                                                <input type="text"  name="Name" maxlength="255" class="required-entry" required>
                                            </div>
                                            <div class="col-md-6 name-firstname">
                                                <label for="dienthoai" class="required">Điện thoại</label>
                                                <input type="number" name="Phone" maxlength="255" class="required-entry">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class=" col-md-12">
                                                <label for="address" class="required">Địa chỉ</label>
                                                <input type="text"  name="Address" maxlength="255" class="required-entry">
                                            </div>
                                        </div>

                                    </li>       
                                </ul>
                            </div>
                            <div class="fieldset">
                                <div class="page-title">
                                    <h2>THÔNG TIN ĐĂNG NHẬP</h2>
                                </div>
                                <ul class="form-list">
                                    <li>
                                        <label for="email_address" class="required"><em>*</em>Địa chỉ Email  <span id="email-result"></span></label>
                                            <%if (request.getAttribute("email") != null) {%>
                                        <p style="color:red"><%=request.getAttribute("email")%></p>
                                        <%}%>
                                        <input type="email"  name="Email" id="email"  required>
                                    </li>  
                                    <li>
                                        <label for="username" class="required"><em>*</em>Username  <span id="user-result"></span></label>
                                            <%if (request.getAttribute("user") != null) {%>
                                        <p style="color:red"><%=request.getAttribute("user")%></p>
                                        <%}%>
                                        <input type="text"  name="User" id="user" required>
                                    </li>
                                    <li>
                                        <label for="password" class="required"><em>*</em>Mật khẩu</label>
                                        <input type="password" name="Pass" class="validate-password" required>
                                    </li>
                                </ul>
                            </div>
                            <%if (request.getAttribute("verified") != null) {%>
                            <p style="color:red"><%=request.getAttribute("verified")%></p>
                            <%}%>
                            <div class="g-recaptcha" data-sitekey="6Le5yyMUAAAAAD2gXDBeluFCWJdAvKsrQ4kikIxv"></div>
                            <div class="buttons-set">
                                <input type="hidden" value="insert" name="command">
                                <button type="submit" title="Submit" class="button"><span>Đăng ký</span></button>
                                <a href="index.jsp" class="back-link">Trở lại trang chủ</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <script src='scripts/option-selectors58d8.js' type='text/javascript'></script>
        <script src='scripts/bootstrap.minefbf.js' type='text/javascript'></script>
        <script src='scripts/owl.carouselefbf.js' type='text/javascript'></script>
        <script src='scripts/main-scriptefbf.js' type='text/javascript'></script>


        <div class="ajax-error-modal modal">
            <div class="modal-inner">
                <div class="ajax-error-title">Lỗi</div>
                <div class="ajax-error-message"></div>
            </div>
        </div>
        <div class="ajax-success-modal modal">
            <div class="overlay"></div>
            <div class="content">
                <div class="ajax-left">
                    <img class="ajax-product-image" alt="&nbsp;" src="#" style="max-width:65px; max-height:100px"/>
                </div>
                <div class="ajax-right">
                    <p class="ajax-product-title"></p>
                    <p class="success-message btn-go-to-cart"><span style="color:#000">&#10004;</span> Đã được thêm vào giỏ hàng.</p>

                    <div class="actions">          
                        <button onclick="window.location = 'http://big-food.bizwebvietnam.net/cart'" class="btn btn-red-popup">Đi tới giỏ hàng</button>
                        <button onclick="window.location = 'http://big-food.bizwebvietnam.net/checkout'" class="btn btn-red-popup">Thanh toán</button>
                    </div>

                </div>
                <a href="javascript:void(0)" class="close-modal"><i class="fa fa-times"></i></a>
            </div>    
        </div>
        <script src='scripts/componentsefbf.js' type='text/javascript'></script>
        <script src='scripts/appefbf.js' type='text/javascript'></script>
        <script src='scripts/api.jquery58d8.js' type='text/javascript'></script>
        <script src='scripts/ajax-cartefbf.js' type='text/javascript'></script>

        <script>
                            $(document).ready(function ()
                            {
                                App.init(); // init core    
                            });
        </script>
        <script type="text/javascript">
            Bizweb.updateCartFromForm = function (cart, cart_summary_id, cart_count_id) {

                if ((typeof cart_summary_id) === 'string') {
                    var cart_summary = jQuery(cart_summary_id);
                    if (cart_summary.length) {
                        // Start from scratch.
                        cart_summary.empty();
                        // Pull it all out.        
                        jQuery.each(cart, function (key, value) {
                            if (key === 'items') {

                                var table = jQuery(cart_summary_id);
                                if (value.length) {
                                    jQuery.each(value, function (i, item) {
                                        jQuery('<div class="control-container"><div class="row"><a class="cart-close" title="Xóa" href="javascript:void(0);" onclick="Bizweb.removeItem(' + item.variant_id + ')"><img class="item-remove" src="//images/itemclose.png"/></a><div class="col-md-10 cart-left"><img src="' + Bizweb.resizeImage(item.image, 'small') + '" /></div><div class="col-md-14 cart-right"><div class="cart-title"><a href="' + item.url + '">' + item.name + '</a></div><div class="cart-price"><i style="color:#636363;font-style: normal;">' + item.quantity + ' x </i>' + Bizweb.formatMoney(item.price, "{{amount_no_decimals_with_comma_separator}}&#8363;") + '</div></div></div>').appendTo(table);
                                    });


                                    jQuery('<div class="subtotal"><span class="cart-total-right"><i style="color:#c69c6d;font-style: normal;font-weight: bold;font-size: 16px;">TỔNG TIỀN:</i> 0&#8363;</span></div>').appendTo(table);
                                    jQuery('<div class="action"><a id="gocart" href="\/cart">Giỏ hàng</a></div>').appendTo(table);
                                } else {
                                    jQuery('<li><p>Không có sản phẩm nào trong giỏ hàng.</p></li>').appendTo(table);
                                }
                            }
                        });
                    }
                }
                updateCartDesc(cart);
            }


            function updateCartDesc(data) {
                var $cartPrice = Bizweb.formatMoney(data.total_price, "{{amount_no_decimals_with_comma_separator}}&#8363;");
                $('.cart-item-count').text(data.item_count);
                $('.cart-total-right').html('<i style="color:#c69c6d;font-style: normal;font-weight: bold;font-size: 16px;">TỔNG TIỀN:</i> ' + $cartPrice + '');
            }
            Bizweb.onCartUpdate = function (cart) {
                Bizweb.updateCartFromForm(cart, '#cart-info-parent .cart-content');
            };
            $(window).load(function () {
                // Let's get the cart and show what's in it in the cart box.  
                Bizweb.getCart(function (cart) {
                    Bizweb.updateCartFromForm(cart, '#cart-info-parent .cart-content');
                });
            });

        </script>	
    </body>
</html>
