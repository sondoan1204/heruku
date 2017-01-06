$(document).ready(function() {
	
	// Cart btn click
	$('.click_to_cart').click(function() {
		document.location.href = $(this).attr('href');
	});
	
	/* Handle dropdown box */
    $(".mini-cart").parent().hover(function (){
    
        $(this).find('#cart-info-parent').stop(true, true).slideDown(300);
      
    }, function (){
      
        $(this).find('#cart-info-parent').hide();
      
    });
	
	//Contact page notification
	setTimeout(function(){
			var url = window.location.href;
            
			if(url.indexOf("contact_error_notification") > -1) {
				
			}
			else
			{			
				if(url.indexOf("contact_posted=true") > -1) {
				
				  $(".notification_contact").fadeIn(400).delay(3000).fadeOut();
				  $(".overlayopacity").fadeIn(400).delay(3000).fadeOut();
					disableScroll();
					setTimeout(function(){
						enableScroll();
					}, 3000);
				}
			}
		
        }, 1000);
	
	//Dropdown cart	
	$("#mini-cart").hover(function() {
		if (!$("#dropdown-cart").is(":visible")) {
			$("#dropdown-cart").slideDown("300");
		}
	});
	$("#cart-dropdown").mouseleave(function() {
		$("#dropdown-cart").slideUp("200");
	});

	$('.prod-coll-1-owl').owlCarousel({
		navigation : true,
		autoPlay: false,
		slideSpeed : 3000,
		paginationSpeed : 400,
		singleItem:true,
		pagination: false,
		navigationText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>']
	});
	$('.prod-coll-2-owl').owlCarousel({
		items : 3, 
		itemsDesktop : [1000,3], 
		itemsDesktopSmall : [900,3], 
		itemsTablet: [600,2], 
		itemsMobile: [400,1],
		navigation : true,
		paginationSpeed : 400,
		pagination: false,
		navigationText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>']
	});
	
	$('.prod-coll-3-owl').owlCarousel({
		items : 3, 
		itemsDesktop : [1000,3], 
		itemsDesktopSmall : [900,3], 
		itemsTablet: [600,2], 
		itemsMobile: [400,1],
		navigation : true,
		paginationSpeed : 400,
		pagination: false,
		navigationText: ['<i class="fa fa-arrow-left"></i>','<i class="fa fa-arrow-right"></i>']
	});
	$('.prod-coll-4-owl').owlCarousel({
		items : 4, 
		itemsDesktop : [1000,4], 
		itemsDesktopSmall : [900,3], 
		itemsTablet: [600,2], 
		itemsMobile: [400,1],
		navigation : true,
		paginationSpeed : 400,
		pagination: false,
		navigationText: ['<i class="fa fa-chevron-left"></i>','<i class="fa fa-chevron-right"></i>']
	});
	$('.brand-owl').owlCarousel({
		items : 6, 
		itemsDesktop : [1000,5], 
		itemsDesktopSmall : [900,3], 
		itemsTablet: [600,2], 
		itemsMobile: [400,1],
		navigation : true,
		autoPlay: true,
		slideSpeed : 500,
		paginationSpeed : 400,
		pagination: false,
		navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
	});

	$('.product .images .imgowl').owlCarousel({
		items : 4, 
		itemsDesktop : [1000,4], 
		itemsDesktopSmall : [900,3], 
		itemsTablet: [600,2], 
		itemsMobile: [400,1],
		navigation : true,
		autoPlay: true,
		slideSpeed : 500,
		paginationSpeed : 400,
		pagination: false,
		navigationText: ['<i class="fa fa-angle-left"></i>','<i class="fa fa-angle-right"></i>']
	});

	$('.images .imgowl .img-item a').click(function() {
		var newImage = $(this).attr('href');
		$('.featured-image img').attr({ src: newImage }); 
		return false;
	});




});

jQuery(function($) {
	"use strict";
	//Mobile menu
	$('.bars-navigation').click(function() {
		if ($('.mobimenu').is(":hidden"))
		{
			$('.mobimenu').slideDown("fast");
		} else {
			$('.mobimenu').slideUp("fast");
		}
		return false;
	});

	$(".category").accordion({
		accordion:false,
		speed: 300,
		closedSign: '+',
		openedSign: '-'
	});
	$(".mobile-menu").accordion({
		accordion:false,
		speed: 300,
		closedSign: '+',
		openedSign: '-'
	});
});
(function($){
	$.fn.extend({ 
		accordion: function(options) {  
			var defaults = {
				accordion: 'true',
				speed: 300,
				closedSign: '[-]',
				openedSign: '[+]'
			};  
			var opts = $.extend(defaults, options); 
			var $this = $(this);  
			$this.find("li").each(function() {
				if($(this).find("ul").size() != 0){
					$(this).find("a:first").after("<em>"+ opts.closedSign +"</em>");  
					if($(this).find("a:first").attr('href') == "#"){
						$(this).find("a:first").click(function(){return false;});
					}
				}
			}); 
			$this.find("li em").click(function() {
				if($(this).parent().find("ul").size() != 0){
					if(opts.accordion){
						//Do nothing when the list is open
						if(!$(this).parent().find("ul").is(':visible')){
							parents = $(this).parent().parents("ul");
							visible = $this.find("ul:visible");
							visible.each(function(visibleIndex){
								var close = true;
								parents.each(function(parentIndex){
									if(parents[parentIndex] == visible[visibleIndex]){
										close = false;
										return false;
									}
								});
								if(close){
									if($(this).parent().find("ul") != visible[visibleIndex]){
										$(visible[visibleIndex]).slideUp(opts.speed, function(){
											$(this).parent("li").find("em:first").html(opts.closedSign);
										});   
									}
								}
							});
						}
					}
					if($(this).parent().find("ul:first").is(":visible")){
						$(this).parent().find("ul:first").slideUp(opts.speed, function(){
							$(this).parent("li").find("em:first").delay(opts.speed).html(opts.closedSign);
						}); 
					}else{
						$(this).parent().find("ul:first").slideDown(opts.speed, function(){
							$(this).parent("li").find("em:first").delay(opts.speed).html(opts.openedSign);
						});
					}
				}
			});
		}
	});
})(jQuery);



