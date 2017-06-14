<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
  .product {
    max-width: 400px;
    box-shadow: 0 0 15px 5px #eee;
    padding: 30px;
    margin-bottom: 40px;
  }

  .product__image,
  .variant-image {
    margin: 0 !important;
  }

  .product__buy,
  .button,
  .btn {
    background: #7ab55c;
    font-size: 16px;
    padding: 0.5625em 1.875em !important;
    color: white !important;
    text-decoration: none;
    border-radius: 3px;
    display: inline-block;
    border: none;
    text-shadow: none;
    font-weight: normal;
    transition: 150ms ease-in-out;
  }

  .product__buy:hover,
  .button:hover,
  .btn:hover {
    text-decoration: none;
    background: #6aa74c;
    text-shadow: none;
  }

  .btn--cart-checkout {
    width: 100%;
    text-align: center;
    cursor: pointer;
  }

  .product .variant-title,
  .product .variant-price {
    margin: 0 0 10px !important;
  }

  .variant-selectors {
    margin-bottom: 20px;
  }

  .variant-selectors select {
    width: 100%;
  }

  .cart {
    position: fixed;
    width: 100%;
    max-width: 350px;
    height: 100%;
    right: 0;
    top: 0;
    background: white;
    border-radius: 1px;
    box-shadow: 0 0 0 rgba(0, 0, 0, 0.1);
    transform: translateX(100%);
    transition: box-shadow 0.2s ease-out, transform 0.2s ease-out;
  }

  .cart.js-active {
    transform: translateX(0);
    box-shadow: -5px 0 5px rgba(0, 0, 0, 0.1);
  }

  .cart-section {
    position: relative;
    padding: 20px;
  }

  .cart-section--top {
    z-index: 5;
  }

  h2.cart-title {
    display: inline-block;
    font-weight: 400;
    font-size: 18px;
    line-height: 1.5;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    max-width: 90%;
    margin-top: 0;
    margin-bottom: 0;
  }

  .btn--close {
    position: absolute;
    right: 9px;
    top: 8px;
    font-size: 35px;
    color: #999;
    border: none;
    background: transparent;
    transition: transform 100ms ease;
    cursor: pointer;
    &:hover {
      transform: scale(1.2);
      color: #666;
    }
  }

  .cart-form {
    position: absolute;
    height: 100%;
    width: 100%;
    top: 0;
    padding: 70px 0 140px 0;
  }

  .cart-item-container {
    height: 100%;
    position: relative;
    overflow-x: hidden;
    overflow-y: auto;
    -webkit-overflow-scrolling: touch;
    perspective: 400px;
    perspective-origin: 50% 0px;
  }


  .cart-item {
    margin-bottom: 20px;
    overflow: hidden;
    backface-visibility: visible;
    min-height: 65px;
    position: relative;
    opacity: 1;
    transition: opacity 0.2s ease-in-out;  
  }

  .cart-item.js-hidden {
    opacity: 0;
  }

  .cart-item.js-working:after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(255,255,255,0.5);
    z-index: 2;
  }

  .cart-item__img {
    width: 65px;
    height: 65px;
    border-radius: 3px;
    background-size: contain;
    background-repeat: no-repeat;
    background-position: center center;
    background-color: #e5e5e5;
    position: absolute;
  }

  .cart-item__content {
    width: 100%;
    padding-left: 75px;
  }

  .cart-item__content-row {
    margin-bottom: 5px;
  }

  .cart-item__variant-title {
    float: right;
    font-weight: bold;
    font-size: 11px;
    line-height: 17px;
    color: #767676;
  }

  .cart-item__quantity-container {
    border: 1px solid #767676;
    float: left;
    border-radius: 3px;
  }

  .quantity-decrement, .quantity-increment {
    color: #767676;
    display: block;
    float: left;
    height: 21px;
    line-height: 16px;
    font-family: monospace;
    width: 25px;
    padding: 0;
    border: none;
    background: transparent;
    box-shadow: none;
    cursor: pointer;
    font-size: 18px;
    text-align: center;
  }

  .cart-item__quantity {
    color: black;
    width: 38px;
    height: 21px;
    font-size: inherit;
    border: none;
    text-align: center;
    -moz-appearance: textfield;
    background: transparent;
    border-left: 1px solid #767676;
    border-right: 1px solid #767676;
    display: block;
    float: left;
    padding: 0;
    border-radius: 0;
  }

  input[type=number]::-webkit-inner-spin-button,
  input[type=number]::-webkit-outer-spin-button {
    -webkit-appearance: none;
    margin: 0;
  }

  .cart-item__price {
    line-height: 23px;
    float: right;
    font-weight: bold;
  }

  .cart-bottom {
    border-top: 1px solid #e5e5e5;
  }

  .cart-info {
    padding: 15px 20px 10px;
  }

  .cart-info__total {
    float: left;
    text-transform: uppercase;
  }

  .cart-info__small {
    font-size: 11px;
  }

  .cart-info__pricing {
    float: right;
  }

  .cart-discount-notice {
    // color: $color-title;
    margin-bottom: 10px;
  }

  .cart-actions-container {
    padding-top: 5px;
  }

  .pricing {
    margin-left: 5px;
    font-size: 16px;
    color: black;
  }
