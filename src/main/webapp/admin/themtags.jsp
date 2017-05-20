
<%@page import="model.Admin"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dao.TagsDAO"%>
<%@page import="model.CTTags"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="../admin/js/bootstrap-tagsinput.css" rel="stylesheet" type="text/css"/>
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">
        <link href="../admin/css/sb-admin.css" rel="stylesheet">
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm tags sàn phẩm</title>
    </head>
    <body><%
        Admin users = (Admin) session.getAttribute("admin");
        if (users == null) {
            response.sendRedirect("dangnhap.jsp");

        }
        %>
        <script src="../admin/js/jquery-2.1.1.min.js" type="text/javascript"></script>
        <script src="../admin/js/bootstrap-tagsinput-angular.js" type="text/javascript"></script>
        <script src="../admin/js/bootstrap-tagsinput.js" type="text/javascript"></script>
        <div id="wrapper">
            <%String url = request.getRequestURI() + "?" + request.getQueryString();
                String idsp = request.getParameter("ID_Product");
            %>

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Quản lý Tags
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Thêm tags
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="panel panel-success" >
                                <div class="panel-heading">
                                    <h3 class="panel-title">Thông tin sản phẩm</h3>
                                </div> 
                            <%
                                long idsps = Long.valueOf(request.getParameter("ID_Product"));
                                ProductDAO productDAO = new ProductDAO();
                                Product c = productDAO.getProduct(idsps);
                                NumberFormat formatter = new DecimalFormat("###,###");
                            %>
                            <div class="panel-body">
                                <div class="form-group">
                                    <label>Tên sản phẩm</label>
                                    <input type="text" class="form-control" value="<%=c.getProductName()%>" readonly="">
                                </div>
                                <div class="form-group input-group">
                                    <span class="input-group-addon">$</span>
                                    <input class="form-control" value="<%=formatter.format(c.getProductPrite())%>" readonly="">
                                    <span class="input-group-addon">VNĐ</span>
                                </div>
                                <div class="text-right">
                                    <a href="../admin/suaproduct.jsp?command=update&ID_Product=<%=c.getProductID()%>">Sửa thông tin sản phẩm <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <form action="../TagsServlet" method="post" role="form">
                            <input type="text" value="<%=url%>" name="url12" hidden="">
                            <input type="text" value="<%=idsp%>" name="idsp" hidden="">
                            <div class="panel panel-success" >
                                <div class="panel-heading">
                                    <h3 class="panel-title"> Thêm keywords</h3>
                                </div>
                                <div class="panel-body">
                                    <div style="margin-bottom: 20px">
                                        <input type="text" value="" data-role="tagsinput" class="form-control" name="tenTag" required="" >
                                    </div>
                                    <input type="hidden" name="command" value="insert">
                                    <input type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                                    <a href="../admin/seoproduct.jsp?pages=1"  class="btn btn-default">Hủy bỏ</a>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-lg-4">
                        <div class="panel panel-success" >
                            <div class="panel-heading">
                                <h3 class="panel-title">Danh sách keyword</h3>
                            </div> <%
                                long id = Long.valueOf(request.getParameter("ID_Product"));
                                TagsDAO tagsDAO = new TagsDAO();
                                ArrayList<CTTags> listTags = tagsDAO.getListTags(id);
                            %>
                            <div class="panel-body">
                                <%    for (CTTags tags : listTags) {
                                %>
                                <span class="badge"><%=tags.getKeyword()%> <a href="../TagsServlet?command=delete&ID_Tags=<%=tags.getId_tags()%>&ID_Product=<%=id%>&Url12=<%=url%>"  style="color: #FFF">x</a></span>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
