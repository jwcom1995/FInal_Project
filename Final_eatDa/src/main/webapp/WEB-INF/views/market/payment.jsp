<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet" href="resources/css/market/payment.css">
<title>Insert title here</title>
</head>

<script type="text/javascript">
let originalPrice = 0;
let discountPrice = 0;
let afterPrice = 0;
let userData = {}
let userCoupon = {}
let request = '';

$(document).ready(function() {
	$('#address_kakao').click(function(){
		new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById("address_kakao").value = data.address;
                document.getElementsByClassName('input-subAddress')[0].focus();
            }
        }).open();
		$('#address_kakao').removeAttr('readonly');
	});
	
	//가격 정보 뿌려주기
	$('.cart-price').each(function() {
		originalPrice += Number($(this).text());
	});
	$('.original-price').each(function() {
		$(this).text(originalPrice);
	});
	$('#original-price').text(originalPrice);
	
	//유저 정보 가져오기
	$.ajax({
		url:"getUserInfo.do",
		type:"post",
		dataType:"json",
		success:function(data){
			userData = data;
		}
	});
	
	//주문자와 동일 체크 시
	$('#check').change(function() {
		if($('#check').is(':checked')) {
			$('.input').eq(0).val(userData.user_name);
			$('.input').eq(1).val(userData.user_addr);
			$('.input').eq(3).val(userData.user_phone);
			$('.input').eq(5).val(userData.user_email);
		} else {
			$('.input').each(function() {
				$(this).val('');
			});
			$('.input').eq(1).attr('readonly','true');
		}
	});
	
	//쿠폰 리스트 가져오기
	$.ajax({
		url:"getCouponList.do",
		type:"post",
		dataType:"json",
		success:function(data) {
			$(data).each(function(key,value) {
				$('#coupon-list').append(
						"<option id='" + value.coupon_id + "' value='"+ value.coupon_rate +"'>"+value.coupon_name+"</option>"
				)
			});
		}
	});
	
	//쿠폰 변경 시 가격 계산
	$('#coupon-list').on('change', function() {
		discountPrice = Math.floor(originalPrice * this.value);
		afterPrice = originalPrice - discountPrice;
		$('.discount-price').text(discountPrice);
		$('.after-price').each(function() {
			$(this).text(afterPrice);
		});
	});
	
	//체크박스 클릭 시 버튼색 변경
	$('#agreePay').change(function() {
		if ($('#agreePay').is(':checked')) {
			$('#paybutton').removeClass('btn-secondary');
			$('#paybutton').addClass('btn-primary');
		} else {
			$('#paybutton').removeClass('btn-primary');
			$('#paybutton').addClass('btn-secondary');
		}
	});
});

function getCoupon_id(){
	let rate = $('#coupon-list').val();
	let coupon_id = '';
	$('option').each(function(){
		if($(this).val() == rate) {
			coupon_id = $(this).attr('id');
		}
	});
	return coupon_id;
}

function progressPay() {
	const pay_info = {
			order_code:'O'+ Math.floor(Math.random()*10000+1) + 'C' + Math.floor(Math.random()*10000+1),
			buyer_name:$('.input').eq(0).val(),
			buyer_email:$('.input').eq(4).val(),
			buyer_tel:$('.input').eq(3).val(),
			buyer_addr:$('.input:eq(1)').val() + ' ' + $('.input:eq(2)').val(),
			paymentOption:$('input:radio[name="payment"]:checked').val(),
			order_price:$('.after-price').eq(1).text(),
			original_price:$('.original-price').eq(0).text(),
			discount_price:$('.discount-price').text(),
			coupon_rate:$('#coupon-list').val(),
			order_message:$('.input').eq(4).val(),
			coupon_id:getCoupon_id()
	}
	
	for (var i = 0; i < 4; i++) {
		if($('.input').eq(i).val() == '') {
			alert('배송 정보를 정확히 입력해주세요.');
			return;
		}
	}
	
	if ($('#coupon-list').val() == 'xx') {
		alert('쿠폰을 선택해주세요.');
		return;
	}
	
	if (pay_info.paymentOption==null) {
		alert('결제 방식을 선택해주세요.');
		return;
	}
	
	if ($('#agreePay').is(':checked') == false) {
		alert('상품 결제에 동의해주셔야 결제가 가능합니다.');
		return;
	}
	
	if (pay_info.paymentOption == 'basic') {
		//무통장 입금
		alert('무통장 입금을 선택하셨습니다.');
		afterPayment(pay_info);
		deleteCoupon();
		window.setTimeout(function(){
			location.href = 'orderSuccess.do?order_id='+pay_info.order_code;
		},1000);
	} else {
		iamport(pay_info);
	}
}

