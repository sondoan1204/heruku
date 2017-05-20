<%@page import="model.Admin"%>
<%@page import="model.Imformation"%>
<%@page import="dao.ImformationDAO"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <%--<c:set var="root" value="${pageContext.request.contextPath}"/>--%>


        <!-- Bootstrap Core CSS -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../admin/ss/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa thông tin website</title>

    </head>
    <body><%
            Admin users = (Admin) session.getAttribute("admin");
            if (users == null) {
                response.sendRedirect("dangnhap.jsp");

            }
        %>
        <%
            long id = 1;
            ImformationDAO imformationDAO = new ImformationDAO();
            Imformation c = imformationDAO.getThongtin();

        %>
        <div id="wrapper">
            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Thông tin website
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Sửa thông tin website
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-2"></div>
                        <div class="col-lg-8">
                            <form action="/Sandwich/ManagerInfomationServlet" method="post" enctype="multipart/form-data">
                                <div class="panel panel-success" >
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Thông tin website </label></h3>
                                    </div>
                                    <div class="row"> 
                                        <div class="col-lg-6">
                                            <div class="panel-body">
                                                <div class="form-group" style="text-align: center;">
                                                    <label>Logo</label>
                                                     <input type="file" class="form-control" name="logo12">
                                                    <input type="hidden" class="form-control" name="tenLogo" value="<%=c.getLogo()%>">
                                                <img src="../images/<%=c.getLogo()%>" style="width: 65px;height: 65px">
                                            </div>
                                            <div class="form-group" style="text-align: center;">
                                                    <label>Icon</label>
                                                     <input type="file" class="form-control" name="icon12">
                                                     <input type="hidden" class="form-control" name="tenIcon" value="<%=c.getIcon()%>">
                                                     <img src="../upload/<%=c.getIcon()%>" style="width: 65px;height: 65px">
                                            </div>
                                            <div class="form-group">
                                                <label>Hotline</label>
                                                <input type="text" class="form-control" name="tenHotline" value="<%=c.getHotline()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Tên facebook</label>
                                                <input type="text" class="form-control" name="tenFacebook" value="<%=c.getFacebook()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Url facebook</label>
                                                <input type="text" class="form-control" name="tenLinkFacebook" value="<%=c.getLinkfacebook()%>">
                                            </div>
                                             <div class="form-group">
                                                <label>Time: Open-Close</label>
                                                <input type="text" class="form-control" name="tenTimeopen" value="<%=c.getTimeopen()%>">
                                            </div>
                                             <div class="form-group">
                                                <label>Url facebook</label>
                                                <input type="text" class="form-control" name="tenLinkFacebook" value="<%=c.getLinkfacebook()%>">
                                            </div>
                                        </div>
                                    </div>
                                            <div class="panel-body">
                                    <div class="col-lg-6">
                                         <div class="form-group">
                                                <label>Address</label>
                                                <input type="text" class="form-control" name="tenAddress" value="<%=c.getAddress()%>">
                                            </div>
                                             <div class="form-group">
                                                <label>Email</label>
                                                <input type="text" class="form-control" name="tenEmail" value="<%=c.getEmail()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Key Word</label>
                                                <input type="text" class="form-control" name="tenKeyword" value="<%=c.getKeyword()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Google API</label>
                                                <input type="text" class="form-control" name="tenGoogle" value="<%=c.getGoogleapi()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Toạ độ X</label>
                                                <input type="text" class="form-control" name="tenXGoogle" value="<%=c.getXlocation()%>">
                                            </div>
                                            <div class="form-group">
                                                <label>Toạ độ Y</label>
                                                <input type="text" class="form-control" name="tenYGoogle" value="<%=c.getYlocation()%>">
                                            </div>
                                        <div class="form-group">
                                            <label>Trạng thái sản phẩm</label>
                                            </br>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiHot" value="true" <%if (c.getHotshow() == true) {%>checked<%}%>> Hot
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiNew" value="true" <%if (c.getNewshow() == true) {%>checked<%}%>> Mới
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" name="trangthaiTopWeek" value="true" <%if (c.getTopweekshow() == true) {%>checked<%}%>> Top tuần
                                            </label>
                                        </div>
                                    </div>
</div>

                                </div>

                                <input type="hidden" name="command" value="update">
                                <input type="hidden" name="ID_Information" value="1">
                                <input type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                                <a href="../admin/quanlyproduct.jsp?pages=1"  class="btn btn-default">Hủy bỏ</a>

                            </div>

                        </form></div>
                    <div class="col-lg-2"></div>
                </div> </div>
        </div>


    </body>
</html>
