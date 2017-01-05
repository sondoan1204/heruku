<%-- 
    Document   : danhsachDH
    Created on : Dec 9, 2016, 3:17:54 PM
    Author     : SONPC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.DonHang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DonHangDAO"%>
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
    <title>Danh sách đơn hàng</title>
</head>
    <body>
    <%
        String url = request.getRequestURI() + "?" + request.getQueryString();
        DonHangDAO donhangDAO = new DonHangDAO();
        ArrayList<DonHang> listDonHang = donhangDAO.getListDonHangRac();
    %>
    <div id="wrapper">

        <jsp:include page="menu.jsp"></jsp:include>
            <div class="col-lg-12">
                <h1 class="page-header">
                    Quản lý đơn hàng
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-table"></i> Danh sách đơn hàng
                    </li>
                </ol>
            </div>
            <div id="page-wrapper">

                
            <div class="row">

                <div class="col-lg-12">
                    <table class="table table-bordered table-hover">

                        <tr >
                            <th >STT</th>
                            <th >Mã đơn hàng</th>
                            <th >Thông tin khách hàng</th>
                            <th colspan="2" ><center>Thông tin đơn hàng</center></th>
                            <th >Thông tin người nhận</th>
                            
                            <th >Ngày đặt hàng</th>
                            
                            
                            <th >Trạng thái</th>
                            <th>Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for (DonHang dh : listDonHang) {
                                count++;
                        %>

                        <tr >

                            <td ><center><%=count%></center></td>
                    <td><center><%=dh.getIdDonhang()%></center></td>
                    <td ><center><%=dh.getTenKhach()%><br><%=dh.getEmailKhach()%></center></td>
                    <td><center>Loại thanh toán:<%=dh.getTenThanhtoan()%><br>Tình trạng: <%=dh.getTinhtrangHD()%></center></td>
                    <td><center>Số lượng: <%=dh.getSoluong()%><br> Tổng cộng: <%=dh.getTong()%></center></td>
                    <td><center><%=dh.getShipname()%><br><%=dh.getShipAdd()%><br><%=dh.getShipPhone()%></center></td>
                        
                       
                        <td><center><%=dh.getNgaydat()%></center></td>
                        <td><center><% if(dh.getSt()==true){%>Hiện<%}%></center></td>
                        <td >
                        <center>
                             <%if (dh.getSt() == true) {%>
                            <a href="${root}/admin/chitiethoadon.jsp?ID_Order=<%=dh.getIdDonhang()%>">Chi tiết</a>
                            <a href="${root}/DonHangServlet?command=deletean&ID_Order=<%=dh.getIdDonhang()%>&URL1204=<%=url%>">Xóa</a>
                            <%}else{%>
                            <a href="${root}/DonHangServlet?command=khoiphuchang&ID_Order=<%=dh.getIdDonhang()%>&URL1204=<%=url%>">Khôi phục</a>
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
