<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome to EatDa</title>

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous">
<style type="text/css">
body{
  margin:0;
  padding:0;
}

.event-main__top{
  width:100%;
  height:300px;
  background: url('resources/images/wine02.png') no-repeat;
  background-size: cover;
  overflow: hidden;
  display: table;
  border: none;
  background-position: 5% 90%;
}

.event-main__top-txt{
  color:white;
  opacity: 0.35;
  display: table-cell;
  vertical-align: bottom;
}

.event-main__top h1, .event-main__top h2{
  display: inline;
}

.event-main__top-txt h1{
  font-weight: 700;
  font-size:120px;
  height:100px;
  line-height: 85px;
}

.event-main__top-txt h2{
  margin-left: 350px;
  font-size: 15px;
}
.event-article {
	height:auto;
}
</style>
<link href="resources/css/event/event-main.css" rel="stylesheet">
</head>
<body style="margin-top:155px;">
  <div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
  <main class="event-main">
    <!-- main img -->
    <div class="event-main__top blog__top">
      <div class="event-main__top-txt blog__top-txt">
        <h1>eat다 이벤트</h1>
        <h2>eatDa Event</h2>
      </div>
    </div>

    <div class="event-article">
      <div class="event-write-btn">
      	<c:if test="${member.user_id =='ADMIN'}">
        <input type="button" value="글쓰기" onclick="location.href='event-writeform.do'">
        </c:if>
      </div>

      <!-- event list -->
      <div class="event-article__listbox">
        <ul class="event-article__list">
        
        	<c:choose>
        		<c:when test="${empty list}">
          		<li>----------- 작성된 글이 없습니다. -----------</li>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="dto" begin="1" end="9">
			          <li>
			            <figure class="event-article__list-img">
			              <img src="resources/images/event-list.png">
			              <figcaption>
			                <p>${dto.event_content}</p>
			                <div class="event-article__list-title">
			                  <h3><span>${dto.event_title}</span> eat다 이벤트</h3>
			                </div>
			              </figcaption>
			              <a href="event-detail.do?event_no=${dto.event_no}"></a>
			            </figure>
			          </li>
		          </c:forEach>
	          </c:otherwise>
					</c:choose>

        </ul>

      </div>
      
    </div>
  </main>
  <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>