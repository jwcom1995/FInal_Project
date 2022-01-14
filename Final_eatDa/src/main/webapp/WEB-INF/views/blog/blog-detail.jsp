<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to EatDa</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
   <script type="text/javascript">
     // like 버튼 클릭! (하트 채우기)
     function likeFunction() {
        let blog_no = $('#blog_no').val();
        let user_id = $('#blog_author').text();
        let like_count = Number($('#like-count').text())+1;
        console.log("blog_no: "+blog_no+", user_id: "+user_id);
        $.ajax({
        	url: "blog-like.do?blog_no="+blog_no+"&user_id="+user_id+"&like_count="+like_count,
          type: "GET",
          dataType:"text"
        });
        $(".fullheart").fadeIn(300);
        $('#like-count').text(Number(like_count));
     }
     
		// like 버튼 클릭! (하트 비우기)
    function unlike(){
    	let blog_no = $('#blog_no').val();
      let user_id = $('#blog_author').text();
      let like_count = Number($('#like-count').text())-1;
      $(".fullheart").fadeOut(300);
      $('#like-count').text(like_count);
			$.ajax({
      	url: "blog-unlike.do?blog_no="+blog_no+"&user_id="+user_id+"&like_count="+like_count,
      	type: "GET",
      	dataType:"text"
			});
		}
     
     //게시글 삭제
     function blogDelete(blog_no){
       var chk = confirm("정말 삭제하시겠습니까?");
       if(chk){
         location.href='blog-delete.do?blog_no='+blog_no;
       }
     }
      
     // 댓글 입력 버튼
     function replySubmit(){
       var reply_content = $("#reply_content").val();
       var blog_no = "${dto.blog_no}";
       var param = {
        	"reply_content":reply_content,
        	"blog_no":blog_no
       }
       var regdate = changeDate(new Date());
       	console.log(changeDate(new Date()));
        $.ajax({
          type: "post",
          url: "reply-insert.do",
          contentType:"application/json; charset=utf-8",
          data: JSON.stringify(param),
          success: function(data){
            console.log(data);
            alert("댓글이 등록되었습니다.");
            $(data).each(function(key, value) {
              $('tbody').prepend(
              	"<tr>" +
                	"<td class='reply-list__userid'> " +value.user_id + "</td>"+
                 	"<td class='reply-list__reply'>"+
                  	"<div>"+
                    	"<span>"+regdate+"</span>" +
                      "<br>"+
                      "<p>"+value.reply_content + "</p>"+
                    "</div>"+
                  "</td>"+
                  "<td class='reply-list__btns'>"+
                  	"<input type='button' title='댓글 수정' name='reply-update-btn' id='update-btn' value='&#xf044' onclick='openUpdateModal(this)'>"+
                  	"<input type='button' title='댓글 삭제' name='reply-del-btn' value='&#xf2ed'>"+
                  	"<input type='button' title='댓글 신고' name='reply-report-btn' id='report-btn' value='&#xf1d8'>"+
                  "</td>"+
                "</tr>"      
              );               
            });
          }
        });
        console.log(param);
     }
      
     // 댓글 수정 및 삭제
     // 수정 버튼 클릭 -> 모달창 띄우기
     function openUpdateModal(object){
       var seq = $(object).siblings("#index").val();
       var reply_no = $(object).parent().siblings(".reply-index").children("#reply_each_no").text();
       $('#reply_no').val(reply_no);
       $(".reply-update__modal").fadeIn(function(){
         let blog_no = $("#blog_no").val();
         let reply_no = $("#reply_no").val();
         var user_id = $(".reply-list__userid").eq(seq).text();
         var reply_content = $(".reply_list_content").eq(seq).text();
         $("#reply_no").val(reply_no);
         $("#user_id_update").val(user_id);
         $("#reply_content_update").val(reply_content);
       });
    }
      
    function replyUpdate(blog_no, user_id){
      if(confirm("댓글을 수정하시겠습니까?")){
        let blog_no = $("#blog_no").val();
        let reply_no = $("#reply_no").val();
        let user_id = $("#user_id_update").val();
        var reply_content = $("#reply_content_update").val();
            
        $.ajax({
          url: "reply-update.do?blog_no="+blog_no+"&reply_no="+reply_no+"&reply_content="+reply_content+"&user_id="+user_id,
          type: "get",
          dataType: "JSON",
          success: function(data){
          	alert("댓글이 수정되었습니다.");
          	$('tbody').html('');
          	$(".reply-update__modal").fadeOut();
         		$(data).each(function(key, value) {
          		$('tbody').append(
              	"<tr>" +
                	"<td class='reply-list__userid'> " +value.user_id + "</td>"+
                  "<td class='reply-list__reply'>"+
                  	"<div>"+
                    	"<span>"+value.updateDateString+"</span>" +
                      "<br>"+
                      "<p class='reply_list_content'>"+value.reply_content +"</p>"+
                  	"</div>"+
                  "</td>"+
               		"<td class='reply-list__btns'>"+
                  	"<input type='button' title='댓글 수정' name='reply-update-btn' id='update-btn' value='&#xf044' onclick='openUpdateModal(this)'>"+
                    "<input type='button' title='댓글 삭제' name='reply-del-btn' value='&#xf2ed'>"+
                    "<input type='button' title='댓글 신고' name='reply-report-btn' id='report-btn' value='&#xf1d8'>"+
                	"</td>"+
               	"</tr>"      
               );               
            });
          },
          error: function(msg){
          	console.log(msg);
          }
        });
      }
    }
      
    $(function(){
    	// x 버튼 클릭 -> 모달창 fade out
    	$(".fa-times").click(function(){
      	$(".reply-update__modal").fadeOut();
      });
    });

    // 댓글 삭제
		function replyDelete(object){
    	var blog_no = $("#blog_each_no").text();
    	var seq = $(object).siblings("#index").val();
    	var reply_no = $(object).parent().siblings(".reply-index").children("#reply_each_no").text();
    	console.log("blog_no: "+blog_no);
    	console.log("seq: "+seq);
    	console.log("reply_no: "+reply_no);
    	var chk = confirm("댓글을 정말 삭제하시겠습니까?");
			if(chk){
      	$.ajax({
        	type: "get",
        	url: "reply-delete.do?blog_no="+blog_no+"&reply_no="+reply_no,
        	dataType: "text",
        	success: function(data){
        		console.log(data);
          	alert("댓글이 삭제되었습니다.");
          	$(object).parents('tr').html('');
          }                   
      	});
    	}
		}
    
    //신고
		// 신고 버튼 클릭 -> 모달창 띄우기
	  function openReportModal(object){
		  var seq = $(object).siblings("#index").val();
	    var reply_no = $(object).parent().siblings(".reply-index").children("#reply_each_no").text();
	    $('#reply_no').val(reply_no);
	    
	  	$(".reply-report__modal").fadeIn(function() {
	      let blog_no = $("#blog_no").val();
	      let reply_no = $("#reply_no").val();
	      var user_id = $(".reply-list__userid").eq(seq).text();
	      var reply_content = $(".reply_list_content").eq(seq).text();
	      $("#report_reply_no").val(reply_no);
	      $("#reported_user_id").val(user_id);
	      $("#report_reply_content").val(reply_content);
	    });
	  }
		
	  function reportSubmit(){
		  if(confirm("신고 내용을 전송하시겠습니까?")){
		  	let blog_no = $("#blog_no_report").val();
		  	let reply_no = $("#reply_no").val();
		  	let user_id = $("#reported_user_id").val();
		  	var reply_content = $("#report_reply_content").val();
		            
		  	$.ajax({
		    	url: "reply-report.do?blog_no="+blog_no+"&reply_no="+reply_no+"&reply_content="+reply_content+"&user_id="+user_id,
		    	type: "get",
		    	dataType: "JSON",
		    	success: function(data){
		    		alert("신고가 완료되었습니다.");
		    	}
		  	});
		    alert("신고가 완료되었습니다.");
		    $(".reply-report__modal").fadeOut();
		  }
	  }
	  $(function(){
		  // x 버튼 클릭 -> 모달창 fade out
		  $(".fa-times").click(function(){
		  	$(".reply-report__modal").fadeOut();
		  });
	  });
	     
		// 날짜 및 시간 출력 포맷 변경
		function changeDate(date){
    	year = date.getFullYear();
    	month = ('0'+(date.getMonth()+1)).slice(-2);
    	day = ('0'+date.getDate()).slice(-2);
     	hour = ('0'+date.getHours()).slice(-2);
    	minute = ('0'+date.getMinutes()).slice(-2);
    	strDate = year+"-"+month+"-"+day+" "+hour+":"+minute;
    	return strDate;
		}
      
   </script>
