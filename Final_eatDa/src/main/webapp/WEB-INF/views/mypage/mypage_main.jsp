<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
</head>
<style type="text/css">
*{
	margin: 0px;
	padding: 0px;
}

.mypage_info_update{
	flex-direction: column;
	width: 800px;
    margin-top: 180px; 
}
  

.info_update_form{
    display: flex;
	position: absolute; 
	flex-direction: column;
    width: 800px;
    align-items: center;
    
} 

h1{
    margin-bottom: 20px;
}

hr{
	margin-top: 20px;
    margin-bottom: 20px;
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

.info_update_form table{
    margin-top: 30px;
    align-items: center;
}

td a{
	text-decoration: none;
	font-size: 0.7rem;
}



.wrap{
	width: 100%;
	height: 650px;
	display: flex;
	justify-content: center;
}

    tr th{
        text-align: left;
        width: 100px;
        height: 40px;
        font-size: 0.8rem;
   		font-weight: 600;
    }

    td input[type="text"], input[type="password"] {
    	width: 230px; height: 30px;
    	font-size: 0.7rem;
    	border: 1px solid #d1d1d1;
        padding-left: 7px;
	}

    td input[type="button"]{
        border: none;
        border-radius: 2px;
        background-color: #FAEED2;
        font-size: 0.5rem;
        color: rgb(95, 95, 95);
    }

    .update_btn{
    	width: 650px;
        text-align: right;
        margin: 30px;
    }

    .user_addr2{
        margin-top: 5px;
    }

    .submit_btn{
        border: none;
        border-radius: 4px;
        width: 75px;
        height: 30px;
        background-color: #ffe084;
        color: white;
        font-weight: bold;
    }

</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	//비밀번호 확인 -> 정보 수정
	function pwChkConfirm(){
		var pw = ${member.user_pw };
		
		var prt = prompt("비밀번호를 입력해주세요.");
		
		if(prt == pw){
			location.href='mypage_updateForm.do';
		}else{
			alert("비밀번호가 틀렸습니다.");
			return false;
		}
	}
	
</script>


<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
    <div class="wrap">
        
        <div class="mypage_info_update">
            <div class="headline">
                <a>마이페이지</a>
                <hr>
            </div>
            <div class="headline2">
                <a>내 정보 관리</a>
            </div>
            <div class="info_update_form">
                <table width="550px">
                    <tr>
                        <col width="150px"> <col width="300px">
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td> <a>${member.user_id }</a></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><a>${member.user_name }</a></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><a>${member.user_email }</a></td>
                    </tr>
                    <tr>
                        <th>핸드폰 번호</th>
                        <td><a>${member.user_phone }</a></td>
                    </tr>  
                    <tr>
                        <th>주소</th>
                        <td>
                            <a>${member.user_addr }</a><br>
                            <a>${member.user_addr_sub }</a>
                        </td>
                    </tr>          
                </table>
                    <div class="update_btn">
                        <input type="button" class="submit_btn" value="수 정" onclick="pwChkConfirm();">
                    </div>
          </div>
        </div>
       
    </div>
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>