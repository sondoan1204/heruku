<%@page import="java.text.NumberFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.OrderSttDAO"%>
<%@page import="model.OrderStt"%>
<%@page import="model.DonHang"%>
<%@page import="model.CTHD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DonHangDAO"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
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
        <title>Chi tiết đơn hàng</title>
    </head>
    <body>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Quản Đơn hàng
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Chi tiết hoá đơn
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-9">
                        <%
                            String url = request.getRequestURI() + "?" + request.getQueryString();
                            long id = Long.valueOf(request.getParameter("ID_Order"));
                            DonHangDAO donhangDAO = new DonHangDAO();
                            ArrayList<DonHang> listDonHang = donhangDAO.getListDonHang();
                            NumberFormat formatter = new DecimalFormat("###,###");
                            int tong = 0;
                        %>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Thông tin hoá đơn</h3>
                            </div>
                            <div class="panel-body">
                                <%
                                    for (DonHang dh1 : listDonHang) {
                                        if (dh1.getIdDonhang() == id) {

                                %>
                                <div class="row">
                                    <div class="col-lg-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Khách hàng</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="list-group">
                                                    <a href="#" class="list-group-item">
                                                        <i class="fa fa-fw fa-user"></i> <%=dh1.getTenKhach()%>
                                                    </a>
                                                </div>
                                                <div class="list-group">
                                                    <a href="#" class="list-group-item"> 
                                                        <i class="fa fa-fw fa-google-plus"></i><%=dh1.getEmailKhach()%>
                                                    </a>
                                                </div>
                                                <div class="list-group">
                                                    <a href="#" class="list-group-item">
                                                        <i class="fa fa-fw fa-calendar"></i> <%=dh1.getNgaydat()%>
                                                    </a>
                                                </div>
                                                <div class="text-right">
                                                    <a href="#">Sửa thông tin khách hàng<i class="fa fa-arrow-circle-right"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Người nhận</h3>
                                            </div>
                                            <div class="panel-body">
                                                <div class="list-group">
                                                    <a href="#" class="list-group-item">
                                                        <i class="fa fa-fw fa-user"></i> <%=dh1.getShipname()%>
                                                    </a>
                                                </div>
                                                <div class="list-group">
                                                    <a href="#" class="list-group-item">
                                                        <i class="fa fa-fw fa-truck"></i><%=dh1.getShipAdd()%>
                                                    </a>
                                                </div>
                                                <div class="list-group">
                                                    <a href="#" class="list-group-item">
                                                        <i class="fa fa-fw fa-phone"></i><%=dh1.getShipPhone()%>
                                                    </a>
                                                </div>
                                                <div class="text-right">
                                                    <a href="#">Sửa thông tin người nhận<i class="fa fa-arrow-circle-right"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h3 class="panel-title"><i class="fa fa-clock-o fa-fw"></i> Xử lý</h3>
                                            </div>
                                            <div class="panel-body">
                                                <%
                                                    OrderSttDAO orderSttDAO = new OrderSttDAO();
                                                    ArrayList<OrderStt> liststt = orderSttDAO.getListSTT();
                                                %>
                                                <%
                                                    for (OrderStt loai : liststt) {
                                                        if (dh1.getIdDonhang() == id) {

                                                %>
                                                <div class="list-group">
                                                    <button class="btn btn-lg btn-default" onclick="window.location.href = '../OrderServlet?command=setloai&ID_Orders=<%=id%>&Loai=<%=loai.getValue()%>&URL1204=<%=url%>'" <%if (loai.getValue() == dh1.getIdSuly()) {%>disabled<%}%>> <%=loai.getName()%> </button>      
                                                </div>
                                                <%}
                                                    }%>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <% if (dh1.getMagiaodich() != null) {%>
                                <div class="row">
                                    <div class="text-right">
                                        <div class="alert alert-info">
                                            <strong>Mã giao dich paypal: </strong> <span style="font-size: 32px">#<%=dh1.getMagiaodich()%></span>
                                        </div>
                                    </div>
                                </div>
                                <%}}}%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <%
                        ArrayList<CTHD> listCTHD = donhangDAO.getListCTHD(id);
                    %>
                    <div class="col-lg-9">
                        <table class="table table-bordered table-hover">
                            <tr >
                                <th >STT</th>
                                <th >Mã SP</th>
                                <th >Tên</th>
                                <th>Số lượng</th>
                                <th>Giá tiền</th>
                            </tr>
                            <%                                int count = 0;

                                for (CTHD dh : listCTHD) {
                                    count++;
                                    tong += dh.getTongcong();
                            %>

                            <tr >
                                <td ><center><%=count%></center></td>
                            <td ><center><%=dh.getIdSanpham()%></center></td>
                            <td><center><%=dh.getTensanpham()%></center></td>
                            <td><center><%=dh.getSoluong()%></center></td>
                            <td><center><%=formatter.format(dh.getTongcong())%></center></td>
                            <!--                            <td >
                                                        <center>
                                                            <a href="../admin/suacategory.jsp?command=update&ID_Category=<%=dh.getIdSanpham()%>">Sửa</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <a href="../ManagerCategoryServlet?command=delete&ID_Category=<%=dh.getIdSanpham()%>">Xóa</a>
                                                        </center>
                                                        </td>-->
                            </tr>
                            <%}%>
                            <div class="col-xs-12 text-right">
                                <div>Trị giá</div>  
                                <div class="huge"><%=formatter.format(tong)%> VND</div>  
                            </div> 
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
