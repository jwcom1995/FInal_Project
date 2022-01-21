$(document).ready(function() {
	let list = getMarketProduct();
	let index = 2;

	getRecentRecipe();
	makeProductSection(list);
	getPopularBlog();
	getLovingRecipe();

	window.setInterval(function() {
		$('.list-item').eq(0).animate({ opacity: 0 }, 800);
		$('.list-item').eq(1).animate({ opacity: 0 }, 1200);
		$('.list-item').eq(2).animate({ opacity: 0 }, 1600);
		window.setTimeout(function() {
			getLovingRecipe();
		}, 1800)
	}, 9000);

	//배너 사진 변경
	window.setInterval(function() {
		if (index == 4) {
			index = 1;
		}
		$('.banner').animate({ opacity: 0 }, 800, function() {
			$('.banner').css('background-image', 'url(resources/images/recipe/main-banner' + index + '.png)');
		});
		$('.banner').animate({ opacity: 1 }, 800);
		index++;
	}, 12000);

	//좌 우 버튼 클릭
	$('.product-btn:eq(0)').click(function() {
		productSwitchBtn(list, 'left');
	});
	$('.product-btn:eq(1)').click(function() {
		productSwitchBtn(list, 'right');
	});
});

const getMarketProduct = () => {
	var list;
	$.ajax({
		url: "getMarketData.do",
		type: "post",
		async: false,
		dataType: "json",
		success: function(data) {
			list = data;
		}
	});
	return list;
}

const makeProductSection = (list) => {
	let temp = new Array();
	for (var i = 0; i < 4; i++) {
		temp.push(list[i]);
	}

	$(temp).each(function(key, value) {
		$('.product-section').append(
			"<div class='card p-card'>" +
			"<span class='p-id' style='display:none;'>" + value.p_id + "</span>" +
			"<span class='p-key' style='display:none;'>" + key + "</span>" +
			"<div class='card-img-div'>" +
			"<img onclick='goProductPage(this)' class='card-img-top' src=" + value.img_path + ">" +
			"</div>" +
			"<div class='card-body'>" +
			"<h6 class='card-subtitle mb-2 text-muted'>" + value.p_short_desc + "</h6>" +
			"<h5 onclick='goProductPage(this)' class='card-title p_title'>" + value.p_name + "</h5>" +
			"<p class='card-text'>" +
			"<span>" + value.p_price + "</span><span>원</span>" +
			"</p>" +
			"<p class='card-text'>" + value.p_description + "</p>" +
			"</div>" +
			"</div>"
		);
	});
}

const productSwitchBtn = (list, direction) => {
	let getKey;
	let product;

	if (direction == 'left') {
		let key = Number($('.p-card:eq(0)').children('.p-key').text());
		if (key == 0) { return; }
		getKey = key - 1;
		product = list[getKey];

		$('.p-card:last').remove();
		$('.product-section').prepend(
			"<div class='card p-card'>" +
			"<span class='p-id' style='display:none;'>" + product.p_id + "</span>" +
			"<span class='p-key' style='display:none;'>" + getKey + "</span>" +
			"<div class='card-img-div'>" +
			"<img onclick='goProductPage(this)' class='card-img-top' src=" + product.img_path + ">" +
			"</div>" +
			"<div class='card-body'>" +
			"<h6 class='card-subtitle mb-2 text-muted'>" + product.p_short_desc + "</h6>" +
			"<h5 onclick='goProductPage(this)' class='card-title p_title'>" + product.p_name + "</h5>" +
			"<p class='card-text'>" +
			"<span>" + product.p_price + "</span><span>원</span>" +
			"</p>" +
			"<p class='card-text'>" + product.p_description + "</p>" +
			"</div>" +
			"</div>"
		);
	} else if (direction == 'right') {
		let key = Number($('.p-card:last').children('.p-key').text());
		if (key == list.length - 1) {
			return;
			alert('마지막 상품입니다.');
		}
		getKey = key + 1;
		product = list[getKey];

		$('.p-card:eq(0)').remove();
		$('.product-section').append(
			"<div class='card p-card'>" +
			"<span class='p-id' style='display:none;'>" + product.p_id + "</span>" +
			"<span class='p-key' style='display:none;'>" + getKey + "</span>" +
			"<div class='card-img-div'>" +
			"<img onclick='goProductPage(this)' class='card-img-top' src=" + product.img_path + ">" +
			"</div>" +
			"<div class='card-body'>" +
			"<h6 class='card-subtitle mb-2 text-muted'>" + product.p_short_desc + "</h6>" +
			"<h5 onclick='goProductPage(this)' class='card-title p_title'>" + product.p_name + "</h5>" +
			"<p class='card-text'>" +
			"<span>" + product.p_price + "</span><span>원</span>" +
			"</p>" +
			"<p class='card-text'>" + product.p_description + "</p>" +
			"</div>" +
			"</div>"
		);
	}
}