const deleteCoupon = () => {
	let coupon_id = {
			coupon_id:getCoupon_id()
	}
	console.log(coupon_id);
	$.ajax({
		url:"deleteCoupon.do",
		type:"post",
		contentType:"application/json; charset=utf-8",
		data:JSON.stringify(coupon_id),
		success:function(msg) {
			console.log('deleteCoupon: ' + msg);
		}
	});
}

//결제 api
function iamport(pay_info) {
    IMP.init('imp62869817');
    IMP.request_pay({
        pg: pay_info.paymentOption,
        pay_method: 'card',
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: pay_info.order_code, 
        amount: pay_info.order_price, 
        buyer_email: pay_info.buyer_email,
        buyer_name: pay_info.buyer_name,
        buyer_tel: pay_info.buyer_tel,
        buyer_addr: pay_info.buyer_addr,
        buyer_postcode: '123-456'
    }, function(rsp) {
	    if (rsp.success) {
	    	alert('결제가 완료되었습니다.');
	    	afterPayment(pay_info);
	    	window.setTimeout(function() {
		    	location.href = 'orderSuccess.do?order_id='+pay_info.order_code;
	    	},1500);
	    } else {
	       	msg += '에러내용 : ' + rsp.error_msg;
		    alert('결제에 실패하였습니다. ');
	    }
	});
}

