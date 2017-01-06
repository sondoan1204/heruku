<%@page import="model.information"%>
<%@page import="sandwich.informationSW"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <%
            informationSW infoSw = new informationSW();
            information info = new information();
            info = infoSw.getInformationDetail();        
        %>
        <div id="fb-root"></div>
    <script>
        window.fbAsyncInit = function() {
            FB.init({
                appId: '654574901370210',
                status : true, // check login status
                cookie : true, // enable cookies to allow the server to access the session
                xfbml: true // parse XFBML
            });
            };
            (function() {
                var e = document.createElement('script');
                e.src = document.location.protocol + '//connect.facebook.net/vi_VN/all.js';
                e.async = true;
                document.getElementById('fb-root').appendChild(e);
            }());
            </script>
    <script>
(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.7&appId=825850937514684";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
        <footer class="footer">
            <div class="container">
                <div class="top-footer row">
                    <div class="footer-subscribe col-md-3 col-sm-12 col-xs-12 foo-col-last pull-right">
                        <div class="foo-mdl-title">
                            <h2>Facebook</h2>
                        </div>
                        <div class="subscribe-content">
                            <div class="fb-page" data-href="https://www.facebook.com/SandwichChiaNui/" data-small-header="false" data-adapt-container-width="true" data-hide-cover="false" data-show-facepile="true">
                                <blockquote cite="https://www.facebook.com/SandwichChiaNui/" class="fb-xfbml-parse-ignore">
                                    <a href="https://www.facebook.com/SandwichChiaNui/">
                                        <%=info.getSitename()%>
                                    </a>
                                </blockquote>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-12 col-xs-12 pull-left">
                        <div class="row">
                            <div class="col-md-3 col-sm-6 foo-col">
                                <div class="foo-mdl-title">
                                    <h2>Về chúng tôi</h2>
                                </div>
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="index.jsp"><span>Trang chủ</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/gioi-thieu"><span>Giới thiệu</span></a>
                                    </li>
                                    <li>
                                        <a href="products-all.jsp?&pages=1"><span>Sản phẩm</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/san-pham-khuyen-mai"><span>Khuyến mãi</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/tin-tuc"><span>Tin tức</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/lien-he"><span>Liên hệ</span></a>
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4 col-sm-6 foo-col">
                                <div class="foo-mdl-title">
                                    <h2>Điều khoản</h2>
                                </div>
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/dieu-khoan"><span>Điều khoản sử dụng</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/dieu-khoan"><span>Điều khoản giao dịch</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/dieu-khoan"><span>Dịch vụ tiện ích</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/dieu-khoan"><span>Quyền sở hữu trí tuệ</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/account/register"><span>Đăng ký thành viên</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/huong-dan"><span>Giao hàng và thanh toán</span></a>
                                    </li>
                                </ul>
                           </div>
                            <!--<div class="col-md-3 col-sm-6 foo-col">
                                <div class="foo-mdl-title">
                                    <h2>Hướng dẫn</h2>
                                </div>
                                <ul class="list-unstyled">
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/huong-dan"><span>Hướng dẫn mua hàng</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/huong-dan"><span>Giao nhận và thanh toán</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/huong-dan"><span>Đổi trả và bảo hành</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/huong-dan"><span>Đăng kí thành viên</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/huong-dan"><span>Mua hàng trả góp</span></a>
                                    </li>
                                    <li>
                                        <a href="http://big-food.bizwebvietnam.net/huong-dan"><span>Mua hàng online</span></a>
                                    </li>
                                </ul>
                            </div>-->
                            <div class="col-md-5 col-sm-6 foo-col">
                                <div class="foo-mdl-title">
                                    <h2>Chính sách</h2>
                                </div>
                                <div class="fb-page" data-href="https://www.facebook.com/linh.kien.sieu.re.2015/" data-tabs="messages" data-height="250" data-small-header="true" data-adapt-container-width="true" data-hide-cover="true" data-show-facepile="false">
                                    <blockquote cite="https://www.facebook.com/linh.kien.sieu.re.2015/" class="fb-xfbml-parse-ignore">
                                        <a href="https://www.facebook.com/linh.kien.sieu.re.2015/">Sandwich Chía Núi</a>
                                    </blockquote>
                                </div>
                            </div>	
                        </div>				
                    </div>				
                </div>
                <div class="mid-footer">
                    <h2><%=info.getSitename()%></h2>
                    <p>Địa chỉ: <%=info.getAddress()%></p>
                    <p>Chi nhánh: Hutech, TP Hồ Chí Minh</p>
                    <p>ĐT: <%=info.getHotline()%>     Email: <%=info.getEmail()%></p>
                </div>
            </div>
        </footer>

    </body>
</html>
