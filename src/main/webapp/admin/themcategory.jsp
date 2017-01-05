<%-- 
    Document   : themcategory
    Created on : Dec 2, 2016, 10:04:08 PM
    Author     : SONPC
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <c:set var="root" value="${pageContext.request.contextPath}"/>


        <!-- Bootstrap Core CSS -->
        <link href="${root}/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${root}/admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="${root}/admin/ss/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${root}/admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản trị</title>
        <%
            String error = "";
            if (request.getParameter("error") != null) {
                error = (String) request.getParameter("error");
            }
        %>

    </head>
    <body>

        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Quản lý danh mục
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Thêm tên danh mục
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-4"></div>
                        <div class="col-lg-4">
                            <form action="/ShopSW/ManagerCategoryServlet" method="post" role="form">

                                <div class="panel panel-success" >
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Tên danh mục</h3>
                                    </div>
                                    <div class="panel-body">
                                        <input type="text" class="form-control" name="tenDanhMuc" placeholder="Nhập tên danh mục"><%=error%>
                                    <br>
                                    <input type="hidden" name="command" value="insert">
                                    <input type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                                    <a href="${root}/ShopSW/admin/quanlycategory.jsp"  class="btn btn-default">Hủy bỏ</a>
                                </div>

                        </form></div>
                    <div class="col-lg-4"></div>
                </div> 
            </div>
        </div>


    </body>
</html>
