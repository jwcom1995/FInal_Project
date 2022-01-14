<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
}

.mypage_coupon{

	flex-direction: column;
	width: 800px;
    margin-top: 180px;  
} 

.coupon_list{
    display: flex;
	position: absolute;
	flex-direction: column; 
    width: 800px;
    height: 570px;
    margin-top: 30px;
    align-items: center;
    overflow-y: scroll;
    
}

.coupon_list::-webkit-scrollbar{
    width: 6px;
}

.coupon_list::-webkit-scrollbar-thumb{
    background-color: #ffe084;
    border-radius: 10px;
}

.headline{
	margin-top: 0px;
}

.headline a{
	font-size: 22pt;
    font-weight: bold;
}
.headline2 a {
    margin-left: 20px;
    margin-bottom: 20px;
    font-size: 20pt;
    font-weight: bold;
}

h1{
    margin-bottom: 20px;
}

hr{
	margin-top:20px;
    margin-bottom: 20px;
}


.coupon_list table{
    align-items: center;
}

.wrap{
	width: 100%;
	height: 1000px;
	display: flex;
	justify-content: center;
}


    .coupon{
        width: 670px;
        height: 180px;
        padding: 20px;
        margin: 5px;
        text-align: left;
        background: url("resources/images/coupon01.jpg");
        background-size: 100% 100%;
        border-radius: 15px;
    }
    

    .coupon h3{
        margin-bottom: 60px;
        font-weight: bold;
        
        color: white;
    }

    .coupon p{
    	margin: 0;
    	padding: 0;
		font-size: 0.9rem;
		font-weight: bold;
		color: gray;
    }
    
    .no_coupon{
    	width: 770px;
    	margin-top: 40px;
    	text-align: center;
    }

	
</style>
<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	<div class="wrap"> 
        <div class="mypage_coupon">
            <div class="headline">
                <a>마이페이지</a>
                <hr>
            </div>
            <c:choose>
	            <c:when test="${empty list }">
	            	<div class="no_coupon">
		                <a>보유하신 쿠폰이 없습니다.</a> &nbsp;
	                </div>
	            </c:when>
            	<c:otherwise>
                	
                	<div class="headline2">
                		<a>쿠폰함</a>
            		</div>
		            <div class="coupon_list">
		                <table  width="630px">
		                    <tr>
		                        <col width="210px"> <col width="210px"><col width="210px">
		                    </tr>
		                    <c:forEach items="${list }" var="dto">
			                    <tr>
			                        <td>
			                            <div class="coupon">
			                                <h3>${dto.coupon_name }</h3>
				                            <p>${dto.coupon_des }</p>
				                            <p>사용 가능 기간: ${dto.coupon_term }개월</p>
			                            </div>
			                        </td>
			                    </tr>
		                    </c:forEach>
		                </table>
		            </div>
                </c:otherwise>
                </c:choose>
          </div>
        </div>
    </div>
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>
