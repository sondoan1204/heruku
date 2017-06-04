<%@page import="model.information"%>
<%@page import="sandwich.informationSW"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="vi">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Liên hệ | Sandwich Chía Núi</title>
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
            informationSW infoSw = new informationSW();
            information info = new information();
            info = infoSw.getInformationDetail();
        %>
        <jsp:include page="header.jsp"></jsp:include>
            <section class="sub-top-bn">
                <h1>Liên hệ</h1>
            </section>
            <section class="bcrumb">
                <div class="container">
                    <ul class="breadcrumb">
                        <li>
                            <a title="Trở lại trang chủ" href="trang-chu" >Trang chủ</a>
                        </li>
                        <li class="active">Liên hệ</li>
                    </ul>
                </div>
            </section>
            <section class="content">
                <div class="container">	
                <div class="row">
                    <div class="googlemap col-xs-12">
                          <style>
                                #map {
                                    width: 100%;
                                    height: 400px;
                                }
                            </style>
                            <div id="map"></div>
                            <script async defer
                                    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhS-sXKcwwOG89De2-MGC6ntouE5T8Xfo&callback=initMap">
                            </script>
                        <button style="margin-top:30px; outline:0;background:#c69c6d;border:0;line-height:50px;padding:0 30px;text-transform:uppercase;color:#fff;font-family:Roboto" onclick="timDuongDi()">Tìm đường đi</button>
                        <script>
                            function initMap() {
                                var latlng = new google.maps.LatLng(10.802014, 106.714746); //Tọa độ cửa hàng
                                var map = new google.maps.Map(document.getElementById('map'), {
                                    center: latlng,
                                    zoom: 16 //Độ phóng to của bản đồ
                                });
                                var marker = new google.maps.Marker({
                                    position: latlng,
                                    map: map,
                                    title: "Sandwich" //Tên hiển thị khi đưa chuột vào địa điểm
                                });
                            }
                            function timDuongDi() {
                                var latlng = new google.maps.LatLng(10.802014, 106.714746); //Vị trí của cửa hàng
                                var map = new google.maps.Map(document.getElementById('map'), {
                                    center: latlng,
                                    zoom: 16
                                });
                                var infoWindow = new google.maps.InfoWindow({map: map});

                                // Try HTML5 geolocation.
                                if (navigator.geolocation) {
                                    navigator.geolocation.getCurrentPosition(function (position) {
                                        var pos = {
                                            lat: position.coords.latitude,
                                            lng: position.coords.longitude
                                        };

                                        infoWindow.setPosition(pos);
                                        infoWindow.setContent('Vị trí của bạn');
                                        map.setCenter(pos);

                                        var directionsDisplay = new google.maps.DirectionsRenderer({
                                            map: map
                                        });
                                        var request = {
                                            destination: latlng, // Điểm đến là vị trí cửa hàng
                                            origin: pos, // Điểm bắt đầu là vị trí hiện tại của bạn
                                            travelMode: google.maps.TravelMode.DRIVING
                                        };
                                        var directionsService = new google.maps.DirectionsService();
                                        directionsService.route(request, function (response, status) {
                                            if (status == google.maps.DirectionsStatus.OK) {
                                                // Display the route on the map.
                                                directionsDisplay.setDirections(response);
                                            }
                                        });
                                    }, function () {
                                        handleLocationError(true, infoWindow, map.getCenter());
                                    });
                                } else {
                                    // Browser doesn't support Geolocation
                                    handleLocationError(false, infoWindow, map.getCenter());
                                }
                            }

                            function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                                infoWindow.setPosition(pos);
                                infoWindow.setContent(browserHasGeolocation ?
                                        'Lỗi: Định vị thất bại.' :
                                        'Lỗi: Trình duyệt hiện tại của bạn không hỗ trợ Geolocation.');
                            }

                        </script>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <form accept-charset='UTF-8' action='index.jspcontact' id='contact' method='post'>
                            <input name='FormType' type='hidden' value='contact' />
                            <input name='utf8' type='hidden' value='true' />

                            <!--form-errors-custom-->

                            <div class="notification_contact"><p>Gửi liên hệ thành công!</p></div>
                            <!--End. form-errors-custom-->


                            <div class="cmtform">
                                <h2 class="legend">Liên hệ với chúng tôi</h2>
                                <ul class="form-list">
                                    <li class="fields clearfix">
                                        <div class="field first">
                                            <label for="name" class="required">Họ tên</label>
                                            <div class="input-box">
                                                <input value="" name="contact[name]" type="text" class="input-text form-control">
                                            </div>
                                        </div>	
                                        <div class="field">
                                            <label for="telephone">Email<em>*</em></label>
                                            <div class="input-box">
                                                <input value="" name="contact[email]" type="email" class="input-text form-control" required>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="wide">
                                        <label for="comment" class="required">Bình luận <%=info.getFacebook()%><em>*</em></label>
                                        <div class="input-box">
                                            <textarea name="contact[body]" class="form-control input-text" cols="5" rows="3" required></textarea>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <div class="cmt-action">
                                <button type="submit" class="cmtbtn"><span>Gửi liên hệ</span></button>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <ul class="ct-info">
                            <li><a href="index.jsp" title="Trang chủ"><img src="../bizweb.dktcdn.net/100/053/643/themes/138603/assets/logoefbf.jpg?1471418341698" alt="Logo"></a></li>
                            <li class="desc"><p>Chuỗi cửa hàng ăn uống và giải trí BigFood thuộc tổng công ty cổ phần DKT JSC được 
                                    đánh giá là một trong những thương hiệu hàng đầu tại Việt Nam</p></li>
                            <li class="ct-locate"><i class="fa fa-map-marker"></i>Tầng 4, 442 Đội Cấn, P. Cống Vị, Q. Ba Đình, 
                                Hà Nội, Việt Nam</li>
                            <li class="ct-phone"><i class="fa fa-phone"></i>(04) 6674 2332  -  (08) 6680 9686</li>
                            <li class="ct-mail"><i class="fa fa-envelope"></i>support@dkt.com.vn</li>
                        </ul>
                    </div>
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
