<%-- 
    Document   : changepass
    Created on : Jan 3, 2017, 7:31:07 PM
    Author     : Toan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đổi mật khẩu</title>
        <jsp:include page = "layout/head.jsp"></jsp:include>
    </head>
    <body>
        <div id="page-wrapper">
        <jsp:include page = "layout/header.jsp"></jsp:include>
        <div id="site-content">
        <!--MAIN
        =========================================================================== -->
                 <div id="main">
                <section class="page_title">
                    <h1 class="text-center">Đổi mật khẩu</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Đổi mật khẩu</li>
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
                                    <form accept-charset='UTF-8' action="UserServlet" method="POST">
                                        <input name='FormType' type='hidden' value='customer_login' />
                                        <input name='utf8' type='hidden' value='true' />
                                        <input type="hidden" value="change" name="command" id="command"/>
                                        <h3 class="form-heading">Đổi mật khẩu</h3>
                                        
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="password" value="" maxlength="50" placeholder="Mật khẩu củ (*)" name="password" required />
                                            </div>
                                        </div>
                                        
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="password" value="" maxlength="50" placeholder="Mật khẩu mới (*)" name="repassword" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="password" value="" maxlength="50" placeholder="Mật khẩu mới nhập lại (*)" name="repassword1" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <ul>
                                                    <li><a class="hover_underline" href="./update_user.jsp">Cập nhật thông tin tài khoảng</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <button class="btn-cart btn btn-primary pull-left" type="submit">Xác nhận</button>
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
