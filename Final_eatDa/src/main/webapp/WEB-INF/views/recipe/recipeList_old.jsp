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
}

.paging, .rec_logo, .searchbox, .rec_list, .category {
	display: flex;
	justify-content: center;
}

.category{
	letter-spacing: 8px;
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
	margin-left:75%;
	width: 100px;
	height: 30px;
}
.searchBtn, .recipeCategory{
	margin:2% 1%;
	width: 80px;
	height: 40px;
}
.www{
	width: 850px;
	margin-left: 20%;
}
</style>
</head>
<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>

	<div class="recipe_top"></div>

	<div class="body">
		<form action="recipeListTest.do" method="get"> 
			<div class="searchbox">
				<select class="recipeCategory" name="searchType">
					<option disabled selected>선택</option>
					<option value="title" <c:if test="${searchType eq 'title'}">selected</c:if> >제목</option>
					<option value="content" <c:if test="${searchType eq 'content'}">selected</c:if> >내용</option>
					<option value="titcon" <c:if test="${searchType eq 'titcon'}">selected</c:if> >제목+내용</option>
				</select>
				<input type="text" class="keyword" id="keyword" name="keyword" placeholder="검색어를 입력하세요.">
				<input type="submit" class="searchBtn" value="검색">
			</div>
		</form>
	      
	    <div class="category">
			<p> <a href="recipeCategory.do?recipe_category=한식">한식</a> | <a href="recipeCategory.do?recipe_category=일식">일식</a> | <a href="recipeCategory.do?recipe_category=중식">중식</a> | <a href="recipeCategory.do?recipe_category=양식">양식</a> | <a href="recipeCategory.do?recipe_category=야식">야식</a> | <a href="recipeCategory.do?recipe_category=비건">비건</a> </p>
		</div>
      
		<div class="www">
			<c:choose>
				<c:when test="${empty list}">
					<div class="col-md-12">
						<p style="text-align:center;">--------------작성된 글이 없습니다.-----------</p>
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

	<!--  	<div class="body">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
			</div>

			<div class="row">
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
				<div class="col-md-3">
					<a href="recipeDetail.do">
						<div class="rec_list">
							<div class="img_wrap">
								<div class="bg_img">
									<img src="resources/images/recipe/main_prod_bg.png"></img>
								</div>
							</div>
							<div class="img_wrap">
								<div class="rec_title">
									<p>고구마빠스!!!!</p>
								</div>
							</div>
							<img src="resources/images/recipe/ppaseu.png"></img>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
	-->
	<div class="bottom">
		<div class="rec_button">
			<input class="writeBtn" type="button" value="글쓰기"
				onclick="location.href='recipeInsert.do'">
		</div>
		<div class="paging">
			<p>◀ 1 2 3 4 5 ▶</p>
		</div>
	</div>

	<div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>