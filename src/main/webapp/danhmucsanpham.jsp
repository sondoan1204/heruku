<%@page import="model.category"%>
<%@page import="sandwich.categorySW"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
	<div class="category">
	<div class="module-title">
		<h2>Danh mục sản phẩm</h2>
	</div>
	<ul class="list-unstyled">
		<% categorySW danhmuc = new categorySW();
                            for (category c : danhmuc.getListCategory()){
                            %> 
                            <li><a class="" href="products.jsp?category=<%=c.getCategoryID()%>"><span><%=c.getCategoryName() %>  </span></a></li>
                            <%
                            }
                            %>                            
        </ul>
</div>





<!--<div class="widget-sidebar-item banner em-effect06">
	<a class="em-eff06-03" href="#bannner_link" title="Sidebar banner"><img src="../bizweb.dktcdn.net/100/053/643/themes/138603/assets/sidebar_bannerjpgefbf.jpg?1471418341698" alt="Big Food"></a>
</div>-->

    </body>
</html>
