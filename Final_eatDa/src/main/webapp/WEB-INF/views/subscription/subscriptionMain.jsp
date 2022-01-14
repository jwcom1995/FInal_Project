<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Subscription_Main</title>
        <link rel="icon" type="image/x-icon" href="resources/subscription/assets/favicon.ico" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="resources/subscription/css/subscription_styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="resources/subscription/css/subscriptionModal_style.css"><!-- Modal css -->
        
        <style>
        	header{margin-top:9%;}
            .tiledBackground{
                background-image: url(resources/subscription/assets/image/kitchen1.jpg);
                background-size: 1200px 600px;
                width: 100%;
                height: 490px;
            }
        </style>
    </head>
    <body>
	    <div id="header">
			<%@ include file="../common/header.jsp"%>
		</div>

        <header class="tiledBackground">
            <div class="container px-5">
                <div class="row gx-5 justify-content-center">
                    <div class="col-lg-6">
                        <div class="text-center my-5">
                            <h1 class="display-5 fw-bolder text-white mb-2">구독 [ Subscription ]</h1><br>
                            <p class="lead text-white-50 mb-4">다양한 혜택과 함께 간편한 밀키트를 제공해드립니다.</p><br>
                            <div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
                                <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#compare">구독 신청하러 가기</a>
                                <a class="btn btn-outline-light btn-lg px-4" href="#features">더 알아보기</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <section class="py-5 border-bottom" id="features">
            <div class="container px-5 my-5">
                <div class="row gx-5">
					 <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-warning bg-gradient text-white rounded-3 mb-3"><i class="bi bi-search"></i></div>
                        <h2 class="h4 fw-bolder">"구독"이란 무엇인가요?</h2><br>
                        <div><p><b>간단히 끼니를 해결하고 싶은 분들을 위해 준비했습니다.</b><br><br>장보러 가지 않고 집에서 간편하게 받아 드실 수 있도록 "eatDa"가 준비했습니다!</p></div>
		            	<a href="javascript:openModal('modal1');" class="button modal-open btn-Link btn-sm" style="color:blue;">> 더 알아보기</a>
	                </div>
                    
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-warning bg-gradient text-white rounded-3 mb-3"><i class="bi bi-heart-fill"></i></div>
                        <h2 class="h4 fw-bolder">"구독"하면 무엇이 좋은가요?</h2><br>
                        <div><p><b>구독신청 회원에게는 밀키트 구매 할인 혜택이 있습니다.</b><br><br>밀키트 배송과 함께 eatDa의 특별한 레시피까지!<br>메일로 받아보실 수 있습니다.</p></div>
		            	<a href="javascript:openModal('modal2');" class="button modal-open btn-Link btn-sm" style="color:blue;">> 더 알아보기</a>
	                </div>
                   
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <div class="feature bg-warning bg-gradient text-white rounded-3 mb-3"><i class="bi bi-question"></i></div>
                        <h2 class="h4 fw-bolder">F A Q</h2><br>
                        <div><p><b>구독에 대해 아직도 잘 모르시겠다면?</b><br><br>자주 묻는 질문을 통해 궁금한 점을 해결해보세요 :)<br>구독 신청을 하기 전에 주의사항도 함께 확인해주세요.</p></div>
	            		<a href="javascript:openModal('modal3');" class="button modal-open btn-Link btn-sm" style="color:blue;">> 더 알아보기</a>
					</div>
                </div>
            </div>
            
            	<div id="modal">
				  <div class="modal-con modal1">
				    <a href="javascript:;" class="close">X</a>
				    <p class="title">"구독"이란?</p>
				    <div class="modal-content">
				    	<b>구독은 eatDa에서 제공하는 정기 구독서비스입니다.</b><br><br>매 번 밀키트를 구매하는 것이 귀찮으신 적, <br>까먹고 이번 주 음식 재료를 준비 못하신 적은 없나요?<br><br>이러한 불편한 점을 해소해드리고자 구독 서비스를 운영중입니다:)<br><br>
				   		저렴한 가격으로 ! 원하는 기간을 선택하여 ! 편안한 만찬을 즐기실 수 있습니다.<br><br>구독에 대해 궁금하신 점이 많으시다면, FAQ를 참고해주세요.
				    </div>
				  </div>
				  
				   <div class="modal-con modal2">
				    <a href="javascript:;" class="close">X</a>
				    <p class="title">구독하면 무엇이 좋은가요?</p>
				    <div class="modal-content">
				    	<b>구독을 신청하신 회원께는 밀키트 구매 할인 혜택이 있습니다.</b><br>밀키트 배송과 함께 eatDa의 특별한 레시피까지! 메일로 받아보실 수 있습니다.<br><br>
				    	<b>첫 번째☝🏻</b><br>밀키트와 함께 만들어 먹을 수 있는 특별한 레시피를 이메일로 발송해드립니다.<br><br><b>두 번째✌🏻</b><br>밀키트 구매 시, 할인 쿠폰을 받으실 수 있습니다.<br><br><b>세 번째🤟🏻</b><br>맛있는 밀키트를 일주일에 한 번씩 꼬박꼬박 받아보실 수 있습니다!<br>
				    </div>
				  </div>
				  
				  <div class="modal-con modal3">
				    <a href="javascript:;" class="close">X</a>
				    <p class="title">F A Q</p>
				    <div class="modal-content">
				    	<b>Q1.</b>이미 구독을 신청했는데 구독 기간이 끝나기 전에 구독을 또 신청할 수 있나요?<br><b>A1.</b>구독 기간이 끝나고 새로운 구독을 신청하실 수 있습니다.<br><br>
				    	<b>Q2.</b>주간 구독과 일반 주문의 다른 점이 있나요?<br><b>A2.</b>주간 구독,일반 주문 모두 밀키트가 배송되지만 주간 구독은 이메일 수신에 동의하셨을 경우 이메일로 레시피를 받아보실 수 있습니다.<br><br>
				    	<b>Q3.</b>구독을 하면 어떤 할인 혜택이 있는건가요?<br><b>A3.</b>일반 주문 시, 결제하시는 밀키트의 금액보다 저렴한 가격으로 가성비 좋은 밀키트를 받아보실 수 있습니다 : )<br>
				    </div>
				  </div>
			</div>	  
        </section>
        
        <section class="bg-light py-5 border-bottom" id="compare">
            <div class="container px-5 my-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bolder">구독 기간 비교하기</h2>
                    <p class="lead mb-0">구독 기간에 대해 궁금한 점을 한 눈에 비교해드립니다.</p>
                </div>
                <div class="row gx-5 justify-content-center">
                    <!-- Pricing card free-->
                    <div class="col-lg-6 col-xl-4" style="width:33.333333%;">
                        <div class="card mb-5 mb-xl-0">
                            <div class="card-body p-5">
                                <div class="small text-uppercase fw-bold text-muted">Weekly</div><br>
                                <div class="mb-3"><span class="display-4 fw-bold">8,000</span><span class="text-muted">/￦</span></div><br>
	                                <ul class="list-unstyled mb-4">
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i><strong>1 week 1 mealkit</strong></ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>일주일에 한 번 발송</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>저렴한 가격!</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>일반 구독과 다르게</ol>
	                                    <ol class="mb-2">&nbsp;&nbsp;&nbsp;&nbsp;특별한 레시피와 함께 밀키트를!</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i><strong>체험용</strong>으로 추천해요:-)</ol>
	                                </ul>
	                                <br>
                                <div class="d-grid"><a class="btn btn-primary" href="subForm.do?type=weekly">주간구독 신청</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-6 col-xl-4" style="width:33.333333%;">
                        <div class="card mb-5 mb-xl-0">
                            <div class="card-body p-5">
                                <div class="small text-uppercase fw-bold"><i class="bi bi-star-fill text-warning"></i>추천<i class="bi bi-star-fill text-warning"></i><br>MONTHLY</div>
                                <div class="mb-3"><span class="display-4 fw-bold">30,000</span><span class="text-muted">/ ￦</span></div><br>
	                                <ul class="list-unstyled mb-4">
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i><strong>1 month 4 mealkit</strong></ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>한 달간 매 주 밀키트 발송</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>주간 구독이 짧다면? <strong>월간 구독!</strong></ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>한 달동안 편하게 밀키트를</ol>
	                                    <ol class="mb-2">&nbsp;&nbsp;&nbsp;&nbsp;제공받을 수 있습니다.</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i><strong>입문용</strong>으로 추천해요:-)</ol>
	                                </ul>
	                                <br>
                                <div class="d-grid"><a class="btn btn-primary" href="subForm.do?type=monthly">월간구독 신청</a></div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-xl-4" style="width:33.333333%;">
                        <div class="card mb-5 mb-xl-0">
                            <div class="card-body p-5">
                                <div class="small text-uppercase fw-bold text-muted">QUARTERLY</div><br>
                                <div class="mb-3"><span class="display-4 fw-bold">89,000</span><span class="text-muted">/￦</span></div><br>
	                                <ul class="list-unstyled mb-4">
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i><strong>1 quarter 12 mealkit</strong></ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>3개월 간 매 주 밀키트 발송</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>할인된 가격!</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>매번 결제하기 번거로우시죠?</ol>
	                                    <ol class="mb-2">&nbsp;&nbsp;&nbsp;&nbsp;맘 편히 밀키트를 받아보세요.</ol>
	                                    <ol class="mb-2"><i class="bi bi-check text-primary"></i>번거로우신 분들께 추천해요:-)</ol>
	                                </ul>
	                                <br>
                                <div class="d-grid"><a class="btn btn-primary" href="subForm.do?type=quarterly">분기구독 신청</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
       
        <div id="footer">
		<%@ include file="../common/footer.jsp"%>
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
