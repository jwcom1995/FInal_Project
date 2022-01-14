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
        <title>Admin_Report</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="resources/admin/css/admin_styles.css" rel="stylesheet" />
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
	     
		 
	     function delete_frm(){
	    	 if(confirm('정말 삭제하시겠습니까?')==true){
	    		 return true;
	    	 }else{
	    		 return false;
	    	 }
	     }
	     
	   // 신고 처리 현황 update
			function reportStatusUpdate(report_status,report_no,report_penalty){
		   	console.log(report_status);
				location.href="reportStatusUpdate.do?report_status="+report_status+"&report_no="+report_no+"&report_penalty="+report_penalty;
			}
        
	   //Modal 실행
	       function modal(id){
	    	   $(".modal").fadeIn();
	       }
	
	    // Modal 값 띄우기
	        function PopupInfo(clicked_element,msg) {
	        	var row_td = clicked_element.getElementsByTagName("td");
	        	var modal = document.getElementById("modal_admin_report");
	        	   
	        	document.getElementById("reporter").innerHTML = row_td[1].innerHTML;
	        	document.getElementById("reported").innerHTML = row_td[2].innerHTML;
	        	document.getElementById("report_content").innerHTML = row_td[3].innerHTML;
	        	document.getElementById("report_date").innerHTML = row_td[4].innerHTML;
	        	$("#reply_content").text(msg);
	        }
	
	        
		//Modal Close 기능
		    function close_pop(flag) {
		         $('#myModal').hide();
		    };
		
        </script>
        
        <style>
			#delBtn{
				float:right;
				border : none;
				margin-right:1%;
				width:80px;
				height:30px;
			}
			
			.btn{
				align-items:center;
				border:0;
				outline:0;
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
                <nav class="sb-sidenav accordion alert-warning"id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav" style="text-align: center;">
                            <div class="sb-sidenav-menu-heading">
                                <img src="resources/admin/assets/img/profile_admin.png" style="width: 60%; height: 60%;">
                                <br>
                                <a href="#" style="text-decoration:none; color: black;">${member.user_name} 님<br>반갑습니다 : )</a>
                            </div>
                            <a class="nav-link home" href="adminMain.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-home" aria-hidden="true"></i></div><span>HOME</span></a> 
							<a class="nav-link post" href="adminPostReply.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-bars" aria-hidden="true"></i></div><span>Post</span></a>
							<a class="nav-link recipe" href="adminRecipe.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-book" aria-hidden="true"></i></div> <span>Recipe</span></a>
							<a class="nav-link product" href="adminProductList.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div><span>Product</span></a> 
							<a class="nav-link order" href="adminOrder.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-truck" aria-hidden="true"></i></div><span>Order</span></a> 
							<a class="nav-link user" href="adminUser.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-user" aria-hidden="true"></i></div><span>User</span></a> 
							<a class="nav-link report" href="adminReport.do" style="color: rgb(224, 179, 57);"><div class="sb-nav-link-icon"><i class="fa fa-ban" aria-hidden="true"></i></div><span>Report</span></a>
                        </div>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <br>
                    <div class="container-fluid px-4">
                        <h1 class="title_tab">신고 관리</h1>
                        <br><br>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table me-1"></i> 신고 관리</div>
                            <div class="card-body">
                            <form action="adminReportDelete.do" id="delFrm" name="delFrm" onsubmit="return delete_frm();">
                                <table id="datatablesSimple">
                                    <col width="50px"><col width="100px"><col width="100px"><col width="400px"><col width="150px"><col width="100px"><col width="50px">
                                    <thead>
                                    <tr></tr>
                                        <tr>
                                            <th><input type="checkbox" name="allCheck" value="selectall" onclick="selectAll(this)"></th>
                                            <th>신고인 ID</th>
                                            <th>신고 대상 ID</th>
                                            <th>신고 내용</th>
                                            <th>신고 일자</th>
                                            <th>처리 현황</th>
                                            <th>패널티</th>
                                        </tr>
                                    </thead>
                                    <tbody id="admin_report">
	                                	<c:forEach items="${reportList}" var="dto">
			                        		<tr onclick="PopupInfo(this,'${dto.reply_content}')">
			                                	<td><input type="checkbox" name="RowCheck[]" value="${dto.report_no}"></td>
			                                	<td>${dto.reporter}</td>
			                                    <td><a id="${dto.report_no}" onclick="modal('${dto.report_no}');" style="text-decoration:none; color:rgb(90, 197, 108); font-weight:bold; cursor:pointer;">${dto.reported}</a></td>
			                                    <td style="vertical-align:middle; overflow:hidden; text-overflow:ellipsis; white-space:nowrap;">${dto.report_content}</td>
			                                    <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.report_date}"/></td>
			                                    <td>
			                                    	<select onChange="reportStatusUpdate(this.value,'${dto.report_no}','${dto.report_penalty}');">
			                                    		<option value="1" ${dto.report_status == "1" ? "selected":""}>처리 대기</option>
			                                    		<option value="2" ${dto.report_status == "2" ? "selected":""}>처리 완료</option>
			                                    	</select>
			                                    </td>
			                                    <td>${dto.report_penalty}</td>
			                                </tr>
			                        	</c:forEach>
                                    </tbody>
                                    <tr></tr>
                                    <tr>
                                        <td colspan="7">
                                            <button type="submit" id="delBtn" value="delete">삭 제</button>
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
	      <div class="modal-content" id="modal_admin_report">
	      	<div>
	      		<label style="font-weight:bold;">신고인 ID</label>
	      		<p class="w3-input w3-border" id="reporter"></p>
	      	</div>
	      	<div>
	            <label style="font-weight:bold;">신고 대상 ID</label>
	            <p class="w3-input w3-border" id="reported">
            </div>
            <div>
	            <label style="font-weight:bold;">신고 내용</label>
	            <p class="w3-input w3-border" id="report_content">
            </div>
            <div>
	            <label style="font-weight:bold;">신고 댓글</label>
	            <p class="w3-input w3-border" id="reply_content">
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
