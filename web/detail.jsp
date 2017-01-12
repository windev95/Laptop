<%-- 
    Document   : detail
    Created on : Dec 3, 2016, 5:58:45 PM
    Author     : BoyIt
--%>
<%@page import="helpers.MoneyFormat"%>
<%@page import="model.Product" %>
<%@page import="dao.ProductDAO" %>
<%@page import="model.Producer" %>
<%@page import="dao.ProducerDAO" %>
<%@page import="model.Category"%> 
<%@page import="dao.CategoryDAO"%>
<%@page import="model.Cpu"%> 
<%@page import="dao.CpuDAO"%>
<%@page import="model.Ram"%> 
<%@page import="dao.RamDAO"%>
<%@page import="model.Storage"%> 
<%@page import="dao.StorageDAO"%>
<%@page import="model.Screensize"%> 
<%@page import="dao.ScreensizeDAO"%>
<%@page import="model.Pricelevel"%> 
<%@page import="dao.PricelevelDAO"%>
<%@page import="model.Image"%> 
<%@page import="dao.ImageDAO"%>
<%@page import="model.Cart" %>
<%
    ProductDAO productDAO = new ProductDAO();
    ProducerDAO producerDAO = new ProducerDAO();
    ScreensizeDAO screensizeDAO = new ScreensizeDAO();
    CpuDAO cpuDAO = new CpuDAO();
    RamDAO ramDAO = new RamDAO();
    StorageDAO storageDAO = new StorageDAO();
    ImageDAO imageDAO = new ImageDAO();
    Product product = new Product();
    String productID = "";
    if(request.getParameter("product") != null)
        {
            productID = request.getParameter("product");
            product = productDAO.getProduct(Long.parseLong(productID));
        }
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
        session.setAttribute("cart", cart);
    }
    MoneyFormat formatter = new MoneyFormat();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>                
        <title>Chi tiết - <%=product.getProductMetaTitle()%></title>
        <meta name="keywords" content="<%=product.getProductMetaKeywords()%>">
        <meta name="description" content="<%=product.getProductMetaDescription()%>">
        <jsp:include page = "layout/head.jsp"></jsp:include>
        <div id="fb-root"></div>
        <script>(function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.8&appId=190240264706946";
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));</script>
    </head>
    <body>

        <div id="page-wrapper">
        <jsp:include page = "layout/header.jsp"></jsp:include>
        <div id="site-content">
        <!--MAIN
        =========================================================================== -->
        <div id="main">
                <section class="page_title">
                    <h1 class="text-center"><%=product.getProductName()%></h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <%
                                    for (Producer c : producerDAO.getProducerNamebyID(product.getProducerID()))
                                    {
                                    %>
                                    <li>
                                        <a href="product.jsp?producer=<%=product.getProducerID()%>&pages=1" title="<%=c.getProducerName()%>"><%=c.getProducerName()%></a>
                                    </li>
                                    <%}
                                    %>
                                    <li class="active  breadcrumb-title"><%=product.getProductName()%></li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    function validate(evt) {
                        var theEvent = evt || window.event;
                        var key = theEvent.keyCode || theEvent.which;
                        key = String.fromCharCode( key );
                        var regex = /[0-9]|\./;
                        if( !regex.test(key) ) {
                            theEvent.returnValue = false;
                            if(theEvent.preventDefault) theEvent.preventDefault();
                        }
                    }
                </script>
                <section class="mtb25">
                    <div class="container">
                        <div class="row">
                            <div class="product-detail" itemscope itemtype="http://schema.org/Product">
