$(document).ready(function() {
	window.setTimeout(function() {
		getCartList();
		deleteCartList();
	},1000);
});

const getCartList = () => {
	let order_id = document.getElementById('order-id').innerText;
	$.ajax({
		url:"getOrderList.do?order_id="+order_id,
		type:"get",
		dataType:"json",
		success:function(data){
			let list = data;
			$(list).each(function(key, value) {
				let dp = Number(value.price)*Number($('#coupon-rate').text());
				$('.container-fluid').eq(2).append(
						"<div class='row rows-width product-section' style='margin:0px auto;'>" +
						"<div class='col-md-2 p-img'>" +
						"<img src='" + value.img_path + "' class='product-img'>" +
						"</div>" +
						"<div class='col-md-6 li-div p-info'>" +
						"<div>" +
						"<span class='title'>상품 명 : </span>" +
						"<span>" + value.p_name + "</span>" +
						"</div>" +
						"<div>" +
						"<span class='title'>주문 수량 : </span>" +
						"<span>" + value.p_count +"</span>" +
						"</div>" +
						"</div>" +
						"<div class='col-md-4 li-div p-price'>" +
						"<div>" +
						"<span class='title'>상품 금액 : </span>" +
						"<span>&nbsp;&nbsp;" + value.price + "</span>" +
						"<span>&#8361;</span>" +
						"</div>" +
						"<div>" +
						"<span class='title'>할인 금액 : </span>" +
						"<span>-" + dp + "</span>" +
						"<span>&#8361;</span>" +
						"</div></div></div>"						
				);
			});
		}
	});
}

const deleteCartList = () => {
	$.ajax({
		url:"deleteCartList.do",
		type:"post",
		success:function(msg) {
			console.log('deleteCartList: ' + msg);
		}
	});
}

const goMain = (command) => {
	location.href=command+'.do';
}