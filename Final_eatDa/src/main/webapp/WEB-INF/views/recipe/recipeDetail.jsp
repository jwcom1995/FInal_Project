<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>eat다</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style type="text/css">
.recipe_top{
   width:100%;
   height:200px;
   background: url('resources/images/recipe/recipeLogo.png') no-repeat;
   background-size: cover;
   overflow: hidden;
   display: table;
   border: none;
   background-position: 0 90%;
   margin-top:155px;
   
}
hr{
   border: 10px;
   width: 800px;
}
.body{
   text-align: center;
   margin: 2% 0;
}
.title, .content, .button{
   display: inline-block;
}

.button input{
   background-color: #fdd300;
	color: black;
	font-weight: bolder;
	border:none;
	height: 33px;
	width: 80px;
}
.title div{
   text-align: right;
   margin-right: 1%;
}
.title div img{
   width: 20px;
   height: 20px;
}
.title p{
   font-size: 13px;
   margin-bottom: 0;
}
.content img{
   margin : 2% 0;
}

.deleteConfirm_modal{
  position:fixed;
  
  width:100%;
  height:100%;
  background: rgba(0,0,0,0.6);
  top:0;
  left:0;
  display:none;
}

.deleteConfirm_modal_content{
  width:300px; 
  height:150px;
  background:#fff; border-radius:10px;
  position:relative; 
  top:50%; 
  left:50%;
  margin-top:-100px; 
  margin-left:-200px;
  text-align:center;
  box-sizing:border-box; 
  padding:15px 15px;
  line-height:23px; 
  box-shadow: 0px 0px 30px rgba(0,0,0,0.8);
  color:#444444;
}

.fa-times{
  float: right;
  cursor: pointer;
}
</style>
<script type="text/javascript">
function confirmModal(){
   $(".deleteConfirm_modal").fadeIn();
}
function confirmModalClose(){
   $(".deleteConfirm_modal").fadeOut();
}


</script>

</head>
<body>
   <div id="header">
      <%@ include file="../common/header.jsp"%>
   </div>
   <div class="recipe_top"></div>
   
   <div class="body">
      <div class="title">
        <p>[ ${dto.recipe_category } ]</p>
         <h4 style="text-align:center;">${dto.recipe_title }</h4>
         <div>
            <strong>조회수 ${dto.recipe_count }</strong>
            <c:if test="${member.user_id =='ADMIN' }">
	            <i class="fas fa-edit" onclick="location.href='recipeUpdateForm.do?recipe_no=${dto.recipe_no }'"></i>
	            <i class="fas fa-trash-alt" onclick="confirmModal()"></i>
            </c:if>
         </div>
         <hr> 
      </div>
      <div class="content">      
         ${dto.recipe_content } 
         <hr>
      </div>   
      <br>
      <div class="button">
         <input type="button" class="list" value="목록" onclick="location.href='recipeList.do'">&nbsp;&nbsp;&nbsp;
      </div>
   </div>


  <div class="deleteConfirm_modal">
     <div class="deleteConfirm_modal_content">
          <i title="닫기" class="fas fa-times fa-lg" onclick="confirmModalClose()"></i>
        <p>삭제하시겠습니까?</p>
        <input type="button" value="확인" onclick="location.href='recipeDelete.do?recipe_no=${dto.recipe_no }'">
     </div>
  </div> 
 
   <div id="footer">
      <%@ include file="../common/footer.jsp"%>
   </div>
</body>
</html>