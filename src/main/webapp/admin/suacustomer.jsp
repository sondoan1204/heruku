<%-- 
    Document   : suacustomer
    Created on : Dec 3, 2016, 6:22:29 PM
    Author     : SONPC
--%>

<%@page import="model.Customer"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
      <c:set var="root" value="${pageContext.request.contextPath}"/>


        <!-- Bootstrap Core CSS -->
        <link href="${root}/ShopSW/admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="${root}/ShopSW/admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="${root}/ShopSW/admin/ss/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="${root}/ShopSW/admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm khách hàng</title>
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
        %>

    </head>
    <body>
<%
        long id = Long.valueOf(request.getParameter("ID_Customer"));
        CustomerDAO customerDAO = new CustomerDAO();
        Customer c = customerDAO.getCustomer(id);

    %>
        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
             <div class="col-lg-12">
                        <h1 class="page-header">
                           Quản lý Khách hàng
                        </h1>
                        <ol class="breadcrumb">
                            <li>
                                <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                            </li>
                            <li class="active">
                                <i class="fa fa-table"></i> Thêm tên khách hàng
                            </li>
                        </ol>
                    </div>
            <div id="page-wrapper">
                <div class="row">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                    <form action="/ShopSW/ManagerCustomerServlet" method="post" role="form">
                    
                        <div class="panel panel-success" >
                            <div class="panel-heading">
                                <h3 class="panel-title"> Tên Khách hàng </label></h3>
                            </div>
                            <div class="panel-body">
                                <input type="text" class="form-control" name="tenKhach" placeholder="Nhập tên danh mục" required value="<%=c.getCustomerName()%>"><%=error%>
                           <br> <input type="text" class="form-control" name="userKhach" placeholder="Nhập tên tài khoản" required value="<%=c.getCustomerUser()%>">
                            <br> <input type="password" class="form-control" name="passKhach" placeholder="Nhập password" required value="<%=c.getCustomerPass()%>">
                             <br> <input type="number" class="form-control" name="phoneKhach" placeholder="Nhập tên điện thoại" required value="<%=c.getCustomerPhone()%>">
                              <br> <input type="text" class="form-control" name="addKhach" placeholder="Nhập địa chỉ" required value="<%=c.getCustomerAdd()%>">
                               <br> <input type="email" class="form-control" name="emailKhach" placeholder="Nhập tên email" required value="<%=c.getCustomerEmail()%>">
                            <br>
                            <label>Trạng thái</label>    
                                <label class="checkbox-inline">
                                  
                                   <%
                                        if (c.getCustomerSt()== true) {
                                    %>
                                    <label class="radio-inline">
                                        <input type="radio" name="trangthaiKhach" id="optionsRadiosInline1" value="true" checked>Hiện
                                    </label>
                                    <label class="radio-inline">
                                    <input type="radio" name="trangthaiKhach" id="optionsRadiosInline1" value="false" >Ẩn
                                    </label>
                                     <%} else {%>
                                    <label class="radio-inline">
                                    <input type="radio" name="trangthaiKhach" id="optionsRadiosInline1" value="true" >Hiện
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="trangthaiKhach" id="optionsRadiosInline1" value="false" checked >Ẩn
                                    </label>
                                    <%}%>
                                </label>
                                <br>
                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="ID_Customer" value="<%=request.getParameter("ID_Customer")%>">
                                <input type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                           <a href="${root}/ShopSW/admin/quanlycustomer.jsp"  class="btn btn-default">Hủy bỏ</a>
                        </div>
                        
                    </form></div>
                        <div class="col-lg-4"></div>
            </div> </div>
        </div>


    </body>
</html>
