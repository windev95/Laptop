<%-- 
    Document   : login
    Created on : Dec 3, 2016, 4:17:04 PM
    Author     : BoyIt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>        
        <title>Đăng nhập</title>
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
                    <h1 class="text-center">Đăng nhập tài khoản</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Đăng nhập tài khoản</li>
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
                                        <input type="hidden" value="login" name="command" id="command"/>
                                        <h3 class="form-heading">Đăng nhập</h3>
                                        <%if(session.getAttribute("error")!=null){%>
                                        <div>
                                            <h4 style="color:red"><%=session.getAttribute("error")%></h4>
                                        </div> 
                                        <%}%>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="email" value="" maxlength="50" placeholder="Email" name="email" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="password" value="" maxlength="50" placeholder="Mật khẩu" name="password" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <ul>
                                                    <li>
                                                        <div class="checkbox">
                                                            <input type="checkbox" id="c3" name="a">
                                                            <label for="c3"><span></span>Ghi nhớ tài khoản</label>
                                                        </div>
                                                    </li>
                                                    <li><a href="javascript:void(0);" onclick="showRecoverPasswordForm()" class="a_forget_pass" style="color:#898989;padding-right:15px">Quên mật khẩu?</a></li>
                                                    <li><a class="hover_underline" href="./register.jsp">Đăng ký tài khoản mới</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <button class="btn-cart btn btn-primary pull-left" type="submit">Đăng nhập</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 form-style form-login" id="recover-password" style="display: none">
                                    <h3 class="form-heading">Bạn quên mật khẩu?</h3>
                                    <form accept-charset='UTF-8' action='/account/recover' id='recover_customer_password' method='post'>
                                        <input name='FormType' type='hidden' value='recover_customer_password' />
                                        <input name='utf8' type='hidden' value='true' />
                                        <p class="text-center">Nhập email của bạn, chúng tôi sẽ gửi email tới cho bạn | <a class="hover_underline" href="javascript:void(0);" onclick="hideRecoverPasswordForm();return false;">Trở lại đăng nhập</a></p>
                                        <div class="row info-input">
                                            <input type="email" name="email" alt="email" id="email_address" placeholder="Địa chỉ Email *" class="input-text required-entry validate-email" value="" required>
                                        </div>
                                        <div class="center-btn">
                                            <button type="submit" class="btn-cart btn btn-primary pull-left">Gửi</button>
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
