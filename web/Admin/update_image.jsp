<%-- 
    Document   : insert_category
    Created on : Dec 30, 2016, 5:42:36 PM
    Author     : Khang
--%>
<%@page import="model.Admin"%>
<% 
    Admin admin = (Admin) session.getAttribute("admin");
    String pqAdmin = "";
    if (admin == null) {
        response.sendRedirect("../Admin/login.jsp");
    }else{        
        if(Integer.parseInt(session.getAttribute("pqAdmin").toString()) != 3 && Integer.parseInt(session.getAttribute("pqAdmin").toString()) != 1){
            pqAdmin = "disabled";
        }
    }
%>
<%@page import="dao.ProductDAO"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sửa hình ảnh</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <link rel="stylesheet" href="${root}/Admin/layout/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="${root}/Admin/layout/plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/skins/_all-skins.min.css">
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <%
            String error = "";
            if(request.getParameter("error")!=null){
                error = (String) request.getParameter("error");
            }
            ProductDAO productDAO = new ProductDAO();
        %>
            <div class="wrapper">
            <jsp:include page="./layout/header.jsp"></jsp:include>
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                      Dashboard
                      <small>Version 2.0</small>
                    </h1>
                    <ol class="breadcrumb">
                      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                      <li class="active">Dashboard</li>
                    </ol>
                  </section>
<!--                MAIN------------------------------------------------------------------->
                    <section class="content">
                      <div class="row">
                          <div class="col-xs-12">
                            <!-- Horizontal Form -->
                            <div class="box box-primary">
                              <div class="box-header with-border">
                                <h3 class="box-title">Thông tin hình ảnh</h3>
                              </div>
                              <!-- /.box-header -->
                              <!-- form start -->
                              <form class="form-horizontal" action="../UpdateImageServlet" method="POST" enctype="multipart/form-data">
                                <div class="box-body">
                                     <input type="hidden" name="image_id" value="<%=request.getParameter("image_id")%>" id="inputEmail3">
                                  <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label">Tên hình ảnh</label>

                                    <div class="col-sm-10">
                                        <input type="text" name="name" required class="form-control" value="<%=request.getParameter("name")%>" id="inputEmail3">
                                    </div>
                                  </div>
                                  
                                  <div class="form-group">
                                    <label for="inputEmail3" class="col-sm-2 control-label">Chọn hình ảnh</label>

                                    <div class="col-sm-10">
                                        <input type="file" name="file[]" required value="<%=request.getParameter("image")%>" />
                                    </div>
                                  </div>
                                   <div class="form-group">
                                            <label class="col-sm-2 control-label">Chọn danh mục</label>
                                            <div class="col-sm-10">
                                            <select name="product_id"  class="form-control">
                                                <%
                                                    for (Product p : productDAO.getListAllProduct())
                                                    {
                                                    %>
                                                    <option value="<%=p.getProductID()%>" ><%=p.getProductName()%></option>
                                                <% } %> 
                                                
                                            </select>
                                            </div>
                                               
                                </div>
                                <!-- /.box-body -->
                                <div class="box-footer">
                                  <button type="submit" class="btn btn-default">Cancel</button>
                                  <button type="submit" class="btn btn-primary pull-right">Cập nhật</button>
                                </div>
                                <!-- /.box-footer -->
                              </form>
                            </div>
                          </div>                 
                  
                    </div>
                  </section>
<!--                /MAIN------------------------------------------------------------------->
            </div>            
            <jsp:include page="./layout/footer.jsp"></jsp:include>
            <jsp:include page="./layout/control-sidebar.jsp"></jsp:include>
            <div class="control-sidebar-bg"></div>
        </div>
            <script src="${root}/Admin/layout/plugins/jQuery/jquery-2.2.3.min.js"></script>
            <script src="${root}/Admin/layout/bootstrap/js/bootstrap.min.js"></script>
            <script src="${root}/Admin/layout/plugins/datatables/jquery.dataTables.min.js"></script>
            <script src="${root}/Admin/layout/plugins/datatables/dataTables.bootstrap.min.js"></script>
            <script src="${root}/Admin/layout/plugins/slimScroll/jquery.slimscroll.min.js"></script>
            <script src="${root}/Admin/layout/plugins/fastclick/fastclick.js"></script>
            <script src="${root}/Admin/layout/dist/js/app.min.js"></script>
            <script src="${root}/Admin/layout/dist/js/demo.js"></script>           
    </body>
</html>
