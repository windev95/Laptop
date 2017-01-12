<%-- 
    Document   : support
    Created on : Dec 3, 2016, 6:10:09 PM
    Author     : BoyIt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>        
        <title>Liên hệ</title>
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
                    <h1 class="text-center">Liên hệ</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Liên hệ</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <style>
                    .header-breadcrumb {
                        margin-bottom: 0px !important;
                    }
                </style>

                <section class="mtb25 section-page">
                    <div class="container">
                        <style>
                            #map {
                                width: 100%;
                                height: 500px;
                            }
                        </style>
                        <button class="btn btn-default mini_btn center-block" onclick="timDuongDi()">Tìm đường đi</button>
                        <div id="map"></div>
                        <script>
                            function initMap() {
                                var latlng = new google.maps.LatLng(10.802149,106.714976); //Vị trí của trung tâm
                                var map = new google.maps.Map(document.getElementById('map'),
                                    {
                                    center: latlng,
                                    zoom: 16
                                });
                                var marker = new google.maps.Marker({
                                    position: latlng,
                                    map: map,
                                    title: "AK"
                                });
                            }
                            function timDuongDi() {
                                var latlng = new google.maps.LatLng(10.802149, 106.714976); //Vị trí của trung tâm
                                var map = new google.maps.Map(document.getElementById('map'), {
                                    center: latlng,
                                    zoom: 16
                                });
                                var infoWindow = new google.maps.InfoWindow({ map: map });
                                // Try HTML5 geolocation.
                                if (navigator.geolocation) {
                                    navigator.geolocation.getCurrentPosition(function (position) {
                                        var pos = {
                                            lat: position.coords.latitude,
                                            lng: position.coords.longitude
                                        };

                                        infoWindow.setPosition(pos);
                                        infoWindow.setContent('Vị trí của bạn');
                                        map.setCenter(pos);
                                        var directionsDisplay = new google.maps.DirectionsRenderer({
                                            map: map
                                        });
                                        var request = {
                                            destination: latlng,
                                            origin: pos,
                                            travelMode: google.maps.TravelMode.DRIVING
                                        };
                                        var directionsService = new google.maps.DirectionsService();
                                        directionsService.route(request, function (response, status) {
                                            if (status == google.maps.DirectionsStatus.OK) {
                                                // Display the route on the map.
                                                directionsDisplay.setDirections(response);
                                            }
                                        });
                                    }, function () {
                                        handleLocationError(true, infoWindow, map.getCenter());
                                    });
                                } else {
                                    // Browser doesn't support Geolocation
                                    handleLocationError(false, infoWindow, map.getCenter());
                                }
                            }
                            function handleLocationError(browserHasGeolocation, infoWindow, pos) {
                                infoWindow.setPosition(pos);
                                infoWindow.setContent(browserHasGeolocation ?
                                                      'Error: The Geolocation service failed.' :
                                                      'Error: Your browser doesn\'t support geolocation.');//
                                //AIzaSyBCCsKuhU3kBqm6QUeaeQ7yzm297VXUNII key 2
                            }
                        </script>
                        <script async defer
                                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCUDgrQ_rLrMHJUy1MQEczXGjjg1k5somw&callback=initMap">
                        </script> 
                    </div>
                </section>
                <br/>
                <section class="section-contact">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5 col-md-push-7">
                                <div class="widget-item">
                                    <a href="#" class="contact-logo"><img src="//bizweb.dktcdn.net/100/052/640/themes/134620/assets/logo1.png?1479951271873" alt=""></a>
                                    <ul class="widget-menu">
                                        <li class="widget-address"><span>Rengar mang lại cho bạn một không gian sống hoàn toàn mới với các dòng sản phẩm về nội thất chất lượng cao, chủng loại phong phú và đa dạng.</span></li>
                                        <li class="widget-address"><i class="fa fa-map-marker"></i> <span>Tầng 4 - Tòa nhà Hanoi Group - 442 Đội Cấn - Ba Đình - Hà Nội</span></li>
                                        <li><i class="fa fa-phone"></i> <span>(04) 6674 2332</span></li>
                                        <li><i class="fa fa-envelope"></i> <span>support@bizweb.vn</span></li>
                                    </ul>
                                    <!-- End .widget-menu -->
                                </div>
                                <!-- End .widget-item -->
                            </div>
                            <div class="col-md-7 col-md-pull-5">
                                <div class="section-article contactpage">
                                    <form accept-charset='UTF-8' action='FeedbackServlet' id='contact' method='post'>
                                        <input name='FormType' type='hidden' value='contact' />
                                        <input name='utf8' type='hidden' value='true' />
                                        <!--form-errors-custom-->
                                        <div class="notification_contact"><p>Gửi liên hệ thành công!</p></div>
                                        <!--End. form-errors-custom-->
                                        <div class="form-inline form-comment">
                                            <div class="form-group">
                                                <label for="name">Họ tên <span class="text-danger">*</span></label>
                                                <input id="name" name="name" type="text" value="" class="form-control" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="email">Email <span class="text-danger">*</span></label>
                                                <input id="email" name="email" class="form-control" type="email" value="" required>
                                            </div>

                                            <div class="form-group">
                                                <label for="message">Lời nhắn <span class="text-danger">*</span></label>
                                                <textarea id="message" name="message" class="form-control custom-control" rows="3" required></textarea>
                                            </div>
                                            <button type="submit" id="submitlienhe" class="btn btn-default">Gửi phản hồi</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
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