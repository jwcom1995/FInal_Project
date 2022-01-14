<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin_Order</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="resources/admin/css/admin_styles.css" rel="stylesheet" />
        <link href="resources/admin/css/admin_nav_styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script type="text/javascript">
		     // 전체 선택 및 선택 게시물 삭제
			    $(function(){
			    	var chkObj = document.getElementsByName("RowCheck[]");
			    	var rowCnt = chkObj.length;
			    	
			    	$("input[name='allCheck']").click(function(){
			    		var chk_listArr = $("input[name='RowCheck[]']");
			    		for(var i = 0 ; i<chk_listArr.length; i++){
			    			chk_listArr[i].checked = this.checked;
			    		}
			    	});
			    	$("input[name='RowCheck[]']").click(function(){
			    		if($("input[name='RowCheck[]']:checked").length == rowCnt){
			    			$("input[name='allCheck']")[0].checked = true;
			    		}else{
			    			$("input[name='allCheck']")[0].checked = false;
			    		}
			    	});
			    });
	        
				// 배송 현황 update
				function shippingStatusUpdate(shipping_status, order_id){
					location.href="shippingStatusUpdate.do?shipping_status="+shipping_status+"&order_id="+order_id;
				}
				
				// 진행 현황 update
				function orderStatusUpdate(order_status,order_id){
					location.href="orderStatusUpdate.do?order_status="+order_status+"&order_id="+order_id;
				}
				
		      //Modal 실행
		       function modal(id){
		    	   $(".modal").fadeIn();
		       }
		
		        // Modal 값 띄우기
		        function PopupInfo(clicked_element,msg) {
		        	   var row_td = clicked_element.getElementsByTagName("td");
		        	   var modal = document.getElementById("modal_admin_order");
		        	   
		        	   console.log(msg);
		        	   
		        	   
		        	   document.getElementById("order_id").innerHTML = row_td[1].innerHTML;
		        	   document.getElementById("user_id").innerHTML = row_td[2].innerHTML;
		        	   document.getElementById("order_date").innerHTML = row_td[3].innerHTML;
		        	   $("#order_msg").text(msg);
		        	}

			    //Modal Close 기능
			    function close_pop(flag) {
			         $('#myModal').hide();
			    };
			    
			  //게시글 삭제
				function delete_frm(){
		    	 if(confirm('정말 삭제하시겠습니까?')==true){
		    		 return true;
		    	 }else{
		    		 return false;
		    	 }
		     }
        </script>
        
        <style>
			button{
				float:right;
				border : none;
				margin-right:1%;
				width:80px;
				height:30px;
			}
		</style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark alert-warning justify-content-between">
            <a class="navbar-brand ps-3" href="index.jsp"><img src="resources/images/logo.png" style="width: 50%; height:30%; float:left;"></a>
            
            <div>
	            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars" style="color:black;"></i></button>
	            
	            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
	                <li class="nav-item dropdown">
	                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color:black;"><i class="fas fa-user fa-fw" style="color:black;"></i></a>
	                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
	                        <li><a class="dropdown-item" href="logout.do">LogOut</a></li>
	                    </ul>
	                </li>
	            </ul>
            </div>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion alert-warning" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav" style="text-align: center;">
                            <div class="sb-sidenav-menu-heading">
                                <img src="resources/admin/assets/img/profile_admin.png" style="width: 60%; height: 60%;"><br>
                                <a href="#" style="text-decoration:none; color: black;">${member.user_name} 님<br>반갑습니다 : )</a>
                            </div>
                            <a class="nav-link home" href="adminMain.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-home" aria-hidden="true"></i></div><span>HOME</span></a> 
							<a class="nav-link post" href="adminPostReply.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-bars" aria-hidden="true"></i></div><span>Post</span></a>
							<a class="nav-link recipe" href="adminRecipe.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-book" aria-hidden="true"></i></div> <span>Recipe</span></a>
							<a class="nav-link product" href="adminProductList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div><span>Product</span></a> 
							<a class="nav-link order" href="adminOrder.do" style="color: rgb(224, 179, 57);"><div class="sb-nav-link-icon"><i class="fa fa-truck" aria-hidden="true"></i></div><span>Order</span></a> 
							<a class="nav-link user" href="adminUser.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-user" aria-hidden="true"></i></div><span>User</span></a> 
							<a class="nav-link report" href="adminReport.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-ban" aria-hidden="true"></i></div><span>Report</span></a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <br>
                    <div class="container-fluid px-4">
                        <h1 class="title_tab">주문 관리</h1>
                        <br><br>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table me-1"></i>주문 관리</div>
                            <div class="card-body">
                            	<form action="adminOrderDelete.do" id="delFrm" name="delFrm" onsubmit="return delete_frm();">
	                                <table id="datatablesSimple">
	                                    <col width="50px">
	                                    <thead>
	                                    	<tr></tr>
	                                        <tr>
	                                            <th><input type="checkbox" name="allCheck" value="selectall" onclick="selectAll(this)"></th>
	                                            <th>주문번호</th>
	                                            <th>주문자 ID</th>
	                                            <th>주문일자</th>
	                                            <th>연락처</th>
	                                            <th>배송 현황</th>
	                                            <th>진행 현황</th>
	                                        </tr>
	                                    </thead>
	                                    <tbody id="admin_order">
		                                    <c:forEach items="${orderList}" var="dto">
				                            	<tr onclick="PopupInfo(this,'${dto.order_message}')">
				                                	<td><input type="checkbox" name="RowCheck[]" value="${dto.order_id}"></td>
				                                    <td>${dto.order_id}</td>
				                                    <td><a id="${dto.order_id}" onclick="modal('${dto.order_id}');" style="text-decoration:none; color:rgb(90, 197, 108); font-weight:bold; cursor:pointer;">${dto.user_id}</a></td>
				                                    <td style="vertical-align:middle;"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.order_date}"/></td>
				                                    <td>${dto.order_phone}</td>
				                                    <td>
				                                    	<select onChange="shippingStatusUpdate(this.value,'${dto.order_id}');">
				                                        	<option value="주문 완료" ${dto.shipping_status == '주문 완료' ? "selected":""}>주문 완료</option>
				                                            <option value="상품 준비중" ${dto.shipping_status == '상품 준비중' ? "selected":""}>상품 준비중</option>
				                                            <option value="배송지 출발" ${dto.shipping_status == '배송지 출발' ? "selected":""}>배송지 출발</option>
				                                            <option value="배송중" ${dto.shipping_status == '배송중' ? "selected":""}>배송중</option>
				                                            <option value="배송 완료" ${dto.shipping_status == '배송 완료' ? "selected":""}>배송 완료</option>
				                                        </select>
				                                    </td>
				                                    <td>
				                                    	<select onChange="orderStatusUpdate(this.value,'${dto.order_id}');">
				                                        	<option value="결제 대기" ${dto.order_status == '결제 대기' ? "selected":""}>결제 대기</option>
				                                            <option value="결제 완료" ${dto.order_status == '결제 완료' ? "selected":""}>결제 완료</option>
				                                            <option value="결제 취소" ${dto.order_status == '결제 취소' ? "selected":""}>결제 취소</option>
				                                    	</select>
				                                	</td>
				                        		</tr>
			                            	</c:forEach>
	                                    </tbody>
	                                    <tr></tr>
	                                    <tr>
	                                        <td colspan="7">
		                                        <button type="submit" value="delete">삭 제</button>
	                                        </td>
	                                    </tr>
	                                </table>
                                </form>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
        
        <!-- Modal -->
        <div id="myModal" class="modal">
 
	      <!-- Modal content -->
	      <div class="modal-content" id="modal_admin_order">
	      	<div>
	      		<label style="font-weight:bold;">주문 번호</label>
	      		<p class="w3-input w3-border" id="order_id"></p>
	      	</div>
	      	<div>
	            <label style="font-weight:bold;">주문자 ID</label>
	            <p class="w3-input w3-border" id="user_id">
            </div>
            <div>
	            <label style="font-weight:bold;">주문일</label>
	            <p class="w3-input w3-border" id="order_date">
            </div>
            <div>
	            <label style="font-weight:bold;">메세지</label>
	            <p class="w3-input w3-border" id="order_msg">
            </div>
            
	            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onclick="close_pop();">닫기</div>
         </div>
	    </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/admin/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="resources/admin/js/datatables-simple-demo.js"></script>
    </body>
</html>
