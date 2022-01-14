<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to EatDa</title>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<link href="resources/css/event/event-write.css" rel="stylesheet">
	<style type="text/css">
		body{
		  margin:0;
		  padding:0;
		}
		
		.event-write__top{
		  width:100%;
		  height:300px;
		  background: url('resources/images/wine02.png') no-repeat;
		  background-size: cover;
		  overflow: hidden;
		  display: table;
		  border: none;
		  background-position: 5% 20%;
		}
		
		.event-write__top-txt{
		  color:white;
		  opacity: 0.5;
		  display: table-cell;
		  vertical-align: bottom;
		}
		
		.event-write__top h1, .event-write__top h2{
		  display: inline;
		}
		
		.event-write__top-txt h1{
		  font-weight: 700;
		  font-size:120px;
		  height:100px;
		  line-height: 105px;
		}
		
		.event-write__top-txt h2{
		  margin-left: 350px;
		  font-size: 15px;
		}
		
		@font-face {
			font-family: 'Nanum Gothic', serif; 
			src: url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css') format('opentype');
		}
		@font-face {
	    font-family: 'MaruBuri';
	    font-weight: 400;
    	font-style: normal;
	    src: url('https://cdn.jsdelivr.net/gh/webfontworld/naver/MaruBuri-Regular.woff2') format('woff2');
		}
	</style>
  
  <!-- summernote -->
	<link href="resources/css/summernote/summernote-bs4.css" rel="stylesheet">  
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
  
</head>
<body style="margin-top:155px;">
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
  <main class="event-write">
    <!-- main img -->
    <div class="event-write__top">
      <div class="event-write__top-txt">
        <h1>eat다 이벤트</h1>
        <h2>eatDa Event</h2>
      </div>
    </div>

    <!-- write content -->
    <div class="event-write__content">
      
      <!-- title -->
      <div class="event-write__content-title">
        <h2>새 글 작성</h2>
      </div>

			<!-- article -> summernote -->
      <div class="event-write__content-article">
        <form action="event-write.do" method="post">
          <input type="text" name="event_title" placeholder="제목을 입력하세요.">
					<textarea id="summernote" name="event_content"></textarea>
					<!-- img -->
					<input type="hidden" id="img" name="event_img" value="">
					<div class="event-write__content-article__btns">
						<input type="submit" name="write-submit-btn" value="작성 완료" onclick="submitBtn()">
						<input type="button" name="write-cancel-btn" value="작성 취소" onclick="location.href='event.do'">
        	</div>
        </form>

      </div>

    </div>

  </main>
  
  <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
	
	<!-- summernote -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<!--  include summernote-ko-KR -->
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.js"></script>
  <script type="text/javascript">
  function submitBtn(){
	  alert("글 작성이 완료되었습니다.");
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
			  placeholder: '내용을 작성해주세요!',	//placeholder 설정
        prettifyHtml:false,
			  toolbar: toolbar,
			  callbacks : { //이미지를 첨부
					onImageUpload : function(files, editor, welEditable) {
						console.log(files+"//"+editor+"//");
						
						for (var i = files.length - 1; i >= 0; i--) {
							uploadEventImageFile(files[i], this);
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
	function uploadEventImageFile(file, el){
		data = new FormData();
		data.append("file", file);
		console.log("data"+data);
		$.ajax({
			data : data,
			type : "POST",
			url : "uploadEventImageFile.do",
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