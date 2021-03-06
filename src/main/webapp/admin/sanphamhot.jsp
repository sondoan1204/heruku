<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page import="model.Admin"%>
<%@page import="model.category"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">


        <!--<c:set var="root" value="${pageContext.request.contextPath}"/>-->

        <!-- Bootstrap Core CSS -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../admin/css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý sản phẩm</title>
    </head>
    <body>
        <%
            String url = request.getRequestURI() + "?" + request.getQueryString();
            ProductDAO productDAO = new ProductDAO();
            int pages = 0, firstResult = 0, maxResult = 0, total = 0;
            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            total = productDAO.countSanPhamHot();
            if (total <= 10) {
                firstResult = 1;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 10;
                maxResult = 10;
            }
            ArrayList<Product> listProduct = productDAO.getListProductHot(firstResult, maxResult);
        %>
        <%
            Admin users = (Admin) session.getAttribute("admin");
            if (users == null) {
                response.sendRedirect("dangnhap.jsp");

            }
        %>
        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Quản lý sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Danh sách sản phẩm Hot
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">

                    <a href="../admin/themproduct.jsp">Thêm sản phẩm mới</a>
                    <div class="row">

                        <div class="col-lg-12">

                            <table class="table table-bordered table-hover">

                                <tr >
                                    <th >STT</th>
                                    <th >Mã SP</th>
                                    <th >Mã loại</th>
                                    <th >Tên sản phẩm</th>
                                    <th >Giá</th>
                                    <th >Giá khuyến mãi</th>
                                    <th >Mô tả ngắn</th>
                                    <th >Hình</th>
                                    <th >Trạng thái</th>
                                    <th>Tùy chọn</th>
                                </tr>

                            <%                            int count = 0;

                                for (Product product : listProduct) {
                                    count++;
                                    CategoryDAO categoryDAO = new CategoryDAO();
                                    category c = categoryDAO.getCategory(product.getCategoryID());
                            %>

                            <tr <%if (product.getProductSt() == false) {%>class="danger"<%}%>>

                                <td>                    
                            <center>
                                <%=count%>
                            </center>
                            </td>
                            <td ><center><%=product.getProductID()%></center></td>
                            <td><center><%=c.getCategoryName()%></center></td>
                            <td><center><%=product.getProductName()%></center></td>
                            <td><center><%=product.getProductPrite()%></center></td>
                            <td><center><%=product.getProductPromotionPrice()%></center></td>
                            <td><center><%=product.getProductShortDescription()%></center></td>
                            <td><center><%=product.getProductImagesFeature()%></center></td>
                            <td>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="trangthaiHot" value="true" disabled="" <%if (product.getProductStHot() == true) {%>checked<%}%>>Hot
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox" name="trangthaiSanPham" value="true" disabled="" <%if (product.getProductSt() == true) {%>checked<%}%>>Trạng thái mở
                                </label>
                            </td>
                            <td >
                            <center>
                                <%if (product.getProductSt() == true) {%>
                                <a href="../admin/suaproduct.jsp?command=update&ID_Product=<%=product.getProductID()%>">Sửa</a>&nbsp;|
                                <a href="../ManagerProductServlet?command=delete&ID_Product=<%=product.getProductID()%>&URL1204=<%=url%>">Xóa</a>
                                <%} else {%>
                                <input type="hidden" value="<%=url%>" name="url1204">
                                <a href="../ManagerProductServlet?command=khoiphuc&ID_Product=<%=product.getProductID()%>&URL1204=<%=url%>">Khôi phục</a>
                                <%}%>
                            </center>
                            </td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                </div>
            </div>
            <div id="page-wrapper">
                <div class="container-fluid">
                    <a <%if (pages - 1 < 1) {%> href="#"<%} else%>href="sanphamhot.jsp?pages=<%=pages-1%>" class="btn btn-default" ><<</a>
                    <%for (int i = 1; i <= (total / 10) + 1; i++) {%>
                    <a href="sanphamhot.jsp?pages=<%=i%>" class="btn btn-default"><%=i%></a>
                    <%}%>
                    <a <%if (pages + 1 > (total / 10)) {%> href="#"<%} else%>href="sanphamhot.jsp?pages=<%=pages+1%>" class="btn btn-default">>></a>
                </div>
            </div>
        </div>
    </body>
</html>
