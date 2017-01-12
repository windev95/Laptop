<%-- 
    Document   : footer
    Created on : Nov 27, 2016, 7:50:09 PM
    Author     : BoyIt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <link href='./css/bpr-products-module.css' rel='stylesheet' type='text/css' />
        <div class="bizweb-product-reviews-module"></div>
        <footer id="footer" class="footer">
            <div id="back-top">
                <a href="#top" title="Trở về đầu trang">TOP</a>
            </div>
            <div class="widget">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-6">
                            <div class="col-md-7 col-sm-6">
                                <div class="widget-item">
                                    <h2 class="widget-title">VỀ CHÚNG TÔI</h2>
                                    <ul class="widget-menu first-footer-ul">
<!--                                        <li class="location-title">Thông tin liên hệ.</li>-->
                                        <li class="widget-address">
                                            <span><i class="fa fa-map-marker theme_color w2"></i> 475A Điện Biên Phủ, P.25, Q.Bình Thạnh, TP.HCM</span>
                                        </li>
                                        <li>
                                            <span><i class="fa fa-mobile theme_color w2"></i>098 7654 321</span> - <span>098 7654 321</span>
                                        </li>
                                        <li>
                                            <span><i class="fa fa-envelope-o theme_color w2"></i> support@gmail.com</span>
                                        </li>
                                    </ul>
                                    <!-- End .widget-menu -->
                                </div>
                                <!-- End .widget-item -->
                            </div>
                            <div class="col-md-5 col-sm-6">
                                <div class="widget-item">
                                    <h2 class="widget-title">CHÍNH SÁCH</h2>
                                    <!-- End .widget-title -->
                                    <ul class="widget-menu">
                                        <li>
                                            <a href="#"><i class="fa fa-caret-right"></i> Hướng dẫn mua hàng</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-caret-right"></i> Thông tin khách hàng</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-caret-right"></i> Chính sách đãi ngộ</a>
                                        </li>
                                    </ul>
                                    <!-- End .widget-menu -->
                                </div>
                                <!-- End .widget-item -->
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6">
                            <div class="col-md-5 col-sm-6">
                                <div class="widget-item">
                                    <h2 class="widget-title">THÔNG TIN</h2>
                                    <!-- End .widget-title -->
                                    <ul class="widget-menu">
                                        <li>
                                            <a href="#"><i class="fa fa-caret-right"></i> Giới thiệu công ty</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-caret-right"></i> Chính sách bảo hành</a>
                                        </li>
                                        <li>
                                            <a href="#"><i class="fa fa-caret-right"></i> Chính sách đổi trả</a>
                                        </li>
                                    </ul>
                                    <!-- End .widget-menu -->
                                </div>
                                <!-- End .widget-item -->
                            </div>
                            <div class="col-md-7 col-sm-6">
                                <div class="widget-item">
                                    <h2 class="widget-title">ĐĂNG KÝ NHẬN TIN</h2>
                                    <!-- End .widget-title -->
                                    <ul class="widget-menu">
                                        <li>
                                            Hãy đăng kí để nhận được tin khuyến mại từ chúng tôi.
                                        </li>
                                        <li>
                                            <!--<div class="input-group">
                                                <input type="text" class="form-control" placeholder="Nhập email của bạn...">
                                                <span class="input-group-btn">
                                                    <button class="btn btn-default" type="button">Đăng ký</button>
                                                </span>
                                            </div>-->
                                            <form action="https://contactform.bizwebapps.vn/ContactForm/ContactFormAsset/SendMail" method="post" data-orientation="left">
                                                <input type="hidden" name="alias" value="dkt-minhpq" title="Đăng ký nhận tin khuyến mãi" placeholder="Nhập email nhận tin khuyến mãi">
                                                <input errormessage="Email không được bỏ trống" class="subcribe_form  form-control" data-message="Vui lòng nhập email hợp lệ" required="True" data-fieldname="email" placeholder="Email" name="email" type="text">
                                                <input type="submit" class="btn btn-success" value="Đăng ký">
                                                <input type="hidden" name="url" value="ranger-theme.bizwebvietnam.net">
                                            </form>
                                        </li>
                                        <li>
                                            <ul class="social_icon">
                                                <li><a href="http://www.facebook.com/#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="https://twitter.com/#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="https://plus.google.com/+#"><i class="fa fa-google-plus"></i></a></li>
                                                <li><a href="skype#"><i class="fa fa-skype"></i></a></li>
                                            </ul>
                                        </li>

                                    </ul>
                                    <!-- End .widget-menu -->
                                </div>
                                <!-- End .widget-item -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End .widget -->
            <div class="footer-bottom">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-7 col-sm-push-5">
                            <div class="pull-right">
                                <ul>
                                    <li><a href="/" title="Trang chủ">Trang chủ</a></li>
                                    <li><a href="./introduce.jsp" title="Giới thiệu">Giới thiệu</a></li>
                                    <li><a href="./all.jsp" title="Sản phẩm">Sản phẩm</a></li>
<!--                                    <li><a href="#" title="Tin tức">Tin tức</a></li>-->
                                    <li><a href="./support.jsp" title="Liên hệ">Liên hệ</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-5 col-sm-pull-7">
                            <div class="pull-left copyright">
                                <span>© Bản quyền thuộc về Team | Cung cấp bởi <a href="https://www.facebook.com" target="_blank" title="Quốc Toàn">TeamWork</a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
