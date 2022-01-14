<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String p_id = request.getParameter("p_id");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin_Product</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="resources/admin/css/admin_styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        
        <script  type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	     
	     //게시글 수정
	     function goUpdate(){
	    	 if(confirm('선택하신 상품을 수정하시겠습니까?')==true){
	    		 return true;
	    	 }else{
	    		 return false;
	    	 }
	     }
	     
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
			.adm_insert{
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
                                <img src="resources/admin/assets/img/profile_admin.png" style="width: 60%; height: 60%;">
                                <br>
                                <a href="#" style="text-decoration:none; color: black;">${member.user_name} 님<br>반갑습니다 : )</a>
                            </div>
                            <a class="nav-link home" href="adminMain.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-home" aria-hidden="true"></i></div><span>HOME</span></a>
                            <a class="nav-link post" href="adminPostReply.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-bars" aria-hidden="true"></i></div><span>Post</span></a>
                            <a class="nav-link recipe" href="adminRecipe.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-book" aria-hidden="true"></i></div><span>Recipe</span></a>
                            <a class="nav-link product" href="adminProductList.do" style="color: rgb(224, 179, 57);"><div class="sb-nav-link-icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></div><span>Product</span></a>
                            <a class="nav-link order" href="adminOrder.do" style="color: black;"><div class="sb-nav-link-icon"><i class="fa fa-truck" aria-hidden="true"></i></div><span>Order</span></a>
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
                        <h1 class="title_tab">상품 관리</h1>
                        <br><br>
                        <div class="card mb-4">
                            <div class="card-header"><i class="fas fa-table me-1"></i> 상품 리스트</div>
                            <div class="card-body">
                            <form action="adminProductWrite.do">
                                <table id="datatablesSimple">
                                    <col width="50px"><col width="200px"><col width="500px"><col width="150px">
                                    <thead>
                                    <tr></tr>
                                        <tr>
                                            <th><input type="checkbox" name="allCheck" value="selectall" onclick="selectAll(this)"></th>                                            
                                            <th>상품명</th>
                                            <th>상품 이미지</th>
                                            <th>상품 가격</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${productList}" var="dto">
			                            	<tr>
			                                	<td style='vertical-align:middle' ><input type="checkbox" name="RowCheck[]" value="${dto.p_id}"></td>
			                                    <td style='vertical-align:middle'><a onclick="return goUpdate();" href="adminProductUpdate.do?p_id=${dto.p_id}" style="text-decoration:none; cursor:pointer; font-weight:bold;">${dto.p_name}</a></td>
			                                    <td><a href="goProductPage.do?p_id=${dto.p_id}"><img src="${dto.img_path}" style="width: 20%; height: 20%;"></a></td>
			                                	<td style='vertical-align:middle'>${dto.p_price} 원</td>
			                                </tr>
		                                </c:forEach>
                                    </tbody>
                                    <tr></tr>
                                    <tr>
                                        <td colspan="7">
                                            <button type="submit" style="text-decoration:none; font-size:11pt; background-color:rgb(90, 142, 221); color:white; float:right;">등 록</button>
	                                        <button type="button" onclick="location.href='adminProductDelete.do'" onsubmit="return delete_frm();" value="delete">삭 제</button>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="resources/admin/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="resources/admin/js/datatables-simple-demo.js"></script>
    </body>
</html>
