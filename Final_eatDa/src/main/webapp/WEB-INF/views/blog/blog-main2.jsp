<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<%@ page import="com.project.eatda.dto.BlogDto"%>
	<%@ page import="java.util.List"%>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<title>Welcome to EatDa</title>

	<link rel="stylesheet"
		  href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
		  integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm"
		  crossorigin="anonymous">
	<style type="text/css">
		.blog-main__top {
			width: 100%;
			height: 300px;
			background: url('resources/images/blog-main.png') no-repeat;
			background-size: cover;
			overflow: hidden;
			display: table;
			border: none;
		}

		.blog-main__top-txt {
			color: white;
			opacity: 0.6;
			display: table-cell;
			vertical-align: bottom;
		}

		.blog-main__top-txt h1, .blog-main__top-txt h2 {
			display: inline;
		}

		.blog-main__top-txt h1 {
			font-weight: 700;
			font-size: 120px;
			height: 100px;
			line-height: 90px;
		}

		.blog-main__top-txt h2 {
			margin-left: 20px;
			font-size: 15px;
		}
		.blog-main__top:hover {
			cursor:pointer;
		}
		.blog-article {
			height:auto;
		}
		
	</style>
	<link href="resources/css/blog/blog-main.css" rel="stylesheet">
	<script type="text/javascript">
		// blog list
		$(document).ready(function() {
			takeBlog(1);
			pagination();
		});

		function takeBlog(num){
			$('.blog-article__list').html('');
			console.log(num);

			$.ajax({
				url: "takeBlog.do?num="+num,
				type: "get",
				dataType: "json",
				success: function(list) {
					let data = list;
					let idx = 0;
					$(data).each(function(key,value){
						if(0<3){
							$('.blog-article__list').append(
									"<li>"+"<a href='blog-detail.do?blog_no="+value.blog_no+"'>"+
									"<div class='blog-article__list-title'>"+
										"<h3>"+value.blog_title+"</h3>"+
										"<span>"+value.user_id+"</span>"+
										"<div class='blog-article__list-title__icons'>"+
											"<i class='fas fa-heart'>&nbsp;"+value.blog_like+"</i>"+"<i class='fas fa-comment'>&nbsp;"+value.reply_count+"</i>"+
										"</div>"+
									"</div>"+
									"<div class='blog-article__list-content'>"+
										"<p>"+value.blog_content+"</p>"+
									"</div>"+
									"<div class='blog-article__list-img'>"+
										"<img src='"+value.blog_img+"'>"+
									"</div></a></li>"
							);
							idx++;
						}
					});
				}
			});
		}
		function pageMove() {
			console.log(blog_list);
		}

		function totalBlog() {
			takeBlog(1);
			pagination();
		}


		//페이징 함수
		function pagination() {
			let paging = 0;
			$('.pagination').html('');

			$.ajax({
				url: "blog-paging.do",
				type: "post",
				dataType: "json",
				success: function(data) {
					paging = Number(data);

					if (paging%3 == 0) {
						paging = paging/3;
					} else {
						paging = paging/3 + 1;
					}

					$('.pagination').append(
							"<a id='left-paging' onclick='leftPaging()'>&laquo;</a>"
					);

					for (var i = 1; i <= paging; i++) {
						$('.pagination').append(
								"<a class='page" + i + "' onclick='movePage(this)'>"+i+"</a>"
						);
					}
					$('.pagination').children().eq(1).addClass('active');
					$('.pagination').append(
							"<a id='right-paging' onclick='rightPaging()''>&raquo;</a>"
					);
				}
			});
		}

		//페이지 이동할 때 함수
		function movePage(object) {
			let page = Number($(object).text());
			let pageid = $(object).attr('id');
			takeBlog(page);
		}

		let presentPage = Number($('.active').text());

		//페이지 << >> 클릭
		function leftPaging() {
			let prevPage = $('.active').prev().text();

			if (prevPage == '«') {
				return;
			} else {
				takeBlog(prevPage);
				$('.active').prev().addClass('active');
				$('.active').eq(1).removeClass('active');
			}
		}

		function rightPaging() {
			let nextPage = $('.active').next().text();

			if (nextPage == '»') {
				return;
			} else {
				takeBlog(nextPage);
				$('.active').next().addClass('active');
				$('.active').eq(0).removeClass('active');
			}
		}

		function searchBlog(){
			var keyword = $('#keyword').val();
			let data = { "keyword":keyword }
			$.ajax({
				url: "blog-search.do",
				type: "post",
				dataType: "json",
				data:JSON.stringify(data),
				contentType:"application/json; charset=utf-8",
				success: function(list) {
					$('.blog-article__list').html('');
					let data = list;
					console.log(data);
					// {"KEYWORD":"!@#"}
					$(data).each(function(key,value){
						$('.blog-article__list').append(
								"<li>"+"<a href='blog-detail.do?blog_no="+value.blog_no+"'>"+
								"<div class='blog-article__list-title'>"+
									"<h3>"+value.blog_title+"</h3>"+
									"<span>"+value.user_id+"</span>"+
									"<div class='blog-article__list-title__icons'>"+
									"<i class='fas fa-heart'>&nbsp;"+value.blog_like+"</i>"+"<i class='fas fa-comment'>&nbsp;"+value.reply_count+"</i>"+
									"</div>"+
								"</div>"+
								"<div class='blog-article__list-content'>"+
									"<p>"+value.blog_content+"</p>"+
								"</div>"+
								"<div class='blog-article__list-img'>"+
									"<img src='"+value.blog_img+"'>"+
								"</div></a></li>"
						);
					});
					$('.pagination').html('');
				}
			});
			
		}
		function goBlogMain() {
			location.href='blog.do';
		}
	</script>
</head>
<body style="margin-top:155px;">
<div id="header">
	<%@ include file="../common/header.jsp"%>
</div>
<main class="blog-main">
	<!-- main img -->
	<div class="blog-main__top" onclick="goBlogMain()">
		<div class="blog-main__top-txt">
			<h1>eat다 그램</h1>
			<h2>eatDagram</h2>
		</div>
	</div>

	<div class="blog-article">
		<!-- search box -->
		<!-- <form action="blog-search.do" method="POST"> -->
		<div class="blog-article__searchbox">
			<select class="blog-article__select" name="searchSelect">
				<option disabled selected>선택</option>
				<option value="title">제목</option>
			</select> <input type="text" name="keyword" id="keyword" placeholder="검색할 제목을 입력하세요.">
			<input type="button" value="검색" onclick="searchBlog()">
			<c:if test="${member.user_id != null}">
			<input type="button" value="글쓰기" onclick="location.href='blog-writeform.do'">
			</c:if>
		</div>


		<!-- blog list -->
		<div class="blog-article__listbox">
			<ul class="blog-article__list">
				<!-- 블로그 글 리스트 -->
			</ul>

			<div class="blog-article__paging">
				<!-- paging -->
				<div class="pagination" align="center"></div>
			</div>

		</div>
	</div>
</main>
<div id="footer">
	<%@ include file="../common/footer.jsp"%>
</div>


</body>
</html>