</style>
<script src="shopify-buy.umd.polyfilled.min.js" type="text/javascript"></script>
        <script src="//code.jquery.com/jquery-2.2.1.min.js"></script>
        <script src="index.js" type="text/javascript"></script>
  
  
  <script id="CartItemTemplate" type="text/template">
    <div class="cart-item">
      <div class="cart-item__img"></div>
      <div class="cart-item__content">
        <div class="cart-item__content-row">
          <div class="cart-item__variant-title"></div>
          <span class="cart-item__title"></span>
        </div>
        <div class="cart-item__content-row">
          <div class="cart-item__quantity-container">
            <button class="btn--seamless quantity-decrement" type="button"><span>-</span><span class="visuallyhidden">Decrement</span></button>
            <input class="cart-item__quantity" type="number" min="0" aria-label="Quantity">
            <button class="btn--seamless quantity-increment" type="button"><span>+</span><span class="visuallyhidden">Increment</span></button>
          </div>
          <span class="cart-item__price"></span>
        </div>
      </div>
    </div>
  </script>
    </head>
    <body>
  




        <div class="cart js-active" style="z-index: 1000;">

  <!-- .cart-section begin // cart header -->
  <div class="cart-section cart-section--top">
    <h2 class="cart-title">Your cart</h2>
    <button class="btn--close">
      <span aria-role="hidden">×</span>
      <span class="visuallyhidden">Close</span>
    </button>
  </div>
  <!-- .cart-section end -->

  <!-- .cart-form begin // cart body -->
  <div class="cart-form">
    <div class="cart-item-container cart-section">
      <!-- cart items will be added here -->
    </div>

    <!-- .cart-bottom begin -->
    <div class="cart-bottom">
      <div class="cart-info clearfix cart-section">
        <div class="type--caps cart-info__total cart-info__small">Total</div>
        <div class="cart-info__pricing">
          <span class="cart-info__small cart-info__total">CAD</span>
          <span class="pricing pricing--no-padding"></span>
        </div>
      </div>
      <div class="cart-actions-container cart-section type--center">
        <div class="cart-discount-notice cart-info__small">Shipping and discount codes are added at checkout.</div>
        <input type="submit" class="btn btn--cart-checkout" id="checkout" name="checkout" value="Checkout">
      </div>
    </div>
    <!-- .cart-bottom end -->

  </div>
  <!-- .cart-form end -->

</div>



        <section class="brand-slide">
	<div class="container">
		<div class="mdl-full-tle">
                        <img src="https://help.shopify.com/assets/shopify-full-color-black.svg" style="width: 150px;">
                        <!-- .cart-tab start -->
  <button class="btn btn--cart-tab js-prevent-cart-listener">
    <span class="btn__counter"></span>
    <svg xmlns="http://www.w3.org/2000/svg" class="icon-cart icon-cart--side" viewBox="0 0 25 25" enable-background="new 0 0 25 25"><g fill="#fff"><path d="M24.6 3.6c-.3-.4-.8-.6-1.3-.6h-18.4l-.1-.5c-.3-1.5-1.7-1.5-2.5-1.5h-1.3c-.6 0-1 .4-1 1s.4 1 1 1h1.8l3 13.6c.2 1.2 1.3 2.4 2.5 2.4h12.7c.6 0 1-.4 1-1s-.4-1-1-1h-12.7c-.2 0-.5-.4-.6-.8l-.2-1.2h12.6c1.3 0 2.3-1.4 2.5-2.4l2.4-7.4v-.2c.1-.5-.1-1-.4-1.4zm-4 8.5v.2c-.1.3-.4.8-.5.8h-13l-1.8-8.1h17.6l-2.3 7.1z"></path><circle cx="9" cy="22" r="2"></circle><circle cx="19" cy="22" r="2"></circle></g></svg>
  </button>
		</div>
		<div class="brand-owl">
			<div class="item">
			        <div class="product" id="buy-button-1">
    <img class="variant-image">
    <h1 class="product-title"></h1>
    <h2 class="variant-title"></h2>
    <h2 class="variant-price"></h2>
    <!--<div class="variant-selectors"></div>-->
    <button class="btn buy-button js-prevent-cart-listener">Add To Cart</button>
  </div>
			</div>
			<div class="item">
							        <div class="product" id="buy-button-1">
    <img class="variant-image">
    <h1 class="product-title"></h1>
    <h2 class="variant-title"></h2>
    <h2 class="variant-price"></h2>
    <!--<div class="variant-selectors"></div>-->
    <button class="btn buy-button js-prevent-cart-listener">Add To Cart</button>
  </div>
			</div>
			<div class="item">
							        <div class="product" id="buy-button-1">
    <img class="variant-image">
    <h1 class="product-title"></h1>
    <h2 class="variant-title"></h2>
    <h2 class="variant-price"></h2>
    <!--<div class="variant-selectors"></div>-->
    <button class="btn buy-button js-prevent-cart-listener">Add To Cart</button>
  </div>
			</div>
			<div class="item">
				<a href="#">
					<img src="./images/brand-img4839b.png" alt="brand 4">
				</a>
			</div>
			<div class="item">
				<a href="#">
					<img src="./images/brand-img5839b.png" alt="brand 5">
				</a>
			</div>
			<div class="item">
				<a href="#">
					<img src="./images/brand-img6839b.png" alt="Brand 6">
				</a>
			</div>
			<div class="item">
				<a href="#">
					<img src="./images/brand-img7839b.png" alt="brand 7">
				</a>
			</div>
			<div class="item">
				<a href="#">
					<img src="./images/brand-img8839b.png" alt="Brand 8">
				</a>
			</div>
							
		</div>
	</div>
</section>
          <script>
    (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
    })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
    ga('create', 'UA-49178120-19', 'auto');
    ga('send', 'pageview');
  </script>


    </body>
</html>