<!--                                <meta itemprop="url" content="//ranger-theme.bizwebvietnam.net/sopha-giuong-co-dien">-->
                                <meta itemprop="image" content="./images/product/<%=product.getProductImage()%>">
                                <meta itemprop="shop-currency" content="VND">
                                <form action="CartServlet?command=plus&productID=<%=product.getProductID()%>" method="post" class="product_form_class">
                                    <div class="product-detail-left col-md-6">
                                        <div class="popup-gallery">
                                            <div class="row">
                                                <div class="col-xs-2 slick-item">
                                                    <div class="overflow-thumbnails-carousel">
                                                        <ul class="thumbnails-carousel owl-carousel">
                                                            <%
                                                            for(Image image : imageDAO.getListImageByProduct(Long.parseLong(productID)))
                                                            {
                                                            %>
                                                            <li>
                                                                <a href="./images/product/<%=image.getImageImage()%>" data-image="./images/product/<%=image.getImageImage()%>" data-zoom-image="./images/product/<%=image.getImageImage()%>">
                                                                    <img src="./images/product/<%=image.getImageImage()%>" title="<%=image.getImageAlt()%>"
                                                                         alt="<%=image.getImageAlt()%>" />
                                                                </a>
                                                            </li>
                                                            <% } %>
                                                            <div class="owl-controls clickable" style="display: none;">
                                                                <div class="owl-pagination">
                                                                    <div class="owl-page active"><span class=""></span></div>
                                                                </div>
                                                                <div class="owl-buttons">
                                                                    <div class="owl-prev"><i class="fa fa-angle-left"></i></div>
                                                                    <div class="owl-next"><i class="fa fa-angle-right"></i></div>
                                                                </div>
                                                            </div>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="col-xs-10">
                                                    <div class="product-image inner-cloud-zoom">
                                                        <a href="./images/product/<%=product.getProductImage()%>" title="" id="ex1">
                                                            <img src="./images/product/<%=product.getProductImage()%>" alt="" id="image" data-zoom-image="./images/product/<%=product.getProductImage()%>"
                                                                 alt="<%=product.getProductName()%>" />
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="product-detail-right col-md-6">
                                        <div class="">
                                            <h2 itemprop="name" class="product-name"><%=product.getProductName()%></h2>
                                            <% for (Cpu cpu : cpuDAO.getCpuNameID(product.getCpuID()))  { %>
                                            <div class="description">Bộ xử lý: <%=cpu.getCpuName()%>, <%=product.getProductCpuDetail()%></div>
                                            <%  }  %>                                               
                                            <%for (Ram ram : ramDAO.getRamNameID(product.getRamID())){ %>
                                            <div class="description">Bộ nhớ RAM: <%=ram.getRamName()%></div>
                                            <%}%>
                                            <%for (Storage storage : storageDAO.getStorageNameID(product.getStorageID())){ %>
                                            <div class="description">Ổ cứng: <%=storage.getStorageName()%></div>
                                            <%}%>
                                            <div class="description">Chipset đồ họa: <%=product.getProductVGA()%></div>
                                            <span class="product-price">
                                                <b itemprop="price" class="productminprice"><%=formatter.format(product.getProductPriceReal())%></b>
                                                <% if(product.getProductSale() > 0 ){ %>
                                                <del><%=formatter.format(product.getProductPrice())%></del>
                                                <% }%>
                                            </span>
                                            <div class="col-sm-12 no-padding-lr quantity_cartbtn ">
                                                <div class="product_cart_btn">
                                                    <button class="product-action btn-red addtocart add-to-cart btn btn-default btn-lg" type="submit" id="button-cart">MUA NGAY</button>

                                                </div>
                                            </div>
                                        </div>
                                        <div class="addthis">
                                            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5620cf1235df3004" async="async"></script>
                                            <div class="addthis_native_toolbox"></div>
                                        </div>
                                    </div>
                                </form>
                                <div class="mtb25 section-product-tabs col-md-12">
                                    <div role="tabpanel" class="product-tab-wrapper">
                                        <!-- Nav tabs -->
                                        <ul class="nav nav-tabs product-tab-info" role="tablist">
                                            <li role="presentation" class="active">
                                                <a href="#product_top_detail" aria-controls="home" role="tab" data-toggle="tab">Thông tin sản phẩm</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#product_info" aria-controls="tab" role="tab" data-toggle="tab">Thông số kỹ thuật</a>
                                            </li>
                                            <li role="presentation">
                                                <a href="#product_cmt" aria-controls="tab" role="tab" data-toggle="tab">Bình luận</a>
                                            </li>
                                        </ul>
                                        <!-- Tab panes -->
                                        <div class="tab-content product-tab-content">
                                            <div role="tabpanel" class="tab-pane active" id="product_top_detail">
                                                <p style="color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: normal;"><%=product.getProductContent()%></p>
                                                <!--<p style="color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: normal;">Tab 1</p>
                                                <p style="color: rgb(0, 0, 0); font-family: Arial, Verdana, sans-serif; font-size: 14px; line-height: normal; text-align: center;"><img src="./images/product/<%=product.getProductImage()%>" /></p> -->
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="product_info">  
                                                <table width="100%" class="table table-hover">
                                                    <tbody>
                                                        <tr id="row_1" class="odd" role="row">
                                                            <td colspan=2 width="30%" class="danger sorting_1" >BỘ XỬ LÝ</td>    
                                                        </tr>                                
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td width="30%" class="sorting_1">Công nghệ CPU</td>
                                                                        <% for (Cpu cpu : cpuDAO.getCpuNameID(product.getCpuID()))  { %>
                                                                        <td><%=cpu.getCpuName()%></td>
                                                                        <%  }  %>
                                                                    </tr>
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td width="30%" class="sorting_1">Loại CPU</td>
                                                                        <td><%=product.getProductCpuDetail()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >BỘ NHỚ</td>
                                                                    </tr>
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td width="30%" class="sorting_1">RAM</td>
                                                                        <%
                                                                        for (Ram ram : ramDAO.getRamNameID(product.getRamID()))
                                                                        {
                                                                        %>
                                                                        <td><%=ram.getRamName()%></td>
                                                                        <%
                                                                        }
                                                                        %>
                                                                    </tr>
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td width="30%" class="sorting_1">Loại RAM</td>
                                                                        <td><%=product.getProductRamDetail()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >ĐĨA CỨNG</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Ổ cứng</td>
                                                                    <%
                                                                    for (Storage storage : storageDAO.getStorageNameID(product.getStorageID()))
                                                                    {
                                                                    %>
                                                                    <td><%=storage.getStorageName()%></td>
                                                                    <%
                                                                    }
                                                                    %>
                                                                  </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Loại ổ đĩa</td>
                                                                    <td><%=product.getProductStorageDetail()%></td>
                                                                  </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >MÀN HÌNH</td>
                                                                    </tr>
                                                                  <tr>
                                                                    <td style="width: 30%;">Kích thước</td>                                                                    
                                                                    <td><%=product.getProductScreen()%> Inch</td>                                                                    
                                                                  </tr>
                                                                  <tr>
                                                                    <td style="width: 30%;">Thông tin thêm</td>
                                                                    <td><%=product.getProductScreenDetail()%></td>
                                                                  </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >ĐỒ HỌA</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Chipset đồ họa</td>
                                                                    <td><%=product.getProductVGA()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >ÂM THANH</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Chuẩn âm thanh</td>
                                                                    <td><%=product.getProductSound()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >ĐĨA QUANG</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Loại đĩa hổ trợ</td>
                                                                    <td><%=product.getProductDVD()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >CỔNG GIAO TIẾP</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Cổng giao tiếp</td>
                                                                    <td><%=product.getProductConnect()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >GIAO TIẾP MẠNG</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">LAN</td>
                                                                    <td><%=product.getProductLAN()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td style="width: 30%;">Chuyển Wifi</td>
                                                                      <td><%=product.getProductWifi()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td style="width: 30%;">Kết nối không dây khác</td>
                                                                      <td><%=product.getProductWireless()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >CARD READER</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Khe đọc thẻ nhớ</td>
                                                                    <td><%=product.getProductCardReader()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >WEBCAM</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Độ phân giải WC</td>
                                                                    <td><%=product.getProductWebcam()%></td>
                                                                    </tr>  
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >PIN/BATTERY</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Thông tin Pin</td>
                                                                    <td><%=product.getProductPin()%></td>
                                                                    </tr>
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >HỆ ĐIỀU HÀNH</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Hệ điều hành</td>
                                                                    <td><%=product.getProductOS()%></td>
                                                                    </tr> 
                                                                    
                                                                    <tr id="row_1" class="odd" role="row">
                                                                        <td colspan=2 width="30%" class="danger sorting_1" >KÍCH THƯỚC & TRỌNG LƯỢNG</td>
                                                                    </tr>
                                                                    <tr>
                                                                    <td style="width: 30%;">Kích thước</td>
                                                                    <td><%=product.getProductSize()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td style="width: 30%;">Trọng lượng</td>
                                                                      <td><%=product.getProductWeight()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td style="width: 30%;">Chất liệu</td>
                                                                      <td><%=product.getProductMaterial()%></td>
                                                                    </tr>
                                                    </tbody>
                                                </table>                                               
                                                
                                            </div>
                                            <div role="tabpanel" class="tab-pane" id="product_cmt">
                                                <p>
                                                <div class="fb-comments" data-href="http://localhost:8080/detail.jsp?product=<%=product.getProductID()%>" data-width="100%" data-numposts="5"></div>
                                            </p>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <section class="featured-products section_related_products mtb25">
                                    <h3 class="related_products_title activities_title text-center padding-lr-15"><a href="/" title="Sản phẩm liên quan">Sản phẩm liên quan</a></h3>
                                    <p class="related_products_description activities_description text-center padding-lr-15 hidden-xs">Chúng tôi mang đến những sản phẩm với chất lượng cao nhất và dịch vụ hoàn hảo nhất cho mọi khách hàng</p>
                                    <div id="owl-demo-featured-products" class="owl-carousel owl-theme">
                                        <%
                                            for(Product p : productDAO.getListProductByCategory(productDAO.getProduct(Long.parseLong(productID)).getCategoryID()))
                                            {
                                        %>
                                        <div class="item">
                                            <div class="col-md-12">
                                                <div class="product_item">
                                                    <form action="CartServlet?command=plus&productID=<%=p.getProductID()%>" class="product_item_form" method="post">
                                                        <div class="product-gird">
                                                            <div class="product-img-parent">
                                                                <% if(p.getProductSale() > 0 ){ %>
                                                                <div class="sale_tag">- <%=p.getProductSale()%>%</div>
                                                                <% }%>
                                                                <a class="product-img" href="detail.jsp?product=<%=p.getProductID()%>" title="<%=p.getProductName()%>">
                                                                    <img class="product-img-first" src="./images/product/<%=p.getProductImage()%>" alt="<%=p.getProductName()%>">
                                                                </a>
                                                                <div class="product-action-btn">
                                                                    <div class="btn-group" role="group" aria-label="Basic example">
                                                                        <a class="btn btn-default btn-lg addtocart" href="CartServlet?command=plus&productID=<%=p.getProductID()%>">CHỌN SẢN PHẨM</a>
                                                                        <a href="detail.jsp?product=<%=p.getProductID()%>" class="btn btn-default btn-black btn-lg">CHI TIẾT</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <span class="product-price text-center">
                                                                <b class="productminprice"><%=formatter.format(p.getProductPriceReal())%></b>
                                                                <% if(p.getProductSale() > 0 ){ %>
                                                                <del><%=formatter.format(p.getProductPrice())%></del>
                                                                <% }%>
                                                            </span>
                                                            <h3 class="product-name"><a href="detail.jsp?product=<%=p.getProductID()%>" title="<%=p.getProductName()%>"><%=p.getProductName()%></a></h3>
                                                            <div style="display:none">
                                                                <select id="product-selectors" name="variantId" style="display:none">
                                                                    <option lỗi liquid unknown operator roduct value="2111409">Ghi - <%=formatter.format(p.getProductPrice())%></option>
                                                                    <option lỗi liquid unknown operator roduct value="2111410">Xanh - <%=formatter.format(p.getProductPrice())%></option>
                                                                </select>
                                                            </div>
                                                            <!--số lượng-->
                                                            <div style="display:none">
                                                                <div class="input-group quantity">
                                                                    <input type="text" class="form-control" name="quantity" id="quantity_wanted" size="2" value="1" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- End .product-gird -->
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            }                                        
                                        %>
                                    </div>
                                </section>
                            </div>
                        </div>
                    </div>
                </section>
