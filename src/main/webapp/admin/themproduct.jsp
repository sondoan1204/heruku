<%@page import="model.Admin"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.category"%>
<%@page import="dao.CategoryDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--<c:set var="root" value="${pageContext.request.contextPath}"/>-->
        <script src="../ckeditor/ckeditor.js" type="text/javascript"></script>

        <!-- Bootstrap Core CSS -->
        <link href="../admin/css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../admin/css/sb-admin.css" rel="stylesheet">

        <!-- Morris Charts CSS -->
        <link href="../admin/js/plugins/morris/morris.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../admin/font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thêm Sản phẩm mới</title>

        <script src="../admin/js/jquery-1.11.0.js" type="text/javascript"></script>
        <script type="text/javascript">
            $('#submit').click(function () {
            //kiem tra trinh duyet co ho tro File API
            if (window.File && window.FileReader && window.FileList && window.Blob)
            {
            // lay dung luong va kieu file tu the input file
            var ftype1 = $('#file1')[0].files[0].type;
            //var ftype2 = $('#file2')[0].files[1].type;
            //var ftype3 = $('#file3')[0].files[2].type;


            switch (ftype1)
            {
            case 'image/png':
                    case 'image/gif':
                    case 'image/jpeg':
                    case 'image/pjpeg':
                    break;
            default:
                    alert('Vui lòng chọn file ảnh!');
            }

            } else {
            alert("Trình duyệt ko hỗ trợ upload file, vui lòng nâng cấp trình duyệt");
            }
            });
        </script>
    </head>
    <body><%
        Admin users = (Admin) session.getAttribute("admin");
        if (users == null) {
            response.sendRedirect("dangnhap.jsp");

        }
        CategoryDAO categoryDAO = new CategoryDAO();
        ArrayList<category> listLoai = categoryDAO.getListLoai();
        %>
        <div id="wrapper">

            <jsp:include page="menu.jsp"></jsp:include>
                <div class="col-lg-12">
                    <h1 class="page-header">
                        Thêm sản phẩm
                    </h1>
                    <ol class="breadcrumb">
                        <li>
                            <i class="fa fa-dashboard"></i>  <a href="index.html">Dashboard</a>
                        </li>
                        <li class="active">
                            <i class="fa fa-table"></i> Thêm sản phẩm mới
                        </li>
                    </ol>
                </div>
                <div id="page-wrapper">
                    <div class="row">
                        <div class="col-lg-12">
                            <form action="../ManagerProductServlet" method="post" enctype="multipart/form-data">
                                <div class="panel panel-success" >
                                    <div class="panel-heading">
                                        <h3 class="panel-title"> Điền thông tin sản phẩm</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <div class="form-group">
                                                    <label>Tên sản phẩm</label>
                                                    <input type="text" class="form-control" name="tenSanpham" placeholder="Nhập tên Sản phẩm" required>
                                                </div>
                                                <div class="form-group">
                                                    <label>Chọn Loại</label>
                                                    <select class="form-control" name="maLoai">
                                                    <%
                                                        for (category category : listLoai) {
                                                    %>
                                                    <option value="<%=category.getCategoryID()%>"><%=category.getCategoryName()%></option>
                                                    <%}%>

                                                </select>
                                            </div>

                                            <div class="form-group input-group">
                                                <span class="input-group-addon">$</span>
                                                <input type="number" class="form-control" name="gia" placeholder="Giá bán" required>
                                                <span class="input-group-addon">VNĐ</span>
                                            </div>
                                            <div class="form-group input-group">
                                                <span class="input-group-addon">$</span>
                                                <input type="number" class="form-control" name="giaKM" placeholder="Giá khuyến mãi" >
                                                <span class="input-group-addon">VNĐ</span>
                                            </div>
                                            <div class="form-group">
                                                <label>Mô tả ngắn</label>
                                                <input class="form-control" name="motaNgan" placeholder="Mô tả ngắn">
                                            </div>
                                            <div class="form-group">
                                                <label>Hình đại diện</label>
                                                <input type="text" class="form-control" ID="imgURL" name="uploadFile" placeholder="URL" required="">
                                                <input type="file" id="filePicker" style="display: none" />
                                                <input type="button" id="authorizeButton" style="display: none" value="Authorize" />
                                                
                                                <!--<input  id="file123" type="file" class="form-control" name="uploadFile" accept="image/*" required >-->
                                            </div>
<!--                                            <div class="form-group">
                                                <label>Sub1</label>
                                                <input type="file" class="form-control" name="hinh2" accept="image/*" id="file2" required>
                                            </div>
                                            <div class="form-group">
                                                <label>Sub2</label>
                                                <input type="file" class="form-control" name="hinh3" accept="image/*" id="file3" required>
                                            </div>-->
                                            <div class="form-group">
                                                <label>Phân loại</label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiKM" value="true">Khuyến mãi
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiHot" value="true">Hot
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiTop" value="true">Top
                                                </label>
                                                <label class="checkbox-inline">
                                                    <input type="checkbox" name="trangthaiTopWeek" value="true">Top Week
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-lg-7">
                                            <div class="form-group">
                                                <label>Mô tả</label>
                                                <textarea class="form-control" name="mota" id="noiDung"></textarea>
                                                <script type="text/javascript" language="javascript">
                                                    CKEDITOR.replace('noiDung', {width: '600px', height: '300px'});
                                                </script>
                                            </div>
                                            <button type="reset" class="btn btn-default">Nhập lại</button>
                                            <input id="submit" type="hidden" name="command" value="insert" >
                                            <input id="submit" type="submit" class="btn btn-default" value="Lưu dữ liệu" >
                                            <a href="../admin/quanlyproduct.jsp?pages=1"  class="btn btn-default">Hủy bỏ</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 
