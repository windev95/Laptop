<%-- 
    Document   : register
    Created on : Dec 3, 2016, 4:06:07 PM
    Author     : BoyIt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng ký</title>
        <jsp:include page = "layout/head.jsp"></jsp:include>
        <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js" type="text/javascript"></script>
        <script type="text/javascript">
              $(document).ready(function () {
                   var x_timer;
                   $("#email").keyup(function (e) {
                        clearTimeout(x_timer);
                        var user_name = $(this).val();
                        x_timer = setTimeout(function () {
                            check_username_ajax(user_name);
                        }, 1000);
                        });
                   function check_username_ajax(email) {
                        $("#user-result").html('<img src="images/shop/ajax-loader.gif" />');
                        $.post('CheckEmailServlet', {'email':email}, function (data) {
                            $("#user-result").html(data);
                         });
                   }
               });
        </script>
    </head>
    <body>
            <div id="page-wrapper">
        <jsp:include page = "layout/header.jsp"></jsp:include>
        <!-- SITE CONTENT
        =========================================================================== -->
        <div id="site-content">
            <div id="main">
                <section class="page_title">
                    <h1 class="text-center">Đăng ký tài khoản</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Đăng ký tài khoản</li>
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
                                <div class="col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 form-style form-login">
                                    <form accept-charset='UTF-8' action="UserServlet" method="POST">
                                        <input name='FormType' type='hidden' value='customer_register' />
                                        <input type="hidden" value="insert" name="command" id="command"/>
                                        <input name='utf8' type='hidden' value='true' />
                                        <h3 class="form-heading">Đăng ký</h3>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="text" value="" name="fullname" id="fullname" maxlength="50" placeholder="Họ và Tên *" />                                                
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="email" value="" name="email" id="email" id="email" maxlength="30" placeholder="Email *" required="yes" /> <span id="user-result"></span>                                                
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="text" value="" name="address" id="address" maxlength="50" placeholder="Địa chỉ *" />                                                
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="number" value="" name="phone" id="phone" maxlength="20" placeholder="Điện thoại *" />                                                
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="password" value="" name="password" id="password" maxlength="50" placeholder="Mật khẩu *" required />
                                            </div>
                                        </div>
                                        <div class="row info-input">
                                            <div class="">
                                                <input type="password" value="" name="repassword" id="repassword" maxlength="50" placeholder="Mật khẩu nhập lại *" required />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="">
                                                <ul>
                                                    <li>
                                                        <div class="checkbox">
                                                            <input type="checkbox" id="c2" name="a">
                                                            <label for="c2"><span></span>Đăng kí nhận tin tức qua email </label>
                                                        </div>
                                                    </li>
                                                    <li><a class="hover_underline" href="./login.jsp">Đăng nhập</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="row">                                            
                                            <button class="btn-cart" type="submit">Đăng ký</button>                                          
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Main Content -->
            </div>
        </div>
        <!-- /SITE CONTENT -->
        
        <!-- SITE FOOTER
        =========================================================================== -->
        <jsp:include page = "layout/brand.jsp"></jsp:include>
        <jsp:include page = "layout/footer.jsp"></jsp:include>
        <!-- /SITE FOOTER -->
    </div>
    <jsp:include page = "layout/script.jsp"></jsp:include>
    </body>
</html>