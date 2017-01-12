<%-- 
    Document   : index
    Created on : Dec 30, 2016, 8:37:53 AM
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
<%@page import="model.Bill"%>
<%@page import="dao.UsersDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BillDAO"%>
<%@page import="helpers.MoneyFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin</title>
        <link rel="icon" href="./images/favicon.png" type="image/x-icon" />
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <c:set var="root" value="${pageContext.request.contextPath}"/>
        <link rel="stylesheet" href="${root}/Admin/layout/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
        <link rel="stylesheet" href="${root}/Admin/layout/plugins/datatables/dataTables.bootstrap.css">
        <link rel="stylesheet" href="${root}/Admin/layout/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/AdminLTE.min.css">
        <link rel="stylesheet" href="${root}/Admin/layout/dist/css/skins/_all-skins.min.css">
        <style type="text/css">
            .jqstooltip 
            { 
                position: absolute;
                left: 0px;top: 0px;
                visibility: hidden;
                background: rgb(0, 0, 0) transparent;
                background-color: rgba(0,0,0,0.6);
                filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);
                -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";
                color: white;font: 10px arial, san serif;
                text-align: left;white-space: nowrap;
                padding: 5px;border: 1px solid white;
                z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}              
        </style>
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <%
            MoneyFormat formatter = new MoneyFormat();
            BillDAO billDAO = new BillDAO();
            ArrayList<Bill> listBill = billDAO.getListBillup();
            UsersDAO usersDAO = new UsersDAO();            
        %>
        <div class="wrapper">
            <jsp:include page="./layout/header.jsp"></jsp:include>
            <div class="content-wrapper">
                <section class="content-header">
                    <h1>
                      ShopLaptop
                      <small>Version 2.0</small>
                    </h1>
                    <ol class="breadcrumb">
                      <li><a href="../Admin/index.jsp"><i class="fa fa-dashboard"></i> Admin</a></li>
                      <li class="active">Index</li>
                    </ol>
                  </section>
<!--                MAIN------------------------------------------------------------------->
                    <section class="content">
                          <!-- Small boxes (Stat box) -->
                    <div class="row">
                      <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-aqua">
                          <div class="inner">
                            <h3>150</h3>

                            <p>New Orders</p>
                          </div>
                          <div class="icon">
                            <i class="ion ion-bag"></i>
                          </div>
                          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <!-- ./col -->
                      <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-green">
                          <div class="inner">
                            <h3>53<sup style="font-size: 20px">%</sup></h3>

                            <p>Bounce Rate</p>
                          </div>
                          <div class="icon">
                            <i class="ion ion-stats-bars"></i>
                          </div>
                          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <!-- ./col -->
                      <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-yellow">
                          <div class="inner">
                            <h3>44</h3>

                            <p>User Registrations</p>
                          </div>
                          <div class="icon">
                            <i class="ion ion-person-add"></i>
                          </div>
                          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <!-- ./col -->
                      <div class="col-lg-3 col-xs-6">
                        <!-- small box -->
                        <div class="small-box bg-red">
                          <div class="inner">
                            <h3>65</h3>

                            <p>Unique Visitors</p>
                          </div>
                          <div class="icon">
                            <i class="ion ion-pie-graph"></i>
                          </div>
                          <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                        </div>
                      </div>
                      <!-- ./col -->
                    </div>
      <!-- /.row -->

            <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Các đơn hàng chưa giao</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
            </div>
            <!-- /.box-header -->        
                <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th>Mã hóa đơn</th>
                                <th>Khách hàng</th>
                                <th>Địa chỉ</th>
                                <th>Điện thoại</th>
                                <th>Tổng hóa đơn</th>
                                <th>Hủy</th>
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
                                            <td><%=bill.getBillName()%></td>
                                            <td><%=bill.getBillAddress()%></td>
                                            <td><%=bill.getBillPhone()%></td>
                                            <td><%=formatter.format(bill.getBillTotal())%></td>
                                            <td>                                              
                                                <center>      
                                                <% if (bill.getBillPaid()==0) {                      
                                                %>
                                                 <button <%=pqAdmin%> class="btn btn-danger btn-xs" onclick="location.href='../ManagerBillServlet?command=delete&bill_id=<%=bill.getBillID()%>'"><i class="glyphicon glyphicon-remove"></i> Hủy</button>
                                                <% }else {%>
                                                <button disabled class="btn btn-danger btn-xs" onclick="location.href='../ManagerBillServlet?command=delete&bill_id=<%=bill.getBillID()%>'"><i class="glyphicon glyphicon-remove"></i> Hủy</button>
                                                <%}%>
                                                </center> 
                                            </td>
                                            <td>
                                              <center> 
                                              <% if (bill.getBillPaid()==0) {                      
                                                %>
                                                <button <%=pqAdmin%> class="btn btn-primary btn-xs" onclick="location.href='../ManagerBillServlet?command=update&bill_id=<%=bill.getBillID()%>'"><i class="glyphicon glyphicon-check"></i> Xác nhận</button>
                                                <%} else {%>
                                                <span class="label label-success"> Hoàn thành</span>
                                                <% }%>
                                              </center>
                                            </td>
                                            <td>
                                              <center> 
                                              <% if (bill.getBillFinish()==0) {                      
                                                %>
                                                <button <%=pqAdmin%> class="btn btn-primary btn-xs" onclick="location.href='../ManagerBillServlet?command=finish&bill_id=<%=bill.getBillID()%>'"><i class="glyphicon glyphicon-check"></i> Đã giao</button>
                                                <%} else {%>
<!--                                                <button class="btn btn-primary btn-xs" onclick="location.href='../ManagerBillServlet?command=update&bill_id=<%=bill.getBillID()%>'"><i class="glyphicon glyphicon-justify"></i> Hoàn tất</button>-->
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
                                <th>Khách hàng</th>
                                <th>Địa chỉ</th>
                                <th>Điện thoại</th>
                                <th>Tổng hóa đơn</th>
                                <th>Hủy</th>
                                <th>Thanh toán</th>
                                <th>Tình trạng</th>                                           
                            </tr>
                        </tfoot>
                    </table>
              <!-- /.table-responsive -->
            </div>
            <!-- /.box-body -->
            <div class="box-footer clearfix">
              
              <a href="../Admin/manager_bill.jsp" class="btn btn-sm btn-default btn-flat pull-right">Xem tất cả</a>
            </div>
            <!-- /.box-footer -->
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
