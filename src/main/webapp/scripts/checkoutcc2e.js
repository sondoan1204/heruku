window.Bizweb || (window.Bizweb = {});
(function () {
    Bizweb.Utility = {
        getParameter: function (name) {
            name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
            var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
                results = regex.exec(location.search);
            return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
        }
    }
    Bizweb.Checkout = function () {
        function Checkout(e, options) {
            if(!options)
                options = {};

            this.ele = e;
            this.existCode= options.existCode;
            this.totalOrderItemPrice = options.totalOrderItemPrice;
            this.discount = options.discount;
            this.shippingFee = options.shippingFee;
            this.freeShipping = options.freeShipping;
            this.requiresShipping = options.requiresShipping;
            this.code = options.code;
            this.inValidCode = false;
            this.discountShipping = false;
            this.shippingMethods = [];
            this.loadedShippingMethods = false;
            this.settingLanguage = options.settingLanguage;
            this.invalidEmail = false;
            this.moneyFormat = options.moneyFormat;
            this.discountLabel = options.discountLabel;
            this.districtPolicy = options.districtPolicy;
            var that = this;

            $("[name='code']").keyup(function(event){
                if(event.keyCode == 13){
                    that.caculateShippingFee();
                    event.preventDefault();
                    return false;
                }
            });

            var coupon = Bizweb.Utility.getParameter("coupon");
            if(coupon)
                this.code = coupon;
        };

        Checkout.prototype.changeOtherAddress = function(element){
            element.value = this.otherAddress;
            if(this.otherAddress){
                $("select[name='ShippingProvinceId']").trigger("change");
            }else{
                $("select[name='BillingProvinceId']").trigger("change");
            }
        }

        Checkout.prototype.shippingProviceChange = function(){
            if(this.otherAddress)
            {
                var that = this;
                if(this.show_district)
                {
                    this.showShippingDistrict();
                }
                else {
                    this.caculateShippingFee();
                }
            }else{
                var initDistrict = $("select[name='ShippingDistrictId'] >option").length > 0 ? false : true;
                if(initDistrict){
                    if(this.show_district)
                    {
                        this.showShippingDistrict();
                    }
                }
            }
        }

        Checkout.prototype.showShippingDistrict = function(){
            var that = this;
            $.ajax({
                url:"/checkout/getdistricts?provinceId=" + that.ShippingProvinceId,
                async: false,
                success:function(data)
                {
                    var html = "";
                    if(that.districtPolicy == "optional")
                        html = "<option value='0'>--- Chọn quận huyện ---</option>";

                    for(var index in data)
                    {
                        var district = data[index];
                        html += "<option value='" + district.id + "'>" + district.name + "</option>"
                    }
                    $("select[name='ShippingDistrictId']").empty().html(html);
                    $("select[name='ShippingDistrictId']").trigger("change");
                }
            });
        }

        Checkout.prototype.billingProviceChange = function(){
            if(!this.otherAddress)
            {
                var that = this;
                if(this.show_district)
                {
                    $.ajax({
                        url:"/checkout/getdistricts?provinceId=" + that.BillingProvinceId,
                        async: false,
                        success:function(data)
                        {
                            var html = "";
                            if(that.districtPolicy == "optional")
                                html = "<option value='0'>--- Chọn quận huyện ---</option>";

                            for(var index in data)
                            {
                                var district = data[index];
                                html += "<option value='" + district.id + "'>" + district.name + "</option>"
                            }
                            $("select[name='BillingDistrictId']").empty().html(html);
                            $("select[name='BillingDistrictId']").trigger("change");
                        }
                    });
                }
                else {
                    this.caculateShippingFee();
                }
            }
        }

        Checkout.prototype.shippingDistrictChange = function(){
            if(this.otherAddress)
            {
                this.caculateShippingFee();
            }
        }

        Checkout.prototype.billingDistrictChange = function(){
            if(!this.otherAddress)
            {
                this.caculateShippingFee();
            }
        }

        Checkout.prototype.changeShippingMethod = function(){
            var shippingFee = parseFloat( $("[name='ShippingMethod'] option:selected").attr("fee"));
            if(this.discountShipping){
                if(shippingFee <= 0){
                    this.freeShipping = true;
                    this.discount = shippingFee;
                }else{
                    this.freeShipping = false;
                    this.discount = 0;
                }
            }else{
                if(shippingFee <= 0){
                    this.freeShipping = true;
                }else{
                    this.freeShipping = false;
                }
            }
            this.shippingFee = shippingFee;
        }
        Checkout.prototype.removeCode = function(){
            this.code = "";
            this.caculateShippingFee();
        }
        Checkout.prototype.caculateShippingFee = function(){
            var that = this;

            if(this.settingLanguage != "vi"){
                var provinceId = 0;
                var districtId = 0;
            }else{
                var provinceId = that.otherAddress ? that.ShippingProvinceId : that.BillingProvinceId;
                var districtId = that.otherAddress ? that.ShippingDistrictId : that.BillingDistrictId;
            }
            var shippingMethod = $("[name='ShippingMethod'] option:selected").val();

            $.ajax({
                url:"/checkout/getshipping?provinceId=" + provinceId  + "&districtId=" + districtId + "&code=" + that.code + "&shippingMethod="+shippingMethod,
                type:"GET",
                success:function(data)
                {
                    that.loadedShippingMethods = true;

                    if(data.error)
                    {
                        //Lỗi
                        that.shippingMethods = [];
                        Twine.refreshImmediately();
                    }
                    else{
                        that.existCode = data.exist_code;
                        if(that.code && !that.existCode)
                        {
                            that.inValidCode = !that.existCode;
                        }
                        else{
                            that.inValidCode = false;
                        }
                        that.freeShipping = data.free_shipping;
                        that.code= data.code;
                        that.discount = data.discount;
                        that.totalOrderItemPrice = data.total_line_item_price;
                        if(that.requiresShipping)
                            that.shippingMethods = data.shipping_methods;
                        that.discountShipping = data.discount_shipping;
                        Twine.refreshImmediately();
                        var html = "";
                        for(var index in that.shippingMethods)
                        {
                            var shippingMethod = that.shippingMethods[index];
                            html += "<option fee=" + shippingMethod.fee + " value=" + shippingMethod.value + ">" + shippingMethod.name + " - " +( shippingMethod.fee > 0 ? money(shippingMethod.fee, that.moneyFormat) : that.discountLabel )  +  "</option>"
                        }
                        $("select[name='ShippingMethod']").empty().html(html);
                        $("select[name='ShippingMethod']").val(data.shipping_method);
                        $("select[name='ShippingMethod']").trigger("change");
                    }
                }
            });
            return false;
        }

        Checkout.prototype.paymentCheckout = function(){
            var that = this;
            var $form = $("form.formCheckout");
            var prvdId = parseInt( $(".iradio_square.checked .icheck.square").attr("data-check-id"));
            if(prvdId == 2) {
                if(!$("#onepay_visa_confirm").is(":checked")) {
                    alert("Bạn chưa đồng ý với các điều khoản và dịch vụ của Onepay!");
                    return false;
                }
            } else if(prvdId == 11) {
                $form.validator('validate');
                if($(".help-block.with-errors > ul").length <= 0) {
                    var url = "/checkout";
                    var method = "POST";
                    NProgress.start();
                    $.ajax({
                        url: url,
                        type: method,
                        global: false,
                        data: $form.serialize(),
                        success: function (data) {
                            if(data.error == "0") {
                                $(".trigger-moca-error-modal").trigger("click");
                            } else if(data.error == "fail") {
                                window.location.href = "/checkout/failure/" + data.order_id;
                            } else {
                                $("#moca-modal iframe").attr("src", data.moca_iframe_url);

                                $(".trigger-moca-modal").trigger("click");
                            }
                            NProgress.done();
                        }
                    });
                }
                return false;
            }
            $form.submit();
            return true;
        }

        Checkout.prototype.toggle = function(e, container) {
            var $toggle = $(e);
            var $container = $(container);

            $container.wrapInner("<div />");

            var i = $container.height();
            var r = $container.find("> div").height();
            var n = 0 === i ? r : 0;

            $container.css("height", i);
            $container.find("> div").contents().unwrap();

            setTimeout(function(i) {
                return function() {
                    $toggle.toggleClass("open");
                    $container.toggleClass("mobile--is-expanded mobile--is-collapsed");
                    $container.addClass("mobile--transition");
                    $container.css("height", n);
                }
            }(this), 0);

            $container.one("webkitTransitionEnd oTransitionEnd otransitionend transitionend msTransitionEnd", function(t) {
                return function(t) {
                    if($container.is(t.target)) {
                        $container.removeClass("mobile--transition");
                        $container.removeAttr("style");
                    }
                }
            }(this))
        }

        return Checkout;
    }();
}).call(this)