const goProductPage = (object) => {
	let p_id = $(object).parent().siblings('.p-id').text();
	location.href = 'goProductPage.do?p_id=' + p_id;
}

const getRecentRecipe = () => {
	$.ajax({
		url: "getRecentRecipe.do",
		type: "post",
		dataType: "json",
		success: function(data) {
			console.log(data);
			$(data).each(function(key, value) {
				$('.rec-recipe').append(
					"<div class='col-md-3'>" +
					"<div class='card' style='height: 380px;'>" +
					"<div class='recipe-no'>" + value.recipe_no + "</div>" +
					"<div style='margin: 15px 0'>" +
					"<img onclick='goRecipeDetail(this)' class='card-img-top' src='" + value.recipe_img + "'>" +
					"</div>" +
					"<div class='card-body'>" +
					"<h5 onclick='goRecipeDetail(this)' class='card-title'>" + value.recipe_title + "</h5>" +
					"<p onclick='goRecipeDetail(this)' class='card-text recipe-text'>" + value.r_short_desc + "</p>" +
					"</div></div></div>"
				);
			});
		}
	});
}

const goRecipeDetail = (object) => {
	let recipe_no = 0;

	if ($(object).attr('class') == 'a-tag') {
		recipe_no = Number($(object).parents('.item-title').siblings('.recipe-no').text());
	} else {
		recipe_no = Number($(object).parent().siblings('.recipe-no').text());
	}

	location.href = 'recipeDetail.do?recipe_no=' + recipe_no;
}

const goBlogDetail = (object) => {
	const blog_no = Number($(object).children().eq(0).text());
	location.href = 'blog-detail.do?blog_no=' + blog_no;
}


//인기 eatdagram 가져오기 하트 구현되면 하트순으로 바꿔줘야함
const getPopularBlog = () => {
	$.ajax({
		url: "getPopularBlog.do",
		type: "post",
		dataType: "json",
		success: function(data) {
			console.log(data);
			$(data).each(function(kay, value) {
				$('.list-base:eq(1)').append(
					"<li class='list-item'>" +
					"<div class='item-inner' onclick='goBlogDetail(this)'>" +
					"<div style='display:none;'>" + value.blog_no + "</div>" +
					"<div class='item-img'>" +
					"<img class='thumbnail' src=" + value.blog_img + ">" +
					"</div>" +
					"<div class='item-title'>" +
					"<div class='pop-title'>" +
					"<a class='a-tag'>" + value.blog_title + "</a>" +
					"</div>" +
					"<div class='pop-content'>" +
					"<a class='a-tag'>" + value.blog_content + "</a>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</li>"
				);
			});
		}
	});
}

const getLovingRecipe = () => {
	$.ajax({
		url: "getLovingRecipe.do",
		type: "post",
		dataType: "json",
		success: function(data) {
			$('.list-base:eq(0)').html('');
			$(data).each(function(key, value) {
				$('.list-base:eq(0)').append(
					"<li class='list-item'>" +
					"<div class='item-inner'>" +
					"<div class='recipe-no'>" + value.recipe_no + "</div>" +
					"<div class='item-img'>" +
					"<img class='thumbnail' onclick='goRecipeDetail(this)' src=" + value.recipe_img + " style='margin-bottom:0; border-radius:15px 5px 5px 15px;'>" +
					"</div>" +
					"<div class='item-title'>" +
					"<div class='pop-title'>" +
					"<a class='a-tag' onclick='goRecipeDetail(this)'>" + value.recipe_title + "</a>" +
					"</div>" +
					"<div class='pop-content'>" +
					"<a class='a-tag' onclick='goRecipeDetail(this)'>" + value.r_short_desc + "</a>" +
					"</div>" +
					"</div>" +
					"</div>" +
					"</li>"
				);
			});
		}
	});
}
