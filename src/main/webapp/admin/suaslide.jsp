<%-- 
    Document   : suaslide
    Created on : Dec 8, 2016, 2:00:56 PM
    Author     : SONPC
--%>

<%@page import="model.Slide"%>
<%@page import="dao.SlideDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <c:set var="root" value="${pageContext.request.contextPath}"/>

        <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>

        <!-- Bootstrap Core CSS -->
        <link href="${root}/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${root}/admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="${root}/admin/ss/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${root}/admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa thông tin slide</title>

    </head>
    <body>
        <%
 long id = Long.valueOf(request.getParameter("ID_Slide"));
            SlideDAO slideDAO = new SlideDAO();
            Slide c = slideDAO.getThongtin(id);

        %>
        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Thông tin Slide
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Sửa thông tin slide
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">

                            <form action="${root}/ManagerSlideServlet" method="post" enctype="multipart/form-data">

                                <div class="panel panel-success" >
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Thông tin slide </h3>
                                    </div>
                                    <div class="row"> 
                                        <div class="col-lg-6">
                                            <div class="panel-body">
                                             
                                                
                                                <input type="hidden" class="form-control" name="idslide" value="<%=c.getSlideID()%>" >
                                            
                                                <div class="form-group">
                                                    <label>Hình ảnh</label>
                                                    <input type="file" class="form-control" name="img12">
                                                    <input type="hidden" class="form-control" name="tenImg" value="<%=c.getImage()%>" >
                                                    <img src="${root}/upload/<%=c.getImage()%>" style="width: 506px;height: 200px">
                                            </div>

                                            <label>DisplayOrder</label>
                                            <input type="number" class="form-control" name="tenDisplay" value="<%=c.getDisplayorder()%>">
                                            <div class="form-group">
                                                <label>Link</label>
                                                <input type="text" class="form-control" name="tenLink" value="<%=c.getLink()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Trạng thái sản phẩm</label>
                                                </br>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthai" value="true" <%if (c.getSt() == true) {%>checked<%}%>> trạng thái
                                                </label>    
                                            </div>


                                        </div>
                                    </div>
                                <div class="panel-body">
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea class="form-control" name="tenDescription" id="noiDung"><%=c.getDescription()%></textarea>
                                            <script type="text/javascript" language="javascript">
                                                CKEDITOR.replace('noiDung', {width: '500px', height: '200px'});
                                            </script>
                                        </div>

                                    </div>
                                </div>
                                </div>
                                

                            </div>

                            <input type="hidden" name="command" value="update">
                            <input type="hidden" name="ID_Slide" value="<%=c.getSlideID()%>">
                            <input type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                            <a href="${root}/admin/quanlyslider.jsp"  class="btn btn-default">Hủy bỏ</a>
                        </form>
                    </div>

                </div>

                
            </div> 
        </div>

    </body>
</html>
