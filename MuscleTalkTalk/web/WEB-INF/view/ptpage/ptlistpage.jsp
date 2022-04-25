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
<head>
<meta charset="UTF-8">
<title>머슬톡톡</title>
</head>
<body>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="pt_list_page_section">
		<div id="pt_list_page_div">
			<div id="pt_list_title">
				<p>PT 프로그램</p>
				<button type="button">즐겨찾기</button>
				<button type="button">내 프로그램 관리</button>
			</div>
			<div id="pt_list_filter">
				<div id="pt_list_page_category_div">
					<p>카테고리 선택</p>
					<i class="fa-solid fa-sort-up pt_list_page_category_arrow"></i>
					<i class="fa-solid fa-sort-down pt_list_page_category_arrow"></i>
				</div>
					<div id="pt_list_page_category_list">
						<ul id="pt_list_page_category_list_box">
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
					<p>일정</p>
					<i class="fa-solid fa-sort-up pt_list_page_category_arrow"></i>
					<i class="fa-solid fa-sort-down pt_list_page_category_arrow"></i>
				</div>
				<div id="pt_list_page_time_list">
					<ul id="pt_list_page_time_list_box">
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
					<div class="pt_list_page_grid_content">${ptVo.ptFilePathList[0] }
						<img alt="" src="${ptVo.ptFilePathList[0] }">
					</div>
				</c:forEach>
				<div class="pt_list_page_grid_content">${ptVoList[0].ptNo }</div>
				<div class="pt_list_page_grid_content"></div>
				<div class="pt_list_page_grid_content"></div>
				<div class="pt_list_page_grid_content"></div>
				<div class="pt_list_page_grid_content"></div>
			</div>
			<div id="pt_list_page_btns">
				<button type="button" class="fa-solid fa-chevron-left"></button>
				<button type="button">1</button>
				<button type="button">2</button>
				<button type="button">3</button>
				<button type="button">4</button>
				<button type="button">5</button>
				<button type="button" class="fa-solid fa-chevron-right"></button>
			</div>	
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	<script type="text/javascript">
	
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
			$("#pt_list_page_category_list").css("height", "90px");
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
			$("#pt_list_page_time_list").css("height", "210px");
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
		console.log(event.target);
		console.log(event.target != $("#pt_list_page_category_div").children('p')[0]);
		if(event.target != $("#pt_list_page_category_div").children('p')[0]){
			for(var i = 0; i < $("#pt_list_page_category_list_box").children().length; i++) {
				if(event.target == $("#pt_list_page_category_list_box").children()[i]) {
					console.log("여기로 들어옴");
					temp_category = false;
				}
			}
			console.log(temp_category);
			if(temp_category) {
				console.log("sdfsdf");
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
	
	</script>
</body>
</html>