function winOpen(url) {
	var width = 575, height = 400,
		left = (document.documentElement.clientWidth / 2 - width / 2),
		top = (document.documentElement.clientHeight - height) / 2,
		opts = 'status=1,resizable=yes' +
			',width=' + width + ',height=' + height +
			',top=' + top + ',left=' + left,
		win = window.open(url, '', opts);
	win.focus();
	return win;
}
 if ($(window).width() > 767) {
	$(".social_share_btn").click(function() {
		winOpen(this.href);
		return false;
	});//-- end. click function
 }


//--WINDOW RESIZE FUNCTION BEGIN
$(window).resize(function() {

	 if ($(window).width() > 767) {
		$(".social_share_btn").click(function() {
			winOpen(this.href);
			return false;
		});//-- end. click function
	 }
	
});
//--WINDOW RESIZE FUNCTION END




//====================== disable Scroll & enable Scroll function =================


/* Fucntion get width browser */
function getWidthBrowser() {
  var myWidth;

  if( typeof( window.innerWidth ) == 'number' ) { 
    //Non-IE 
    myWidth = window.innerWidth;
    //myHeight = window.innerHeight; 
  } 
  else if( document.documentElement && ( document.documentElement.clientWidth || document.documentElement.clientHeight ) ) { 
    //IE 6+ in 'standards compliant mode' 
    myWidth = document.documentElement.clientWidth; 
    //myHeight = document.documentElement.clientHeight; 
  } 
  else if( document.body && ( document.body.clientWidth || document.body.clientHeight ) ) { 
    //IE 4 compatible 
    myWidth = document.body.clientWidth; 
    //myHeight = document.body.clientHeight; 
  }
  
  return myWidth;
}

var keys = {37: 1, 38: 1, 39: 1, 40: 1};

function preventDefault(e) {
  e = e || window.event;
  if (e.preventDefault)
      e.preventDefault();
  e.returnValue = false;  
}

function preventDefaultForScrollKeys(e) {
    if (keys[e.keyCode]) {
        preventDefault(e);
        return false;
    }
}
	
function disableScroll() {
  if (window.addEventListener) // older FF
      window.addEventListener('DOMMouseScroll', preventDefault, false);
  window.onwheel = preventDefault; // modern standard
  window.onmousewheel = document.onmousewheel = preventDefault; // older browsers, IE
  window.ontouchmove  = preventDefault; // mobile
  document.onkeydown  = preventDefaultForScrollKeys;
}
	
function enableScroll() {
    if (window.removeEventListener)
        window.removeEventListener('DOMMouseScroll', preventDefault, false);
    window.onmousewheel = document.onmousewheel = null; 
    window.onwheel = null; 
    window.ontouchmove = null;  
    document.onkeydown = null;  
}




//===============bizwebinput=================
function validate(evt) {
	var Bizwebinput = document.getElementsByClassName('bizwebinput'),
      	theEvent = evt || window.event,
      	key = theEvent.keyCode || theEvent.which,
  		key = String.fromCharCode( key ),
		regex = /[0-9]|\./;
		if( !regex.test(key) ) {
			theEvent.returnValue = false;
			if(theEvent.preventDefault) theEvent.preventDefault();			
			(Bizwebinput.value)=1;			
		} else {
		var value = new Number(Bizwebinput.value),
			min = new Number(Bizwebinput.min);
			if (value < min) {				
				theEvent.returnValue = false;
				if(theEvent.preventDefault) theEvent.preventDefault();
				(Bizwebinput.value)=1;				
			}
		}	 
}
$(".bizwebinput").blur(function()
{
	
	if (!this.value.match(/[0-9]|\./)) {		
		(this.value)=1;				
	}
	if(!$.trim(this.value).length) {		
		(this.value)=1;	
	}
	else if((this.value) < (this.min)) {		
		(this.value)=1;		
	}
});