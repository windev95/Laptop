<%-- 
    Document   : stric
    Created on : Nov 27, 2016, 10:37:39 PM
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
    <script src='./js/slick.js' type='text/javascript'></script>
    <script src='./js/main.js' type='text/javascript'></script>
    <script src='./js/bootstrap.js' type='text/javascript'></script>
    <script src='./js/jquery.menu-aim.js' type='text/javascript'></script>
    <script src='./js/menu.js' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/menu.js?1479951271873' type='text/javascript'></script>
<!--<script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/slick.js?1479951271873' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/main.js?1479951271873' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/bootstrap.js?1479951271873' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/jquery.menu-aim.js?1479951271873' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/menu.js?1479951271873' type='text/javascript'></script>-->
    <div class="overlayopacity"></div>
    <div class="ajax-error-modal modal">
        <div class="modal-inner">
            <div class="ajax-error-title">Lỗi</div>
            <div class="ajax-error-message"></div>
        </div>
    </div>
    <div class="ajax-success-modal modal">
        <div class="overlay"></div>
        <div class="content">
            <div class="ajax-left">
                <img class="ajax-product-image" alt="&nbsp;" src="" style="max-width:65px; max-height:100px" />
            </div>
            <div class="ajax-right">
                <p class="ajax-product-title"></p>
                <p class="success-message btn-go-to-cart"><span style="color:#000">&#10004;</span> Đã được thêm vào giỏ hàng.</p>
                <div class="actions">
                    <button onclick="window.location='/cart'" class="btn btn-red-popup">Đi tới giỏ hàng</button>
                    <button onclick="window.location='/checkout'" class="btn btn-red-popup">Thanh toán</button>
                </div>
            </div>
            <a href="javascript:void(0)" class="close-modal"><i class="fa fa-times"></i></a>
        </div>
    </div>
    <script src='./js/components.js' type='text/javascript'></script>
    <script src='./js/app.js' type='text/javascript'></script>
    <script src='./js/api.jquery.js' type='text/javascript'></script>
    <script src='./js/ajax-cart.js' type='text/javascript'></script>
<!--<script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/components.js?1479951271873' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/app.js?1479951271873' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/assets/themes_support/api.jquery.js?3' type='text/javascript'></script>
    <script src='//bizweb.dktcdn.net/100/052/640/themes/134620/assets/ajax-cart.js?1479951271873' type='text/javascript'></script>-->
    <script>
        $(document).ready(function () {
            App.init(); // init core
        });
    </script>
    <script type="text/javascript">
        Bizweb.updateCartFromForm = function (cart, cart_summary_id, cart_count_id) {

            if ((typeof cart_summary_id) === 'string') {
                var cart_summary = jQuery(cart_summary_id);
                if (cart_summary.length) {
                    // Start from scratch.
                    cart_summary.empty();
                    // Pull it all out.
                    jQuery.each(cart, function (key, value) {
                        if (key === 'items') {
                            var table = jQuery(cart_summary_id);
                            if (value.length) {
                                jQuery.each(value, function (i, item) {
                                    jQuery('<div class="control-container"><div class="row"><a class="cart-close" title="Xóa" href="javascript:void(0);" onclick="Bizweb.removeItem(' + item.variant_id + ')"><img class="item-remove" src="//bizweb.dktcdn.net/100/052/640/themes/134620/assets/itemclose.png?1479951271873"/></a><div class="col-md-10 cart-left"><img src="' + Bizweb.resizeImage(item.image, 'small') + '" /></div><div class="col-md-14 cart-right"><div class="cart-title"><a href="' + item.url + '">' + item.name + '</a></div><div class="cart-price"><i style="color:#898989;font-style: normal;">' + item.quantity + ' x </i>' + Bizweb.formatMoney(item.price, "{{amount_no_decimals_with_comma_separator}}₫") + '</div></div></div>').appendTo(table);
                                });
                                jQuery('<div class="subtotal"><span class="cart-total-right"><i style="color:#898989;font-style: normal;">TỔNG TIỀN:</i> 0₫</span></div>').appendTo(table);
                                jQuery('<div class="action"><a id="gocart" href="\/cart">Giỏ hàng</a></div>').appendTo(table);
                            }
                            else {
                                jQuery('<li><p>Không có sản phẩm nào trong giỏ hàng.</p></li>').appendTo(table);
                            }
                        }
                    });
                }
            }
            updateCartDesc(cart);
        }
        function updateCartDesc(data) {
            var $cartPrice = Bizweb.formatMoney(data.total_price, "{{amount_no_decimals_with_comma_separator}}₫");
            $('.cart-number').text(data.item_count);
        }
        Bizweb.onCartUpdate = function (cart) {
            Bizweb.updateCartFromForm(cart, '#cart-info-parent .cart-content');
        };
        $(window).load(function () {
            // Let's get the cart and show what's in it in the cart box.
            Bizweb.getCart(function (cart) {
                Bizweb.updateCartFromForm(cart, '#cart-info-parent .cart-content');
            });
        });
    </script>
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
        (function(){
            var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
            s1.async=true;
            s1.src='https://embed.tawk.to/58500409e2def07b70b0c8e2/default';
            s1.charset='UTF-8';
            s1.setAttribute('crossorigin','*');
            s0.parentNode.insertBefore(s1,s0);
    })();
    </script>
    <!--End of Tawk.to Script-->
<!--    <script lang="javascript">
        (function() {
            var pname = ( (document.title !='')? document.title : document.querySelector('h1').innerHTML );
            var ga = document.createElement('script'); 
            ga.type = 'text/javascript';
            ga.src = '//live.vnpgroup.net/js/web_client_box.php?hash=744490d02029212edbf582898c435781&data=eyJoYXNoIjoiNDc2NzEzMWZhY2M3YzNkYTQ2Y2M2NzUzNTgxNTg4ZTUiLCJzc29faWQiOjMwMjYwMDl9&pname='+pname;
            var s = document.getElementsByTagName('script');s[0].parentNode.insertBefore(ga, s[0]);})();
        </script>	-->
    </body>
</html>
