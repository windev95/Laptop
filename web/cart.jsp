<%-- 
    Document   : cart
    Created on : Dec 3, 2016, 8:44:42 PM
    Author     : BoyIt
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="model.Item"%>
<%@page import="model.Cart" %>
<%@page import="helpers.MoneyFormat"%>
<%
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                session.setAttribute("cart", cart);
            }
            MoneyFormat formatter = new MoneyFormat();
%>
<!DOCTYPE html>
<html lang="vn">
    <head>        
        <title>Giỏ hàng</title>
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
                    <h1 class="text-center">Giỏ hàng</h1>
                </section>
                <div class="header-breadcrumb">
                    <div class="container">
                        <div class="row ">
                            <div class="col-xs-12">
                                <ol class="breadcrumb">
                                    <li><a href="/" title="Trang chủ">Trang chủ </a> </li>
                                    <li class="active breadcrumb-title">Giỏ hàng</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====================Cart Begin=============================-->
                <div class="cart_div">
                    <div class="container">
                        <div class="row">
                            <div class="cart_div_center col-xs-12 col-sm-12 col-md-12 col-lg-12">

                                <form action="/cart.jsp" method="post" id="cart_form" class="clearfix big_screen_form table-responsive">
                                    <table class="table big_screen">
                                        <!--HÀNG TIÊU ĐỀ-->
                                        <tr class="cart_title">
                                            <td class="td_item_price">STT</td>
                                            <td class="img_item_cart_title">Sản phầm</td>
                                            <td>Thông tin</td>
                                            <td class="td_item_price">Đơn giá</td>
                                            <td>Số lượng</td>
                                            <td>Thành tiền</td>
                                            <td>Xóa</td>
                                        </tr>
                                        <!--SẢN PHẨM-->
                                        <% int i = 1;%>
                                        <%for (Map.Entry<Long, Item> list : cart.getCartItems().entrySet()) {%>
                                        <tr class="cart_items">
                                            <td class="td_item_price">                                                
                                                <%= i++%>
                                            </td>
                                            <!--hình ảnh-->
                                            <td class="img_item_cart">

                                                <img height="70" width="70" alt="<%=list.getValue().getProduct().getProductName()%>" src="./images/product/<%=list.getValue().getProduct().getProductImage()%>" class="img-responsive">

                                            </td>
                                            <!--tên sản phẩm-->
                                            <td class="cart_item_title">
                                                <a href="detail.jsp?product=<%=list.getValue().getProduct().getProductID()%>" title="<%=list.getValue().getProduct().getProductName()%>"><%=list.getValue().getProduct().getProductName()%></a>
                                            </td>
                                            <!--giá-->
                                            <td class="cart_price_item"> <%=formatter.format(list.getValue().getProduct().getProductPriceReal())%></td>
                                            <!--số lượng-->
                                            <td>
                                                <input type="number" class="big_input form-control input-control" min="1" name="Lines" value="<%=list.getValue().getQuantity()%>">
                                            </td>
                                            <!--thành tiền-->
                                            <td class="cart_price_total"><%= formatter.format(list.getValue().getQuantity() * list.getValue().getProduct().getProductPriceReal()) %></td>
                                            <!--xóa-->
                                            <td class="cart_item_close"><a href="CartServlet?command=remove&productID=<%=list.getValue().getProduct().getProductID()%>" data-id="1420708"><i class="fa fa-trash"></i></a></td>
                                        </tr>
                                        <% }%>
                                    </table>
                                    <!-- FOTTER-->
                                    <div class="cart_footer col-sm-12 col-md-12 col-lg-12 no-padding-lr">
                                        <div class="cart_checkout pull-right col-xs-12 pull-right text-right no-padding-lr">
                                            <div class="cart_checkout_total pull-right text-right col-xs-12 pull-right text-right no-padding-lr">
                                                <div class="big_cart_total">
                                                    <span>Tổng tiền:</span><span><%=formatter.format(cart.total())%></span>
                                                </div>
                                            </div>
                                            <div class="cart_checkout_pay pull-right text-right col-xs-12 pull-right text-right no-padding-lr">
                                                <a class="btn btn-default shop_link" href="/all.jsp?pages=1" role="button">Mua Thêm</a>
                                                <button class="btn btn-default" name="update" type="submit">Cập nhật</button>
                                                <a class="btn btn-default" href="CartServlet?command=delete&productID=<%=0%>" type="button">Xóa hết</a>
<!--                                                <button href="CartServlet?command=removeAll" id="empty_cart_button" class="btn btn-default" value="empty_cart" name="update_cart_action" type="button">
                                                    <span><span>Xóa hết</span></span>
                                                </button>-->
                                                <a class="btn btn-default" href="/checkout.jsp" type="button">Thanh toán</a>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!--====================Cart End=============================-->
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
