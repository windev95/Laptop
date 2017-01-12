<%-- 
    Document   : manager_product
    Created on : Dec 30, 2016, 10:18:52 AM
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
<%@page import="dao.UsersDAO"%>
<%@page import="model.Bill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BillDAO"%>
<%@page import="helpers.MoneyFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản lý đơn hàng</title>
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
        
    </script>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <%
            MoneyFormat formatter = new MoneyFormat();
            BillDAO billDAO = new BillDAO();
            ArrayList<Bill> listBill = billDAO.getListBill();          
        %>
       <div class="wrapper">
            <jsp:include page="./layout/header.jsp"></jsp:include>
            <div class="content-wrapper">
<!--                MAIN------------------------------------------------------------------->
                        <section class="content">
                             <div class="row">
                               <div class="col-xs-12">
                                 <!-- /.box -->
                                 <div class="box">
                                   <div class="box-header">              
                                     <h3 class="box-title">Tất cả đơn hàng</h3>                                                                       
                                   </div>
                                   <!-- /.box-header -->
                                   <div class="box-body">
                                     <table id="example1" class="table table-bordered table-striped">
                                       <thead>
                                       <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Ngày lập</th>
                                            <th>Khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th>Điện thoại</th>
                                            <th>Tổng hóa đơn</th>
                                            <th>Thanh toán</th>
                                            <th>Tình trạng</th>                                           
                                       </tr>
                                       </thead>
                                       <tbody>
                                        <%
                                            for(Bill bill : listBill){
                                        %>
                                          <tr>
                                            <td><a href="${root}../Admin/bill_detail.jsp?bill=<%=bill.getBillID()%>"><%=bill.getBillID()%></a></td>
                                            <td><%=bill.getBillDate()%></td>
                                            <td><%=bill.getBillName()%></td>                                            
                                            <td><%=bill.getBillAddress()%></td>
                                            <td><%=bill.getBillPhone()%></td>
                                            <td><%=formatter.format(bill.getBillTotal())%></td>
                                            <td>
                                              <center> 
                                              <% if (bill.getBillPaid()==0) {                      
                                                %>
                                                <span class="label label-warning"> Chưa thanh toán</span>                                                
                                                <%} else {%>
                                                <span class="label label-success"> Hoàn thành</span>
                                                <% }%>
                                              </center>
                                            </td>
                                            <td>
                                              <center> 
                                              <% if (bill.getBillFinish()==0) {                      
                                                %>
                                                <span class="label label-warning"> Chưa giao</span>   
                                                <%} else {%>                    
                                                <span class="label label-success"> Hoàn thành</span>
                                                <% }%>
                                              </center>
                                            </td>
                                            
                                          </tr>
                                          <% }%>
                                       </tbody>
                                       <tfoot>
                                       <tr>
                                            <th>Mã hóa đơn</th>
                                            <th>Ngày lập</th>
                                            <th>Khách hàng</th>
                                            <th>Địa chỉ</th>
                                            <th>Điện thoại</th>
                                            <th>Tổng hóa đơn</th>
                                            <th>Thanh toán</th>
                                            <th>Tình trạng</th> 
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