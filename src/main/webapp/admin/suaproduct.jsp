<%-- 
    Document   : suaproduct
    Created on : Dec 6, 2016, 1:26:59 PM
    Author     : SONPC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Category"%>
<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
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
        <title>Sửa sản phẩm</title>


    </head>
    <body>
        <%
            CategoryDAO categoryDAO = new CategoryDAO();
            ArrayList<Category> listLoai = categoryDAO.getListLoai();
        %>
        <%
            long id = Long.valueOf(request.getParameter("ID_Product"));
            ProductDAO productDAO = new ProductDAO();
            Product c = productDAO.getProduct(id);

        %>
        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Sửa sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Sửa thông tin sản phẩm
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="/ShopSW/ManagerProductServlet" method="post" enctype="multipart/form-data">
                                <div class="panel panel-success" >
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Thông tin sản phẩm</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="col-lg-5">
                                            
                                                <input type="hidden" class="form-control" name="ID_Product" value="<%=c.getProductID()%>" >
                                        
                                        <div class="form-group">
                                            <label>Tên sản phẩm</label>
                                            <input type="text" class="form-control" name="tenSanpham" value="<%=c.getProductName()%>" required>
                                        </div>



                                        <div class="form-group">
                                            <label>Chọn Loại</label>
                                            <select class="form-control" name="maLoai">
                                                <%
                                                    for (Category category : listLoai) {
                                                %>
                                                <option value="<%=category.getCategoryID()%>"<% if (c.getCategoryID() == category.getCategoryID()) {%>selected <%}%>><%=category.getCategoryName()%></option>
                                                <%}%>

                                            </select>
                                        </div>

                                        <div class="form-group input-group">
                                            <span class="input-group-addon">$</span>
                                            <input type="number" class="form-control" name="gia" value="<%=c.getProductPrite()%>" required>
                                            <span class="input-group-addon">VNĐ</span>
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon">$</span>
                                            <input type="number" class="form-control" name="giaKM" value="<%=c.getProductPromotionPrice()%>" >
                                            <span class="input-group-addon">VNĐ</span>
                                        </div>
                                        <div class="form-group">
                                            <label>Mô tả ngắn</label>
                                            <input class="form-control" name="motaNgan" value="<%=c.getProductShortDescription()%>">
                                        </div>
                                        <div class="form-group">
                                            <label>Hình đại diện</label>
                                            <input type="file" class="form-control" name="uploadFile"  >
                                            <label>Sub1</label>
                                            <input type="file" class="form-control" name="hinh2" >
                                            <input class="form-control col-md-3"  type="hidden" name="anh1" value="<%=c.getProductSubImages1()%>">
                                            <input class="form-control col-lg-3" type="hidden" name="anhbia" value="<%=c.getProductImagesFeature()%>">
                                             <label>Sub2</label>
                                            <input type="file" class="form-control" name="hinh3" >
                                            <input class="form-control col-lg-3" type="hidden" name="anh2" value="<%=c.getProductSubImages2()%>" readonly>
                                            <div class="form-group">
                                                <br>
                                            <img src="${root}/upload/<%=c.getProductImagesFeature()%>" style="width: 135px;height: 135px">
                                            <img src="${root}/upload/<%=c.getProductSubImages1()%>" style="width: 135px;height: 135px">
                                             <img src="${root}/upload/<%=c.getProductSubImages2()%>" style="width: 135px;height: 135px">
                                            </div>
                                        </div>
                                      





                                    </div>
                                    <div class="col-lg-7">
                                        <div class="form-group">
                                            <label>Mô tả</label>
                                            <textarea class="form-control" name="mota" id="noiDung" ><%=c.getProductDescription()%></textarea>
                                            <script type="text/javascript" language="javascript">
                                                CKEDITOR.replace('noiDung', {width: '600px', height: '280px'});
                                            </script>
                                        </div>



                                        <div class="form-group">
                                            <label>Phân loại</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiNew" value="true" <%if (c.getProductStNew() == true) {%>checked<%}%>>Mới
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiKM" value="true" <%if (c.getProductStPromotion() == true) {%>checked<%}%>>Khuyến mãi
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiHot" value="true" <%if (c.getProductStHot() == true) {%>checked<%}%>>Hot
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiTop" value="true" <%if (c.getProductStTop() == true) {%>checked<%}%>>Top
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiTopWeek" value="true" <%if (c.getProductStTopWeek() == true) {%>checked<%}%>>Top Week
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>Trạng thái sản phẩm</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiSanPham" value="true" <%if (c.getProductSt() == true) {%>checked<%}%>>Xuất hiện trong menu
                                            </label>
                                        </div>
                                        <input type="hidden" name="command" value="update">
                                        <input type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                                        <a href="${root}/admin/quanlyproduct.jsp?pages=1"  class="btn btn-default">Hủy bỏ</a>
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