<!--                <script src='//bizweb.dktcdn.net/assets/themes_support/option_selection.js?4' type='text/javascript'></script>-->
                <script src='./js/option_selection.js' type='text/javascript'></script>
                <script>
                    var selectCallback = function(variant, selector) {
                        var addToCart    = jQuery('.product-detail-right .add-to-cart'),
                            productPrice = jQuery('.product-detail-right .product-price .productminprice'),
                            comparePrice = jQuery('.product-detail-right .product-price .old_price'),
                            Productpuk   = jQuery('.product-detail-right .puk');
                        if (variant) {
                            if (variant.available) {
                                addToCart.removeClass('disabled').removeAttr('disabled').text('MUA NGAY');
                            } else {
                                addToCart.text('HẾT HÀNG').addClass('disabled').attr('disabled', 'disabled');
                                productPrice.html('HẾT HÀNG');
                            }
                            // Regardless of stock, update the product price
                            productPrice.html(Bizweb.formatMoney(variant.price, "{{amount_no_decimals_with_comma_separator}}₫"));
                            Productpuk.html(variant.sku);
                            // Also update and show the product's compare price if necessary
                            if ( variant.compare_at_price > variant.price ) {
                                comparePrice.html(Bizweb.formatMoney(variant.compare_at_price, "{{amount_no_decimals_with_comma_separator}}₫")).show();
                            } else {
                                comparePrice.hide();
                            }
                        }
                        else {
                            addToCart.text('HẾT HÀNG').addClass('disabled').attr('disabled', 'disabled');
                            productPrice.html('HẾT HÀNG');
                        }
                        if (variant && variant.image) {
                            var originalImage = $(".product-image img");
                            var newImage = variant.image;
                            var element = originalImage[0];
                            Bizweb.Image.switchImage(newImage, element, function (newImageSizedSrc, newImage, element) {
                                //if image different size > fit new zoomContainer size = image size
                                //switchImage
                                $(element).parents('a').attr('href', newImageSizedSrc);
                                $(element).attr('src', newImageSizedSrc);

                                if ($(window).width() > 767) {
                                    $('.zoomContainer').remove();
                                    $("#image").removeData('elevateZoom');
                                    $("#image").attr('src', newImageSizedSrc);
                                    $("#image").data('zoom-image', newImageSizedSrc);
                                    $("#image").elevateZoom({
                                        zoomType : "inner",
                                        cursor: "crosshair"
                                    });//-- end. elevateZoom
                                }
                            });//-- End Bizweb.Image.switchImage
                        }//-- End if (variant && variant.image)
                    };//                    
                </script>
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
