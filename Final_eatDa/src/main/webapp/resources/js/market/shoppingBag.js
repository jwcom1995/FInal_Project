let price = 0;
let totalPrice = 0;

window.onload = function() {
	makeSubDelivery();
	//멀티버튼 구현
	$('input:checkbox').on('click', function() {
		if (!($(this).prop('checked'))) {
			$('#m-check').attr('src', 'resources/images/market/check.png');
		}
	});

	let totalPrice = 0;
	$('.right-col-price').each(function() {
		totalPrice += Number($(this).children().eq(0).text());
	})

	$('#totalPrice').text(totalPrice);
}

const leftButton = (object) => {
	let quantity = $(object).siblings('.quantity').text();
	price = Number($(object).parent().siblings('.right-col-price').children().eq(0).text());

	if (quantity == 1) {
		alert('한 개 이상을 선택해주세요.');
		return;
	} else {
		$(object).siblings('.quantity').text('');
		$(object).siblings('.quantity').text(quantity - 1);
		$(object).parent().siblings('.right-col-price').children().eq(0).text(price - (price / quantity));
		calcTotal();
	}
}

const rightButton = (object) => {
	let quantity = $(object).siblings('.quantity').text();
	price = Number($(object).parent().siblings('.right-col-price').children().eq(0).text());

	if (quantity == 9) {
		alert('한 상품은 한번에 10개 이하 주문 가능합니다.');
		return;
	} else {
		$(object).siblings('.quantity').text('');
		$(object).siblings('.quantity').text(Number(quantity) + 1);
		$(object).parent().siblings('.right-col-price').children().eq(0).text(price + price / quantity);
		calcTotal();
	}
}

const calcTotal = () => {
	let length = $('.start-row').length;

	for (var i = 0; i < length; i++) {
		let temp = $('.start-row').eq(i).children('.right-col').children('.right-col-price').children().eq(0).text();
		totalPrice += Number(temp);
	}

	$('#totalPrice').text('');
	$('#totalPrice').text(totalPrice);
	totalPrice = 0;
}

const pushMulti = () => {
	let src = $('#m-check').attr('src');

	if (src == 'resources/images/market/check.png') {
		$('#m-check').attr('src', 'resources/images/market/full-check.png');
		$('input:checkbox[name="checkbox"]').each(function() {
			this.checked = true;
		});
	} else {
		$('#m-check').attr('src', 'resources/images/market/check.png');
		$('input:checkbox[name="checkbox"]').each(function() {
			this.checked = false;
		});
	}
}

const choiceDelete = () => {
	let array = new Array();
	console.log($('now-tab').children('input:checkbox[name="checkbox"]:checked'));
	if ($('.now-tab').text() == '일반배송' && $('input:checkbox[name="checkbox"]:checked').length == 0) {
		alert('선택하신 상품이 없습니다.');
		return;
	}

	if ($('input:checkbox[name="checkbox"]:checked').parent().parent().siblings('.category').text() == 'SUBSCRIPTION') {
		alert('구독 배송 상품은 삭제하실 수 없습니다.');
		return;
	}

	if (confirm('선택하신 상품을 장바구니에서 제거 하시겠습니까?')) {
		$('input:checkbox[name="checkbox"]').each(function() {
			if (this.checked == true) {
				let price = $(this).parents('.left-col').siblings('.right-col').children('.right-col-price').children('.each-price').text();
				let totalPrice = $('#totalPrice').text();
				$('#totalPrice').text(totalPrice - price);

				if ($(this).parents('.start-row').css('display') == "block") {
					array.push($(this).siblings('.p-id').text());
					$(this).parents('.start-row').remove();
				}
			}
		});
	}

	let data = {
		"array": array
	}

	$.ajax({
		url: "deleteProductBag.do",
		type: "post",
		contentType: "application/json; charset=utf-8",
		data: JSON.stringify(data),
		success: function(msg) {
			alert('선택하신 상품을 장바구니에서 제거했습니다.');
		}
	});
	$('#m-check').attr('src', 'resources/images/market/check.png');
	$('input:checkbox[name="checkbox"]').each(function() {
		this.checked = false;
	});
}

const makeOrder = () => {
	let product = document.getElementsByClassName('start-row');

	if (product.length == 0) {
		alert('장바구니에 담긴 상품이 없습니다.');
		return;
	}

	if (confirm('위 상품들을 주문하시겠습니까?')) {
		let array = new Array();
		$('.category').each(function() {
			console.log($(this).text());
			let data = {
				p_id: $(this).siblings('.left-col').find('.p-id').text(),
				quantity: $(this).siblings('.right-col').find('.quantity').text(),
				price: $(this).siblings('.right-col').find('.each-price').text()
			}
			array.push(data);
		});

		$.ajax({
			url: "updateCartList.do",
			type: "post",
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(array),
			success: function(msg) {
				console.log(msg);
			}
		});

		window.setTimeout(function() {
			location.href = 'makeOrder.do';
		}, 1000);
	}
}

const makeSubDelivery = () => {
	$.ajax({
		url: "getCartProduct.do?command=SUBSCRIPTION",
		type: "get",
		dataType: "json",
		success: function(data) {
			var list = data;
			$(list).each(function(key, value) {
				$('.order-product').append(
					"<div class='start-row' style='display:none;'>" +
					"<div class='category' style='display:none;'>" + value.category + "</div>" +
					"<div class='col-lg-8 left-col'>" +
					"<div class='left-col-check'>" +
					"<input type='checkbox' class='check-img' name='checkbox'>" +
					"<span class='p-id' style='display:none;'>" + value.p_id + "</span>" +
					"</div>" +
					"<div class='left-col-img'>" +
					"<img src='" + value.img_path + "' class='product-img'>" +
					"</div>" +
					"<div class='left-col-title'>" + value.p_name + "</div>" +
					"</div>" +
					"<div class='col-lg-4 right-col'>" +
					"<div class='right-col-quantity'>" +
					"<span class='quantity' style='font-weight:bold;'>" + value.cart_count + "</span>&nbsp;" +
					"<span style='font-weight:bold;'>개</span>" +
					"</div>" +
					"<div class='right-col-price sub-col-price'>" +
					"<span class='each-price'>" + value.cart_price + "</span>&nbsp;" +
					"&nbsp;<span>원</span>" +
					"</div></div></div>"
				);
			});
		}
	});
}

const subDelivery = () => {
	$('#norDev').removeClass('now-tab');
	$('#subDev').addClass('now-tab');
	$('#totalPrice').css("display", "none");
	$('.sub-price').css("display", "inline");

	$('.category').each(function() {
		if ($(this).text() == 'SUBSCRIPTION') {
			$(this).parent('.start-row').css("display", "block");
		} else if ($(this).text() == 'NORMAL') {
			$(this).parent('.start-row').css("display", "none");
		}
	});
}

const normalDelivery = () => {
	$('#norDev').addClass('now-tab');
	$('#subDev').removeClass('now-tab');
	$('.sub-price').css("display", "none");
	$('#totalPrice').css("display", "inline");

	$('.category').each(function() {
		if ($(this).text() == 'NORMAL') {
			$(this).parent('.start-row').css("display", "block");
		} else if ($(this).text() == 'SUBSCRIPTION') {
			$(this).parent('.start-row').css("display", "none");
		}
	});
}

const goMarketMain = () => {
	location.href = 'marketMain.do';
}
