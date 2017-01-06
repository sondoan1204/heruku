<%-- 
    Document   : quanlycustomer
    Created on : Dec 3, 2016, 5:05:33 PM
    Author     : SONPC
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Customer"%>
<%@page import="java.util.ArrayList"%>
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
    <link href="${root}/admin/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${root}/admin/css/sb-admin.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="${root}/admin/css/plugins/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${root}/admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Quản Lý tài khoản khách hàng</title>
</head>
<body>
    <%
        CustomerDAO customerDAO = new CustomerDAO();
        ArrayList<Customer> listCustomer = customerDAO.getListCustomer();
    %>
    <div id="wrapper">

        <jsp:include page="menu.jsp"></jsp:include>
            <div class="col-lg-12">
                <h1 class="page-header">
                    Quản lý tài khoản khách hàng
                </h1>
                <ol class="breadcrumb">
                    <li>
                        <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                    </li>
                    <li class="active">
                        <i class="fa fa-table"></i> Danh sách khách hàng
                    </li>
                </ol>
            </div>
            <div id="page-wrapper">

                <a href="${root}/admin/themcustomer.jsp">Thêm Khách hàng</a>
            <div class="row">

                <div class="col-lg-12">
                    <table class="table table-bordered table-hover">

                        <tr >
                            <th >STT</th>
                            <th >Mã Khách</th>
                            <th >Tên Khách</th>
                            <th >User</th>
                            <th >password</th>
                            <th >Phone</th>
                            <th >Addres</th>
                            <th >Email</th>
                            <th >Trạng thái</th>
                            <th>Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for (Customer customer : listCustomer) {
                                count++;
                        %>

                        <tr >

                            <td >                    <center>
                            <%=count%></center></td>
                        <td ><center><%=customer.getCustomerID()%></center></td>
                        <td><center><%=customer.getCustomerName()%></center></td>
                        <td><center><%=customer.getCustomerUser()%></center></td>
                        <td><center><%=customer.getCustomerPass()%></center></td>
                        <td><center><%=customer.getCustomerPhone()%></center></td>
                        <td><center><%=customer.getCustomerAdd()%></center></td>
                        <td><center><%=customer.getCustomerEmail()%></center></td>
                        <td><center><%
                            if (customer.getCustomerSt() == true) {
                            %>
                            <fieldset id="<%=count%>">
                            <label class="radio-inline">
                                <input type="radio" name="<%=count%>"  checked>Hiện
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="<%=count%>"   >Ẩn
                            </label>
                            </fieldset>
                            <%} else {%>
                            <fieldset id="<%=count%>">
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
                            <a href="${root}/admin/suacustomer.jsp?command=update&ID_Customer=<%=customer.getCustomerID()%>">Sửa</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="${root}/ManagerCustomerServlet?command=delete&ID_Customer=<%=customer.getCustomerID()%>">Xóa</a>
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
