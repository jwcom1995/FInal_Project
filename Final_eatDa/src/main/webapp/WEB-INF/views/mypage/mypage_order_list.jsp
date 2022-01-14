<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
</head>

<style type="text/css">

*{
	margin: 0px;
	padding: 0px;
}

.mypage_info_list{ 
	display: flex;
	position: absolute;
	flex-direction: column;
	align-items: center;
	margin-top: 200px;
	width: 800px;  
}

.order_info_list_wrap{ 
    display: flex;
    position: absolute;
	flex-direction: column;
    width: 800px;
    align-items: center;
    margin-top: 50px;
}

.order_info_list{
    display: flex;
	flex-direction: column;
    width: 800px;
    height: 300px;
    align-items: center;
    margin-top: 40px;
    margin-bottom: 100px;
    overflow-y: scroll;
}

.order_info_list::-webkit-scrollbar{
    width: 6px;
}

.order_info_list::-webkit-scrollbar-thumb{
    background-color: #ffe084;
    border-radius: 10px;
}

.headline{
	width: 800px;
	text-align: center;
}
.headline a{
	font-size: 22pt;
    font-weight: bold;
}

table{
    margin-top: 10px;
    align-items: center;
    text-align: center;
}

table td{
    padding-top: 5px;
    padding-bottom: 5px;
    font-size: 0.8rem;

}

table th{
padding-bottom: 5px;
    text-align: center;
	border-bottom: 2px solid;
}


.order_id{
	color:#ffe084;
	font-weight: bold;
}


.wrap{
	width: 100%;
	height: 700px;
	display: flex;
	justify-content: center;
}
.order_id:hover{
	cursor:pointer;
}





</style>

<script type="text/javascript">
	const goOrderSuccess = (order_id) => {
		location.href = 'goOrderSuccess.do?order_id=' + order_id;
	}
</script>

<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	<div class="wrap">
        
        <div class="mypage_info_list">
            <div class="headline">
                <a>주문 내역</a>
                <hr>
            </div>

        
        <div class="order_info_list_wrap">
          <div class="order_info_list" >
              <table width="750px">
                <tr>
                    <col width="50px"><col width="400px"><col width="300px">
                </tr>
                <tr>
                	<th>NO</th>
                	<th>주문 번호</th>
                	<th>주문 날짜</th>
                </tr>
                
                <c:forEach items="${list}" var="dto" varStatus="index">
			       <tr>
			       	 <td>${index.index}</td>
			         <td class="order_id" onclick="goOrderSuccess('${dto.order_id}')">${dto.order_id }</td>
			         <td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${dto.order_date}"/></td>
			      </tr>
		        </c:forEach>
	
              </table>
          </div>
       </div>



        </div>
       
    </div>
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>
