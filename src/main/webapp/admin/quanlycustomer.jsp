<%-- 
    Document   : quanlycustomer
    Created on : Dec 3, 2016, 5:05:33 PM
    Author     : SONPC
--%>
<%@page import="model.Admin"%>
<%@page import="model.customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.CustomerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">



        <!-- Bootstrap Core CSS -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../admin/css/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý tài khoản khách hàng</title>
    </head>
    <body>
        <%
            CustomerDAO customerDAO = new CustomerDAO();
            ArrayList<customer> listCustomer = customerDAO.getListCustomer();
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

                    <a href="../admin/themcustomer.jsp">Thêm Khách hàng</a>
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
                                for (customer customer : listCustomer) {
                                    count++;
                            %>

                            <tr >

                                <td >                    <center>
                                <%=count%></center></td>
                            <td ><center><%=customer.getIDcus()%></center></td>
                            <td><center><%=customer.getTen()%></center></td>
                            <td><center><%=customer.getUser()%></center></td>
                            <td><center><%=customer.getPass()%></center></td>
                            <td><center><%=customer.getDT()%></center></td>
                            <td><center><%=customer.getDiachi()%></center></td>
                            <td><center><%=customer.getEmail()%></center></td>
                            <td><center><%
                                if (customer.getStatus() == true) {
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
                                <a href="../admin/suacustomer.jsp?command=update&ID_Customer=<%=customer.getIDcus()%>">Sửa</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="../ManagerCustomerServlet?command=delete&ID_Customer=<%=customer.getIDcus()%>">Xóa</a>
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
