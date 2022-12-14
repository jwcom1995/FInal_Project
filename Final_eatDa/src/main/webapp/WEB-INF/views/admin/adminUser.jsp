<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.project.eatda.biz.AdminBiz" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin_User</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
<link href="resources/admin/css/admin_styles.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		//전체 선택 및 선택 게시물 삭제
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
		
		function delete_frm(){
	    	 if(confirm('정말 삭제하시겠습니까?')==true){
	    		 return true;
	    	 }else{
	    		 return false;
	    	 }
	     }
		
		// 회원 활성화 update
		function userEnableUpdate(user_enable,user_id){
			location.href="adminUserUpdate.do?user_enable="+user_enable+"&user_id="+user_id;
		}
		
		//Modal 실행
	       function modal(id){
	    	   $(".modal").fadeIn();
	       }
	
	    // Modal 값 띄우기
	        function PopupInfo(clicked_element,msg) {
	        	var row_td = clicked_element.getElementsByTagName("td");
	        	var modal = document.getElementById("modal_admin_user");
	        	   
	        	document.getElementById("user_name").innerHTML = row_td[2].innerHTML;
	        	document.getElementById("user_email").innerHTML = row_td[3].innerHTML;
	        	document.getElementById("user_phone").innerHTML = row_td[4].innerHTML;
	        	$("#user_addr").text(msg);
	        }
	
		//Modal Close 기능
		    function close_pop(flag) {
		         $('#myModal').hide();
		    };
        </script>

<style>
		#delBtn {
			float: right;
			border: none;
			margin-right: 1%;
		}
		
		.btn{
			align-items:center;
			border:0;
			outline:0;
		}
		
		.adm_mailing {
			float: right;
			border: none;
			margin-right: 1%;
			width: 100px;
			height: 30px;
			text-decoration: none; 
			font-size: 11pt; 
			background-color: rgb(90, 142, 221); 
			color: white;
		}
		
		#nav_btn {float: right;}
</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-dark alert-warning justify-content-between">
		<a class="navbar-brand ps-3" href="index.jsp"><img src="resources/images/logo.png"style="width: 50%; height: 30%; float: left;"></a>
		<div>
			<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars" style="color: black;"></i></button>

			<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" style="color: black;"><i class="fas fa-user fa-fw" style="color: black;"></i></a>
					<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown"><li><a class="dropdown-item" href="logout.do">LogOut</a></li>
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
							<img src="resources/admin/assets/img/profile_admin.png" style="width: 60%; height: 60%;"> <br> <a href="#" style="text-decoration: none; color: black;">${member.user_name} 님<br>반갑습니다 : )	</a>
						</div>
						<a class="nav-link home" href="adminMain.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-home" aria-hidden="true"></i></div><span>HOME</span></a> 
						<a class="nav-link post" href="adminPostReply.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-bars" aria-hidden="true"></i></div><span>Post</span></a>
						<a class="nav-link recipe" href="adminRecipe.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-book" aria-hidden="true"></i></div> <span>Recipe</span></a>
						<a class="nav-link product" href="adminProductList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div><span>Product</span></a> 
						<a class="nav-link order" href="adminOrder.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-truck" aria-hidden="true"></i></div><span>Order</span></a> 
						<a class="nav-link user" href="adminUser.do" style="color: rgb(224, 179, 57);"><div class="sb-nav-link-icon"><i class="fa fa-user" aria-hidden="true"></i></div><span>User</span></a> 
						<a class="nav-link report" href="adminReport.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-ban" aria-hidden="true"></i></div><span>Report</span></a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<br>
				<div class="container-fluid px-4">
					<h1 class="title_tab">회원 관리</h1>
					<br><br>
					<div class="card mb-4">
						<div class="card-header"><i class="fas fa-table me-1"></i> 회원 리스트</div>
						<div class="card-body">
						<form action="adminUserDelete.do" id="delFrm" name="delFrm" onsubmit="return delete_frm();">
							<table id="datatablesSimple">
								<col width="50px">
								<thead>
									<tr></tr>
									<tr>
										<th><input type="checkbox" name="allCheck" value="selectall" onclick="selectAll(this)"></th>
										<th>I D</th>
										<th>회원명</th>
										<th>이메일</th>
										<th>연락처</th>
										<th>활성화 여부</th>
									</tr>
								</thead>
								<tbody id="admin_user">
									<c:forEach items="${userList}" var="dto">
										<tr onclick="PopupInfo(this,'${dto.user_addr}')">
											<td><input type="checkbox" name="RowCheck[]" value="${dto.user_id}"></td>
											<td>${dto.user_id}</td>
											<td><a id="${dto.user_id}" onclick="modal('${dto.user_id}');" style="text-decoration:none; color:rgb(90, 197, 108); font-weight:bold; cursor:pointer;">${dto.user_name}</a></td>
											<td>${dto.user_email}</td>
											<td>${dto.user_phone}</td>
											<td>
												<select onChange="userEnableUpdate(this.value,'${dto.user_id}');">
													<option value="Y" ${dto.user_enable == 'Y' ? "selected":""}>활성화</option>
													<option value="N" ${dto.user_enable == 'N' ? "selected":""}>비활성화</option>
												</select>
											</td>
										</tr>
									</c:forEach>
								</tbody>
								<tr></tr>
								<tr>
									<td colspan="7">
										<button type="button" class="adm_mailing" onclick="location.href='emailWrite.do'">메일 보내기</button>
										<button type="submit" id="delBtn" value="delete" style="width: 80px; height: 30px;">삭 제</button></td>
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
	      <div class="modal-content" id="modal_admin_user">
	      	<div>
	      		<label style="font-weight:bold;">회원명</label>
	      		<p class="w3-input w3-border" id="user_name"></p>
	      	</div>
	      	<div>
	            <label style="font-weight:bold;">휴대전화</label>
	            <p class="w3-input w3-border" id="user_phone">
            </div>
            <div>
	            <label style="font-weight:bold;">주 소</label>
	            <p class="w3-input w3-border" id="user_addr">
            </div>
            <div>
	            <label style="font-weight:bold;">이메일</label>
	            <p class="w3-input w3-border" id="user_email">
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
