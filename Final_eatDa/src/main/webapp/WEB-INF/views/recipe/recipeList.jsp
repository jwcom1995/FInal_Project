<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eat다</title>
<style type="text/css">
.recipe_top {
	width: 100%;
	height: 200px;
	background: url('resources/images/recipe/recipeLogo.png') no-repeat;
	background-size: cover;
	overflow: hidden;
	display: table;
	border: none;
	background-position: 0 90%;
	margin-top:155px;
}

.rec_list>img {
	width: 200px;
	height: 200px;
	margin-bottom: 5%;
}
.rec_list{
	margin-bottom: 2%;
}

.img_wrap {
	position: absolute;
}

.rec_title {
	position: relative;
	top: 165px;
	
}

.rec_title p {
	font-weight: bolder;
	color: white;
}

.bg_img {
	position: relative;
	top: 150px;
	left: 0px;
}

.bg_img>img {
	width: 200px;
	height: 50px;
}

.container, .rec_logo {
	margin: 2% 0;
}

.rec_button input, .searchBtn{
	background-color: #fdd300;
	color: black;
	font-weight: bolder;
	border:none;
}

.paging, .rec_logo, .searchbox, .rec_list, .category {
	display: flex;
	justify-content: center;
}

.category{
	letter-spacing: 8px;
	margin-bottom: 2%;
}
.category a{
	text-decoration: none;
	color : #808080;
	category{}
}

.category a:hover{
	color : #fdd300;
}
.searchbox .keyword{
	margin-top:2%;
	width : 840px;
	height: 40px;
}
.writeBtn {
	margin: 0 0 1% 68%;
	width: 100px;
	height: 30px;
}
.searchBtn, .recipeCategory{
	margin:2% 0.5%;
	width: 80px;
	height: 40px;
}
.www{
	width: 850px;
	margin-left: 20%;
}
.paging a{
    text-decoration: none;
    color: black;
}
.paging a:active {
	color:#fdd300;
}
.fontSize{
	margin-top:5%;
	font-size: x-large;
	height: 400px;
}
</style>

<script type="text/javascript">
	function categoryChk(obj){
		console.log(obj);
		var val1 = document.getElementsByName("category")[0].value = obj;
		console.log(val1);
		
		val1.submit();
		return false;

	}
</script>
</head>
<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>

	<div class="recipe_top"></div>

	<div class="body">
		<form action="recipeList.do" method="get"> 
			<div class="searchbox">
				<select class="recipeCategory" name="searchType">
					<option disabled selected>선택</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="titcon">제목+내용</option>
				</select>
				<input type="text" class="keyword" name="keyword" placeholder="검색어를 입력하세요.">
				<input type="submit" class="searchBtn" value="검색">
			</div>
			
	
			<!-- 검색후 화면에 보여질 게시글 수와 페이지 -->
			<input type="hidden" name="pageNum" value="1">
			<input type="hidden" name="amount" value="9">
		</form>
	    <div class="category">
			 	<a href="recipeList.do">전체</a> |
				<a href="recipeList.do?category=한식">한식</a> | 
				<a href="recipeList.do?category=일식">일식</a> | 
				<a href="recipeList.do?category=중식">중식</a> | 
				<a href="recipeList.do?category=양식">양식</a> | 
				<a href="recipeList.do?category=야식">야식</a> | 
				<a href="recipeList.do?category=비건">비건</a>			
			
		</div>
	    
		<div class="www">
			<c:choose>
				<c:when test="${empty list}">
					<div class="col-md-12">
						<p class="fontSize" style="text-align:center;">작성된 글이 없습니다.</p>
					</div>
				</c:when>
				<c:otherwise>
				<c:set var="i" value="0" />
				<c:set var="j" value="3" />
					<div class="row">
					<c:forEach items="${list}" var="recipeDto">
						<div class="col-md-4">
							<a href="recipeDetail.do?recipe_no=${recipeDto.recipe_no }">
								<div class="rec_list">
									<div class="img_wrap">
										<div class="bg_img">
											<img src="resources/images/recipe/main_prod_bg.png"></img>
										</div>
									</div>
									<div class="img_wrap">
										<div class="rec_title">
											<p>${recipeDto.recipe_title }</p>
										</div>
									</div>
									<img src="${recipeDto.recipe_img }" />
								</div>
							</a>	
						</div>
					</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>


	<div class="bottom">
		<c:if test="${member.user_id =='ADMIN'}">
			<div class="rec_button">
				<input class="writeBtn" type="button" value="글쓰기"
					onclick="location.href='recipeInsert.do'">
			</div>
		</c:if>
		<div class="paging">
			<c:if test="${rpdto.prev }" >
				<a href="recipeList.do?pageNum=${rpdto.startPage - 1 }&amount=${rpdto.amount }">이전</a>
			</c:if>
			
			<c:forEach var="num" begin="${rpdto.startPage }" end="${rpdto.endPage }" >
				<p class="${rpdto.pageNum eq num ? 'active' : '' }">
					<a href="recipeList.do?pageNum=${num }&amount=${rpdto.amount}">${num }</a>&nbsp;
				</p>
			</c:forEach>
			
			<c:if test="${rpdto.next }" >
				<a href="recipeList.do?pageNum=${rpdto.endPage + 1 }&amount=${rpdto.amount }">다음</a>
			</c:if>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>