<!--                        </form>
                        <img src="https://drive.google.com/uc?id=0B2xIzP693TX3V2E3dUtldWVxNzA" alt="">-->
                        <div id="authorize-div" style="display: none">
                            <span>Authorize access to Drive API</span>
                            <!--Button for the user to click to initiate auth sequence -->
                            <button id="authorize-button" onclick="handleAuthClick(event)">
                                Authorize
                            </button>
                        </div>
                        <pre id="output"></pre>


                        <script type="text/javascript">
                            var CLIENT_ID = '1096174929497-ipubrn1gmtl0ehq44bgo9kn529hc3drp.apps.googleusercontent.com';
                            var SCOPES = 'https://www.googleapis.com/auth/drive';
                            /**
                             * Called when the client library is loaded to start the auth flow.
                             */
                            function handleClientLoad() {
                            window.setTimeout(checkAuth, 1);
                            }

                            /**
                             * Check if the current user has authorized the application.
                             */
                            function checkAuth() {
                            gapi.auth.authorize({
                            'client_id': CLIENT_ID,
                                    'scope': SCOPES,
                                    'immediate': true
                            },
                                    handleAuthResult);
                            }

                            /**
                             * Called when authorization server replies.
                             *
                             * @param {Object} authResult Authorization result.
                             */
                            function handleAuthResult(authResult) {
                            var authButton = document.getElementById('authorizeButton');
                            var filePicker = document.getElementById('filePicker');
                            authButton.style.display = 'none';
                            filePicker.style.display = 'none';
                            if (authResult && !authResult.error) {
                            // Access token has been successfully retrieved, requests can be sent to the API.
                            filePicker.style.display = 'block';
                            filePicker.onchange = uploadFile;
                            } else {
                            // No access token could be retrieved, show the button to start the authorization flow.
                            authButton.style.display = 'block';
                            authButton.onclick = function () {
                            gapi.auth.authorize({
                            'client_id': CLIENT_ID,
                                    'scope': SCOPES,
                                    'immediate': false
                            },
                                    handleAuthResult);
                            };
                            }
                            }

                            /**
                             * Start the file upload.
                             *
                             * @param {Object} evt Arguments from the file selector.
                             */
                            function uploadFile(evt) {
                            gapi.client.load('drive', 'v2', function () {
                            var file = evt.target.files[0];
                            insertFile(file);
                            });
                            }


                            /**
                             * Insert new file.
                             *
                             * @param {File} fileData File object to read data from.
                             * @param {Function} callback Function to call when the request is complete.
                             */
                            function insertFile(fileData, callback) {
                            const boundary = '-------314159265358979323846';
                            const delimiter = "\r\n--" + boundary + "\r\n";
                            const close_delim = "\r\n--" + boundary + "--";
                            var reader = new FileReader();
                            reader.readAsBinaryString(fileData);
                            reader.onload = function (e) {
                            var contentType = fileData.type || 'application/octet-stream';
                            var metadata = {
                            'title': fileData.name,
                                    'mimeType': contentType,
                                    'parents': [{
                                    'id': '0B2xIzP693TX3anlkWnA4eElod2c'
                                    }]
                            };
                            var base64Data = btoa(reader.result);
                            var multipartRequestBody =
                                    delimiter +
                                    'Content-Type: application/json\r\n\r\n' +
                                    JSON.stringify(metadata) +
                                    delimiter +
                                    'Content-Type: ' + contentType + '\r\n' +
                                    'Content-Transfer-Encoding: base64\r\n' +
                                    '\r\n' +
                                    base64Data +
                                    close_delim;
                            var request = gapi.client.request({
                            'path': '/upload/drive/v2/files',
                                    'method': 'POST',
                                    'params': {
                                    'uploadType': 'multipart'
                                    },
                                    'headers': {
                                    'Content-Type': 'multipart/mixed; boundary="' + boundary + '"'
                                    },
                                    'body': multipartRequestBody
                            });
                            if (!callback) {
                            callback = function (file) {
                            console.log(file.thumbnailLink)
                                    $("#imgURL").val(file.id)
                            };
                            }
                            request.execute(callback);
                            }
                            }
                        </script>
                        <script type="text/javascript" src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
<!--                        <div class="form-group">
                            <label>Hình đại diện</label>
                            <input type="text" class="form-control" ID="imgURL" name="uploadFile" placeholder="URL" required="">
                            <input type="file" id="filePicker" style="display: none" />
                            <input type="button" id="authorizeButton" style="display: none" value="Authorize" />
                        </div>-->
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>
