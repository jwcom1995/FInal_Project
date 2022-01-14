<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

.mypage_like{ 
	display: flex;
	position: absolute;
	flex-direction: column;
	width: 800px;  
	margin-top: 160px;
    padding-top: 0;
}

.blog_like_wrap{ 
    display: flex;
    position: absolute;
	flex-direction: column;
    width: 800px;
    align-items: center;
    margin-top: 120px;
}

.blog_like{
    display: flex;
	flex-direction: column;
    width: 630px;
    height: 300px;
    align-items: center;
    margin-top: 40px;
    margin-bottom: 100px;
    overflow-y: scroll;
}

.blog_like table tr td{
	padding: 10px;
	vertical-align: top;
}

.blog_like table tr td a{
	text-decoration: none;
	font-size: 0.7rem;
}

.blog_like table tr td .blog_list{
    width: 400px;
    height: 140px;
    margin-left: 10px;
    overflow: hidden;
    text-overflow: ellipsis;

}

.blog_like table tr td .blog_list h3{
    font-size: 14pt;
    font-weight: bold;
    margin-bottom: 20px;

}

.blog_like table tr td .blog_list a{
	
    font-size: 0.7rem;

}

.blog_like::-webkit-scrollbar{
    width: 6px;
}

.blog_like::-webkit-scrollbar-thumb{
    background-color: #ffe084;
    border-radius: 10px;
}


.market_like_wrap, .bought_product_wrap{
    display: flex;
	flex-direction: column;
    width: 800px;
    align-items: center;
    margin-top: 20px;
    margin-bottom: 50px;
}

.market_like{
    display: flex;
	flex-direction: column;
    width: 750px;
    height: 250px;
    align-items: left;
}

.bought_product{
    display: flex;
	flex-direction: column;
    width: 750px;
    height: 270px;
    align-items: left;
}

.market_like table tr td .market_list, .bought_product table tr td .bought_list{
    max-width: 160px;
    max-height: 150px;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.market_order_list input{
	width: 60px;
	height: 20px;
	border: 0;
	background: #FAEED2;
	color: gray;
	border-radius: 5px;
    font-size: 0.7rem;

}


.market_like::-webkit-scrollbar, .bought_product::-webkit-scrollbar{
    height: 6px;
}

.market_like::-webkit-scrollbar-thumb, .bought_product::-webkit-scrollbar-thumb{
    background-color: #ffe084;
    border-radius: 10px;
}

h1{
    margin-bottom: 20px;
}

hr{
	margin-top: 20px;
    margin-bottom: 20px;
}
.headline{
	margin-top: 0px;
}

.headline a{
	font-size: 22pt;
    font-weight: bold;
}

.headline2{
	margin-top:30px;
}

.headline3{
	margin-top:380px;
}

.headline4{
	margin-top:20px;
}

.headline2 a, .headline3 a, .headline4 a{
    margin-left: 20px;
    margin-bottom: 20px;
    font-size: 20pt;
    font-weight: bold;
}


table{
    margin-top: 10px;
    align-items: center;
}


.wrap{
	width: 100%;
	height: 1500px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.market_like table tr td, .bought_product table tr td{
    text-align: center;
    padding: 15px;
}

.market_like table tr td a, .bought_product table tr td a{
    text-decoration: none;
	font-size: 0.7rem;
	font-weight: bold;
}

.blog_like_list:hover, .market_like_list:hover, .market_order_list:hover{
	cursor:pointer;
}

.no_blog_list{
	width: 550px;
	margin-top: 140px;
	text-align: center;
}

.no_market_list, .no_order_list{
	width: 750px;
	margin-top: 60px;
	text-align: center;
}

.no_blog_list a, .no_market_list a, .no_order_list a{
	text-decoration: none;
	font-size: 0.8rem;
}

#link_order_list{
	text-decoration: none;
	font-size: 0.8rem;
	color: gray;
}

#link_order_list:hover{
	color: blue;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
	blogLike();
	marketLike();
	marketOrderList();
});

//블로그 찜 목록
function blogLike() {
	$.ajax({
		url:"blogLikeList.do",
		type:"post",
		dataType:"json",
		success:function(data) {
			let list = data;
			
			if(list == 0){
				$('.blog_like').append(
						"<div class='no_blog_list'>" +
						"<a>좋아한 EatDagram 글이 없습니다.</a>" +
						"</div>"
					);
			}else{
			$(list).each(function(key, value) {
				$('.blog_like').append(
						"<table class='blog_like_list' id='" + value.blog_no + "' onclick='goBlogLike(this)'>" +
						"<tr>"+
						"<td>" +
						"<div class='like-img-div'>" +
						"<img id='" + value.blog_no + "' class='like-img' src='" + value.blog_img + "' width='150' height='150'>" +
						"</div>"+
						"</td>"+
						
						"<td>"+
						"<div class='blog_list'>" +
						"<h3>" +value.blog_title + "</h3>" +
						"<a>" +value.blog_content + "</a>" +
						"</div>" +
						"</td>"+
						"</tr>" +
						"</table>"
					);
			});
			}
		}
	});
	
}

