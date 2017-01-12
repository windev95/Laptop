<%-- 
    Document   : orders
    Created on : Jan 3, 2017, 4:46:01 PM
    Author     : Toan
--%>
<%@page import="model.Users"%>
<% 
    Users users = (Users) session.getAttribute("user");
    if (users == null) {
        response.sendRedirect("/login.jsp");
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
        <title>Chi tiết đơn hàng</title>
        <jsp:include page = "layout/head.jsp"></jsp:include>
    </head>
    <body>
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
        <div id="page-wrapper">
        <jsp:include page = "layout/header.jsp"></jsp:include>
        <div id="site-content">
        <!--MAIN
        =========================================================================== -->
        <div id="site-content">
            <div id="main">
                <section class="page_title">
                    <h1 class="text-center">Chi tiết đơn hàng</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Chi tiết đơn hàng</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Content -->
                <div class="main-content order">
                    <div class="container">
                        <div class="row">
                            <h2>Chi tiết đơn hàng <%=bill.getBillDate()%></h2>
                            <div class="table-responsive">
                                <fieldset>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr class="">
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
                                                <td><a href='detail.jsp?product=<%=billDetail.getProductID()%>'><%=productDAO.getProduct(billDetail.getProductID()).getProductName()%></a></td>
                                                <td><%=formatter.format(billDetail.getPrice())%></td>
                                                <td><%=billDetail.getQuantity()%></td>
                                                <td><%=formatter.format(billDetail.getPrice() * billDetail.getQuantity())%></td>
                                            </tr>
                                            <% }%>
                                        </tbody>                                        
                                    </table>
                                </fieldset>
                            </div>
                            <!-- BEGIN CART COLLATERALS -->
                            <div class="row">
                                <div class="col-sm-4">
                                    <div class="">
                                        <h3>Thông tin thanh toán</h3>
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
                            <!--cart-collaterals-->
                        </div>
                    </div>
                </div>
                <!-- End Main Content -->
            </div>
        </div>
        <!--=======================================================================
         /MAIN-->
        </div>        
        <!-- SITE FOOTER  -->
        <jsp:include page = "layout/brand.jsp"></jsp:include>
        <jsp:include page = "layout/footer.jsp"></jsp:include>
        <!-- /SITE FOOTER -->
        </div>
        <jsp:include page = "layout/script.jsp"></jsp:include>
    </body>
</html>
