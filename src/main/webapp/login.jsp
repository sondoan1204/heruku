<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8" />
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="content-language" content="vi">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Đăng nhập | Big food</title>
    <!-- *** Site Style ***-->
    <link href='css/bootstrapefbf.css' rel='stylesheet' type='text/css' />
    <link href='css/font-awesomeefbf.css' rel='stylesheet' type='text/css' />
    <link href='css/owl.carouselefbf.css' rel='stylesheet' type='text/css' />
    <link href='css/owl.transitionsefbf.css' rel='stylesheet' type='text/css' />
    <link href='css/css-main-stylesefbf.css' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,700&amp;subset=latin,vietnamese' rel='stylesheet' type='text/css'>
    <script src='scripts/jquery-1.9.1.minefbf.js' type='text/javascript'></script>
    <!--google recapcha v2-->
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
        <section class="sub-top-bn">
            <h1>Đăng nhập tài khoản</h1>
        </section>
        <section class="bcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a title="Trở lại trang chủ" href="index.jsp" >Trang chủ</a>
                    </li>
                    <li class="active">Đăng nhập tài khoản</li>
                </ul>
            </div>
        </section>
        <section class="content">
            <div class="container">
                <div class="main-login" id="login">
                    <div class="account-login">				
                        <form accept-charset='UTF-8' action='UsersServlet' method='post'>
                            <div class="row">
                                <div class="col-md-6 registered-users">
                                    <div class="content">
                                        <div class="page-title">
                                            <h2>THÔNG TIN TÀI KHOẢN</h2>
                                        </div>

                                    <%if (request.getAttribute("error") != null) {%>
                                    <p style="color:red"><%=request.getAttribute("error")%></p>
                                    <%} else {%>
                                    <p>Nếu bạn đã có tài khoản, xin hãy đăng nhập.</p>
                                    <%}%>
                                    <ul class="form-list">
                                        <li>
                                            <label for="email" class="required"><em>*</em> Tên đăng nhập</label>
                                            <div class="input-box">
                                                <input type="text" name="User" class="input-text required-entry validate-email" title="Địa chỉ Email" required>
                                            </div>
                                        </li>
                                        <li>
                                            <label for="pass" class="required"><em>*</em> Mật khẩu</label>
                                            <div class="input-box">
                                                <input type="password" name="Pass" class="input-text required-entry validate-password" id="pass" title="Mật khẩu" required>
                                            </div>
                                        </li>
                                    </ul>                                       
                                </div>
                                <%if (request.getAttribute("verified") != null) {%>
                                <p style="color:red"><%=request.getAttribute("verified")%></p>
                                <%}%>
                                <div class="g-recaptcha" data-sitekey="6Le5yyMUAAAAAD2gXDBeluFCWJdAvKsrQ4kikIxv"></div>
                                <div class="buttons-set">
                                    <input type="hidden" value="login" name="command">
                                    <button type="submit" class="button" title="Login">
                                        <span>Đăng nhập</span>
                                    </button>
                                    <a href="javascript:void(0);" onclick="showRecoverPasswordForm()" class="f-left">Quên mật khẩu?</a>

                                </div>
                            </div>
                            <div class="col-md-6 new-users">
                                <div class="content">
                                    <div class="page-title">
                                        <h2>BẠN CHƯA CÓ TÀI KHOẢN</h2>
                                    </div>
                                    <p>Bằng cách tạo một tài khoản với cửa hàng của chúng tôi, bạn sẽ có thể di chuyển thông qua các quy trình kiểm tra nhanh hơn, lưu trữ nhiều địa chỉ gửi hàng, xem và theo dõi đơn đặt hàng của bạn trong tài khoản của bạn và nhiều hơn nữa.</p>
                                </div>
                                <div class="buttons-set" style="text-align: center">
                                    <button type="button" title="Khởi tạo tài khoản" class="button" onclick="window.location.href = 'signup.jsp';"><span><span>Tạo tài khoản</span></span></button>

                                    </br> ------ hoặc Đăng nhập bằng ------</br>
                                    <div class="buttons-set">
                                        <button style="background: #E9654C;" type="button" title="Đăng nhập tài khoản bằng Google" class="button" onclick="window.location.href = 'https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=https://sondoan1204-javatest.herokuapp.com/OAuth2Callback&response_type=code&client_id=1072517011559-98o65aqld7in2j3du772p3uio5le3a2i.apps.googleusercontent.com&approval_prompt=force';"><span><span>Google</span></span></button>
                                        <button style="background: #3b5998;" type="button" title="Đăng nhập tài khoản bằng Facebook" class="button" onclick="window.location.href = 'https://www.facebook.com/dialog/oauth?client_id=429789270711609&redirect_uri=https://sondoan1204-javatest.herokuapp.com/OAuth2fb&scope=email&scope=user_friends';"><span><span>Facebook</span></span></button>                                
                                        <button style="background: #333;" type="button" title="Đăng nhập tài khoản bằng GitHub" class="button" onclick="window.location.href = 'https://github.com/login/oauth/authorize?client_id=02edf4e25d434e53b086&redirect_uri=https://sondoan1204-javatest.herokuapp.com/Oauth2git&scope=user';"><span><span>GitHub</span></span></button>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>                    
            </div>                        
            <div class="main-recover" id="recover-password" style="display: none">
                <div class="page-title">
                    <h2>Bạn quên mật khẩu?</h2>
                </div>
                <form accept-charset='UTF-8' action='https://big-food.bizwebvietnam.net/account/recover' id='recover_customer_password' method='post'>
                    <input name='FormType' type='hidden' value='recover_customer_password' />
                    <input name='utf8' type='hidden' value='true' />

                    <div class="fieldset">
                        <p>Nhập email của bạn, chúng tôi sẽ gửi email tới cho bạn.</p>
                        <ul class="form-list">
                            <li>
                                <label for="email_address" class="required"><em>*</em>Địa chỉ Email</label>
                                <div class="input-box">
                                    <input type="email" name="email" alt="email" id="email_address" class="input-text required-entry validate-email" value="" required>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="buttons-set">
                        <button type="submit" class="button"><span>Gửi</span></button>
                        <a href="javascript:void(0);" onclick="hideRecoverPasswordForm();
                                return false;">Trở lại đăng nhập</a>

                    </div>                            
                </form>
            </div>
        </div>
    </section>
    <script type="text/javascript">
        function showRecoverPasswordForm() {
            document.getElementById('recover-password').style.display = 'block';
            document.getElementById('login').style.display = 'none';
        }

        function hideRecoverPasswordForm() {
            document.getElementById('recover-password').style.display = 'none';
            document.getElementById('login').style.display = 'block';
        }

        if (window.location.hash == '#recover') {
            showRecoverPasswordForm()
        }
    </script>


    <jsp:include page="footer.jsp"></jsp:include>
    <jsp:include page="copyright.jsp"></jsp:include>
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
