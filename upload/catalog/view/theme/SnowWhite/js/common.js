function getURLVar(key) {
	var value = [];

	var query = document.location.search.split('?');

	if (query[1]) {
		var part = query[1].split('&');

		for (i = 0; i < part.length; i++) {
			var data = part[i].split('=');

			if (data[0] && data[1]) {
				value[data[0]] = data[1];
			}
		}

		if (value[key]) {
			return value[key];
		} else {
			return '';
		}
	}
}

jQuery(document).ready(function() {
	// Highlight any found errors
	jQuery('.text-danger').each(function() {
		var element = jQuery(this).parent().parent();

		if (element.hasClass('form-group')) {
			element.addClass('has-error');
		}
	});

	// Currency
	jQuery('#form-currency .currency-select').on('click', function(e) {
		e.preventDefault();

		jQuery('#form-currency input[name=\'code\']').val(jQuery(this).attr('name'));

		jQuery('#form-currency').submit();
	});

	// Language
	jQuery('#form-language .language-select').on('click', function(e) {
		e.preventDefault();

		jQuery('#form-language input[name=\'code\']').val(jQuery(this).attr('name'));

		jQuery('#form-language').submit();
	});

	/* Search */
	jQuery('#search input[name=\'search\']').parent().find('button').on('click', function() {
		var url = jQuery('base').attr('href') + 'index.php?route=product/search';

		var value = jQuery('header #search input[name=\'search\']').val();

		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}

		location = url;
	});

	jQuery('#search input[name=\'search\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			jQuery('header #search input[name=\'search\']').parent().find('button').trigger('click');
		}
	});

	// Menu
	jQuery('#menu .dropdown-menu').each(function() {
		var menu = jQuery('#menu').offset();
		var dropdown = jQuery(this).parent().offset();

		var i = (dropdown.left + jQuery(this).outerWidth()) - (menu.left + jQuery('#menu').outerWidth());

		if (i > 0) {
			jQuery(this).css('margin-left', '-' + (i + 10) + 'px');
		}
	});

	// Product List
	jQuery('#list-view').click(function() {
		jQuery('#content .product-grid > .clearfix').remove();

		jQuery('#content .row > .product-grid').attr('class', 'product-layout product-list col-xs-12');
		jQuery('#grid-view').removeClass('active');
		jQuery('#list-view').addClass('active');

		localStorage.setItem('display', 'list');
	});

	// Product Grid
	jQuery('#grid-view').click(function() {
		// What a shame bootstrap does not take into account dynamically loaded columns
		var cols = jQuery('#column-right, #column-left').length;

		if (cols == 2) {
			jQuery('#content .product-list').attr('class', 'product-layout product-grid col-lg-6 col-md-6 col-sm-12 col-xs-12');
		} else if (cols == 1) {
			jQuery('#content .product-list').attr('class', 'product-layout product-grid col-lg-4 col-md-4 col-sm-6 col-xs-12');
		} else {
			jQuery('#content .product-list').attr('class', 'product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12');
		}

		jQuery('#list-view').removeClass('active');
		jQuery('#grid-view').addClass('active');

		localStorage.setItem('display', 'grid');
	});

	if (localStorage.getItem('display') == 'list') {
		jQuery('#list-view').trigger('click');
		jQuery('#list-view').addClass('active');
	} else {
		jQuery('#grid-view').trigger('click');
		jQuery('#grid-view').addClass('active');
	}

	// Checkout
	jQuery(document).on('keydown', '#collapse-checkout-option input[name=\'email\'], #collapse-checkout-option input[name=\'password\']', function(e) {
		if (e.keyCode == 13) {
			jQuery('#collapse-checkout-option #button-login').trigger('click');
		}
	});

	// tooltips on hover
	jQuery('[data-toggle=\'tooltip\']').tooltip({container: 'body',trigger: 'hover'});

	// Makes tooltips work on ajax generated content
	jQuery(document).ajaxStop(function() {
		jQuery('[data-toggle=\'tooltip\']').tooltip({container: 'body'});
	});
});