function afterPayment(pay_info) {
	//결제 이후 데이터 삽입
	console.log('afterPayment.pay_info: ' + pay_info);
	$.ajax({
		url:"paySuccess.do",
		type:"post",
		contentType:"application/json; charset=utf-8",
		data:JSON.stringify(pay_info),
		success:function(msg){
			console.log(msg);	
		}
	});
}
</script>
<body style="margin-top:200px;"> 
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	
	<!-- 본문 작성 -->
	<div id="container" class="container-fluid">
        <div class="row rows-width first-section" style="margin:0 auto; margin-top:4%">
            <div class="col-md-12">
                <h1 class="display-5" style="font-weight: bold; letter-spacing:3px;">주문 결제</h1><br>
            </div>
        </div>
        <hr style="margin:20px 70px 20px 70px;">
        <!-- 좌측 섹션 -->
        <div class="row rows-info" style="margin:0 auto;">
            <div class="col-md-8 col-left">

                <div class="input-div box-black">
                    <h4>배송 정보 입력</h4>
                </div>

                <div class="same-div" align="right">
                    <span>주문자와 동일</span>
                    <input type="checkbox" id="check">
                </div>

                <div class="box-black input-div-f">
                    <div class="del-input-div">
                        <div class="box-gray title-box">이름</div>
                        <div class="del-second-div">
                            <input type="text" name="name" class="input" placeholder="배송 받으실 분의 성함을 입력해주세요">
                        </div>
                    </div>
                    <div class="del-input-div">
                        <div class="box-gray title-box">주소</div>
                        <div class="del-second-div">
                            <input id="address_kakao" type="text" name="address" class="input input-address" readonly placeholder="클릭해주세요.">
                           	<input type="text" class="input input-subAddress" placeholder="상세주소를 입력해주세요">
                        </div>
                    </div>
                    <div class="del-input-div">
                        <div class="box-gray title-box">연락처</div>
                        <div class="del-second-div">
                            <input type="text" name="name" class="input" placeholder="배송 받으실 분의 연락처를 입력해주세요">
                        </div>
                    </div>
                    <div class="del-input-div">
                        <div class="box-gray title-box">배송 시 요청사항</div>
                        <div class="del-second-div">
                            <input type="text" name="name" class="input" placeholder="20자 이내로 입력해주세요">
                            <input type="hidden" class="input" name="email">
                        </div>
                    </div>
                </div>

            
                <div class="box-gray title-padding">
                    <h4 style="margin:0;">주문 상품 정보</h4>
                </div>
                <!-- 주문 상품 정보 -->
                <div class="box-black">
				<c:forEach var="dto" items="${list}">
                    <!-- 상품 한 줄 -->
                    <div class="box-gray product-row">
                        <div class="p-row-first">
                            <img src="${dto.img_path}">
                        </div>
                        <div class="p-row-second">
                            <span>${dto.p_name}</span>
                        </div>
                        <div class="p-row-third">
                            <span>${dto.cart_count}</span>
                            <span>개</span>
                        </div>
                        <div class="p-row-fourth">
                            <span class="cart-price">${dto.cart_price}</span>
                            <span>&#8361;</span>
                        </div>
                    </div>
                    <!-- 상품 한 줄 끝 -->
				</c:forEach>                   
                </div>

                <!-- 쿠폰 적용 섹션 -->
                <div class="box-gray title-padding">
                    <h4 style="margin:0;">쿠폰 적용</h4>
                </div>
   
                <!-- 쿠폰 적용 div -->
                <div class="box-black title-padding">
                    <div class="coupon-div">
                        <select id="coupon-list">
                        	<option value="xx">쿠폰을 선택해주세요</option>
                        </select>
                    </div>

                    <div class="coupon-info">
                        <div class="coupon-info-ori">
                            <span>원래 금액&nbsp; ></span>&nbsp;
                            <span class="original-price"></span>&nbsp;&#8361;
                        </div>
                        <div class="coupon-info-icon">
                            <img src="resources/images/market/trans.png" alt="trans" id="trans">
                        </div>
                        <div class="coupon-info-after">
                            <span>쿠폰 적용 가&nbsp; ></span>&nbsp;
                            <span class="after-price"></span>&nbsp;&#8361;
                        </div>
                    </div>
                </div>

                <!-- 결제 수단 선택 섹션 -->
                <div class="box-gray title-padding">
                    <h4 style="margin:0;">결제 수단</h4>
                </div>

                <!-- 결제 수단 선택 -->
                <div class="box-black payment-section">
                    <table style="width:100%">
                        <colgroup>
                            <col width="20%">
                            <col width="80%">
                        </colgroup>
                        <tbody>
                            <tr style="height:120px">
                                <th>
                                    &nbsp;&nbsp;&nbsp;결제수단 선택
                                </th>
                                <td>
                                    <div>
                                        <div>
                                            <input type="radio" id="card" name="payment" value="kcp"><label for="card">신용카드</label><br>
                                            <a href="#" class="payment-desc">신용카드 약관 설명></a>
                                        </div>
                                        <div>
                                            <input type="radio" id="basic" name="payment" value="basic"><label for="basic">무통장입금</label><br>
                                            <a href="#" class="payment-desc">무통장 입금 약관 설명></a>
                                        </div>
                                        <div>
                                            <input type="radio" id="kakao" name="payment" value="kakaopay"><label for="kakao">카카오페이</label><br>
                                            <a href="#" class="payment-desc">카카오 페이 약관></a>
                                        </div>
                                        <div>
                                            <input type="radio" id="smile" name="payment" value="smile"><label for="smile">스마일페이</label><br>
                                            <a href="#" class="payment-desc">페이코 결제 약관></a>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- 우측 결제 배너 -->
            <div class="col-md-4" style="height:30%;">
                <div class="fixed-Banner">
                    <div class="f-price">
                        <h4>최종 결제금액</h4>
                    </div>
                    <div class="bn-price-sz bn-price-first">
                        <span>총 상품 가격</span><br>
                        <span class="price original-price"></span>&nbsp;&#8361;
                    </div>
                    <div class="bn-price-sz bn-price-ml">
                        <span>쿠폰 할인가</span><br>
                        <span class="price discount-price"></span>&nbsp;&#8361;
                    </div>
                    <div class="bn-price-sz bn-price-ml">
                        <span>총 결제 금액</span><br>
                        <span class="price after-price"></span>&nbsp;&#8361;
                    </div>
                    <div>
                        <input type="checkbox" id="agreePay">
                        <label class="agree-label">상품의 가격,할인,배송정보,결제대행을 모두 확인하였으며 상품 결제에 동의합니다.</label>
                    </div>
                    <div class="bn-button">
                        <button id="paybutton" onclick="progressPay()" class="btn btn-secondary" style="width:80%;">결제하기</button>
                    </div>
                </div>
            </div>

        </div>
    </div>
	
	<div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>

</body>
</html>