//블로그 상세 페이지로 이동
function goBlogLike(object) {
	var blog_no = $(object).attr('id');
	location.href = 'blog-detail.do?blog_no='+blog_no;
}

//마켓 찜 목록
function marketLike() {
	$.ajax({
		url:"likeProduct-main.do",
		type:"post",
		dataType:"json",
		success:function(data) {
			let list = data;
			
			if(list == 0){
				$('.market_like').append(
						"<div class='no_market_list'>" +
						"<a>좋아한 상품이 없습니다.</a>" +
						"</div>"
					);
			}else{
			$(list).each(function(key, value) {
				$('.market_like_list').append(
						"<td id='"+ value.p_id +"' onclick='goMarketLike(this)'>" +
						"<div class='like-img-div'>" +
						"<img class='like-img' src='" + value.img_path + "' width='150' height='150'>" +
						"</div>"+
						
						"<div class='blog_list'>" +
						"<a>" +value.p_name + "</a><br>" +
						"<a>" +value.p_price + " 원</a>" +
						"</div>" +
						"</td>"
					);
			});
			}
		}
	});
	
}

//찜한상품, 주문상품 마켓 상세 페이지로 이동
function goMarketLike(object) {
	var p_id = $(object).attr('id');
	location.href = 'goProductPage.do?p_id='+p_id;
}

//주문한 상품 목록
function marketOrderList() {
	$.ajax({
		url:"marketOrderList.do",
		type:"post",
		dataType:"json",
		success:function(data) {
			let list = data;
			
			if(list == 0){
				$('.bought_product').append(
						"<div class='no_order_list'>" +
						"<a>주문한 상품이 없습니다.</a>" +
						"</div>"
					);
			}else{
			$(list).each(function(key, value) {
				$('.market_order_list').append(
						"<td>" +
						"<div class='list_div' id='"+ value.p_id +"' onclick='goMarketLike(this)'>" +
						"<div class='like-img-div'>" +
						"<img class='like-img' src='" + value.img_path + "' width='150' height='150'>" +
						"</div>"+
						
						"<div class='order_list'>" +
						"<a>" +value.p_name + "</a><br>" +
						"<a>" +value.price + " 원</a>" +
						"</div>" +
						"</div>" +
						"<input type='button' id='" + value.order_id + "' value='리뷰 작성' onclick='reviewForm(this)'>"+
						"</td>"
					);
			});
			}
		}
	});
	
}


//리뷰작성 -> 리뷰
function reviewForm(object) {
	var order_id = $(object).attr('id');
    var p_id = $(object).siblings('.list_div').attr('id');
    var p_name = $(object).siblings('.list_div').children('.order_list').children('a').eq(0).text();
    var img_path = $(object).siblings('.list_div').children('.like-img-div').children('.like-img').attr('src');
    
    console.log(img_path);
    console.log(p_id);
    console.log(p_name);
    
	location.href = 'reviewForm.do?order_id=' + order_id + '&p_id=' + p_id + '&p_name=' + p_name + '&img_path=' + img_path;
}



</script>

<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	<div class="wrap">
        
        <div class="mypage_like">
            <div class="headline">
                <a>마이페이지</a>
                <hr>
            </div>
            <div class="headline2">
                <a>내가 좋아한 EatDagram</a>
            </div>
            <div class="blog_like_wrap">
           		<div class="blog_like"></div>
        	</div>
          
          <div class="headline3">
            <a>찜한 상품</a>
          </div>
          <div class="market_like_wrap">
          <div class="market_like" style="overflow-x: auto; overflow-y: hidden;">
              <table width="600px">
                <tr>
                    <col width="200px">
                </tr>
                <tr class="market_like_list"></tr>  
              </table>
          </div>
        </div>

        <div class="headline4">
            <a>주문한 상품</a><br>
            <a href="marketOrderList2.do?user_id=${member.user_id }" id="link_order_list">>>주문내역 보기</a>
         </div>
          <div class="bought_product_wrap">
          <div class="bought_product" style="overflow-x: auto; overflow-y: hidden;">
              <table width="600px">
                <tr>
                    <col width="200px">
                </tr>
                <tr class="market_order_list"></tr>  
              </table>
          </div>
        </div>



        </div>
       
    </div>
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>