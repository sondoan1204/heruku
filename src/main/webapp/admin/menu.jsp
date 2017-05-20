<%-- 
    Document   : menu
    Created on : Dec 2, 2016, 3:51:01 PM
    Author     : SONPC
--%>

<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
    </head>
    <body>
        
        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="navbar-header">                
                <a class="navbar-brand" href="../admin"> Admin</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">                
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="images_login/background.jpg" style="width: 30px; height: 100%">  <b class="caret"></b></a>
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
                            <a href="dangxuat.jsp"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Menu Items -->
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
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>   
        <!-- /.container-fluid -->
        <!-- jQuery Version 1.11.0 -->
        <script src="../admin/js/jquery-1.11.0.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="../admin/js/bootstrap.min.js"></script>
    </body>
</html>
