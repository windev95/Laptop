<%-- 
    Document   : index
    Created on : Dec 30, 2016, 8:37:53 AM
    Author     : Khang
--%>
<%@page import="model.Admin"%>
<% 
    Admin admin = (Admin) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("/Admin/login.jsp");
    }
%>
<%@page import="model.Bill" %>
<%@page import="dao.BillDAO" %>
<%@page import="model.BillDetail" %>
<%@page import="dao.BillDetailDAO" %>
<%@page import="model.Product" %>
<%@page import="dao.ProductDAO" %>
<%@page import="helpers.MoneyFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Chi tiết hóa đơn</title>
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
        BillDAO billDAO = new BillDAO();
        Bill bill = new Bill();
        ProductDAO productDAO = new ProductDAO();
        BillDetailDAO billDetailDAO = new BillDetailDAO();
        MoneyFormat formatter = new MoneyFormat();
        String billID = "";
        if(request.getParameter("bill") != null)
        {
            billID = request.getParameter("bill");
            bill = billDAO.getBill(billID);
        }
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
                      <div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Chi tiết hóa đơn #<%=bill.getBillID()%></h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="table-responsive">
                <table class="table no-margin">
                  <thead>
                  <tr>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Số lượng</th>
                    <th>Thành tiền</th>
                  </tr>
                  </thead>
                  <tbody>
                      <%
                        for(BillDetail billDetail : billDetailDAO.getListBillDetailbyBillID(String.valueOf(billID)))
                            {
                       %>
                        <tr>
                            <td><a href='../detail.jsp?product=<%=billDetail.getProductID()%>' target="_blank"><%=productDAO.getProduct(billDetail.getProductID()).getProductName()%></a></td>
                            <td><%=formatter.format(billDetail.getPrice())%></td>
                            <td><%=billDetail.getQuantity()%></td>
                            <td><%=formatter.format(billDetail.getPrice() * billDetail.getQuantity())%></td>
                        </tr>
                       <% }%>
                  </tbody>
                </table>
              </div>
              <div class="row">
                                <div class="col-sm-4">
                                    <div class="">
                                        <h3>Thông tin giao hàng</h3>
                                        <div class="">
                                            <p>
                                                Trạng thái thanh toán:
                                                <%if(bill.getBillPaid()==0){%>
                                                    <span class="label label-warning">Chưa thanh toán</span>
                                                <%}else {%>
                                                    <span class="label label-success">Hoàn thành</span>
                                                <% }%>
                                            </p>
                                            <p>
                                                Trạng thái vận chuyển:
                                                <%if(bill.getBillFinish()==0){%>
                                                    <span class="label label-warning">Chưa giao</span>
                                                <%}else {%>
                                                    <span class="label label-success">Hoàn thành</span>
                                                <% }%>
                                            </p>
                                            <p>Tên: <%=bill.getBillName()%></p>
                                            <p>Địa chỉ: <%=bill.getBillAddress()%></p>
                                            <p>Điện thoại: <%=bill.getBillPhone()%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                </div>
                                <div class="col-sm-4">
                                    <h3>Tổng tiền hóa đơn</h3>
                                    <div class="">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <td> Tổng tiền </td>
                                                    <td class="text-right"><span class="price"><%=formatter.format(bill.getBillTotal())%></span></td>
                                                </tr>
                                                <tr>
                                                    <td>Giao hàng tận nơi:</td>
                                                    <td class="text-right"><span class="price">0₫</span></td>
                                                </tr>
                                                <tr>
                                                    <td> Cần thanh toán </td>
                                                    <td class="text-right"><span class="price"><%=formatter.format(bill.getBillTotal())%></span></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--inner-->
                                </div>
                            </div>
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
