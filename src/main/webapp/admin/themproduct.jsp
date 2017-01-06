<%@page import="model.Admin"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.ArrayList"%>
<%@page import="model.category"%>
<%@page import="dao.CategoryDAO"%>
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
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../admin/js/plugins/morris/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Sản phẩm mới</title>

        <script src="../admin/js/jquery-1.11.0.js" type="text/javascript"></script>
        <script type="text/javascript">
            $('#submit').click(function () {
                //kiem tra trinh duyet co ho tro File API
                if (window.File && window.FileReader && window.FileList && window.Blob)
                {
                    // lay dung luong va kieu file tu the input file
                    var ftype1 = $('#file1')[0].files[0].type;
                    //var ftype2 = $('#file2')[0].files[1].type;
                    //var ftype3 = $('#file3')[0].files[2].type;


                    switch (ftype1)
                    {
                        case 'image/png':
                        case 'image/gif':
                        case 'image/jpeg':
                        case 'image/pjpeg':
                            break;
                        default:
                            alert('Vui lòng chọn file ảnh!');
                    }

                } else {
                    alert("Trình duyệt ko hỗ trợ upload file, vui lòng nâng cấp trình duyệt");
                }
            });
        </script>
    </head>
    <body><%
        Admin users = (Admin) session.getAttribute("admin");
        if (users == null) {
            response.sendRedirect("dangnhap.jsp");

        }
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<category> listLoai = categoryDAO.getListLoai();
        %>
        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Thêm sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Thêm sản phẩm mới
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="../ManagerProductServlet" method="post" enctype="multipart/form-data">
                                <div class="panel panel-success" >
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Điền thông tin sản phẩm</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <div class="form-group">
                                                    <label>Tên sản phẩm</label>
                                                    <input type="text" class="form-control" name="tenSanpham" placeholder="Nhập tên Sản phẩm" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Chọn Loại</label>
                                                    <select class="form-control" name="maLoai">
                                                    <%
                                                        for (category category : listLoai) {
                                                    %>
                                                    <option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
                                                    <%}%>

                                                </select>
                                            </div>

                                            <div class="form-group input-group">
                                                <span class="input-group-addon">$</span>
                                                <input type="number" class="form-control" name="gia" placeholder="Giá bán" required>
                                                <span class="input-group-addon">VNĐ</span>
                                            </div>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon">$</span>
                                                <input type="number" class="form-control" name="giaKM" placeholder="Giá khuyến mãi" >
                                                <span class="input-group-addon">VNĐ</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Mô tả ngắn</label>
                                                <input class="form-control" name="motaNgan" placeholder="Mô tả ngắn">
                                            </div>
                                            <div class="form-group">
                                                <label>Hình đại diện</label>
                                                <input  id="file123" type="file" class="form-control" name="uploadFile" accept="image/*" required >
                                            </div>
                                            <div class="form-group">
                                                <label>Sub1</label>
                                                <input type="file" class="form-control" name="hinh2" accept="image/*" id="file2" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Sub2</label>
                                                <input type="file" class="form-control" name="hinh3" accept="image/*" id="file3" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Phân loại</label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiKM" value="true">Khuyến mãi
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiHot" value="true">Hot
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiTop" value="true">Top
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiTopWeek" value="true">Top Week
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-7">
                                            <div class="form-group">
                                                <label>Mô tả</label>
                                                <textarea class="form-control" name="mota" id="noiDung"></textarea>
                                                <script type="text/javascript" language="javascript">
                                                    CKEDITOR.replace('noiDung', {width: '600px', height: '300px'});
                                                </script>
                                            </div>
                                            <button type="reset" class="btn btn-default">Nhập lại</button>
                                            <input id="submit" type="hidden" name="command" value="insert" >
                                            <input id="submit" type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                                            <a href="../admin/quanlyproduct.jsp?pages=1"  class="btn btn-default">Hủy bỏ</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