// Cart add remove functions
var cart = {
	'add': function(product_id, quantity) {
		jQuery.ajax({
			url: 'index.php?route=checkout/cart/add',
			type: 'post',
			data: 'product_id=' + product_id + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				jQuery('#cart > button').button('loading');
			},
			complete: function() {
				jQuery('#cart > button').button('reset');
			},
			success: function(json) {
				jQuery('.alert, .text-danger').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					jQuery('header').after('<div class="alert alert-success container pr-15 pl-15"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					// Need to set timeout otherwise it wont update the total
					setTimeout(function () {
					jQuery('.count-block').html(  '<span class="items-to-cart">' + parseInt( json['total'] ) + '</span>' );
					}, 100);

					//jQuery('html, body').animate({ scrollTop: 0 }, 'slow');

					//jQuery('#cart > ul').load('index.php?route=common/cart/info ul li');
					jQuery('#cart-modal .modal-body').load('index.php?route=common/cart/info .modal-body');
					
					jQuery('#cart-modal').modal();

				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'update': function(key, quantity) {
		jQuery.ajax({
			url: 'index.php?route=checkout/cart/edit',
			type: 'post',
			data: 'key=' + key + '&quantity=' + (typeof(quantity) != 'undefined' ? quantity : 1),
			dataType: 'json',
			beforeSend: function() {
				jQuery('#cart > button').button('loading');
			},
			complete: function() {
				jQuery('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					//jQuery('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					jQuery('.count-block').html(  '<span class="items-to-cart">' + parseInt( json['total'] ) + '</span>' );
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					//jQuery('#cart > ul').load('index.php?route=common/cart/info ul li');
					jQuery('#cart-modal .modal-body').load('index.php?route=common/cart/info .modal-body');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function(key) {
		jQuery.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				jQuery('#cart > button').button('loading');
			},
			complete: function() {
				jQuery('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					//jQuery('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
					if (parseInt( json['total'] != 0)){
						jQuery('.count-block').html(  '<span class="items-to-cart">' + parseInt( json['total'] ) + '</span>' );
					} else{
						jQuery('.count-block').html(  '' );
					}
				}, 100);
				
				var now_location = String(document.location.pathname);

				if ((now_location == '/cart/') || (now_location == '/checkout/') || (getURLVar('route') == 'checkout/cart') || (getURLVar('route') == 'checkout/checkout')) {
					location = 'index.php?route=checkout/cart';
				} else {
					//jQuery('#cart > ul').load('index.php?route=common/cart/info ul li');
					jQuery('#cart-modal .modal-body').load('index.php?route=common/cart/info .modal-body');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var voucher = {
	'add': function() {

	},
	'remove': function(key) {
		jQuery.ajax({
			url: 'index.php?route=checkout/cart/remove',
			type: 'post',
			data: 'key=' + key,
			dataType: 'json',
			beforeSend: function() {
				jQuery('#cart > button').button('loading');
			},
			complete: function() {
				jQuery('#cart > button').button('reset');
			},
			success: function(json) {
				// Need to set timeout otherwise it wont update the total
				setTimeout(function () {
					jQuery('#cart > button').html('<span id="cart-total"><i class="fa fa-shopping-cart"></i> ' + json['total'] + '</span>');
				}, 100);

				if (getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') {
					location = 'index.php?route=checkout/cart';
				} else {
					jQuery('#cart > ul').load('index.php?route=common/cart/info ul li');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	}
}

var wishlist = {
	'add': function(product_id) {
		jQuery.ajax({
			url: 'index.php?route=account/wishlist/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				jQuery('.alert').remove();

				if (json['redirect']) {
					location = json['redirect'];
				}

				if (json['success']) {
					jQuery('header').after('<div class="alert alert-success container"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');
				}

				jQuery('#wishlist-total span').html(json['total']);
				jQuery('#wishlist-total').attr('title', json['total']);

				//jQuery('html, body').animate({ scrollTop: 0 }, 'slow');
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

var compare = {
	'add': function(product_id) {
		jQuery.ajax({
			url: 'index.php?route=product/compare/add',
			type: 'post',
			data: 'product_id=' + product_id,
			dataType: 'json',
			success: function(json) {
				jQuery('.alert').remove();

				if (json['success']) {
					jQuery('#content').parent().before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + ' <button type="button" class="close" data-dismiss="alert">&times;</button></div>');

					jQuery('#compare-total').html(json['total']);

					//jQuery('html, body').animate({ scrollTop: 0 }, 'slow');
				}
			},
			error: function(xhr, ajaxOptions, thrownError) {
				alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
			}
		});
	},
	'remove': function() {

	}
}

/* Agree to Terms */
jQuery(document).delegate('.agree', 'click', function(e) {
	e.preventDefault();

	jQuery('#modal-agree').remove();

	var element = this;

	jQuery.ajax({
		url: jQuery(element).attr('href'),
		type: 'get',
		dataType: 'html',
		success: function(data) {
			html  = '<div id="modal-agree" class="modal">';
			html += '  <div class="modal-dialog">';
			html += '    <div class="modal-content">';
			html += '      <div class="modal-header">';
			html += '        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>';
			html += '        <h4 class="modal-title">' + jQuery(element).text() + '</h4>';
			html += '      </div>';
			html += '      <div class="modal-body">' + data + '</div>';
			html += '    </div';
			html += '  </div>';
			html += '</div>';

			jQuery('body').append(html);

			jQuery('#modal-agree').modal('show');
		}
	});
});

// Autocomplete */
(function(jQuery) {
	jQuery.fn.autocomplete = function(option) {
		return this.each(function() {
			this.timer = null;
			this.items = new Array();

			jQuery.extend(this, option);

			jQuery(this).attr('autocomplete', 'off');

			// Focus
			jQuery(this).on('focus', function() {
				this.request();
			});

			// Blur
			jQuery(this).on('blur', function() {
				setTimeout(function(object) {
					object.hide();
				}, 200, this);
			});

			// Keydown
			jQuery(this).on('keydown', function(event) {
				switch(event.keyCode) {
					case 27: // escape
						this.hide();
						break;
					default:
						this.request();
						break;
				}
			});

			// Click
			this.click = function(event) {
				event.preventDefault();

				value = jQuery(event.target).parent().attr('data-value');

				if (value && this.items[value]) {
					this.select(this.items[value]);
				}
			}

			// Show
			this.show = function() {
				var pos = jQuery(this).position();

				jQuery(this).siblings('ul.dropdown-menu').css({
					top: pos.top + jQuery(this).outerHeight(),
					left: pos.left
				});

				jQuery(this).siblings('ul.dropdown-menu').show();
			}

			// Hide
			this.hide = function() {
				jQuery(this).siblings('ul.dropdown-menu').hide();
			}

			// Request
			this.request = function() {
				clearTimeout(this.timer);

				this.timer = setTimeout(function(object) {
					object.source(jQuery(object).val(), jQuery.proxy(object.response, object));
				}, 200, this);
			}

			// Response
			this.response = function(json) {
				html = '';

				if (json.length) {
					for (i = 0; i < json.length; i++) {
						this.items[json[i]['value']] = json[i];
					}

					for (i = 0; i < json.length; i++) {
						if (!json[i]['category']) {
							html += '<li data-value="' + json[i]['value'] + '"><a href="#">' + json[i]['label'] + '</a></li>';
						}
					}

					// Get all the ones with a categories
					var category = new Array();

					for (i = 0; i < json.length; i++) {
						if (json[i]['category']) {
							if (!category[json[i]['category']]) {
								category[json[i]['category']] = new Array();
								category[json[i]['category']]['name'] = json[i]['category'];
								category[json[i]['category']]['item'] = new Array();
							}

							category[json[i]['category']]['item'].push(json[i]);
						}
					}

					for (i in category) {
						html += '<li class="dropdown-header">' + category[i]['name'] + '</li>';

						for (j = 0; j < category[i]['item'].length; j++) {
							html += '<li data-value="' + category[i]['item'][j]['value'] + '"><a href="#">&nbsp;&nbsp;&nbsp;' + category[i]['item'][j]['label'] + '</a></li>';
						}
					}
				}

				if (html) {
					this.show();
				} else {
					this.hide();
				}

				jQuery(this).siblings('ul.dropdown-menu').html(html);
			}

			jQuery(this).after('<ul class="dropdown-menu"></ul>');
			jQuery(this).siblings('ul.dropdown-menu').delegate('a', 'click', jQuery.proxy(this.click, this));

		});
	}
})(window.jQuery);

// Калечим корзину

$(document).ready(function(){
	$('body').on('click', '#shipping_method_list label' , function(){
		if($(this).attr('for') == 'pickup.pickup'){
			$('#payment_address_heading_heading').hide();
			$('label[for="payment_address_country_id"]').addClass('nas-tipo-net');
			$('#payment_address_country_id').val(176);
			$('label[for="payment_address_zone_id"]').addClass('nas-tipo-net');
			$('#payment_address_zone_id').val(2761);
			$('label[for="payment_address_city"]').addClass('nas-tipo-net');
			$('#payment_address_city').val('не выбрано');
			$('label[for="payment_address_postcode"]').addClass('nas-tipo-net');
			$('#payment_address_postcode').val('00000');
			$('label[for="payment_address_address_1"]').addClass('nas-tipo-net');
			$('#payment_address_address_1').val('не выбрано');
			$('label[for="payment_address_address_1"]').addClass('payment_address_custom_field.address.1');
			$('label[for="payment_address_shipping_address"]').addClass('nas-tipo-net');
			$('#payment_address_shipping_address').prop("checked");
		} else{
			$('#payment_address_heading_heading').show();
			$('label[for="payment_address_country_id"]').removeClass('nas-tipo-net');
			$('label[for="payment_address_zone_id"]').removeClass('nas-tipo-net');
			$('label[for="payment_address_city"]').removeClass('nas-tipo-net');
			$('label[for="payment_address_postcode"]').removeClass('nas-tipo-net');
			$('label[for="payment_address_address_1"]').removeClass('nas-tipo-net');
			$('label[for="payment_address_address_1"]').removeClass('payment_address_custom_field.address.1');
			$('label[for="payment_address_shipping_address"]').removeClass('nas-tipo-net');
		}
	});
});

