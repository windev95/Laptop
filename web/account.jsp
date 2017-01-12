<%-- 
    Document   : account
    Created on : Dec 17, 2016, 11:14:12 PM
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
<%@page import="helpers.MoneyFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>        
        <title>Thông tin tài khoảng</title>
        <jsp:include page = "layout/head.jsp"></jsp:include>
    </head>
    <body>
        <%
        BillDAO billDAO = new BillDAO();
        MoneyFormat formatter = new MoneyFormat();
        %>
        <div id="page-wrapper">
        <jsp:include page = "layout/header.jsp"></jsp:include>
        <div id="site-content">
        <!--MAIN
        =========================================================================== -->
            <div id="main">
                <section class="page_title">
                    <h1 class="text-center">Trang khách hàng</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Trang khách hàng</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Content -->
                <div class="main-content account">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-9">
                                <h3>Đơn hàng</h3>
                                <div class="table-responsive">
                                    <fieldset>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr class="first last">
                                                    <th rowspan="1">Mã đơn hàng</th>
                                                    <th rowspan="1">Ngày</th>
                                                    <th rowspan="1">Loại thanh toán</th>
                                                    <th colspan="1">Đã thanh toán</th>
                                                    <th rowspan="1">Hoàn thành</th>
                                                    <th colspan="1">Thành tiền</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                for(Bill bill : billDAO.getListBillbyUserID(String.valueOf(session.getAttribute("id"))))
                                                    {
                                                %>
                                                <tr class="first odd">                                                    
                                                    <td>
                                                        <a href='/orders.jsp?bill=<%=bill.getBillID()%>'>#<%=bill.getBillID()%></a>
                                                    </td>
                                                    <td><%=bill.getBillDate()%></td>
                                                    <td><%=bill.getBillPayment()%></td>
                                                    <td>
                                                        <%if(bill.getBillPaid()==0){%>
                                                            <span class="label label-warning">Chưa thanh toán</span>
                                                        <%}else {%>
                                                            <span class="label label-success">Hoàn thành</span>
                                                        <% }%>
                                                    </td>
                                                    <td>
                                                        <%if(bill.getBillFinish()==0){%>
                                                            <span class="label label-warning">Chưa giao</span>
                                                        <%}else {%>
                                                            <span class="label label-success">Hoàn thành</span>
                                                        <% }%>
                                                    </td>
                                                    <td class="a-right movewishlist">
                                                        <%=formatter.format(bill.getBillTotal())%>
                                                    </td>                                                    
                                                </tr>
                                                <% }%>
                                            </tbody>
                                        </table>
                                    </fieldset>
                                </div>

                            </div>
                            <div class="col-md-3">
                                <h3>Thông tin tài khoản</h3>
                                <div class="">
                                    <table class="table table-bordered">
                                        <tbody>
                                            <tr>
                                                <td>Họ và tên: </td>
                                                <td><p> <%=session.getAttribute("name")%></p></td>
                                            </tr>
                                            <tr>
                                                <td>Email: </td>
                                                <td><p> <%=session.getAttribute("email")%></p></td>
                                            </tr>
                                            <tr>
                                                <td>Địa chỉ: </td>
                                                <td><p> <%=session.getAttribute("address")%></p></td>
                                            </tr>

                                            <tr>
                                                <td>Số điện thoại: </td>
                                                <td> <%=session.getAttribute("phone")%></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <ul class="checkout">
                                        <li>
                                            <button onclick="window.location.href='../change_pass.jsp'" width="100%" class="btn mini_btn btn-block">ĐỔI MẬT KHẨU</button>
                                            <button onclick="window.location.href='../update_user.jsp'" width="100%" class="btn mini_btn btn-block">CẬP NHẬT THÔNG TIN</button>
                                        </li>
                                    </ul>
                                </div>
                                <!--inner-->
                            </div>
                        </div>
                    </div>
                </div>
    <!-- End Main Content -->
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
