$('.top-slider').slick({
	appendArrows: $('.arrows'),
	prevArrow: '<img src="catalog/view/theme/SnowWhite/img/left.png">',
	nextArrow: '<img src="catalog/view/theme/SnowWhite/img/right.png">',
	appendDots: $('.dots'),
	dots: true
});
$('.vertical-slider').slick({
	vertical: false,
	slidesToShow: 1,
	slidesToScroll: 1,
	arrows: false,
	fade: true,
	asNavFor: '.slider-navigation'
});
$('.slider-navigation').slick({
	slidesToShow: 3,
	slidesToScroll: 1,
	asNavFor: '.vertical-slider',
	centerMode: false,
	focusOnSelect: true,
	vertical: true,
	arrows: true,
	appendArrows: $('.slider-arr'),
	nextArrow: '<img src="catalog/view/theme/SnowWhite/img/arr-down.png">',
	prevArrow: '<img class="arr-prev" src="catalog/view/theme/SnowWhite/img/arr-down.png">',
});

$('.nav-link.dropdown-toggle').off('click');

$(document).ready(function () {
	$('.down').click(function () {
		var $input = $(this).parent().find('input');
		var count = parseInt($input.val()) - 1;
		count = count < 1 ? 0 : count;
		$input.val(count);
		$input.change();
		return false;
	});
	$('.up').click(function () {
		var $input = $(this).parent().find('input');
		$input.val(parseInt($input.val()) + 1);
		$input.change();
		return false;
	});
});

$('.popover-dismiss').popover({
	trigger: 'focus'
});


$(document).ready(function () {
	var url = document.location.href;
	$.each($(".catalog-menu a"), function () {
		if (url.indexOf(this.href) >= 0) {
			$(this).addClass('active');
		};
	});
});

$(document).ready(function () {
	$('.close-cart-modal').on('click', function () {
		$('#cart-modal').modal('hide');
	});

	$('.btn_toogler').on('click', function () {
		if($('.btn_toogler').attr('checked') == 'checked'){
			$('#guest').click();
		} 
	});
	// Add slideDown animation to dropdown
	$('.dropdown').on('show.bs.dropdown', function(e){
		$(this).find('.dropdown-menu').first().stop(true, true).slideDown(300);
	});

// Add slideUp animation to dropdown
	$('.dropdown').on('hide.bs.dropdown', function(e){
		$(this).find('.dropdown-menu').first().stop(true, true).slideUp(300);
	});

	$('.filter-show-btn').on('click', function(){
		$('.filter-show').toggleClass('active');
		if($('.filter-show').is(":visible")){
			$(this).text('Свернуть фильтр');
		} else{
			$(this).text('Открыть фильтр');
		}
	});

	var x_window = screen.width/2 - 790/2;
	var y_window = screen.height/2 - 568/2;
	var link = $('.repost-link');
	link.attr('onclick', "popupWin=window.open(this.href,'contacts','location,width=790,height=568'); popupWin.focus(); return false");
	//link.setAttribute("onclick","popupWin = window.open(this.href,'contacts','location,width=490,height=368,top=0'); popupWin.focus(); return false")

});

function request_quantity() {
	return $('#quantity').val();
}