<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to EatDa</title>  
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  
  <link href="resources/css/blog/blog-update.css" rel="stylesheet">
  <!-- 분리가 안 먹혀서 top 부분만 이곳에 작성함 -->
  <style type="text/css">
  	.blog-update__top{
		  width:100%;
		  height:300px;
		  background: url('resources/images/blog-cooking.png') no-repeat;
		  background-size: cover;
		  overflow: hidden;
		  display: table;
		  border: none;
		  background-position: 0% 55%;
		}
		
		.blog-update__top-txt{
		  color:white;
		  opacity: 0.6;
		  display: table-cell;
		  vertical-align: bottom;
		}
  	.blog-update__top h1, .blog-update__top h2{
		  display: inline;
		}
		
		.blog-update__top-txt h1{
		  font-weight: 700;
		  font-size:120px;
		  height:100px;
		  line-height: 109px;
		}
		
		.blog-update__top-txt h2{
		  margin-left: 20px;
		  font-size: 15px;
		}
  </style>
  <!-- summernote -->
  <link href="resources/css/summernote/summernote-bs4.css" rel="stylesheet"> 
</head>
<body style="margin-top:155px;">
	<div id="header">
		<%@ include file="../common/header.jsp"%>
		<%@ include file="../common/summernote.jsp"%>
	</div>
  <main class="blog-update">
    <!-- main img -->
    <div class="blog-update__top blog__top">
      <div class="blog-update__top-txt blog__top-txt">
        <h1>eat다 그램</h1>
				<h2>eatDagram</h2>
      </div>
    </div>

    <!-- write content -->
    <div class="blog-update__content">
      
      <!-- title -->
      <div class="blog-update__content-title">
        <h2>글 수정</h2>
      </div>

			<!-- article -> summernote -->
      <div class="blog-update__content-article">
      	<form action="blog-update.do" method="post">
        	<input id="user_id" name="user_id" value="${dto.user_id}">
        	<input id="blog-no" type="hidden" name="blog_no" value="${dto.blog_no}">
          <input type="text" name="blog_title" id="title" value="${dto.blog_title}">
					<textarea class="summernote" id="summernote" name="blog_content">${dto.blog_content}</textarea>
					<!-- img -->
					<input type="hidden" id="img" name="blog_img" value="">
					<div class="blog-update__content-article__btns">
						<input type="submit" name="update-submit-btn" value="수정 완료" onclick="submitBtn()">
						<input type="button" name="update-cancel-btn" value="수정 취소" onclick="location.href='blog-detail.do?blog_no=${dto.blog_no}'">
        	</div>
				</form>
      </div>

    </div>

  </main>
  
  <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
	
<script type="text/javascript">
 	function submitBtn(){
		/* let blog_no = $('#blog-no').val();
		var user_id=$('#user_id').val();
		var blog_title=$('#title').val();
		var blog_content=$('#summernote').val();
		console.log(blog_no);
		console.log(blog_title);
		console.log(blog_content);
		location.href="blog-update.do?blog_title="+blog_title+"&blog_content="+blog_content+"&user_id"+user_id+"&blog_no="+blog_no; */
 		alert("글 수정이 완료되었습니다.");
 	}
 	
	//summernote
	$(document).ready(function() {
		var fontList = ['나눔고딕','나눔명조','MaruBuri','궁서체','Arial','Arial Black','Comic Sans MS','Courier New','Verdana','Times New Roamn'];
		var toolbar = [
			// 글꼴 설정
		  ['font', ['fontname','fontsize']],
		  ['fontstyle', ['bold', 'italic', 'underline', 'strikethrough','forecolor','backcolor','clear']],
		  ['style', ['style']],
		  ['highlight', ['highlight']],
		  ['paragraph', ['paragraph','height','ul', 'ol']],
		  // 그림첨부, 링크만들기
		  ['insert',['table','hr','link','picture']],
		];
		$('#summernote').summernote({
			  lang: "ko-KR",								// 한글 설정
			  fontNames: fontList,
			  fontNamesIgnoreCheck: fontList,
				// 추가한 폰트사이즈
			  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
			  height: 350,									// 에디터 높이
        width: 840,									  // 에디터 넓이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
        tabsize: 2,
        prettifyHtml:false,
			  toolbar: toolbar,
			  callbacks : { //여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files, editor, welEditable) {
						console.log(files+"//"+editor+"//");
						
						for (var i = files.length - 1; i >= 0; i--) {
							uploadImageFile(files[i], this);
						}
					}
			  },
			  popover: {
				  image: [
				    ['imageResize', ['resizeFull', 'resizeHalf', 'resizeQuarter', 'resizeNone']],
				    ['float', ['floatLeft', 'floatRight', 'floatNone']],
				    ['remove', ['removeMedia']],
				    ['custom', ['imageTitle']],
				  ]
				}
				
		});
	});
	
 	function uploadImageFile(files, el){
		data = new FormData();
		data.append("file", file);
		console.log("data"+data);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadImageFile.do",
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
	
</body>
</html>
