<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to EatDa</title>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link href="resources/admin/css/write.css" rel="stylesheet">
  <style type="text/css">
	#senderName,#senderMail,#receiveMail,#subject{
	    width: 840px;
	    height: 40px;
	    padding-left: 10px;
	    font-size: 16px;
	    margin-left: 10%;
	    margin-top:2%;
    }
    #uploadFile{
    	width: 840px;
	    height: 40px;
	    padding-left: 10px;
	    font-size: 16px;
	    margin-left: 10%;
	    margin-top:2%;
	    border:none;
    }
    #deleteBtn{
    	width: 10px;
	    padding-right: 80px;
	    font-size: 11pt;
	    text-align: center;
	    font-weight: normal;
	    margin-left: 50%;
    }
  	.write__top h2{ display: inline;}

	.write__top-txt h2{
		margin-left: 20px;
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
		
		textarea{
			width: 840px;
	    	height: 200px;
		    padding-left: 10px;
		    font-size: 16px;
		    margin-left: 10%;
		    margin-top:2%;
		    resize: vertical;
		}
		form{
			width:80%;
			margin-left: inherit;
		}
		img{
			margin-left:30%;
		}
  </style>
</head>
<body style="margin-top:155px;">
  <main class="write">
    <div class="write__content">
      <div class="write__content-title">
        <h2>이메일 보내기</h2>
      </div>
      <div class="write__content-article">
        <form action="send.do" onsubmit="return check_frm();" method="post" enctype="multipart/form-data">
	    	<label><input type="text" name="senderName" id="senderName" value="EatDa" readonly><br></label>
	        <label><input type="text" name="senderMail" id="senderMail" value="TeamEatDa@eatDa.com" readonly><br></label>
	        <label><input type="text" name="receiveMail" id="receiveMail" placeholder="수신자 이메일을 입력하세요" autofocus><br></label>
	        <label><input type="text" name="subject" id="subject" value="안녕하세요  ${member.user_name}님, EatDa입니다 :)"><br></label>
	        <label><textarea cols="80" name="message" id="message" placeholder="내용을 입력하세요"></textarea></label>
	          	
	        <input type="hidden" name="img_path" class="img_path">
	        <div class="file_input">
		    	<label><input type="file" name="uploadFile" id="uploadFile"></label>
	    		<div class="select_img"><img src=""></div>
	        </div>
			<br><br>
			<div class="product-write__content-article__btns">
				<input type="submit" name="write-submit-btn" id="btnInsert" value="전 송">
				<input type="button" name="write-cancel-btn" value="취 소" onclick="location.href='adminUser.do'">
        	</div>
        </form>
      </div>
    </div>
  </main>
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
	function check_frm(){
	    	 if(confirm('작성하신 메일을 전송하시겠습니까?')==true){
	    		 return true;
	    	 }else{
	    		 return false;
	    	 }
	     }
	
	// 사진 첨부 시 아래 영역에 선택한 사진 띄우기
	$("#uploadFile").change(function(){
			if(this.files && this.files[0]) {
				var reader = new FileReader;
				reader.onload = function(data){
					$(".select_img img").attr("src", data.target.result).width(300);
				}
				reader.readAsDataURL(this.files[0]);
			}
		});
	
	$("#btnInsert").click(function(){
		let data = new FormData(document.getElementById("f"));
		
		$.ajax({
			url:"/admin/send.do",
			type:"post",
			processData:false,
			contentType:false,
			data:data,
			success:function(){
				adminUser();
		}
		});
	});
	</script>
	
</body>
</html>