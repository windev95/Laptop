<%-- 
    Document   : all
    Created on : Dec 1, 2016, 10:24:43 AM
    Author     : BoyIt
--%>
<%@page import="model.Product" %>
<%@page import="dao.ProductDAO" %>
<%@page import="model.Cart" %>
<%@page import="helpers.MoneyFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vn">
    <head>        
        <title>Trang chủ  </title>
        <jsp:include page = "layout/head.jsp"></jsp:include>
    </head>
    <body>
        <%
        ProductDAO productDAO = new ProductDAO();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            session.setAttribute("cart", cart);
        }
        MoneyFormat formatter = new MoneyFormat();
        %>
        
        <div id="page-wrapper">
        <jsp:include page = "layout/header.jsp"></jsp:include>
        <!-- SITE CONTENT
        =========================================================================== -->
        <div id="site-content">
            <div id="main">
                <jsp:include page = "layout/slider.jsp"></jsp:include> 
                <jsp:include page = "layout/contact.jsp"></jsp:include>
                <section class="featured_projects">
                    <div class="container">
                        <div class="row ">
                            <div class="col-md-12">
                                <h2 class="activities_title text-center">Sản phẩm bán chạy</h2>
                                <p class="activities_description text-center">Bạn có thể thấy dưới đây là hơn 100 sản phẩm bán chạy nhất tại Shop của chúng tôi.</p>
                            </div>
                            <div>
                                <div class="tablist_parent col-md-12">
                                    <!-- Nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Sản phẩm mới</a></li>
                                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">GIÁ TỐT</a></li>
                                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Gaming</a></li>
                                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Notebook</a></li>
                                        <li role="presentation"><a href="#settings2" aria-controls="settings2" role="tab" data-toggle="tab">Ultrabook</a></li>
                                        <li role="presentation"><a href="#settings3" aria-controls="settings3" role="tab" data-toggle="tab">2 in 1</a></li>
                                        <li role="presentation" class="dropdown">
                                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                                                Dự án <i class="fa fa-angle-down pull-right"></i>
                                            </a>
                                            <ul class="dropdown-menu">
                                                <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Sản phẩm mới</a></li>
                                                <li role="presentation"><a href="#profile" id="profile_tab" aria-controls="profile" role="tab" data-toggle="tab">GIÁ TỐT</a></li>
                                                <li role="presentation"><a href="#messages" id="messages_tab" aria-controls="messages" role="tab" data-toggle="tab">Gaming</a></li>
                                                <li role="presentation"><a href="#settings" id="settings_tab" aria-controls="settings" role="tab" data-toggle="tab">Notebook</a></li>
                                                <li role="presentation"><a href="#settings2" id="settings2_tab" aria-controls="settings2" role="tab" data-toggle="tab">Ultrabook</a></li>
                                                <li role="presentation"><a href="#settings3" id="settings3_tab" aria-controls="settings3" role="tab" data-toggle="tab">2 in 1</a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>

                                <!-- Tab panes -->
                                <div class="tab-content">
