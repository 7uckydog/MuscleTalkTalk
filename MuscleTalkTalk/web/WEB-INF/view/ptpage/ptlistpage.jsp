<%@ include file="/WEB-INF/view/csslink.jsp"%>
<link rel="stylesheet" href="<%= request.getContextPath() %>/cssfolder/css/ptpage.css">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머슬톡톡</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="pt_list_page_section">
		<div id="pt_list_page_div">
			<div id="pt_list_title">
				<p>PT 프로그램</p>
				<c:if test="${not empty ssMvo }">
					<button type="button" id="pt_list_favorite_list_btn">즐겨찾기</button>
				</c:if>
				<c:if test="${ssMvo.memberTrainer == 'T' }">
					<button id="my_program_btn" type="button">내 프로그램 관리</button>
				</c:if>
			</div>
			<div id="pt_list_filter">
				<div id="pt_list_page_category_div">
					<p></p>
					<i class="fa-solid fa-sort-up pt_list_page_category_arrow"></i>
					<i class="fa-solid fa-sort-down pt_list_page_category_arrow"></i>
				</div>
					<div id="pt_list_page_category_list">
						<ul id="pt_list_page_category_list_box">
							<li>전체</li>
							<li>웨이트</li>
							<li>다이어트</li>
							<li>재활</li>
						</ul>
					</div>
				<div id="pt_list_page_location_div">
					<p>지역</p>
					<i class="fa-solid fa-sort-up pt_list_page_category_arrow"></i>
					<i class="fa-solid fa-sort-down pt_list_page_category_arrow"></i>
				</div>
				<div id="pt_list_page_location_list">
					<ul id="pt_list_page_location_list_box">
						<li>서울</li>
						<li>경기도</li>
					</ul>
				</div>
				<div id="pt_list_page_time_div">
					<p></p>
					<i class="fa-solid fa-sort-up pt_list_page_category_arrow"></i>
					<i class="fa-solid fa-sort-down pt_list_page_category_arrow"></i>
				</div>
				<div id="pt_list_page_time_list">
					<ul id="pt_list_page_time_list_box">
						<li>전체</li>
						<li>월요일</li>
						<li>화요일</li>
						<li>수요일</li>
						<li>목요일</li>
						<li>금요일</li>
						<li>토요일</li>
						<li>일요일</li>
					</ul>
				</div>
				<button type="button" id="pt_list_page_text_btn">검색</button>
				<input type="text" id="pt_list_page_text">
			</div>
			<div id="pt_list_page_container">
				<c:forEach var="ptVo" items="${ptVoList }">
					<div class="pt_list_page_grid_content">
						<div class="pt_list_page_cursor">
							<input type="hidden" class="pt_list_page_pt_no" value="${ptVo.ptNo }">
							<img alt="" src="${ptVo.ptFilePathList[0] }">
							<i class="fa-solid fa-heart pt_list_page_favortie"></i>
							<p class="pt_list_page_grid_content_location">${ptVo.ptLocation }</p>
							<p class="pt_list_page_grid_content_title">${ptVo.ptName }</p>
							<p class="pt_list_page_grid_content_info">${ptVo.ptCategoryStr}&nbsp;&bull;&nbsp;${ptVo.ptTrainerName }</p>
							<p class="pt_list_page_grid_content_price">1회: ${ptVo.ptPrice }원</p>
							<p class="pt_list_page_grid_content_favorite">즐겨찾기 수: ${ptVo.favoriteCnt }</p>
						</div>
					</div>
				</c:forEach>
			</div>
			<div id="pt_list_page_btns">
				<c:if test="${startPage > 1 }">
					<button type="button" class="fa-solid fa-chevron-left pt_list_page_prev_btn"></button>
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="p">
					<button class="pt_list_page_btn" type="button">${p }</button>
				</c:forEach>
				<c:if test="${endPage < totalpageCnt}">
					<a class="Page" href="BoardReadAll?page=${endPage+1 }">다음</a>
					<button type="button" class="fa-solid fa-chevron-right pt_list_page_next_btn""></button>
				</c:if>
			</div>	
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	<script type="text/javascript">
	

	$('.pt_list_page_prev_btn').click(function() {
		console.log(${startPage});
		console.log(${startPage - 1});
		location.href = "ptlist?page=${startPage-1 }&category="+categoryNum+"&time="+timeNum + "&search="+$("#pt_list_page_text").val().trim();
	});
	for(var i = 0; i < $('.pt_list_page_btn').length; i++) {	
		$('.pt_list_page_btn').eq(i).click(function() {
			location.href = "ptlist?page="+$(this).text()+"&category="+categoryNum+"&time="+timeNum + "&search="+$("#pt_list_page_text").val().trim();
		});
		if($('.pt_list_page_btn').eq(i).text() == Number(${pageInt})) {
			$('.pt_list_page_btn').eq(i).css({
				color: 'white',
				backgroundColor : '#4B4DB2'
			})
		}
	}
	$('.pt_list_page_next_btn').click(function() {
		location.href = "ptlist?page=${endPage+1 }&category="+categoryNum+"&time="+timeNum + "&search="+$("#pt_list_page_text").val().trim();
	});
	
	$(window).resize(function() {
		$("#pt_list_page_category_list").css({
			top: $("#pt_list_page_category_div").offset().top + 40,
			left: $("#pt_list_page_category_div").offset().left
		});
		$("#pt_list_page_location_list").css({
			top: $("#pt_list_page_location_div").offset().top + 40,
			left: $("#pt_list_page_location_div").offset().left
		});
		$("#pt_list_page_time_list").css({
			top: $("#pt_list_page_time_div").offset().top + 40,
			left: $("#pt_list_page_time_div").offset().left
		});
	});
	
	$(function() {
		$("#pt_list_page_category_list").css({
			top: $("#pt_list_page_category_div").offset().top + 40,
			left: $("#pt_list_page_category_div").offset().left
		});
		$("#pt_list_page_location_list").css({
			top: $("#pt_list_page_location_div").offset().top + 40,
			left: $("#pt_list_page_location_div").offset().left
		});
		$("#pt_list_page_time_list").css({
			top: $("#pt_list_page_time_div").offset().top + 40,
			left: $("#pt_list_page_time_div").offset().left
		});
/*  		$("#pt_list_page_category_list_box li").filter(":first").css({
			'border-radius': '5px 5px 0 0',
			'border-top': '1px solid rgba(75, 77, 178, 0.3)'
		});
		$("#pt_list_page_category_list_box li").filter(":last").css({
			'border-radius': '0 0 5px 5px',
			'border-bottom': '1px solid rgba(75, 77, 178, 0.3)'
		}); */
		// 리스트 li 호버 추가
		$("#pt_list_page_category_list_box li, #pt_list_page_location_list_box li, #pt_list_page_time_list_box li").hover(function() {
 			$(this).css({
				backgroundColor: '#4B4DB2',
				color: 'white'
			});
		}, function() {
 			$(this).css({
				/* backgroundColor: '#c8c9e8', */
				backgroundColor: 'transparent',
				color: 'black'
			});
		});
	});
	
	//카테고리 리스트 박스
	$("#pt_list_page_category_div").click(function() {
		if($("#pt_list_page_category_list").css("height") != '0px'){
			$("#pt_list_page_category_list").css("height", "0px");
			$("#pt_list_page_category_list").css("border-color", "rgba(75, 77, 178, 0.0)");
		} else {
			$("#pt_list_page_category_list").css("height", "120px");
			$("#pt_list_page_category_list").css("border-color", "rgba(75, 77, 178, 1)");
		}
		if($("#pt_list_page_category_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
			$("#pt_list_page_category_div").css("border", '1px solid rgba(75, 77, 178, 1)');
		} else {
			$("#pt_list_page_category_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
		}
	});
	
	//지역 리스트 박스
	$("#pt_list_page_location_div").click(function() {
		if($("#pt_list_page_location_list").css("height") != '0px'){
			$("#pt_list_page_location_list").css("height", "0px");
			$("#pt_list_page_location_list").css("border-color", "rgba(75, 77, 178, 0.0)");
		} else {
			$("#pt_list_page_location_list").css("height", "60px");
			$("#pt_list_page_location_list").css("border-color", "rgba(75, 77, 178, 1)");
		}
		if($("#pt_list_page_location_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
			$("#pt_list_page_location_div").css("border", '1px solid rgba(75, 77, 178, 1)');
		} else {
			$("#pt_list_page_location_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
		}
	});
	
	//일정 리스트 박스
	$("#pt_list_page_time_div").click(function() {
		if($("#pt_list_page_time_list").css("height") != '0px'){
			$("#pt_list_page_time_list").css("height", "0px");
			$("#pt_list_page_time_list").css("border-color", "rgba(75, 77, 178, 0.0)");
		} else {
			$("#pt_list_page_time_list").css("height", "240px");
			$("#pt_list_page_time_list").css("border-color", "rgba(75, 77, 178, 1)");
		}
		if($("#pt_list_page_time_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
			$("#pt_list_page_time_div").css("border", '1px solid rgba(75, 77, 178, 1)');
		} else {
			$("#pt_list_page_time_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
		}
	});
	
	window.onclick = function(event) {
		var temp_category = true;
		if(event.target != $("#pt_list_page_category_div").children('p')[0]){
			for(var i = 0; i < $("#pt_list_page_category_list_box").children().length; i++) {
				if(event.target == $("#pt_list_page_category_list_box").children()[i]) {
					temp_category = false;
				}
			}
			if(temp_category) {
				$("#pt_list_page_category_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
				$("#pt_list_page_category_list").css("height", "0px");
				$("#pt_list_page_category_list").css("border-color", "rgba(75, 77, 178, 0.0)");
			}
		}
		var temp_day = true;
		if(event.target != $("#pt_list_page_location_div").children('p')[0]){
			for(var i = 0; i < $("#pt_list_page_location_list_box").children().length; i++) {
				if(event.target == $("#pt_list_page_location_list_box").children()[i]) {
					temp_day = false;
				}
			}
			if(temp_day) {
				$("#pt_list_page_location_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
				$("#pt_list_page_location_list").css("height", "0px");
				$("#pt_list_page_location_list").css("border-color", "rgba(75, 77, 178, 0.0)");
			}
		}
		var temp_start_time = true;
		if(event.target != $("#pt_list_page_time_div").children('p')[0]){
			for(var i = 0; i < $("#pt_list_page_time_list_box").children().length; i++) {
				if(event.target == $("#pt_list_page_time_list_box").children()[i]) {
					temp_start_time = false;
				}
			}
			if(temp_start_time) {
				$("#pt_list_page_time_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
				$("#pt_list_page_time_list").css("height", "0px");
				$("#pt_list_page_time_list").css("border-color", "rgba(75, 77, 178, 0.0)");
			}
		}
	};
	

	
	$(".pt_list_page_cursor").click(function(event) {
		if(!(event.target == $(this).children('.pt_list_page_favortie')[0])) {
			var ptNo = $(this).children(".pt_list_page_pt_no").val();
			location.href = "ptread?ptNo=" + ptNo;
		}
	});
	
	$("#my_program_btn").on('click', function() {
		location.href="myptprogram";
	});
	
	$('.pt_list_page_favortie').click(function() {
		<c:if test="${not empty ssMvo}">
			var ptNoTemp = $(this).prevAll('.pt_list_page_pt_no').val();
			var favoriteCheck = false;
			for(var i = 0; i < ptFavoriteVoList.length; i++) {
				if(ptFavoriteVoList[i] == ptNoTemp) {
					favoriteCheck = true;
				}
			}
			
	 		$.ajax({
				url: 'ptfavorite.ax',
				type: 'post',
				data: {
					memberNo : ${ssMvo.memberNo},
					ptNo : ptNoTemp,
					favoriteCheck : favoriteCheck
				},
				success : function(result) {
					if(result == "1") {
						console.log("ajax success");
						if(favoriteCheck) {
							var ptFavoriteVoListIndexTemp = -1;
							for(var i = 0; i < ptFavoriteVoList.length; i++) {
								if(ptFavoriteVoList[i] == ptNoTemp) {
									ptFavoriteVoListIndexTemp = i;
								}
							}
							ptFavoriteVoList.splice(ptFavoriteVoListIndexTemp, 1);
						} else {
							ptFavoriteVoList.push(Number(ptNoTemp));
						}
						for(var i = 0; i < $('.pt_list_page_pt_no').length; i++) {
							if($('.pt_list_page_pt_no').eq(i).val() == ptNoTemp) {
								var favoriteCntTemp = $('.pt_list_page_pt_no').eq(i).nextAll(".pt_list_page_grid_content_favorite").text();
								favoriteCntArray = favoriteCntTemp.split(":");
								if(favoriteCheck) {								
									$('.pt_list_page_pt_no').eq(i).nextAll(".pt_list_page_grid_content_favorite").text(favoriteCntArray[0] + ": " + (Number(favoriteCntArray[1]) - 1));
								} else {
									$('.pt_list_page_pt_no').eq(i).nextAll(".pt_list_page_grid_content_favorite").text(favoriteCntArray[0] + ": " + (Number(favoriteCntArray[1]) + 1));
								}
							}
						}
					}
					console.log(ptFavoriteVoList);
					favoriteChk();
				},
				error : function(request, status, error) {
					console.log(request);
					console.log(status);
					console.log(error);
				} 
			});
	 		
 		</c:if>
 		<c:if test="${empty ssMvo}">
 			alert("로그인후 가능합니다.");
 		</c:if>
 		
	});
	
	var ptFavoriteVoList = [];
	<c:forEach var="vo" items="${ptFavoriteVoList}">
		ptFavoriteVoList.push(${vo.ptNo});
	</c:forEach>
	favoriteChk();
	function favoriteChk() {
		$('.pt_list_page_favortie').off('mouseenter');
		$('.pt_list_page_favortie').off('mouseleave');
		if(ptFavoriteVoList.length == 0) {
			for(var i = 0; i < $('.pt_list_page_pt_no').length; i++) {
				$('.pt_list_page_favortie').eq(i).css('-webkit-text-fill-color','white');
				$('.pt_list_page_favortie').eq(i).on({
					mouseenter : function() {
						$(this).css('-webkit-text-fill-color', '#c8c9e8');
					},
					mouseleave : function() {
						$(this).css('-webkit-text-fill-color', 'white');
					}
				});
			}
			return;
		}
		
		for(var i = 0; i < $('.pt_list_page_pt_no').length; i++) {			
			$('.pt_list_page_favortie').eq(i).css('-webkit-text-fill-color','white');
			$('.pt_list_page_favortie').eq(i).on({
				mouseenter : function() {
					$(this).css('-webkit-text-fill-color', '#c8c9e8');
				},
				mouseleave : function() {
					$(this).css('-webkit-text-fill-color', 'white');
				}
			});
			for(var j = 0; j < ptFavoriteVoList.length; j++) {				
				if($('.pt_list_page_pt_no').eq(i).val() == ptFavoriteVoList[j]) {
					$('.pt_list_page_favortie').eq(i).css('-webkit-text-fill-color','#4B4DB2');
					$('.pt_list_page_favortie').eq(i).off('mouseenter');
					$('.pt_list_page_favortie').eq(i).off('mouseleave');
				}
			}
		}
	}
	
	$('#pt_list_favorite_list_btn').click(function() {
		location.href = "favoritelist";
	});
	var categoryNum = ${categoryInt};
	var timeNum = ${timeInt};
	<c:if test="${not empty search}">
		$("#pt_list_page_text").val('${search}');
	</c:if>
	$('#pt_list_page_category_list_box li').on('click', function() {
		
		switch ($(this).text()) {
		case '전체':
			categoryNum = 0;
			break;
		case '웨이트':
			categoryNum = 1;
			break;
		case '다이어트':
			categoryNum = 2;
			break;
		case '재활':
			categoryNum = 3;
			break;

		default:
			break;
		}
		urlMapping();
		//$("#pt_list_page_category_div p").text($(this).text());
		//$("#pt_list_page_category_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
		//$("#pt_list_page_category_list").css("height", "0px");
		//$("#pt_list_page_category_list").css("border-color", "rgba(75, 77, 178, 0.0)");
	});
	
	$('#pt_list_page_time_list_box li').on('click', function() {
		switch ($(this).text()) {
		case '전체':
			timeNum = 0;
			break;
		case '월요일':
			timeNum = 1;
			break;
		case '화요일':
			timeNum = 2;
			break;
		case '수요일':
			timeNum = 3;
			break;
		case '목요일':
			timeNum = 4;
			break;
		case '금요일':
			timeNum = 5;
			break;
		case '토요일':
			timeNum = 6;
			break;
		case '일요일':
			timeNum = 7;
			break;

		default:
			break;
		}
		urlMapping();
		//$("#pt_list_page_time_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
		//$("#pt_list_page_time_list").css("height", "0px");
		//$("#pt_list_page_time_list").css("border-color", "rgba(75, 77, 178, 0.0)");
	});
	
	$(function() {
		var categoryInt = ${categoryInt};
		var categoryTemp;
		switch (categoryInt) {
		case 0:
			categoryTemp = '카테고리 선택'
			break;
		case 1:
			categoryTemp = '웨이트'
			break;
		case 2:
			categoryTemp = '다이어트'
			break;
		case 3:
			categoryTemp = '재활'
			break;

		default:
			break;
		}
		$("#pt_list_page_category_div p").text(categoryTemp);
		
		var timeInt = ${timeInt};
		var timeTemp;
		switch (timeInt) {
		case 0:
			timeTemp = '일정'
			break;
		case 1:
			timeTemp = '월요일'
			break;
		case 2:
			timeTemp = '화요일'
			break;
		case 3:
			timeTemp = '수요일'
			break;
		case 4:
			timeTemp = '목요일'
			break;
		case 5:
			timeTemp = '금요일'
			break;
		case 6:
			timeTemp = '토요일'
			break;
		case 7:
			timeTemp = '일요일'
			break;

		default:
			break;
		}
		$("#pt_list_page_time_div p").text(timeTemp);
	});
	
	$("#pt_list_page_text").keydown(function(event) {
		var searchStr = $(this).val().trim();
		if(searchStr == "") {
			return;
		}
		if(event.keyCode == 13) {
			location.href = "ptlist?page=1&category="+categoryNum+"&time="+timeNum + "&search="+$(this).val();
		}
	});
	
	$("#pt_list_page_text_btn").click(function() {
		location.href = "ptlist?page=1&category="+categoryNum+"&time="+timeNum + "&search="+$(this).next().val();
	});
	
	function urlMapping() {
		var searchStr = $("#pt_list_page_text").val().trim();
		location.href = "ptlist?page=1&category="+categoryNum+"&time="+timeNum + "&search="+searchStr;
	};
	
	</script>
</body>
</html>