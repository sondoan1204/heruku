
<%@page import="model.Admin"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.CategoryDAO"%>
<%@page import="model.category"%>
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


        <link href="../admin/css/bootstrap.css" rel="stylesheet" type="text/css"/>
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
    <body><%
            Admin users = (Admin) session.getAttribute("admin");
            if (users == null) {
                response.sendRedirect("dangnhap.jsp");

            }
        %>
        <%
            String url = request.getRequestURI() + "?" + request.getQueryString();
            ProductDAO productDAO = new ProductDAO();
            int pages = 0, firstResult = 0, maxResult = 0, total = 0;
            if (request.getParameter("pages") != null) {
                pages = (int) Integer.parseInt(request.getParameter("pages"));
            }
            total = productDAO.countSanPhamHien();
            if (total <= 20) {
                firstResult = 1;
                maxResult = total;
            } else {
                firstResult = (pages - 1) * 20;
                maxResult = 20;
            }
            ArrayList<Product> listProduct = productDAO.getListProductHien(firstResult, maxResult);
        %>
        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Quản lý sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Danh sách sản phẩm
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
<!--                                <th >Mã SP</th>-->
                                <th >Mã loại</th>
                                <th >Tên sản phẩm</th>
                                <th >Giá</th>
<!--                                <th >Giá khuyến mãi</th>
                                <th >Mô tả ngắn</th>
                                <th >Hình</th>-->
                                <th >Trạng thái</th>
                                <th>Tùy chọn</th>
                            </tr>

                            <%                            int count = 0;
                                NumberFormat formatter = new DecimalFormat("###,###");
                                for (Product product : listProduct) {
                                    count++;
                                    CategoryDAO categoryDAO = new CategoryDAO();
                                    category c = categoryDAO.getCategory(product.getCategoryID());
                            %>

                            <tr <%if (product.getProductSt() == false) {%>class="danger"<%}%>>

                                <td >                    <center>
                                <%=count%></center></td>
<!--                            <td ><center><%=product.getProductID()%></center></td>-->
                            <td><center><%=c.getCategoryName()%></center></td>
                            <td><center><%=product.getProductName()%></center></td>
                            <td><center><%= formatter.format(product.getProductPrite())%></center></td>
<!--                            <td><center><%=product.getProductPromotionPrice()%></center></td>
                            <td><center><%=product.getProductShortDescription()%></center></td>
                            <td><center><%=product.getProductImagesFeature()%></center></td>-->
                            <td><center><%
                                if (product.getProductSt() == true) {
                                %>
                                <fieldset id="<%=count%>" disabled="">
                                    <label class="radio-inline">
                                        <input type="radio" name="<%=count%>"  checked>Hiện
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="<%=count%>"   >Ẩn
                                    </label>
                                </fieldset>
                                <%} else {%>
                                <fieldset id="<%=count%>" disabled="">
                                    <label class="radio-inline">
                                        <input type="radio" name="<%=count%>"  >Hiện
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="<%=count%>"checked >Ẩn
                                    </label>
                                </fieldset>
                                <%}%></center></td>
                            <td >
                            <center>
                                <%if (product.getProductSt() == true) {%>
                                <a href="../admin/themtags.jsp?ID_Product=<%=product.getProductID()%>">Chỉnh sửa thẻ Tags</a>
                                <%} else {%>
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
                    <a <%if (pages - 1 < 1) {%> href="#"<%} else%> href="seoproduct.jsp?pages=<%=pages-1%>" class="btn btn-default" ><<</a>
                    <%for (int i = 1; i <= (total / 20) + 1; i++) {%>
                    <a href="seoproduct.jsp?pages=<%=i%>" class="btn btn-default"><%=i%></a>
                    <%}%>
                    <a <%if (pages + 1 > (total / 20)) {%> href="#"<%} else%>href="seoproduct.jsp?pages=<%=pages+1%>" class="btn btn-default">>></a>
                </div>

            </div>
        </div>


    </body>
</html>