<!--                                    Sản phẩm mới-->
                                    <div role="tabpanel" class="tab-pane active" id="home">
                                        <div class="featured_projects_hidden_xs">
                                            <%
                                                for(Product pnew : productDAO.getListProductNew())
                                                {
                                            %>
                                            <div class="col-sm-6 col-md-4 projects-item-content">
                                                <div class="projects-item">
                                                    <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                    <div class="projects-item-info">
                                                        <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                        <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% }%>
                                        </div><!-- End. Item hidden-xs-->
                                        <div class="featured_projects_show_xs">
                                            <div id="owl-demo-featured_projects" class="owl-carousel owl-theme">
                                                <%
                                                for(Product pnew : productDAO.getListProductNew())
                                                {
                                                %>
                                                <div class="item">
                                                    <div class="col-xs-12 projects-item-content">
                                                        <div class="projects-item">
                                                            <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                            <div class="projects-item-info">
                                                                <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                                <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>

                                            </div>
                                        </div>
                                        <div class="col-md-12 text-center projects-item-content">
                                            <a href="/all.jsp" class="projects-item-content-more btn btn-default">Xem thêm</a>
                                        </div>
                                    </div>
                                                
<!--                                    Sản phẩm giá tốt-->
                                    <div role="tabpanel" class="tab-pane" id="profile">
                                        <div class="featured_projects_hidden_xs">
                                            <%
                                                for(Product pnew : productDAO.getListProductPrice())
                                                {
                                            %>
                                            <div class="col-sm-6 col-md-4 projects-item-content">
                                                <div class="projects-item">
                                                    <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                    <div class="projects-item-info">
                                                        <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                        <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% }%>
                                        </div>
                                        <div class="featured_projects_show_xs">
                                            <div id="owl-demo-featured_projects_profile" class="owl-carousel owl-theme">

                                                <%
                                                for(Product pnew : productDAO.getListProductPrice())
                                                {
                                                %>
                                                <div class="item">
                                                    <div class="col-xs-12 projects-item-content">
                                                        <div class="projects-item">
                                                            <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                            <div class="projects-item-info">
                                                                <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                                <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>

                                            </div>
                                        </div>
                                        <div class="col-md-12 text-center projects-item-content">
                                            <a href="/all.jsp" class="projects-item-content-more btn btn-default">Xem thêm</a>
                                        </div>
                                    </div>

<!--                                     GAMING-->
                                    <div role="tabpanel" class="tab-pane" id="messages">
                                        <div class="featured_projects_hidden_xs">
                                            <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(1))
                                                {
                                            %>
                                            <div class="col-sm-6 col-md-4 projects-item-content">
                                                <div class="projects-item">
                                                    <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                    <div class="projects-item-info">
                                                        <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                        <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% }%>
                                        </div>
                                        <div class="featured_projects_show_xs">
                                            <div id="owl-demo-featured_projects_profile" class="owl-carousel owl-theme">

                                                <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(1))
                                                {
                                                %>
                                                <div class="item">
                                                    <div class="col-xs-12 projects-item-content">
                                                        <div class="projects-item">
                                                            <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                            <div class="projects-item-info">
                                                                <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                                <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>

                                            </div>
                                        </div>
                                        <div class="col-md-12 text-center projects-item-content">
                                            <a href="/product.jsp?category=1" class="projects-item-content-more btn btn-default">Xem thêm</a>
                                        </div>
                                    </div>
                                                
<!--                                     NOTEBOOK-->
                                    <div role="tabpanel" class="tab-pane" id="settings">
                                        <div class="featured_projects_hidden_xs">
                                            <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(2))
                                                {
                                            %>
                                            <div class="col-sm-6 col-md-4 projects-item-content">
                                                <div class="projects-item">
                                                    <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                    <div class="projects-item-info">
                                                        <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                        <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% }%>
                                        </div>
                                        <div class="featured_projects_show_xs">
                                            <div id="owl-demo-featured_projects_profile" class="owl-carousel owl-theme">

                                                <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(2))
                                                {
                                                %>
                                                <div class="item">
                                                    <div class="col-xs-12 projects-item-content">
                                                        <div class="projects-item">
                                                            <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                            <div class="projects-item-info">
                                                                <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                                <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>

                                            </div>
                                        </div>
                                        <div class="col-md-12 text-center projects-item-content">
                                            <a href="/product.jsp?category=2" class="projects-item-content-more btn btn-default">Xem thêm</a>
                                        </div>
                                    </div>
                                                
<!--                                     ULTRABOOK-->
                                    <div role="tabpanel" class="tab-pane" id="settings1">
                                        <div class="featured_projects_hidden_xs">
                                            <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(3))
                                                {
                                            %>
                                            <div class="col-sm-6 col-md-4 projects-item-content">
                                                <div class="projects-item">
                                                    <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                    <div class="projects-item-info">
                                                        <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                        <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% }%>
                                        </div>
                                        <div class="featured_projects_show_xs">
                                            <div id="owl-demo-featured_projects_profile" class="owl-carousel owl-theme">

                                                <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(3))
                                                {
                                                %>
                                                <div class="item">
                                                    <div class="col-xs-12 projects-item-content">
                                                        <div class="projects-item">
                                                            <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                            <div class="projects-item-info">
                                                                <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                                <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>

                                            </div>
                                        </div>
                                        <div class="col-md-12 text-center projects-item-content">
                                            <a href="/product.jsp?category=3" class="projects-item-content-more btn btn-default">Xem thêm</a>
                                        </div>
                                    </div>
                                                
<!--                                     2 IN 1-->
                                    <div role="tabpanel" class="tab-pane" id="settings2">
                                        <div class="featured_projects_hidden_xs">
                                            <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(4))
                                                {
                                            %>
                                            <div class="col-sm-6 col-md-4 projects-item-content">
                                                <div class="projects-item">
                                                    <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                    <div class="projects-item-info">
                                                        <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                        <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                    </div>
                                                </div>
                                            </div>
                                            <% }%>
                                        </div>
                                        <div class="featured_projects_show_xs">
                                            <div id="owl-demo-featured_projects_profile" class="owl-carousel owl-theme">

                                                <%
                                                for(Product pnew : productDAO.getListProductBuysByCategory(4))
                                                {
                                                %>
                                                <div class="item">
                                                    <div class="col-xs-12 projects-item-content">
                                                        <div class="projects-item">
                                                            <a href="detail.jsp?product=<%=pnew.getProductID()%>"><img src="./images/product/<%=pnew.getProductImage()%>" alt="<%=pnew.getProductName()%>"></a>
                                                            <div class="projects-item-info">
                                                                <h3 class="projects-item-title"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=pnew.getProductName()%></a></h3>
                                                                <p class="projects-item-description"><a href="detail.jsp?product=<%=pnew.getProductID()%>"><%=formatter.format(pnew.getProductPriceReal())%></a></p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <% }%>

                                            </div>
                                        </div>
                                        <div class="col-md-12 text-center projects-item-content">
                                            <a href="/product.jsp?category=4" class="projects-item-content-more btn btn-default">Xem thêm</a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="activities">
                    <div class="container">
                        <div class="row ">
                            <style>
                                .featured-products {
                                    background: url("");
                                    background-repeat: no-repeat;
                                    background-position: top center;
                                    background-size: cover;
                                    position: relative;
                                }
                            </style>
                            <h2 class="activities_title text-center padding-lr-15">Sản phẩm nổi bật</h2>
                            <p class="activities_description text-center padding-lr-15 hidden-xs">Chúng tôi mang đến những sản phẩm với chất lượng cao nhất và dịch vụ hoàn hảo nhất cho mọi khách hàng</p>
                            <div id="owl-demo-featured-products" class="owl-carousel owl-theme">
                            <%
                                for(Product p : productDAO.getListProductNoibat())
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
<!--                                                    <div style="display:none">
                                                        <select id="product-selectors" name="variantId" style="display:none">
                                                            <option lỗi liquid unknown operator roduct value="2023875">Đỏ - <%=formatter.format(p.getProductPriceReal())%></option>
                                                            <option lỗi liquid unknown operator roduct value="2023876">Trắng - <%=formatter.format(p.getProductPriceReal())%></option>
                                                        </select>
                                                    </div>-->
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
                                <% } %>
                            </div>
                        </div>
                    </div>
                </section>
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
