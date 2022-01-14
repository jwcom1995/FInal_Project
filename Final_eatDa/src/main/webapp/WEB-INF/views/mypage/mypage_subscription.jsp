<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
}

.mypage_subscription{

	flex-direction: column;
	width: 800px;
	margin-top: 180px; 
	padding-top: 0;
}

.subscription_info{
    display: flex;
	position: absolute;
	flex-direction: column;  
    width: 800px;
    align-items: center;
}

h1{
    margin-bottom: 20px;
}

hr{
	margin-top:20px;

}

.headline{
	font-size: 22pt;
    font-weight: bold;
}

.headline2{
	margin-top: 35px;
}
.headline2 a {
    margin-left: 20px;
    margin-bottom: 20px;
    font-size: 20pt;
    font-weight: bold;
}

.subscription_info table{
    margin-top: 30px;
    align-items: center;
}

.subscription_info a{
	text-decoration: none;
	font-size: 0.7rem;
}

.wrap{
	width: 100%;
	height: 1000px;
	display: flex;

	justify-content: center;
}
    .subscription_info th{
        text-align: left;
        vertical-align: top;
        width: 100px;
        height: 40px;
        font-size: 0.8rem;
   		font-weight: 600;
    }
    
    .subscription_info td{
        vertical-align: top;
    }


    .submit_btn{
        border: none; 
        border-radius: 4px;
        width: 75px;
        height: 30px;
        background-color: #ffe084;
        color: white;
        font-size: 0.8rem;
        font-weight: bold;
    }
    
    .regist_btn{
    	text-align: right;
    }

    .delivery_product, .delivery_product2{
        width: 150px;
        text-align: center;
    }

    .alter_product1{
        width: 150px;
    }

	.alter_product_pic{
        height: 150px;
        width: 150px;
    }

    .alter_product_pic1{
        content: url("resources/images/sub_food2.png");
        height: 150px;
        width: 150px;
        margin-top: 20px;
    }
    
    .alter_product_pic2{
        content: url("resources/images/sub_food3.png");
        height: 150px;
        width: 150px;
        margin-top: 20px;
    }
    
    .alter_product_pic3{
        content: url("resources/images/sub_food4.png");
        height: 150px;
        width: 150px;
        margin-top: 20px;
    }

    input[type=radio] { display:none; }


    [type=radio] + label{
        display: inline-block;
        cursor: pointer;
        line-height: 22px;
    }

    [type=radio]:checked + label{
        outline: 5px solid #ffe084;
    }

    .alter_product_name1 a{
         margin-left: 50px;
    }

    .alter_product_name2 a{
        margin-left: 110px;
    }

    .alter_product_name3 a{
        margin-left: 100px;
    }
    
    .no_subscription{
    	width: 750px;
    	margin-top: 40px;
    	text-align: center;
    }
    .no_subscription a{
	text-decoration: none;
	font-size: 0.8rem;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		getMarketProduct();
		deliveryProduct();
	});

	const getMarketProduct = () => {
		$.ajax({
			url:"getMarketProduct.do",
			type:"post",
			dataType:"json",
			success:function(data) {
				$(data).each(function(key, value) {
					$('.rec-recipe').append(
						"<td>" +
						"<input type='radio' name='alter_product' id='" + value.p_id +"'>"+
						"<label for='"+ value.p_id + "'><img src='" + value.img_path +"' class='alter_product_pic'>"+
						"</label> &nbsp;&nbsp;"+
						"<br>"+
						"<span class='alter_product_name1'> <a>"+value.p_name+"</a></span>" +
						"</td>"
					);
				});
			}
		});
	}
	
	const deliveryProduct = () => {
		$.ajax({
			url:"deliveryProduct.do",
			type:"post",
			dataType:"json",
			success:function(data) {
				$(data).each(function(key, value) {
					$('.delivery_product2').append(
						"<td>"+
						"<img src='" + value.img_path +"' width='150' height='150'><br>"+
						"<a>" + value.p_name + "</a>"+
						"</td>"
					);
				});
			}
		});
	}
	
	
	function submitBtn(){
		alert("신청이 완료되었습니다.");		
	}
</script>
<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	
	<div class="wrap">
        <div class="mypage_subscription">
            <div class="headline">
                <a>마이페이지</a>
                <hr>
            </div>
            <c:choose>
            		<c:when test="${dto != null}">
            <div class="headline2">
                <a>구독 내역</a>
            </div>
            <div class="subscription_info">
                <table width="760px">
                    <tr>
                        <col width="120px"> <col width="500px">
                    </tr>
                    <tr>
                        <th>구독 종류</th>
                        <td> <a>${dto.subscription_type }</a></td>
                    </tr>
                    <tr>
                        <th>구독 기간</th>
                        <td><a>${dto.subscription_term }</a></td>
                    </tr>
                    <tr>
                        <th>결제 금액</th>
                        <td><a>${dto.subscription_price } 원</a></td>
                    </tr>
                    
                   	<c:choose>
                    <c:when test="${dto.subscription_type == '제철구독' }">
	                    <tr>
	                        <th>배송 예정 상품</th>
	                        <td>
	                            <div class="delivery_product">
		                            <img src="resources/images/sub_food1.png" width="150" height="150"><br>
		                            <a>이달의 샐러드</a>
	                        	</div>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th>대체 상품</th>
	                        <td>
	                            <input type="radio" name="alter_product" value="food1" id="food1" checked="checked">
	                            <label for="food1" class="alter_product_pic1"></label> &nbsp;
	                            <input type="radio" name="alter_product" value="food2" id="food2">
	                            <label for="food2" class="alter_product_pic2"></label> &nbsp;
	                            <input type="radio" name="alter_product" value="food3" id="food3">
	                            <label for="food3" class="alter_product_pic3"></label>
	                            <br>
	                            <span class="alter_product_name1">
	                                <a>샤인마토</a>
	                            </span>
	                            <span class="alter_product_name2">
	                                <a>미니 월남쌈</a>
	                            </span>
	                            <span class="alter_product_name3">
	                                <a>한끼 당근</a>
	                            </span>
	                        </td>
	                    </tr> 
                    </c:when>
                    
                    <c:otherwise>
                    	<tr>
	                        <th>배송 예정 상품</th>
	                        <td class="delivery_product2"></td>
	                    </tr>
	                    <tr>
	                        <th>대체 상품</th>
	                        <td class="rec-recipe"></td>
	                    </tr>
                    </c:otherwise>
                    
                    </c:choose>
                    
                    <tr>
                    	<td colspan="2">
                    		<div class="regist_btn">
                                <input type="button" class="submit_btn" value="수정 신청" onclick="submitBtn();">
                            </div>
                    	</td>
                    </tr>    
                </table>
                </c:when>
                <c:otherwise>
                	<div class="no_subscription">
	                	<a>구독중인 상품이 없습니다.</a> &nbsp;
	                	<a href="subMain.do">구독 신청하기</a>
                	</div>
                </c:otherwise>
                </c:choose>
                    
          </div>
        </div>
    </div>
    
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>
