<%-- 
    Document   : quanlycategory
    Created on : Dec 2, 2016, 9:58:09 PM
    Author     : SONPC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CategoryDAO"%>
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
        <link href="${root}/admin/css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${root}/admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý danh mục</title>
    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listCategory = categoryDAO.getListCategory();
        %>
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
                            <i class="fa fa-table"></i> Danh sách danh mục
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">

                    <a href="${root}/admin/themcategory.jsp">Thêm danh mục</a>
                <div class="row">

                    <div class="col-lg-9">
                        <table class="table table-bordered table-hover">

                            <tr >
                                <th >STT</th>
                                <th >Mã danh mục</th>
                                <th >Tên danh mục</th>
                                <th >tình trạng</th>
                                <th>Tùy chọn</th>
                            </tr>

                            <%
                                int count = 0;
                                for (Category category : listCategory) {
                                    count++;

                            %>

                            <tr <%if (category.getCategorySt() == false) {%>class="danger"<%}%>>

                                <td >                    <center>
                                <%=count%></center></td>
                            <td ><center><%=category.getCategoryID()%></center></td>
                            <td><center><%=category.getCategoryName()%></center></td>
                            <td><center><%if (category.getCategorySt() == false) {%>Đã xoá<%}else{%>Đang sử dụng<%}%></center></td>
                            <td >
                            <center>
                                <%if (category.getCategorySt() == true) {%>
                                <a href="${root}/admin/suacategory.jsp?command=update&ID_Category=<%=category.getCategoryID()%>">Sửa</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="${root}/ManagerCategoryServlet?command=delete&ID_Category=<%=category.getCategoryID()%>">Xóa</a>
                                <%} else {%>
                                <a href="${root}/ManagerCategoryServlet?command=khoiphuc&ID_Category=<%=category.getCategoryID()%>">Khôi phục</a>
                                <%}%>
                            </center>
                            </td>
                            </tr>
                            <%}%>

                        </table>
                    </div>
                </div>
            </div>
        </div>


    </body>
</html>
