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

.mypage_update{
	flex-direction: column;
	width: 800px;
    margin-top: 180px;  
}

.update_form{
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

.update_form table{
    margin-top: 30px;
    align-items: center;
}

td a{ 
	text-decoration: none;
	font-size: 0.7rem;
}

.prefer_txt span{
    text-decoration: none;
	font-size: 0.6rem;
    color: grey;
}

.wrap{
	width: 100%;
	height: 850px;
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
    
    .user_id{
    	border-top: none;
    }
	
    .user_addr_chk{
        width: 55px;
        height: 18px;
    }

    .regist_btn{
        text-align: center;
        margin: 30px;
    }

    .user_addr_sub{
        margin-top: 5px;
    }
    
    .user_phone{
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

    .delete_btn{
        border: none;
        border-radius: 4px;
        width: 75px;
        height: 30px;
        background-color: rgb(134, 134, 132);
        color: white;
        font-weight: bold;
    }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

	//정보 수정 완료 -> 메인페이지(다시 로그인)
	$(document).ready(function(){
		
		$(".submit_btn").on("click", function(){
			alert("정보 수정이 완료되었습니다. 다시 로그인 해주세요.");
			return true;
		});	
	
	})
	
	//회원탈퇴
	function memberDelete(){
		
		var con = confirm("회원 탈퇴 하시겠습니까?");
		
		if(con == true){
			alert("회원 탈퇴가 정상적으로 완료되었습니다.");
			location.href='memberDelete.do?user_id=${member.user_id }';
		}else{
			return false;
		}
	}
</script>

<!-- 카카오 주소 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function addr_search() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("user_addr").value = extraAddr;
                
                } else {
                    document.getElementById("user_addr").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("user_addr").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("user_addr_sub").focus();
            }
        }).open();
    }
</script>

<body>
	<div id="header">
		<%@ include file="../common/header.jsp"%>
	</div>
	<div class="wrap">     
        <div class="mypage_update">
            <div class="headline">
                <a>마이페이지</a>
                <hr>
            </div>
            <div class="headline2">
                <a>내 정보 수정</a>
            </div> 
            <div class="update_form">
            <form action="memberUpdate.do" method="post">
                <table width="550px">
                    <tr>
                        <col width="150px"> <col width="300px">
                    </tr>
                    <tr>
                        <th>아이디</th>
                        <td><input type="text" class="user_id" name="user_id" readonly="readonly" value="${member.user_id }"></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><a>${member.user_name }</a></td>
                    </tr>
                    <tr>
                        <th>비밀번호</th>
                        <td><input type="password" class="user_pw" name="user_pw" required="required" value="${member.user_pw }"></td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td><input type="text" class="user_email" name="user_email" required="required" value="${member.user_email }"></td>
                    </tr>
                    <tr>
                        <th>메일 수신</th>
                        <td>
                            <input type="radio" name="user_mailing" class="user_mailing" value="Y" <c:if test="${member.user_mailing eq 'Y'}">checked="checked"</c:if>><a> 동의함</a>&nbsp;&nbsp;
                            <input type="radio" name="user_mailing" class="user_mailing" value="N" <c:if test="${member.user_mailing eq 'N'}">checked="checked"</c:if>><a> 동의하지 않음</a>
                        </td>
                    </tr>
                    <tr>
                        <th>주소</th>
                        <td>
                            <input type="text" class="user_addr" name="user_addr" id="user_addr" required="required" value="${member.user_addr }">
                            <input type="button" class="user_addr_chk" value="주소 검색" onclick="addr_search();"><br>
                            <input type="text" class="user_addr_sub" name="user_addr_sub" id="user_addr_sub" value="${member.user_addr_sub }">
                        </td>
                    </tr>
                    <tr>
                        <th>핸드폰 번호</th>
                        <td>
                            <input type="text" class="user_phone" name="user_phone" required="required" value="${member.user_phone }">
                        </td>
                    </tr>
                    <tr>
                        <th>선호하는 음식</th>
                        <td>
                            <input type="checkbox" class="prefer" name="prefer" value="k_food"><a> 한식</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="j_food"><a> 일식</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="c_food"><a> 중식</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="w_food"><a> 양식</a> &nbsp;
                            <input type="checkbox" class="prefer" name="prefer" value="v_food"><a> 비건</a><br>
                            <div class="prefer_txt"><span>중복선택 가능</span></div>
                        </td>
                    </tr>         
                </table>
                    <div class="regist_btn">
                        <input type="submit" class="submit_btn" value="수 정">
                        <input type="button" class="delete_btn" value="탈 퇴" onclick="memberDelete();">
                    </div>
            </form>
          </div>
        </div>
    </div>
    <div id="footer">
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>