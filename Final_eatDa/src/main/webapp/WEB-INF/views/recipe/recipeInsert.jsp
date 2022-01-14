<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">

  
  <style type="text/css">
.recipe_content-wrap{
	  margin-top: 30px;
  text-align: justify;
}
.recipe_content-title, .category{
	margin-bottom: 2%;
}
.recipe-button, .recipe_content-title, .recipe_title,.form-group, .recipe_content-category, .conrainer{
	display: flex;
	justify-content: center;
}

.recipe_title{
	padding-bottom: 15px;
	border-bottom: 0.3px solid rgb(235, 235, 235);
}
.recipe_content-title input, .short input{
	margin-top:2%;
	width : 880px;
	height: 40px;
}

.recipe-button{
	margin-bottom: 2%;
}

.recipe-button input{
	background-color: #fdd300;
	color: black;
	font-weight: bolder;
	border:none;
	width: 80px;
	height: 33px;
}
.recipe_top{
	  width:100%;
	  height:200px;
	  background: url('resources/images/recipe/recipeLogo.png') no-repeat;
	  background-size: cover;
	  overflow: hidden;
	  display: table;
	  border: none;
	  background-position: 0 90%;
	  margin-top:155px;
	  
	}


.recipe_content-category{letter-spacing: 8px;}
.recipe_content-category label{margin-right: 2%;}	
.recipe_content-main{margin-left: 13%;}	

  </style>
</head>
<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
		<%@ include file="../common/summernote.jsp"%>
	</div>
	<div class="recipe_write">
	    <!-- main img -->
		<div class="recipe_top"></div>
	
	    <!-- title -->
	    <div class="recipe_title">
	        <h2>새 글 작성</h2>
	    </div>
	    
	    <!-- main content -->
	  	<div class="recipe_content-article">
			<form action="recipeInsertRes.do" method="POST">
		
				<div class="recipe_content-title">
					<input type="text" class="form-control" placeholder="제목을 입력하세요." id="title" name="recipe_title">
				</div>
		
				<div class="recipe_content-category">
					<strong>CATEGORY&nbsp;|&nbsp;</strong>
					<label><input type="radio" name="recipe_category" value="한식"> 한식</label>
					<label><input type="radio" name="recipe_category" value="일식"> 일식</label>
					<label><input type="radio" name="recipe_category" value="중식"> 중식</label>
					<label><input type="radio" name="recipe_category" value="양식"> 양식</label>
					<label><input type="radio" name="recipe_category" value="야식"> 야식</label>
					<label><input type="radio" name="recipe_category" value="비건"> 비건</label>
				</div>
				<div class="form-group short">
					<input type="text" name="r_short_desc">
				</div>
				<div class="form-group">
					<textarea id="summernote" class="form-control" rows="5" id="content" name="recipe_content"></textarea>
					<!-- image 경로 넘겨주기! -->
					<input type="hidden" id="img" name="recipe_img" value="">
				</div>
				
				<div class="recipe-button ">
					<input type="submit" value="등록"> &nbsp;&nbsp;&nbsp;
					<input type="button" value="취소" onclick="location.href='recipeList.do'">
				</div>
			</form>
		</div>
	</div>

  <script>
	var toolbar = [
	   // 글꼴 설정
	   ['fontname', ['fontname']],
	   // 글자 크기 설정
	   ['fontsize', ['fontsize']],
	   // 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
	   ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	   // 글자색
	   ['color', ['forecolor','color']],
	   // 표만들기
	   ['table', ['table']],
	   // 글머리 기호, 번호매기기, 문단정렬
	   ['para', ['ul', 'ol', 'paragraph']],
	   // 줄간격
	   ['height', ['height']],
	   // 그림첨부, 링크만들기, 동영상첨부
	   ['insert',['picture','link','video']],
	   // 코드보기, 확대해서보기, 도움말
	   ['view', ['codeview','fullscreen', 'help']]
	];

	var setting = {
	   height : 450,
	   width : 880,
	   minHeight : null,
	   maxHeight : null,
	   focus : true,
	   lang : 'ko-KR',
	   toolbar : toolbar,
	   callbacks : { //여기 부분이 이미지를 첨부하는 부분
			onImageUpload : function(files, editor, welEditable) {
				console.log(files+"//"+editor+"//");
				
				for (var i = files.length - 1; i >= 0; i--) {
					uploadSummernoteImageFile(files[i], this);
				}
			}
	   }
	};

	$('#summernote').summernote(setting);
  
	function uploadSummernoteImageFile(file, el) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadSummernoteImageFile.do",
			contentType : false,
			enctype : 'multipart/form-data',
			processData : false,
			success : function(data) {
				$(el).summernote('editor.insertImage', data.url);
				console.log("date.url" + data.url);
				console.log("data" + data);
				document.getElementById('img').value = data.url;
			}
		});
	}
	
  </script>
  
  	<div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>