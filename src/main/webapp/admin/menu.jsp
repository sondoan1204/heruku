<%-- 
    Document   : menu
    Created on : Dec 2, 2016, 3:51:01 PM
    Author     : SONPC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <title>menu</title>
    </head>
    <body>
        <%
        Admin admin = null;
            if (session.getAttribute("admin") != null) {
                admin = (Admin) session.getAttribute("admin");
            }
        %>
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
<!--                    <a><img src="<%=admin.getAvata()%>" style="width: 30px; height: 100%"></a>-->
<!--                    <ul class="dropdown-menu message-dropdown">
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>sadasd</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-preview">
                            <a href="#">
                                <div class="media">
                                    <span class="pull-left">
                                        <img class="media-object" src="http://placehold.it/50x50" alt="">
                                    </span>
                                    <div class="media-body">
                                        <h5 class="media-heading"><strong>John Smith</strong>
                                        </h5>
                                        <p class="small text-muted"><i class="fa fa-clock-o"></i> Yesterday at 4:32 PM</p>
                                        <p>Lorem ipsum dolor sit amet, consectetur...</p>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="message-footer">
                            <a href="#">Read All New Messages</a>
                        </li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell"></i> <b class="caret"></b></a>
                    <ul class="dropdown-menu alert-dropdown">
                        <li>
                            <a href="#">Alert Name <span class="label label-default">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-primary">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-success">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-info">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-warning">Alert Badge</span></a>
                        </li>
                        <li>
                            <a href="#">Alert Name <span class="label label-danger">Alert Badge</span></a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">View All</a>
                        </li>
                    </ul>
                </li>-->
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="<%=admin.getAvata()%>" style="width: 30px; height: 100%"> <%=admin.getName()%> <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Profile</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">

                    <li >
                        <a href="index.jsp"><i class="fa fa-fw fa-dashboard"></i> Dashboard</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo4"><i class="fa fa-fw fa-arrows-v"></i>Website<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo4" class="collapse">
                            <li>
                                <a href="suathongtin.jsp"><i class="fa fa-fw fa-edit"></i> Thông tin Website</a>
                            </li>
                            <li>
                                <a href="quanlyslider.jsp"><i class="fa fa-fw fa-edit"></i> Slide</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo1"><i class="fa fa-fw fa-arrows-v"></i>Loại SP<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo1" class="collapse">
                            <li>
                                <a href="themcategory.jsp"><span class="glyphicon glyphicon-plus-sign"></span> Thêm loại mới</a>
                            </li>
                            <li>
                                <a href="quanlycategory.jsp"><span class="glyphicon glyphicon-th-list"></span> Danh sách loại</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo2"><i class="fa fa-fw fa-arrows-v"></i>Sản phẩm<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo2" class="collapse">
                            <li>
                                <a href="themproduct.jsp"><span class="glyphicon glyphicon-plus-sign"></span> Thêm SP mới</a>
                            </li>
                            <li>
                                <a href="quanlyproduct.jsp?pages=1"><span class="glyphicon glyphicon-th-list"></span> Danh sách sản phẩm</a>
                            </li>
                            <li>
                                <a href="sanphamnew.jsp?pages=1"><span class="glyphicon glyphicon-leaf"></span> Sản phẩm Mới</a>
                            </li>
                            <li>
                                <a href="sanphamhot.jsp?pages=1"><span class="glyphicon glyphicon-fire"></span> Sản phẩm Hot</a>
                            </li>
                            <li>
                                <a href="sanphamkhuyenmai.jsp?pages=1"><span class="glyphicon glyphicon-gift"></span> Sản phẩm Khuyến mãi</a>
                            </li>
                             <li>
                                <a href="sanphamxoa.jsp?pages=1"><span class="glyphicon glyphicon-remove"></span> Sản phẩm đã xoá</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo3"><i class="fa fa-fw fa-arrows-v"></i>Khách hàng<i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo3" class="collapse">
                            <li>
                                <a href="themcustomer.jsp"><span class="glyphicon glyphicon-plus-sign"></span> Thêm khách hàng</a>
                            </li>
                            <li>
                                <a href="quanlycustomer.jsp"><span class="glyphicon glyphicon-user"></span> Danh sách khách hàng</a>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <a href="danhsachDH.jsp"><i class="fa fa-fw fa-table"></i> Đơn hàng</a>
                    </li>
                    <li>
                        <a href="DonHangXoa.jsp"><i class="fa fa-fw fa-edit"></i> Đơn hàng đã xoá</a>
                    </li>
                    <li>
                        <a href="seoproduct.jsp?pages=1"><i class="fa fa-fw fa-desktop"></i> KeyWords Sản phẩm</a>
                    </li>
<!--                    <li>
                        <a href="bootstrap-grid.html"><i class="fa fa-fw fa-wrench"></i> Bootstrap Grid</a>
                    </li>
                    <li>
                        <a href="javascript:;" data-toggle="collapse" data-target="#demo"><i class="fa fa-fw fa-arrows-v"></i> Dropdown <i class="fa fa-fw fa-caret-down"></i></a>
                        <ul id="demo" class="collapse">
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                            <li>
                                <a href="#">Dropdown Item</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blank-page.html"><i class="fa fa-fw fa-file"></i> Blank Page</a>
                    </li>-->
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <!-- /.container-fluid -->
        <!-- jQuery Version 1.11.0 -->
        <script src="${root}/admin/js/jquery-1.11.0.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="${root}/admin/js/bootstrap.min.js"></script>

        <!-- Morris Charts JavaScript -->
        <script src="${root}/admin/js/plugins/morris/raphael.min.js"></script>
        <script src="${root}/admin/js/plugins/morris/morris.min.js"></script>
        <script src="${root}/admin/js/plugins/morris/morris-data.js"></script>
    </body>
</html>
