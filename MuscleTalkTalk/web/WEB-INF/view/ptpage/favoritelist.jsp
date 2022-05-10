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
				<p>즐겨찾기</p>
				<button type="button" id="pt_list_pt_program_list_btn">PT 프로그램</button>
				<c:if test="${ssMvo.memberTrainer == 'T' }">
					<button id="my_program_btn" type="button">내 프로그램 관리</button>
				</c:if>
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
		location.href="favoritelist?page=${startPage-1 }";
	});
	for(var i = 0; i < $('.pt_list_page_btn').length; i++) {	
		$('.pt_list_page_btn').eq(i).click(function() {
			location.href="favoritelist?page="+$(this).text();
		});
		if($('.pt_list_page_btn').eq(i).text() == Number(${pageInt})) {
			$('.pt_list_page_btn').eq(i).css({
				color: 'white',
				backgroundColor : '#4B4DB2'
			})
		}
	}
	$('.pt_list_page_next_btn').click(function() {
		location.href="favoritelist?page=${endPage+1 }";
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
			if (confirm("즐겨찾기에서 삭제하시겠습니까?")) {
	         	alert("즐겨찾기에서 삭제합니다.")
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
							location.href = "favoritelist?page=${pageInt}";
						}
						favoriteChk();
					},
					error : function(request, status, error) {
						console.log(request);
						console.log(status);
						console.log(error);
					} 
				});
			} else {
	            alert("즐겨찾기에서 삭제하지 않습니다.");
	        }
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
	
	$('#pt_list_pt_program_list_btn').click(function() {
		location.href = "ptlist";
	});
	
	</script>
</body>
</html>