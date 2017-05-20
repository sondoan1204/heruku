<%@page import="model.Admin"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>

<%@page import="model.ChartPie"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ChartDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sb-admin.css" rel="stylesheet">
        <link href="css/plugins/morris.css" rel="stylesheet">
        <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản trị</title>
        <script type="text/javascript">
            <%
                ChartDAO charDao = new ChartDAO();
                ArrayList<ChartPie> listchar = charDao.getAll();
                ArrayList<ChartPie> listSLThag = charDao.getDonhangThang();
                int donhang = charDao.countDonHang();
                int sanpham = charDao.countSP();
                int doanhthu = charDao.sumDoanhThu();
                NumberFormat formatter = new DecimalFormat("###,###");

            %>
            function aa() {
            var chart = new CanvasJS.Chart("sondoan1204",
            {
            title: {
            text: "Số lượng sàn phẩm theo loại"
            },
                    legend: {
                    maxWidth: 350,
                            itemWidth: 120
                    },
                    data: [
                    {
                    type: "pie",
                            showInLegend: true,
                            legendText: "{indexLabel}: {y} SP",
                            dataPoints: [
            <%for (ChartPie c : listchar) {%>
                            {y: <%=c.getValue()%>, indexLabel: "<%=c.getName()%>"},
            <%}%>

                            ]
                    }
                    ]
            });
            chart.render();
            };
            function bb() {
            var chart = new CanvasJS.Chart("ahihi",
            {
            title: {
            text: "Số lượng đơn hàng theo tháng"

            },
                    axisY: {
                    title: "Số lượng"
                    },
                    data: [
                    {
                    dataPoints: [

            <%for (ChartPie c : listSLThag) {%>
                    {y: <%=c.getValue()%>, label: "Tháng <%=c.getName()%>"},
            <%}%>
                    ]
                    }
                    ]
            });
            chart.render();
            };
            function PageLoad() {
            aa(); bb();
            }
            window.onload = PageLoad;
        </script>
        <script src = "js/jquery-2.1.1.min.js" type = "text/javascript" ></script>
        <script src="js/jquery-2.1.1.js" type="text/javascript"></script>
        <script src="js/highcharts.js" type="text/javascript"></script>
        <script src="js/excanvas.js" type="text/javascript"></script>
        <script src="js/canvasjs.min.js" type="text/javascript"></script>
    </head>
    <body>
        <%
            Admin users = (Admin) session.getAttribute("admin");
            if (users == null) {
                response.sendRedirect("dangnhap.jsp");

            }
        %>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div id="page-wrapper">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Quản trị
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Index
                            </li>
                        </ol>
                    </div>                
                    <div class="row">
                        <div class="col-lg-3 col-md-6">
                            <div class="panel panel-green">
                                <div class="panel-heading">
                                    <div class="row">
                                        <div class="col-xs-3">
                                            <i class="fa fa-tasks fa-5x"></i>
                                        </div>
                                        <div class="col-xs-9 text-right">
                                            <div class="huge"><%=sanpham%></div>
                                        <div>Tổng sản phẩm!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="quanlyproduct.jsp?pages=1">
                                <div class="panel-footer">
                                    <span class="pull-left">Danh sách sản phẩm</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <div class="panel panel-yellow">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-shopping-cart fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%=donhang%></div>
                                        <div>Tổng số đơn hàng</div>
                                    </div>
                                </div>
                            </div>
                            <a href="danhsachDH.jsp">
                                <div class="panel-footer">
                                    <span class="pull-left">Xem đơn hàng</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="panel panel-red">
                            <div class="panel-heading">
                                <div class="row">
                                    <div class="col-xs-3">
                                        <i class="fa fa-money fa-5x"></i>
                                    </div>
                                    <div class="col-xs-9 text-right">
                                        <div class="huge"><%=formatter.format(doanhthu)%> VNĐ</div>
                                        <div>Tổng doanh thu!</div>
                                    </div>
                                </div>
                            </div>
                            <a href="#">
                                <div class="panel-footer">
                                    <span class="pull-left">View Details</span>
                                    <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                    <div class="clearfix"></div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Sản phẩm năm <%=new GregorianCalendar().get(Calendar.YEAR)%> </h3>
                            </div>
                            <div class="panel-body">
                                <div id="sondoan1204" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Thống kê năm <%=new GregorianCalendar().get(Calendar.YEAR)%></h3>
                            </div>
                            <div class="panel-body">
                                <div id="ahihi" style="height: 300px; width: 100%;"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