<link href="resources/css/blog/blog-detail.css" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style type="text/css">
.blog-detail__top{
  width:100%;
  height:300px;
  background: url('resources/images/blog-detail.png') no-repeat;
  background-size: cover;
  overflow: hidden;
  display: table;
  border: none;
  background-position: 20% 30%;
}

.blog-detail__top-txt{
  color:white;
  opacity: 0.6;
  display: table-cell;
  vertical-align: bottom;
}

.blog-detail__top-txt h1, .blog-detail__top-txt h2{
  display: inline;
}

.blog-detail__top-txt h1{
  font-weight: 700;
  font-size:120px;
  height:100px;
  line-height: 90px;
}

.blog-detail__top-txt h2{
  margin-left: 350px;
  font-size: 15px;
}

</style>

</head>
<body style="margin-top:155px;">
   <div id="header">
      <%@ include file="../common/header.jsp"%>
   </div>
  <main class="blog-detail">
    <!-- main img -->
    <div class="blog-detail__top blog__top">
      <div class="blog-detail__top-txt blog__top-txt">
        <h1>eat다 블로그</h1>
        <h2>eatDa Blog</h2>
      </div>
    </div>

    <div class="detail-article">
      <div class="detail-article__titlearea">
        <!-- title -->
        <div class="detail-article__title">
          <h2>${dto.blog_title}</h2>
          <div class="blog-index" style="display:none;"><span id="blog_each_no">${dto.blog_no}</span></div>
        </div>
            
            <div class="detail-article__undertitle">
               <div class="detail-article__blog-count">
                  <span>조회수&nbsp;&nbsp;</span>${dto.blog_count}
               </div>
           <!-- buttons -->
           <div class="detail-article__btn">
           	 <span style="display:none" id="blog_author">${dto.user_id}</span>
             <span>작성자&nbsp;&nbsp;&nbsp;${dto.user_id}</span><span><fmt:formatDate pattern="yyyy-MM-dd a hh:mm" value="${dto.regdate}"/></span>
             <input type="button" value="목록" onclick="location.href='blog.do'">
             <input type="button" value="수정" onclick="location.href='blog-updateform.do?blog_no=${dto.blog_no}'">
             <input type="button" value="삭제" onclick="blogDelete(${dto.blog_no})">
           </div>
        </div>
      </div>

      <!-- content -->
      <div class="detail-article__content">
        <p>${dto.blog_content}</p>

        <!-- click likes area -->
        <div class="detail-article__content-likes">
             <i class="far fa-heart fa-lg emptyheart" onclick="likeFunction()"></i>
             <i class="fas fa-heart fa-lg fullheart" onclick="unlike()"></i>
          <span class="count-likes" id="like-count">${dto.blog_like}</span>
          <h6>마음에 드는 글이었나요? 그렇다면 하트를 눌러주세요 <i class="far fa-hand-point-left fa-sm"></i></h6>
        </div>
      </div>
      
      <!-- reply -->
      <div class="detail-article__reply">
        <!-- insert reply -->
        <div class="detail-article__reply-input">
          <form name="replyForm" method="post" id="replyForm">
            <textarea id="reply_content" name="reply_content" placeholder="댓글을 작성해주세요."></textarea>
            <input type="button" id="replyBtn" title="댓글 입력" class="reply-submitbtn" value="&#xf4ad" onclick="replySubmit()" >
          </form>
        </div>
        
        <!-- reply list -->
        <div class="detail-article__reply-list">
          <h4>댓글 목록<i class="fas fa-comment-dots"></i></h4>
          
          <table class="reply-list">
            <colgroup>
              <col width="13%"><col width="70%"><col width="15%">
            </colgroup>
            <tbody>
               <c:forEach var="reply" items="${list}" varStatus="status">
                   <tr>
                     <td class="reply-index" style="display:none;"><span id="reply_each_no">${reply.reply_no}</span></td>
                     <td class="reply-list__userid">${reply.user_id}</td>
                     <td class="reply-list__reply">
                       <div>
                         <span><fmt:formatDate pattern="yyyy-MM-dd a hh:mm" value="${reply.regdate}"/></span>
                         <br>
                         <p class="reply_list_content">${reply.reply_content}</p>
                       </div>
                     </td>
                     <td class="reply-list__btns">
                       <input type="hidden" id="index" value="${status.index}">
                       <input type="button" title="댓글 수정" name="reply-update-btn" id="update-btn" value="&#xf044" onclick="openUpdateModal(this)">
                       <input type="button" title="댓글 삭제" name="reply-del-btn" value="&#xf2ed" onclick="replyDelete(this)">
                       <input type="button" title="댓글 신고" name="reply-report-btn" id="report-btn" value="&#xf1d8" onclick="openReportModal(this)">
                     </td>
                   </tr>
                   </c:forEach>
                </tbody>
          </table>
          
        </div>
      </div>
    </div>
  </main>
  
  <!-- update reply modal -->
   <div class="reply-update__modal">
      <div class="reply-update__modal-content">
         <i title="창 닫기" class="fas fa-times fa-lg"></i>
         <h5>댓글 수정</h5>
       <form name="reply_update" method="post" id="reply_update_form">
           <input type="hidden" id="reply_no" name="reply_no">
           <input type="hidden" id="user_id_update" name="user_id">
           <input type="hidden" id="blog_no" name="blog_no" value="${dto.blog_no}">
                
           <textarea id="reply_content_update" name="reply_content_update" >${reply.reply_content}</textarea>
           <input type="button" id="replyUpdateBtn" name="reply-update-submit" title="수정 완료" class="reply-updatebtn" value="&#xf044" onclick="replyUpdate()" >
       </form>
    </div>
   </div>
  
  
  <!-- report modal -->
   <div class="reply-report__modal">
      <div class="reply-report__modal-content">
         <i title="창 닫기" class="fas fa-times fa-lg"></i>
         <h5>댓글 신고하기</h5>
         <form action="report-reply" method="post">
	         <input type="hidden" id="report_reply_no" name="reply_no">
	         <input type="hidden" id="blog_no_report" name="blog_no" value="${dto.blog_no}">
            <table>
               <colgroup><col width="120px"><col width="350px"></colgroup>
               <tr>
                  <th>제목</th>
                  <td><input type="text" name="report-title" placeholder="제목을 작성해주세요."></td>
               </tr>
               <tr>
                  <th>신고자</th>
                  <td><input type="text" id="reporter_user_id" name="reporter_user_id" value="${user_id}" readonly></td>
               </tr>
               <tr>
                 <th>신고 대상</th>
                 <td><input type="text" id="reported_user_id" name="user_id" value="${reply.user_id}" readonly></td>
               </tr>
               <tr>
                 <th>댓글 내용</th>
                 <td><textarea id="report_reply_content" name="report_reply_content" readonly>${reply.reply_content }</textarea></td>
               </tr>
               <tr>
                 <th colspan="2">신고 내용</th>
               </tr>
               <tr>
                 <td colspan="2">
                   <textarea path="report" name="report" placeholder="신고 내용을 작성해 주세요"></textarea>
                 </td>
               </tr>
               <tr>
                 <td colspan="2" class="report-submit-btn">
                   <input type="button" title="관리자에게 신고내용 전송" id="report-submit-btn" name="report-submit-btn" value="&#xf1d8" onclick="reportSubmit()">
                 </td>
               </tr>
            </table>
         </form>
      </div>
   </div>
   
  <div id="footer">
      <%@ include file="../common/footer.jsp"%>
   </div>
   
</body>
</html>