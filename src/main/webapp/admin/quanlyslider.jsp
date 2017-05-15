
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.slide"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.SlideDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        
      <c:set var="root" value="${pageContext.request.contextPath}"/>


        <!-- Bootstrap Core CSS -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../admin/ss/plugins/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản trị</title>
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
        %>

    </head>
     <body>

        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Quản lý danh mục
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.jsp">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Quan lý Slider
                        </li>
                    </ol>
                </div>
				<%
        SlideDAO categoryDAO = new SlideDAO ();
        ArrayList<slide> listCategory = categoryDAO.getListThongtin();
    %>
                <div id="page-wrapper">
                    <div class="row">
                       <div class="col-lg-12">
					   <a href="../admin/themslider.jsp" class="btn btn-default">Thêm ảnh slider</a>
                    <table class="table table-bordered table-hover">

                        <tr >
                            <th >STT</th>
                            
                            <th >Hình ảnh</th>
                            <th >DisplayOrder</th>
                            <th >Link</th>
                            <th >Mô tả</th>
                            <th >Trạng thái</th>
                            <th>Tùy chọn</th>
                        </tr>

                        <%
                            int count = 0;
                            for (slide category : listCategory) {
                                count++;
                              
                        %>

                        <tr >

                            <td >                    <center>
                            <%=count%></center></td>
                        
                    <td><center><img src="../images/<%=category.getAnh()%>" style="width: 460px;height: 175px"></center></td>
                        <td><center><%=category.getThutu()%></center></td>
                        <td><center><%=category.getLink()%></center></td>
                        <td><center><%=category.getMota()%></center></td>
                    <td><center><% if(category.getTrangthai()==true){%> Đang sử dụng <%}%></center></td>
                        <td >
                        <center>
                            <a href="../admin/suaslide.jsp?command=update&ID_Slide=<%=category.getIDslide()%>">Sửa</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="../ManagerSlideServlet?command=delete&ID_Slide=<%=category.getIDslide()%>">Xóa</a>
                        </center>
                        </td>
                        </tr>
                        <%}%>

                    </table>
                </div>
            </div>
        </div>


    </body>
</html>
