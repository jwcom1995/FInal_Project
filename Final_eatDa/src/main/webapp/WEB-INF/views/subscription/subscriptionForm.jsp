<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.project.eatda.controller.SubscriptionController" %>

<% String userid = (String)session.getAttribute("user_id"); %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>구독 신청서</title>

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/subscription/css/subscriptionModal_style.css"><!-- Modal css -->

  <style>
		    body {
		      min-height: 100vh;
		
		      background: -webkit-gradient(linear, left bottom, right top, from(#dbb992), to(#6c4a1d));
		      background: -webkit-linear-gradient(bottom left, #dbb992 0%, #6c4a1d 100%);
		      background: -moz-linear-gradient(bottom left, #dbb992 0%, #6c4a1d 100%);
		      background: -o-linear-gradient(bottom left, #dbb992 0%, #6c4a1d 100%);
		      background: linear-gradient(to top right, #dbb992 0%, #6c4a1d 100%);
		    }
		    .input-form {
		      width: 400px;
		      height : 880px;
		
		      margin-top: 80px;
		      padding: 32px;
		
		      background: #fff;
		      -webkit-border-radius: 10px;
		      -moz-border-radius: 10px;
		      border-radius: 10px;
		      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
		    }
		    #m_title{
		    	font-size:15pt;
		    	font-weight: bold;
		    }
			#chk_nm{
				font-size:18pt;
				font-weight: bold;
			}
			#label_btn{
				font-size: 15pt;
				vertical-align:-1px;
				cursor : pointer;
			}
			.s_form_btn{
				margin-left: 10%;
				font-size:10px; 
				width:25px;
				height:25px; 
				vertical-align:text-top;
			}
			.messageContent{
				z-index:1;
			}
			#modal{
				z-index:2;
			}
			.button{
				padding-left:13%;
			}
  </style>
</head>

<body>
<div class="container" style="padding-left:5%;">
	<div class="input-form-backgroud row">
		<div class="input-form col-md-12 mx-auto">
			<form class="validation-form" style="padding-left:2%;" novalidate action="subFinish.do">
			<input type="hidden" name="title" value="${title}">
			<input type="hidden" name="userid" value="${member.user_id}">
			<input type="hidden" name="term" value="${term}">
			<input type="hidden" name="price" value="${price}">		
				<div class="container px-5 my-5 px-5 justify-content-flex-start">
					<h1 style="text-align:center;">${type} 신청</h1> <br>	
					<label for="sub_type" style="font-weight: bold; font-size: 20pt; color:rgb(70, 70, 70);">구독 유형</label><br><br>  
					
					<div class="sub_form_select" >  
						<div class="sub_form_button">           
							<input type="radio" id="chk1" name="chk" class="s_form_btn" value="일반 구독" checked><label for="chk1" id="label_btn">&nbsp;일반 구독</label><br>
							<a href="javascript:openModal('modal1');" class="button modal-open btn-Link btn-sm" style="color:blue;">> 일반 구독이란?</a>
						</div>
						<br>
						<div class="sub_form_button">   
							<input type="radio" id="chk2" name="chk" class="s_form_btn" value="제철 구독"><label for="chk2" id="label_btn">&nbsp;제철 식재료 구독</label><br> 
							<a href="javascript:openModal('modal2');" class="button modal-open btn-Link btn-sm" style="color:blue;">> 제철 식재료 구독이란?</a>
						</div>
					</div>
					
			<!-- Modal 내용 -->		
			<div id="modal">
				<div class="modal-con modal1">
					<a href="javascript:;" class="close">X</a>
					<p class="title">"일반 구독"이란?</p>
					<div class="modal-content">
						<p>일반 구독은 eatDa에서 제공하는 <b>랜덤형 구독</b>입니다.</p><br>
						<p>마켓에 올라와있는 밀키트 중에서 랜덤으로 배송을 받으실 수 있습니다.</p><br>
						<p>못먹는 음식 또는 식재료, 알러지 등을 아래 메세지에 남겨주시면<br>참고하여 밀키트를 보내드립니다:)</p>
					</div>
				</div>
				<div class="modal-con modal2">
					<a href="javascript:;" class="close">X</a>
					<p class="title">"제철 식재료 구독"이란?</p>
					<div class="modal-content">
						<p>제철 식재료 구독은 <b>계절에 맞는 식재료로 구성된 밀키트를 제공하는 구독</b>입니다.</p><br>
						<p>제철 식재료로 구성된 밀키트로 신선한 밀키트를 랜덤으로 제공받으실 수 있습니다.</p><br>
						<p>못먹는 음식 또는 식재료, 알러지 등을 아래 메세지에 남겨주시면<br>참고하여 밀키트를 보내드립니다:)</p>
					</div>
				</div>
			</div>
		</div>
			
			<div class="container px-5 my-5 px-5 justify-content-flex-start">
				<label for="sub_type" style="font-weight: bold; font-size: 20pt; color:rgb(70, 70, 70); white-space: pre-line;">메세지 남기기</label><br>
					<div class="row gx-5">
						<div id="contentForm">
							<div class="form-floating mb-3">
								<textarea rows="3" cols="120" id="vertical" name="msg" style="height: 10rem; white-space: pre-line; margin-top: 3%;" class="form-control" id="message" name="msg" type="text" placeholder="못먹는 음식 또는 음식 알러지 등에 대해 작성해주세요.
									예시) 저는 오이를 싫어합니다. 오이가 들어가있지 않은 밀키트로 배송해주세요."></textarea>
                            </div>
                        </div>
					</div>
			</div>
          <div class="mb-4">
	          <button class="btn btn-warning btn-lg btn-block" type="submit" style="font-size:20pt;">구독 신청</button>
	          <button class="btn btn-secondary btn-md btn-block" type="button" onclick="location.href='subMain.do'" style="font-size:15pt;">취 소</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  
  <script src=js/modal.js>
       	</script>
       	
   		<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
        // Modal 기능
        function openModal(modalname){
        	  document.get
        	  $("#modal").fadeIn(300);
        	  $("."+modalname).fadeIn(300);
        	}

        	$("#modal, .close").on('click',function(){
        	  $("#modal").fadeOut(300);
        	  $(".modal-con").fadeOut(300);
        	});		      	
        </script>
       
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="resources/subscription/js/scripts.js"></script>
        <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

</html>