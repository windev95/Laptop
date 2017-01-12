<%-- 
    Document   : manager_admin
    Created on : Jan 11, 2017, 11:55:35 AM
    Author     : Toan
--%>
<%@page import="model.Admin"%>
<% 
    Admin adminid = (Admin) session.getAttribute("admin");
    String pqAdmin = "";
    if (adminid == null) {
        response.sendRedirect("../Admin/login.jsp");
    }else{        
        if(Integer.parseInt(session.getAttribute("pqAdmin").toString()) != 1){
            pqAdmin = "disabled";
        }
    }
%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Pq"%>
<%@page import="dao.PqDAO"%>
<%@page import="dao.AdminDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý tài khoảng Admin</title>
        <link rel="icon" href="./images/favicon.png" type="image/x-icon" />
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
            AdminDAO adminDAO = new AdminDAO();
            PqDAO pqDAO = new PqDAO();
            ArrayList<Admin> listAdmin = adminDAO.getListAdmin();            
        %>
        <div class="wrapper">
            <jsp:include page="./layout/header.jsp"></jsp:include>
            <div class="content-wrapper">
                <section class="content-header">
                    <%if(pqAdmin!="disabled"){%>
                    <a class="btn btn-primary mini_btn center-block" href="../Admin/insert_admin.jsp">THÊM MỚI</a>
                    <% }%>
                  </section>
<!--                MAIN------------------------------------------------------------------->
                        <section class="content">
                             <div class="row">
                               <div class="col-xs-12">
                                 <!-- /.box -->

                                 <div class="box">
                                   <div class="box-header">
                                     <h3 class="box-title">Bảng danh mục sản phẩm</h3>                                     
                                     
                                   </div>
                                   <!-- /.box-header -->
                                   <div class="box-body">
                                     <table id="example1" class="table table-bordered table-striped display" cellspacing="0" width="100%">
                                       <thead>
                                       <tr>
                                            <th>Mã Admin</th>
                                            <th>Tên Admin</th>
                                            <th>Avatar</th>
                                            <th>Email</th>
                                            <th>Phân quyền</th>
                                            <th width="75px">Tùy chọn</th>
                                       </tr>
                                       </thead>
                                       <tbody>
                                        <%
                                            for(Admin admin : listAdmin){
                                        %>
                                        <tr>                                        
                                          <td><%=admin.getAdminID()%></td>
                                          <td><%=admin.getAdminfullName()%></td>
                                          <td>
                                              <div class="col-sm-5 col-md-5 no-padding-l">
                                                <div class="product-img-parent">
                                                    <a href="#" class="product-img"><img src="${root}../Admin/images/admin/<%=admin.getAdminAvatar()%>" width="50" height="50" alt="<%=admin.getAdminfullName()%>"></a>
                                                </div>
                                              </div>
                                          </td>
                                          <td><%=admin.getAdminEmail()%></td>
                                          <td><%=pqDAO.getPqName(Long.toString(admin.getPqID())).getPqName()%></td>
                                          <td width="75px"> 
                                              <center> 
                                             <button <%=pqAdmin%> class="btn btn-primary btn-xs" onclick="location.href='${root}../Admin/update_admin.jsp?command=update&admin_id=<%=admin.getAdminID()%>'"><i class="glyphicon glyphicon-pencil"></i> Sửa</button>
                                             <button <%=pqAdmin%> class="btn btn-danger btn-xs" onclick="location.href='../AdminServlet?admin_id=<%=admin.getAdminID()%>'"><i class="glyphicon glyphicon-remove"></i> Xóa</button>
                                                </center> 
                                           </td>                                         
                                        </tr>
                                       <% }%>
                                       </tbody>
                                       <tfoot>
                                       <tr>
                                            <th>Mã Admin</th>
                                            <th>Tên Admin</th>
                                            <th>Avatar</th>
                                            <th>Email</th>
                                            <th>Phân quyền</th>
                                            <th width="75px">Tùy chọn</th>
                                       </tr>
                                       </tfoot>
                                     </table>
                                   </div>
                                   <!-- /.box-body -->
                                 </div>
                                 <!-- /.box -->
                               </div>
                               <!-- /.col -->
                             </div>
                             <!-- /.row -->
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
            <script>
            $(document).ready(function () {
                $('#example1').DataTable({
                    responsive: true
                });
            });
            </script>
            <script type="text/javascript">
	$(function(){
		$('.sidebar-menu a').filter(function(){return this.href===location.href;}).parent().addClass('active').siblings().removeClass('active');
		$('.sidebar-menu a').click(function(){
			$(this).parent().addClass('active').siblings().removeClass('active');	
		});
	});
	</script>
    </body>
</html>
