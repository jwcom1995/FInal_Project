<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>EatDa FoodBTI</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Cute+Font&family=Gaegu:wght@700&family=IBM+Plex+Sans+KR:wght@200&family=Nanum+Myeongjo&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="resources/css/market/foodbti.css">
<script type="text/javascript">
let count = 0;
let array = [];
const questionArray = [
	'식당에 들어가서 앉았는데 벨을 눌러도, 5분을 앉아있어도 직원이 안온다. 이때 큰 소리로 주문할 수 있다.',
	'저기압 일 땐 고기앞으로, 기분이 고기압일 땐 고기앞으로.',
	'하루 3끼 내 밥상에 육류가 없으면 하루종일 기분이 좋지 않다.',
	'스트레스를 받으면 뭐 먹을지 고민하는 편이다.',
	'옆자리 선배가 하루종일 갈군다면 당이 땡기는 편이다.',
	'나는 점심메뉴를 고르는데 1시간 이상이 소요가 된다. 혹은 점심 메뉴는 옆자리 동료가 고른 메뉴를 먹는 편이다.',
	'지금 당신은 뭘 먹을지 정했다.',
];
//페이지 진행 2배수마다 배열 채워주고
//8페이지 끝나고 9페이지로 넘어갈 때 mbti 완성해서 페이지에 뿌려줘야함

const response = (value) => {
	let nowPage = Number(document.getElementsByClassName('now-page')[0].innerText) + 1;
	let mbti = '';
	count += value;

	if ((nowPage - 1) % 2 == 0) {
		switch (nowPage - 1) {
			case 1, 2:
				count >= 1 ? array.push('E') : array.push('I');
				break;
			case 3, 4:
				count >= 1 ? array.push('M') : array.push('V');
				break;
			case 5, 6:
				count >= 1 ? array.push('W') : array.push('S');
				break;
			case 7, 8:
				count >= 1 ? array.push('A') : array.push('P');
				break;
		}
		count = 0;
	}

	if (nowPage < 9) {
		let nowQuestion = nowPage - 2;
		$('.question-div').animate({ opacity: 0 }, 400, function() {
			$('.question-div').html('');
			$('.question-div').append(
				'<span class="gaegu">STEP.</span>&nbsp;&nbsp;' +
				'<span class="now-page gaegu"></span>' +
				'<div class="question gaegu">'
				+ questionArray[nowQuestion] +
				'</div>'
			);
			$('.question-div').css('opacity', '1');
			$('.now-page').text(nowPage);
		});
	} else if (nowPage == 9) {
		$('.paging').addClass('after-question');
		$('.paging').addClass('.gaegu');
		$('.paging').html(
			'당신의 성향을 파악하고 있습니다.'
		);
		$('.question-div').html(
			'<div class="text-center">' +
			'<div class="spinner-border" role="status">' +
			'</div>' +
			'</div>'
		);

		setTimeout(function() {
			for (var i = 0; i < 4; i++) {
				mbti += array[i];
			}
			afterTest(mbti);
		}, 2000);
	}
}

const afterTest = (mbti) => {
	$.ajax({
		url: "getMbtiProduct.do?m_name=" + mbti,
		type: "get",
		dataType: "json",
		success: function(data) {
			$(data).each(function(key, value) {
				$('.content-div').html(
					"<div class='after-content'>" +
					"<div class='after-paging' align='right'>" +
					"<span style='font-size:medium'>EatDa 이달의 컨텐츠!</span><br>" +
					"</div>" +
					"<div class='question-box'>" +
					"<div class='after-body'>" +
					"<div class='question gaegu' style='margin-top: 20px;'>" +
					"당신의 성향은 '" + value.m_name + "' 입니다." +
					"</div>" +
					"<div class='after-text gaegu'>" +
					"<span style='font-size:medium;'>" + value.m_content + "</span><br>" +
					"<span>당신에게 어울리는 음식은...</span>" +
					"</div>" +
					"</div>" +
					"<div class='card p-card' align='left'>" +
					"<div style='display:none' class='p-id'>" + value.p_id + "</div>" +
					"<div class='img-div' align='center'>" +
					"<img onclick='goProductPage(this)' src='" + value.img_path + "' class='card-img-top rec-img'>" +
					"</div>" +
					"<div class='card-body'>" +
					"<h6 class='card-subtitle mb-2 text-muted'>" + value.p_short_desc + "</h6>" +
					"<h5 class='card-title' onclick='goProductPage(this)'>" + value.p_name + "</h5>" +
					"<p class='card-text'>" +
					"<span>" + value.p_price + "</span><span>원</span>" +
					"</p>" +
					"<p class='card-text'>" + value.p_description + "</p>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</div>"
				);
			});
		}
	});
}

const goProductPage = (object) => {
	let p_id = $(object).parent().siblings('.p-id').text();
	location.href = 'goProductPage.do?p_id=' + p_id;
}

const start = () => {
	$('.content-div').html(
		'<div class="content">' +
		'<div class="paging" align="right">' +
		'<span class="now-page">1</span>' +
		'<span>/ 8</span>' +
		'</div>' +
		'<div class="question-box">' +
		'<div class="question-div">' +
		'<span class="gaegu">STEP.</span>&nbsp;&nbsp;' +
		'<span class="now-page gaegu">1</span>' +
		'<div class="question gaegu">' +
		'식당에서 밑반찬을 다 먹었을 때 셀프바가 있는지 먼저 살펴보는 편이다.' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>' +
		'<div class="btn-div d-grid gap-3 col-9 mx-auto">' +
		'<button class="btn btn-outline-info q-btn" onclick="response(1)">정말 그렇다</button>' +
		'<button class="btn btn-outline-danger q-btn" onclick="response(0)">전혀 아니다</button>' +
		'</div>'
	);
}
</script>
</head>
<body>
    <div class="header container-fluid" style="width:100%;">
        <div class="row">
            <div class="col-md-6 header-col" style="padding-left: 5%;">
                <span class="head-title main" onclick="location.href='index.do'">EatDa</span>
            </div>
            <div class="col-md-6 header-col" style="padding-right: 5%;" align="right">
                <span class="head-title" onclick="location.reload()">Replay</span>
            </div>
        </div>
    </div>
    <div class="container" style="height:92%;">
        <div class="row" style="height:100%;">
            <div class="col-md-3"></div>
            <div class="col-md-6 content-div">
                <div class="content">
                    <div class="paging" align="right">
                        <span style="font-size:medium">EatDa 이달의 컨텐츠!</span><br>
                    </div>
                    <div class="question-box">
                        <div class="question-div">
                            <div class="question gaegu">
                                이번 주말은 어떤 음식을 즐겨볼까?
                            </div>
                            <div class="question gaegu">
                                내 성향 테스트해보고 추천 메뉴도 알아보자!
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btn-start-div d-grid col-10 mx-auto">
                    <button class="btn btn-outline-warning q-btn" onclick="start()">음BTI 검사하기</button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>