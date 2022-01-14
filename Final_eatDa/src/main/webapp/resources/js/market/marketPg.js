var img_path = $('#img').attr('src');
var p_name = $('.title').text();
var s_desc = $('.short-desc').text();
var p_description = $('#p-description').text();
var seller_desc = $('#seller-desc').text();
var p_amount = $('#p-amount').text();
var p_cal = $('#p-cal').text();

$(document).ready(function() {
	likeProduct();
	let originalPrice = $('#price').text();
	
	$('.btn-close').click(function() {
		$('#quantity').text('1');
		$('#price').text(originalPrice);
	});
	$('.modal-footer').children().eq(2).click(function() {
		$('#quantity').text('1');
		$('#price').text(originalPrice);
	});
});

const keepShopping = () => {
	let originalPrice = $('#price').text();
	$('#quantity').text('1');
	$('#price').text(originalPrice);
}

const leftButton = (object) => {
	let quantity = Number($(object).siblings('#quantity').text());
	let priceSpan = $(object).parents('.modal-info-quantity').siblings('.modal-info-price').children('#price');
	
	let price = Number($(priceSpan).text());
	
	if (quantity == 1) {
		alert('한 개 이상을 선택해주세요.');
		return;
	} else {
		$(object).siblings('#quantity').text('');
		$(object).siblings('#quantity').text(quantity-1);
		
		$(priceSpan).text('');
		$(priceSpan).text(price-(price/quantity));
	}
}

const rightButton = (object) => {
	let quantity = Number($(object).siblings('#quantity').text());
	let priceSpan = $(object).parents('.modal-info-quantity').siblings('.modal-info-price').children('#price');
	let price = Number($(priceSpan).text());
	
	if (quantity == 9) {
		alert('한 상품은 한번에 10개 이하 주문 가능합니다.');
		return;
	} else {
		$(object).siblings('#quantity').text('');
		$(object).siblings('#quantity').text(quantity+1);
		
		$(priceSpan).text('');
		$(priceSpan).text(price+(price/quantity));
	}
}
const likeProduct = () => {
	$.ajax({
		url:"likeProduct-main.do",
		type:"post",
		dataType:"json",
		success:function(data) {
			let list = data;
			$(list).each(function(key, value) {
				$('.like-title').append(
					"<div class='like-img-div'>" +
					"<img id='" + value.p_id + "' class='like-img' src='" + value.img_path + "' onclick='goLikeProduct(this)'>" +
					"</div>"
				);
			});
		}
	});
}
const goLikeProduct = (object) => {
	let p_id = $(object).attr('id');
	location.href = 'goProductPage.do?p_id='+p_id;
}

const likeThis = () => {
	let p_id = document.getElementById('p-id').innerText;
	let p_name = document.getElementsByClassName('title')[0].innerText;
	let img_path = $('#img').attr('src');
	let flag = '';
	
	//이미 찜한 상품인지 체크
	$('.like-img').each(function() {
		if ($(this).attr('id') == p_id) {
			if (confirm(p_name + " 상품은 이미 찜한 상품입니다. 취소하시겠습니까?")) {
				deleteProductLike(p_id);
				$(this).parent('.like-img-div').remove();
				flag = 'true';
			}
		}
	});
	if(flag=='true') {return;}
	
	$.ajax({
		url: "likeProductInsert.do",
		type: "post",
		data: p_id,
		success:function(msg) {
			if (msg == 'true') {
				alert(p_name + " 상품을 찜했습니다! 오른쪽 '내가 찜한 상품' 에서 확인해보세요.");
				$('.like-title').append(
						"<div class='like-img-div'>" +
						"<img id='" + p_id + "' class='like-img' src='" + img_path + "' onclick='goLikeProduct(this)'>" +
						"</div>"
				);
			}
		}
	});
}

const deleteProductLike = (p_id) => {
	$.ajax({
		url:"deleteProductLike.do",
		type:"post",
		data:p_id,
		success:function(msg) {
			if (msg === 'false') {
				alert('취소 실패!');
			}
		}
	});
}

const putShoppingBag = () => {
	let p_price = $('.right-info-desc').eq(0).children('span').eq(0).text();
	let quantity = $('#quantity').text();
	let data = {
		"p_id":document.getElementById('p-id').innerText,
		"p_price":p_price*quantity,
		"quantity":quantity
	}
	
	if (confirm('해당 상품을 장바구니에 넣으시겠습니까?')) {
		$.ajax({
			url:"putShoppingBag.do",
			type:"post",
			data:JSON.stringify(data),
			contentType:"application/json; charset=utf-8",
			success:function(flag) {
				let msg = (flag=='true'?'장바구니로 이동하시겠습니까?':'해당 상품은 이미 장바구니에 담겨있습니다. 장바구니로 이동하시겠습니까?') 
				if (confirm(msg)) {
					location.href = 'goShoppingBag.do';
				}
			}
		});
	}
}
const directPurchase = () => {
	//바로 구매하기
	if (confirm('알림::바로 구매하기를 이용하시면 장바구니가 비워집니다. 계속하시겠습니까?')) {
		let product = {
				p_name:$('.modal-info-title').children('span').text(),
				img_path:$('#img').attr('src'),
				p_price:$('#price').text(),
				quantity:$('#quantity').text(),
				p_id:$('#p-id').text()
		}
		location.href = 'makeOrder.do?p_id=' + product.p_id + '&quantity='+product.quantity + '&price=' + product.p_price;
	};
}

const changeColorBtn = () => {
	for (var i = 0; i < 4; i++) {
		$('.tap-button').eq(i).removeClass('btn-primary').addClass('btn-secondary');
	}		
}

const reviewTap = () => {
	changeColorBtn()
	const productId = $('#p-id').text();
	$('#reviewButton').removeClass('btn-secondary').addClass('btn-primary');
	$('.changeTap').css('display','none');
	$('.review-wrap').css('display','block');
}

const detailTap = () => {
	changeColorBtn();
	$('#detailButton').removeClass('btn-secondary').addClass('btn-primary');
	$('.review-wrap').css('display','none');
	$('.changeTap').css('display','block');
}

const ready = (command) => {
	if (command == 'control') {
		alert('관리자만 상품 관리 탭을 이용할 수 있습니다.');
	} else {
		alert('해당 기능은 서비스 준비중 입니다.');
	}
}