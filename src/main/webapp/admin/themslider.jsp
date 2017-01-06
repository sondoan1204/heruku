
<%@page import="model.Admin"%>
<%@page import="model.slide"%>
<%@page import="dao.SlideDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../admin/css/sb-admin.css" rel="stylesheet">
        <!-- Morris Charts CSS -->
        <link href="../admin/ss/plugins/morris.css" rel="stylesheet">
        <!-- Custom Fonts -->
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm slider</title>
    </head>
    <body><%
        Admin users = (Admin) session.getAttribute("admin");
        if (users == null) {
            response.sendRedirect("dangnhap.jsp");
        }
        %>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Thêm slider
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Thêm Slider
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="../ManagerSlideServlet" method="post" enctype="multipart/form-data">
                            <div class="panel panel-success" >
                                <div class="panel-heading">
                                    <h3 class="panel-title"> Thông tin slide </h3>
                                </div>
                                <div class="row"> 
                                    <div class="col-lg-6">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                <label>Hình ảnh</label>
                                                <input type="file" class="form-control" name="img12" required="">
                                            </div>
                                            <label>DisplayOrder</label>
                                            <input type="number" class="form-control" name="tenDisplay" >
                                            <div class="form-group">
                                                <label>Link</label>
                                                <input type="text" class="form-control" name="tenLink" >
                                            </div>
                                            <div class="form-group">
                                                <label>Trạng thái sản phẩm</label>
                                                </br>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthai" value="true" checked> trạng thái
                                                </label>    
                                            </div>
                                        </div>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-6">
                                            <div class="form-group">
                                                <label>Mô tả</label>
                                                <textarea class="form-control" name="tenDescription" id="noiDung"></textarea>
                                                <script type="text/javascript" language="javascript">
                                                    CKEDITOR.replace('noiDung', {width: '500px', height: '200px'});
                                                </script>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="hidden" name="command" value="insert">
                            <input type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                            <a href="../admin/quanlyslider.jsp"  class="btn btn-default">Hủy bỏ</a>
                        </form>
                    </div>
                </div>
            </div>
    </body>
</html>
