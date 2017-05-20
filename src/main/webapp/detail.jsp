<%@page import="sandwich.tagSW"%>
<%@page import="model.tag"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.products"%>
<%@page import="sandwich.productSW"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:fb='http://www.facebook.com/2008/fbml' >
    <head>
        <meta property="fb:app_id" content="353011608412219" />
        <meta charset="UTF-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="vi">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Chi tiết sản phẩm | Big food</title>
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
        <div id="fb-root"></div>
<script>
window.fbAsyncInit = function() {
FB.init({
appId : '353011608412219',
status : true, // check login status
cookie : true, // enable cookies to allow the server to access the session
xfbml : true // parse XFBML});
};
(function() {
var e = document.createElement('script');
e.src = document.location.protocol + '//connect.facebook.net/en_US/all.js';
e.async = true;
document.getElementById('fb-root').appendChild(e);
}());
</script>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=353011608412219";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

        <%
            NumberFormat format = new DecimalFormat("###,###");
            productSW pd = new productSW();
            products product = new products();
            String product_id = "";
            if (request.getParameter("product") != null) {
                product_id = request.getParameter("product");
                product = pd.getProductDetail(Long.parseLong(product_id));
            }
        %>
        <jsp:include page="header.jsp"></jsp:include>
        <section class="sub-top-bn">
                <h1><%=product.getTen()%></h1>
        </section>
        <section class="bcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a title="Trở lại trang chủ" href="/" >Trang chủ</a>
                    </li>
                    <li>
                        <a href="/" title="Sản phẩm trong tuần">Sản phẩm</a>
                    </li>
                    <li class="active"><%=product.getTen()%></li>
                </ul>
            </div>
        </section>
        <section class="content">
            <div class="container">
                <div class="product row">
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <div class="featured-image">
                            <img src="./images-product/<%=product.getAnhbia()%>" alt="<%=product.getTen()%>">
                        </div>
                        <div class="images">
                            <div class="imgowl" >
                                <div class="img-item col-xs-12">
                                    <a href="./images-product/<%=product.getAnh1()%>">
                                        <img src="./images-product/<%=product.getAnh1()%>" alt="<%=product.getTen()%>">
                                    </a>
                                </div>
                                <div class="img-item col-xs-12">
                                    <a href="./images-product/<%=product.getAnh2()%>">
                                        <img src="./images-product/<%=product.getAnh2()%>" alt="<%=product.getTen()%>">
                                    </a>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12 col-xs-12">
                        <form action="" method="post">
                            <div class="prod-desc">
                                <h2 itemprop="name"><%=product.getTen()%></h2>
                                <%if (product.getTTkm() == true) {%>
                                <div class="price-box">
                                    <p class="special-price">
                                        <span><%= format.format(product.getGiakm())%>&#8363;</span>
                                    </p>
                                    <p class="old-price">
                                        <span><%= format.format(product.getGia())%>&#8363;</span>
                                    </p>
                                </div>
                                <%} else {%>  
                                <div class="price-box">
                                    <p class="special-price">
                                        <span><%= format.format(product.getGia())%>&#8363;</span>
                                    </p>
                                </div>
                                <%}%>
                                <div class="primary-box">
                                    <p class="desctit">Mô tả ngắn: </p>
                                    <p><%=product.getMotangan()%></p>
                                </div>
                                <div class="quantity-box clearfix">
                                    <label>Số lượng: </label>
                                    <div class="input-group qttform">
                                        <span class="input-group-btn data-dwn">
                                            <div onclick="var result = document.getElementById('qty'); var qty = result.value; if (!isNaN(qty) & amp; & amp; qty > 1) result.value--; return false;" class="btn mathbtn" data-dir="dwn"><span class="fa fa-minus"></span></div>
                                        </span>
                                        <input type="text" id="qty" class="bizwebinput form-control product_input_qty qtt-center" value="1" name="quantity" min="1" onpaste="return false;" onkeypress='validate(event)'/>
                                        <span class="input-group-btn data-up">
                                            <div onclick="var result = document.getElementById('qty');
                                                    var qty = result.value;
                                                    if (!isNaN(qty))
                                                        result.value++;
                                                    return false;" class="btn mathbtn" data-dir="up"><span class="fa fa-plus"></span></div>
                                        </span>
                                    </div>
                                </div>
                                <div class="action-box clearfix">
                                    <%String a = request.getRequestURL().toString();%>
                                    <a href='CartServlet?command=plus&productID=<%=product.getIDsp()%>&url=<%=a%>?product=<%=product.getIDct()%>' class="btn btn-primary addtocart">Mua hàng</a>

                                </div>
                                    <div class="fb-like" data-href="http://minhduc.com/detail.jsp?product=<%=product.getIDsp()%>" data-layout="standard" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>
                                    Thêm nút like ở đây
<!--                                <div class="fb-like" data-href="http://minhduc.com/detail.jsp?product=<%=product.getIDsp()%>" data-layout="standard" data-action="like" data-size="large" data-show-faces="true" data-share="true"></div>-->
                                <div class="addthis">
                                    <script type="text/javascript" src="../s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5620cf1235df3004" async="async"></script>	
                                    <div class="addthis_native_toolbox"></div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="product-detail">
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#tab_1" aria-controls="home" role="tab" data-toggle="tab">THÔNG TIN SẢN PHẨM</a></li>
                        <li role="presentation"><a href="#tab_2" aria-controls="profile" role="tab" data-toggle="tab">KHÁCH HÀNG ĐÁNH GIÁ</a></li>
                        <li role="presentation"><a href="#tab_3" aria-controls="messages" role="tab" data-toggle="tab">THẺ TAGS</a></li>
                    </ul>
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="tab_1">
                            <div class="std">
                                <%=product.getMota()%>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab_2">
                            <div class="std">
                                Thêm bình luận ở đây
                                <div class="fb-comments" data-href="http://localhost:8080/Sandwich/detail.jsp?product=<%=product.getIDsp()%>" data-width="760" data-num-posts="20"></div>
<!--                                <div class="fb-comments" data-href="http://localhost:8080/Sandwich/detail.jsp?product=<%=product.getIDsp()%>" data-width="100%" data-num-posts="20"></div>-->
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="tab_3">
                            <ul class="producttagsul">
                                <%
                                    tagSW danhmuc = new tagSW();
                                    for (tag t : danhmuc.getListTagByIDproduct(product.getIDsp())) {

                                        if (t == null) {%>
                                <li class="producttagsli"><a href="#">Sản phẩm chưa có tag</a></li>
                                    <%break;
                                                }%>
                                <li class="producttagsli">
                                    <a href="tag.jsp?tag=<%=t.getTagName()%>" title="<%=t.getTagName()%>"><%=t.getTagName()%></a>
                                </li>
                                <%}%>

                                <!--                                    <li class="producttagsli"><a href="#">Sản phẩm chưa có tag</a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="prod-coll-1 left15 related_product_owl">
                    <div class="module-title">
                        <h2>Sản phẩm liên quan</h2>
                    </div>
                    <div class="row">
                        <div class="prod-coll-4-owl">	
                            <%
                                for (products p : pd.getListProductByLienquan(product.getIDct())) {
                            %>
                            <div class="col-md-12">
                                <div class="product-grid">
                                    <div class="feature-img">
                                        <a href="detail.jsp?product=<%=p.getIDsp()%>">
                                            <img src="images-product/<%=p.getAnhbia()%>" alt="<%=p.getTen()%>" class="img-responsive">
                                        </a>
                                        <div class="grid-action-box">
                                            <form action="" class="product_item_form" method="post">	
                                                <input type="hidden" name="variantId" value="2099142" />
                                                <button type="submit" title="Mua hàng" class="list-add-cart add-to-cart">				
                                                    <span>Mua hàng</span>
                                                </button>		
                                            </form>
                                        </div>
                                    </div>
                                    <div class="prod-info">
                                        <%if (p.getTTkm() == true) {%>
                                        <div class="price-box">
                                            <p class="special-price">
                                                <span><%=p.getGia()%>&#8363;</span>
                                            </p>
                                            <p class="old-price">
                                                <span><%= format.format(p.getGiakm())%>&#8363;</span>
                                            </p>
                                        </div>
                                        <%} else {%>  
                                        <div class="price-box">
                                            <p class="special-price">
                                                <span><%=p.getGia()%>&#8363;</span>
                                            </p>
                                        </div>
                                        <%}%>

                                        <a href="detail.jsp">
                                            <h3><%=p.getTen()%></h3>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <%}%>
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
                        <button onclick="window.location = 'cart.html'" class="btn btn-red-popup">Đi tới giỏ hàng</button>
                        <button onclick="window.location = 'https://big-food.bizwebvietnam.net/checkout'" class="btn btn-red-popup">Thanh toán</button>
                    </div>

                </div>
                <a href="javascript:void(0)" class="close-modal"><i class="fa fa-times"></i></a>
            </div>    
        </div>
        <script src='scripts/componentsefbf.js' type='text/javascript'></script>
        <script src='scripts/appefbf.js' type='text/javascript'></script>
        <script src='scripts/api.jquery58d8.js' type='text/javascript'></script>
        <script src='scripts/ajax-cartefbf.js' type='text/javascript'></script>   
    </body>
</html>
