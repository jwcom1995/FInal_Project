<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin_Product_Write</title>

  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <link href="resources/admin/css/write.css" rel="stylesheet">
  <style type="text/css">
	#p_price,#p_short_desc,#p_cal,#p_amount,#seller_desc{
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
  	.product-write__top h2{ display: inline;}

	.product-write__top-txt h2{
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
        <h2>상품 등록</h2>
      </div>
      <div class="write__content-article">
        <form action="adminProductInsert.do" onsubmit="return check_frm();" method="post" enctype="multipart/form-data">
        	<div class="p_category">
	          	<strong>CATEGORY&nbsp;|&nbsp;</strong>
				<label><input type="radio" name="p_category" value="한식"> 한식</label>
				<label><input type="radio" name="p_category" value="일식"> 일식</label>
				<label><input type="radio" name="p_category" value="중식"> 중식</label>
				<label><input type="radio" name="p_category" value="양식"> 양식</label>
				<label><input type="radio" name="p_category" value="비건"> 비건</label>
				<label><input type="radio" name="p_category" value="고기만"> 고기만</label>
				<label><input type="radio" name="p_category" value="해산물"> 해산물</label>
				<label><input type="radio" name="p_category" value="스페인"> 스페인</label>
	          	<label><input type="radio" name="p_category" value="기타"> 기타</label>
	          	<br><br>
	         </div> 	
	          	<label><input type="text" name="p_name" id="p_name" placeholder="상품명을 입력하세요" required><br></label>
	          	<label><input type="text" name="p_short_desc" id="p_short_desc" placeholder="간략한 설명을 입력하세요" required><br></label>
	          	<label><textarea cols="80" rows="10" name="p_description" id="p_description" placeholder="상품 설명을 입력하세요" required></textarea></label>
	          	<label><input type="text" name="p_price" id="p_price" placeholder="상품 가격을 입력하세요" required><br></label>
	          	<label><input type="text" name="p_cal" id="p_cal" placeholder="상품의 칼로리를 입력하세요" required><br></label>
	          	<label><input type="text" name="p_amount" id="p_amount" placeholder="상품의 gram(그램)을 입력하세요" required></label>
	          	<label><input type="text" name="seller_desc" id="seller_desc" placeholder="판매자의 설명을 입력하세요" required> </label>
	          	<input type="hidden" name="img_path" class="img_path">
	          	<div class="file_input">
		          	<label><input type="file" name="uploadFile" id="uploadFile"></label>
	    	      	<div class="select_img"><img src=""></div>
	          	</div>
	          	
	          	<br><br>

			<div class="product-write__content-article__btns">
				<input type="submit" name="write-submit-btn" id="btnInsert" value="등 록">
				<input type="button" name="write-cancel-btn" value="취 소" onclick="location.href='adminProductList.do'">
        	</div>
        </form>
      </div>
    </div>
  </main>
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
  <script type="text/javascript">
	function check_frm(){
	    	 if(confirm('작성하신 상품을 등록하시겠습니까?')==true){
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
			url:"/admin/adminProductInsert.do",
			type:"post",
			processData:false,
			contentType:false,
			data:data,
			success:function(){
				adminProductList();
		}
		});
	});
	</script>
	
</body>
</html>