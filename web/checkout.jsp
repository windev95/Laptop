<%-- 
    Document   : checkout
    Created on : Dec 25, 2016, 9:19:11 PM
    Author     : Toan
--%>
<%@page import="model.Users"%>
<% 
    Users users = (Users) session.getAttribute("user");
    if (users == null) {
        response.sendRedirect("/login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <jsp:include page = "layout/head.jsp"></jsp:include>
        <title>Thông tin thanh toán</title>
    </head>
    <body>

        <div id="page-wrapper">
        <jsp:include page = "layout/header.jsp"></jsp:include>
        <div id="site-content">
        <!--MAIN
        =========================================================================== -->
                 <div id="main">
                <section class="page_title">
                    <h1 class="text-center">Thông tin thanh toán</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Thông tin thanh toán</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Content -->
                <div class="main-content">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="login" class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 form-style form-login">
                                    <form accept-charset='UTF-8' action="CheckOutServlet" method="POST">
                                        <input name='FormType' type='hidden' value='customer_login' />
                                        <input name='utf8' type='hidden' value='true' />
                                        <input type="hidden" value="login" name="command" id="command"/>
                                        <h3 class="form-heading">Thông tin thanh toán</h3>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="hidden" value="<%=session.getAttribute("id")%>" name="id" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="text" value="<%=session.getAttribute("name")%>" maxlength="50" placeholder="Tên" name="name" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="text" value="<%=session.getAttribute("phone")%>" maxlength="50" placeholder="Điện thoại" name="phone" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="text" value="<%=session.getAttribute("address")%>" maxlength="50" placeholder="Địa chỉ" name="address" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <span>Payment *</span>
                                            <div class="">
                                                <select name="payment">
                                                    <option value="Bank transfer"> Bank transfer</option>
                                                    <option value="Live"> Live</option>
                                                </select>
                                            </div>                                            
                                        </div>
                                        <div class="row">
                                            <button class="btn-cart btn btn-primary pull-left" type="submit">CHECKOUT</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <script type="text/javascript">
                                function showRecoverPasswordForm() {
                                    document.getElementById('recover-password').style.display = 'block';
                                    document.getElementById('login').style.display = 'none';
                                }
                                function hideRecoverPasswordForm() {
                                    document.getElementById('recover-password').style.display = 'none';
                                    document.getElementById('login').style.display = 'block';
                                }
                                if (window.location.hash == '#recover') { showRecoverPasswordForm() }
                            </script>
                        </div>
                    </div>
                </div>
                <!-- End Main Content -->
            </div>             
        <!--/MAIN-->
        </div>        
        <!-- SITE FOOTER
        =========================================================================== -->
        <jsp:include page = "layout/brand.jsp"></jsp:include>
        <jsp:include page = "layout/footer.jsp"></jsp:include>
        <!-- /SITE FOOTER -->
    </div>
    <jsp:include page = "layout/script.jsp"></jsp:include>
    </body>
</html>
