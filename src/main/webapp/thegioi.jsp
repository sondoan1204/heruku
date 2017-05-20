<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.FeedMessage"%>
<%@page import="model.Feed"%>
<%@page import="model.RSSFeedParser"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="content-language" content="vi">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <title>Tin tức Thế giới | Sandwich Chía Núi</title>
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
            RSSFeedParser parser = new RSSFeedParser(
                    "http://vnexpress.net/rss/the-gioi.rss");
            Feed feed = parser.readFeed();
        %>     
        <section class="sub-top-bn">
            <h1><%=new SimpleDateFormat("dd/MM/yyyy").format(Date.parse(feed.getPubDate()))%></h1>
        </section>
        <section class="bcrumb">
            <div class="container">
                <ul class="breadcrumb">
                    <li>
                        <a title="Trở lại trang chủ" href="/">Trang chủ</a>
                    </li>
                    <li class="active"><%=feed.getTitle()%></li>
                </ul>
            </div>
        </section>
        <section class="content">
            <div class="container">
                <div class="content row">
                    <div class="col-md-9 col-md-push-3 center-site">
                        <div class="center">
                            <%
                                int count = 0;
                                for (FeedMessage message : feed.getMessages()) {
                                    count++;
                                    if (count == 6) {
                                        break;
                                    }
                                    String s = message.getDescription();
                                    String ex = s.substring(s.indexOf("src=\"") + 5);
                                    String es = ex.substring(0, ex.indexOf("\" ></a>"));
                                    String ed = ex.substring(ex.indexOf("\" ></a>") + 12);
                            %>
                            <div class="blog-grid">

                                <div class="blog-img">
                                    <a href="https://big-food.bizwebvietnam.net/cach-lam-hamburger-bo-sieu-nhanh-cho-bua-sang">
                                        <img src="<%=es%>" alt="Cách làm Hamburger bò siêu nhanh cho bữa sáng" style="width: 849px;">
                                    </a>
                                </div>

                                <div class="blog-info">
                                    <a href="https://big-food.bizwebvietnam.net/cach-lam-hamburger-bo-sieu-nhanh-cho-bua-sang"><h2><%=message.getTitle()%></h2></a>
                                    <div class="summary">
                                        <%=ed%>  <a href="<%=message.getLink()%>">[Đọc tiếp]</a>
                                    </div>
                                    <div class="article-info">
                                        <ul class="pull-left col-xs-12 col-sm-9 col-md-10 no-padding-l">
                                            <li><p><i class="fa fa-calendar"></i> 29, Tháng Giêng, 2016</p></li>
                                            <li><p><i class="fa fa-commenting-o"></i> 2</p></li>
                                            <li><i class="fa fa-tag"></i> Tags: Bánh kem, Bánh Pizza, Hamburger, </li>
                                        </ul>



                                        <ul class="social_share pull-right col-xs-12 col-sm-3 col-md-2">
                                            <li>
                                                <a class="social_share_btn" href="https://www.facebook.com/sharer/sharer.php?u=http://big-food.bizwebvietnam.net/cach-lam-hamburger-bo-sieu-nhanh-cho-bua-sang"><i class="fa fa-facebook"></i></a>
                                            </li>
                                            <li>
                                                <a class="social_share_btn" href="https://twitter.com/share?url=http://big-food.bizwebvietnam.net/cach-lam-hamburger-bo-sieu-nhanh-cho-bua-sang&amp;text=C%C3%A1ch%20l%C3%A0m%20Hamburger%20b%C3%B2%20si%C3%AAu%20nhanh%20cho%20b%E1%BB%AFa%20s%C3%A1ng"><i class="fa fa-twitter"></i></a>
                                            </li>
                                            <li>
                                                <a class="social_share_btn" href="https://plus.google.com/share?url=http://big-food.bizwebvietnam.net/cach-lam-hamburger-bo-sieu-nhanh-cho-bua-sang"><i class="fa fa-google-plus"></i></a>
                                            </li>
                                            <li>
                                                <a class="social_share_btn" href="https://pinterest.com/pin/create/button/?url=http://big-food.bizwebvietnam.net/cach-lam-hamburger-bo-sieu-nhanh-cho-bua-sang&amp;description=C%C3%A1ch%20l%C3%A0m%20Hamburger%20b%C3%B2%20si%C3%AAu%20nhanh%20cho%20b%E1%BB%AFa%20s%C3%A1ng&amp;media=//bizweb.dktcdn.net/100/053/643/articles/02-blog3.jpg?v=1454052795640"><i class="fa fa-pinterest-p"></i></a>
                                            </li>
                                        </ul>

                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                    <div class="col-md-3 col-md-pull-9 left-sidebar">
                       <jsp:include page="danhmucsanpham.jsp"></jsp:include>
                        <div class="blog-cate">
                            <div class="blog-title">
                                <h2>Danh mục tin tức</h2>
                            </div>
                            <ul>
                                <li><a href="https://big-food.bizwebvietnam.net/tin-noi-bat"><span>Tin nổi bật (2)</span></a></li>	

                                <li><a href="https://big-food.bizwebvietnam.net/tin-tuc"><span>Tin tức (5)</span></a></li>	

                            </ul>
                        </div>
                        <div class="blog-cate blog_tags">
                            <div class="blog-title">
                                <h2 title="Thẻ Tags">Thẻ Tags</h2>
                            </div>
                            <ul>
                                <li><a href="https://big-food.bizwebvietnam.net/tin-tuc/banh-kem" title="banh-kem">Bánh kem</a></li>
                                <li><a href="https://big-food.bizwebvietnam.net/tin-tuc/banh-pizza" title="banh-pizza">Bánh Pizza</a></li>
                                <li><a href="https://big-food.bizwebvietnam.net/tin-tuc/hamburger" title="hamburger">Hamburger</a></li>
                                <li><a href="https://big-food.bizwebvietnam.net/tin-tuc/banh-ngot" title="banh-ngot">Bánh ngọt</a></li>
                                <li><a href="https://big-food.bizwebvietnam.net/tin-tuc/banh-su-kem" title="banh-su-kem">Bánh su kem</a></li>
                            </ul>
                        </div>
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
