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
	<section id="pt_insert_page_section">
		<div id="pt_write_title">
			<p>프로그램 등록</p>
		</div>
		<div id="pt_write_content">
			<form name="pt_time_form" action="ptinsert.do" method="post" enctype="multipart/form-data">
				<div class="row">
					<div class="col_25">
						<label for="pt_name">프로그램 명</label>
					</div>
					<div class="col_75">
						<input class="pt_write_input_text" type="text" id="pt_name"
							name="pt_name" autocomplete="off">
						<p id="pt_name_textCount">00/30자</p>
					</div>
				</div>
				<div class="row">
					<input type="file" class="input_ptimg_file" id="input_ptimg_file1"
						name="input_ptimg_file1""> <input type="file"
						class="input_ptimg_file" id="input_ptimg_file2"
						name="input_ptimg_file2""> <input type="file"
						class="input_ptimg_file" id="input_ptimg_file3"
						name="input_ptimg_file3"">
					<button type="button" id="test_input_data">테스트</button>
					<div class="col_25">
						<label for="">커버 이미지</label>
					</div>
					<div class="col_75">
						<div class="wrapper">
							<div id="input_imgbox1" class="input_imgbox_content"></div>
							<div id="input_imgbox2" class="input_imgbox_content"></div>
							<div id="input_imgbox3" class="input_imgbox_content"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">카테고리 (종류)</label>
					</div>
					<div class="col_75">
						<div id="pt_category_div">
							<p>카테고리 선택</p>
							<i class="fa-solid fa-sort-up pt_category_arrow"></i>
							<i class="fa-solid fa-sort-down pt_category_arrow"></i>
						</div>
						<div id="pt_category_list">
							<ul id="pt_category_list_box">
								<li>웨이트</li>
								<li>다이어트</li>
								<li>재활</li>
							</ul>
						</div>
						<input type="hidden" name="pt_category" id="pt_category">
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">프로그램 간단 설명</label>
					</div>
					<div class="col_75">
						<textarea class="pt_write_textarea" name="pt_introduce"
							id="pt_introduce" cols="30" rows="10"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">프로그램 상세 설명</label>
					</div>
					<div class="col_75">
						<textarea class="pt_write_textarea" name="pt_information"
							id="pt_information" cols="30" rows="10"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">수업 추천 회원</label>
					</div>
					<div class="col_75">
						<textarea class="pt_write_textarea" name="pt_target_student"
							id="pt_target_student" cols="30" rows="10"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">트레이너 소개</label>
					</div>
					<div class="col_75">
						<textarea class="pt_write_textarea" name="pt_trainer_info"
							id="pt_trainer_info" cols="30" rows="10"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">유의사항</label>
					</div>
					<div class="col_75">
						<textarea class="pt_write_textarea" name="pt_notice"
							id="pt_notice" cols="30" rows="10"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">수업 진행 일시</label>
					</div>
					<div class="col_75" id="pt_time_info_list">
						<div id="pt_day_div" class="pt_time_div">
							<p>요일 선택</p>
							<i class="fa-solid fa-sort-up pt_time_arrow"></i>
							<i class="fa-solid fa-sort-down pt_time_arrow"></i>
						</div>
						<div id="pt_day_list">
							<ul id="pt_day_list_box">
								<li>월요일</li>
								<li>화요일</li>
								<li>수요일</li>
								<li>목요일</li>
								<li>금요일</li>
								<li>토요일</li>
								<li>일요일</li>
							</ul>
						</div>
						<div id="pt_start_time_div" class="pt_time_div">
							<p>시작 시간 선택</p>
							<i class="fa-solid fa-sort-up pt_time_arrow"></i>
							<i class="fa-solid fa-sort-down pt_time_arrow"></i>
						</div>
						<div id="pt_start_time_list">
							<ul id="pt_start_time_list_box">
							</ul>
						</div>
						<div id="pt_end_time_div" class="pt_time_div">
							<p>종료 시간 선택</p>
							<i class="fa-solid fa-sort-up pt_time_arrow"></i>
							<i class="fa-solid fa-sort-down pt_time_arrow"></i>
						</div>
						<div id="pt_end_time_list">
							<ul id="pt_end_time_list_box">
							</ul>
						</div>
						<div id="pt_time_add_div">
							<button type="button" id="pt_time_add_btn">추가</button>
						</div>
						<input type="hidden" id="pt_time_info" name="pt_time_info">
						<p id="pt_time_notice">*모든 PT 프로그램은 1시간 단위로 진행됩니다.</p>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">프로그램 1회 가격</label>
					</div>
					<div class="col_75">
						<input class="pt_write_input_text" type="text" id="pt_price"
							name="pt_price" autocomplete="off">
					</div>
				</div>
				<div class="row">
					<button type="button" id="pt_submit_button">등록</button>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	




	<script type="text/javascript">
		//이미지 드래그 앤 드랍 기능
		$(".input_imgbox_content").on({
			dragover : dragOver,
			dragleave : dragOver,
			drop : uploadFiles
		});

		function dragOver(event) {
			event.stopPropagation();
			event.preventDefault();
			if (event.type == "dragover") {
				$(event.target).css({
					"background-color" : "rgba(75, 77, 178, 0.5)"
				});
			} else {
				$(event.target).css({
					"background-color" : "white"
				});
			}
		}

		function uploadFiles(e) {
			event.stopPropagation();
			event.preventDefault();
			dragOver(event);
			var files = e.originalEvent.dataTransfer.files;
			console.log($(this));
			console.log($(this).index());
			$(".input_ptimg_file")[$(this).index()].files = files;
			console.log($(".input_ptimg_file")[$(this).index()].files);
			if (files.length > 1) {
				alert("파일을 하나만 올려주세요");
				return;
			}
			if (files[0].type.match(/image.*/)) {
				$(e.target).css(
						{
							"background-image" : "url("
									+ window.URL.createObjectURL(files[0])
									+ ")",
							"outline" : "none",
							"background-size" : "contain",
							"background-repeat" : "no-repeat"
						});
			} else {
				alert("이미지 파일을 올려주세요");
				return;
			}
		}
	
		//인풋 글자수 체크
		$("#pt_name").keydown(function(e) {
			let content = $(this).val();
			if (content.length == 0 || content == '') {
				$("#pt_name_textCount").text('00/30자');
			} else if (content.length < 10) {
				$("#pt_name_textCount").text('0' + content.length + '/30자');
			} else {
				$("#pt_name_textCount").text(content.length + '/30자');
			}
		})
		
		//포커스일때 border 애니메이션 추가
		$("#pt_write_content input").focus(function() {
			$(this).css("border", "1px solid rgba(75, 77, 178, 1)");
		});

		$("#pt_write_content input").blur(function() {
			$(this).css("border", "1px solid rgba(75, 77, 178, 0.3)");
		});

		$("#pt_write_content textarea").focus(function() {
			$(this).css("border", "1px solid rgba(75, 77, 178, 1)");
		});

		$("#pt_write_content textarea").blur(function() {
			$(this).css("border", "1px solid rgba(75, 77, 178, 0.3)");
		});
		
		//placeholder 추가
		$(function() {
			$("#pt_name").val("프로그램명을 입력하세요");
			$("#pt_introduce").text("프로그램 시작 전, 회원이 숙지해야 할 사항을 적어주세요.\n준비물, 추가 비용 등 프로그램에 필요한 안내 및 공지 내용을 반드시 작성해 주세요.");
			$("#pt_information").val("프로그램이 진행되는 과정.\n프로그램의 최종 목표 등 프로그램을 설명해 주세요.\n추가로 타 프로그램과의 차이점 및 장점을 작성해 주세요");
			$("#pt_target_student").val("이런 회원님이 들었으면 좋겠다하는 추천 대상을 작성해 주세요");
			$("#pt_trainer_info").val("트레이너의 경력, 방식, 프로그램을 시작하게 된 계기 등과\n자신을 표현할 간다한 소개 글을 작서해 주세요.");
			$("#pt_notice").val("프로그램을 수강하 때 주의해야하는 사항, 예약 취소 관련 안내 사항등을 작성해 주세요.");
			$("#pt_price").val("가격 입력 (원)");
		});

		$(".pt_write_textarea, .pt_write_input_text").on({
			focus : ptInformationPlaceholder,
			blur : ptInformationPlaceholder
		})

		function ptInformationPlaceholder(e) {
			if (e.type == "focus") {
				console.log("test2: " + e.target.id);
				console.log($(e.target).css("color") != "rgb(0, 0, 0)");
				if ($(e.target).css("color") != "rgb(0, 0, 0)") {
					$(e.target).val("");
					$(e.target).css("color", "black");
				}
			} else if ($(e.target).val() == "") {
				console.log("teset3" + e.target.id);
				$(e.target).css("color", "#757575");
				if (e.target.id == "pt_name") {
					console.log("pt_name input text");
					$(e.target).val("프로그램명을 입력하세요");
				} else if (e.target.id == "pt_introduce") {
					console.log("pt_introduce textarea text");
					$(e.target).val("프로그램 시작 전, 회원이 숙지해야 할 사항을 적어주세요.\n준비물, 추가 비용 등 프로그램에 필요한 안내 및 공지 내용을 반드시 작성해 주세요.");
				} else if (e.target.id == "pt_information") {
					console.log("pt_information textarea text");
					$(e.target).val("프로그램이 진행되는 과정.\n프로그램의 최종 목표 등 프로그램을 설명해 주세요.\n추가로 타 프로그램과의 차이점 및 장점을 작성해 주세요");
				} else if (e.target.id == "pt_target_student") {
					console.log("pt_target_student textarea text");
					$(e.target).val("이런 회원님이 들었으면 좋겠다하는 추천 대상을 작성해 주세요");
				} else if (e.target.id == "pt_trainer_info") {
					console.log("pt_trainer_info textarea text");
					$(e.target).val("트레이너의 경력, 방식, 프로그램을 시작하게 된 계기 등과\n자신을 표현할 간다한 소개 글을 작서해 주세요.");
				} else if (e.target.id == "pt_notice") {
					console.log("pt_notice textarea text");
					$(e.target).val("프로그램을 수강하 때 주의해야하는 사항, 예약 취소 관련 안내 사항등을 작성해 주세요.");
				} else if (e.target.id == "pt_price") {
					console.log("pt_price input text");
					$(e.target).val("가격 입력 (원)");
				}
			}
		}

		//카테고리 리스트 박스
		$("#pt_category_div").click(function() {
			if($("#pt_category_list").css("height") != '0px'){
				$("#pt_category_list").css("height", "0px");
			} else {
				$("#pt_category_list").css("height", "90px");
			}
			if($("#pt_category_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
				$("#pt_category_div").css("border", '1px solid rgba(75, 77, 178, 1)');
			} else {
				$("#pt_category_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
			}
		});
		
		//요일 리스트 박스
		$("#pt_day_div").click(function() {
			if($("#pt_day_list").css("height") != '0px'){
				$("#pt_day_list").css("height", "0px");
			} else {
				$("#pt_day_list").css("height", "210px");
			}
			if($("#pt_day_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
				$("#pt_day_div").css("border", '1px solid rgba(75, 77, 178, 1)');
			} else {
				$("#pt_day_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
			}
		});
		
		//시작시간 리스트 박스
		$("#pt_start_time_div").click(function() {
			if($("#pt_start_time_list").css("height") != '0px'){
				$("#pt_start_time_list").css("height", "0px");
			} else {
				$("#pt_start_time_list").css("height", "210px");
			}
			if($("#pt_start_time_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
				$("#pt_start_time_div").css("border", '1px solid rgba(75, 77, 178, 1)');
			} else {
				$("#pt_start_time_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
			}
		});
		
		//종료시간 리스트 박스
		$("#pt_end_time_div").click(function() {
			if($("#pt_end_time_list").css("height") != '0px'){
				$("#pt_end_time_list").css("height", "0px");
			} else {
				$("#pt_end_time_list").css("height", "210px");
			}
			if($("#pt_end_time_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
				$("#pt_end_time_div").css("border", '1px solid rgba(75, 77, 178, 1)');
			} else {
				$("#pt_end_time_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
			}
		});
		
		$(window).resize(function() {
			$("#pt_category_list").css({
				top: $("#pt_category_div").offset().top + 40,
				left: $("#pt_category_div").offset().left
			});
			$("#pt_day_list").css({
				top: $("#pt_day_div").offset().top + 40,
				left: $("#pt_day_div").offset().left
			});
			$("#pt_start_time_list").css({
				top: $("#pt_start_time_div").offset().top + 40,
				left: $("#pt_start_time_div").offset().left
			});
			$("#pt_end_time_list").css({
				top: $("#pt_end_time_div").offset().top + 40,
				left: $("#pt_end_time_div").offset().left
			});
		});
		
		window.onclick = function(event) {
			var temp_category = true;
			if(event.target != $("#pt_category_div").children('p')[0]){
				for(var i = 0; i < $("#pt_category_list_box").children().length; i++) {
					if(event.target == $("#pt_category_list_box").children()[i]) {
						temp_category = false;
					}
				}
				if(temp_category) {
					$("#pt_category_list").css("height", "0px");
					$("#pt_category_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
				}
			}
			var temp_day = true;
			if(event.target != $("#pt_day_div").children('p')[0]){
				for(var i = 0; i < $("#pt_day_list_box").children().length; i++) {
					if(event.target == $("#pt_day_list_box").children()[i]) {
						temp_day = false;
					}
				}
				if(temp_day) {
					$("#pt_day_list").css("height", "0px");
					$("#pt_day_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
				}
			}
			var temp_start_time = true;
			if(event.target != $("#pt_start_time_div").children('p')[0]){
				for(var i = 0; i < $("#pt_start_time_list_box").children().length; i++) {
					if(event.target == $("#pt_start_time_list_box").children()[i]) {
						temp_start_time = false;
					}
				}
				if(temp_start_time) {
					$("#pt_start_time_list").css("height", "0px");
					$("#pt_start_time_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
				}
			}
			var temp_end_time = true;
			if(event.target != $("#pt_end_time_div").children('p')[0]){
				for(var i = 0; i < $("#pt_end_time_list_box").children().length; i++) {
					if(event.target == $("#pt_end_time_list_box").children()[i]) {
						temp_end_time = false;
					}
				}
				if(temp_end_time) {
					$("#pt_end_time_list").css("height", "0px");
					$("#pt_end_time_div").css("border", '1px solid rgba(75, 77, 178, 0.3)');
				}
			}
		};
		
		// 리스트 박스 초기 설정
		$(function() {
			for(var i = 0; i <= 24; i++) {
				$("#pt_start_time_list_box").append("<li>"+i+":00</li>");
				$("#pt_end_time_list_box").append("<li>"+i+":00</li>");
			}
			$("#pt_category_list").css({
				top: $("#pt_category_div").offset().top + 40,
				left: $("#pt_category_div").offset().left
			});
			$("#pt_day_list").css({
				top: $("#pt_day_div").offset().top + 40,
				left: $("#pt_day_div").offset().left
			});
			$("#pt_start_time_list").css({
				top: $("#pt_start_time_div").offset().top + 40,
				left: $("#pt_start_time_div").offset().left
			});
			$("#pt_end_time_list").css({
				top: $("#pt_end_time_div").offset().top + 40,
				left: $("#pt_end_time_div").offset().left
			});
			// 리스트 li 호버 추가
			$("#pt_category_list_box li, #pt_day_list_box li, #pt_start_time_list_box li, #pt_end_time_list_box li").hover(function() {
	 			$(this).css({
					backgroundColor: '#4B4DB2',
					color: 'white'
				});
			}, function() {
	 			$(this).css({
					/* backgroundColor: '#c8c9e8', */
					backgroundColor: 'white',
					color: 'black'
				});
			});
			
			// 리스트 li 클릭시 값 변경
			$("#pt_category_list_box li, #pt_day_list_box li, #pt_start_time_list_box li, #pt_end_time_list_box li").click(function() {
				console.log($(this).parents().eq(1).prev().children('p'));
				$(this).parents().eq(1).prev().children('p').text($(this).text());
				$(this).parents().eq(1).prev().children('p').css("color","black");
			});
			$("#pt_category_list_box li").click(function() {
				if($(this).text() == "웨이트") {
					$("#pt_category").val(1);
				} else if($(this).text() == "다이어트") {
					$("#pt_category").val(2);
				} else if($(this).text() == "재활") {
					$("#pt_category").val(3);
				}
				 
			});
		});
		
		$("#pt_time_add_btn").click(function() {
 			var dayInfo = ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'];
 			var dayInfoTemp = [];
			var day = $(".pt_time_div p").eq(0).text();
			var startTime = $(".pt_time_div p").eq(1).text();
			var endTime = $(".pt_time_div p").eq(2).text();
			if(day != '요일 선택' && startTime != '시작 시간 선택' && endTime!= '종료 시간 선택') {
				for(var i = 0; i < $(".time_info_div").length; i++) {
					dayInfoTemp.push($(".time_info_div").eq(i).children().eq(0).text());
					if(day == $(".time_info_div").eq(i).children().eq(0).text()) { //해당하는 요일이 있다면
						$(".time_info_div").eq(i).children().eq(1).text(startTime);
						$(".time_info_div").eq(i).children().eq(2).text(endTime);
						// 해당요일에 시간 업데이트
						return;
					}
				}
				//만약 해당요일이 없다면 요일 추가
				var temp = 0;
				var dayTemp = -1;
 				for(var i = 0; i < dayInfo.length; i++) {
					if(day == dayInfo[i]) {
						temp = i;
					}
				}
 				for(var i = 0; i < dayInfoTemp.length; i++) {
					for(var j = 0; j < dayInfo.length; j++) {
						if(dayInfoTemp[i] == dayInfo[j]) {
							if(j < temp) {
								dayTemp = i;
							}
						}
					}
				}
 				if(dayTemp != -1) {
	 				$(".time_info_div").eq(dayTemp).after('<div class="time_info_div"></div>');
	 				for(var i = 0; i < 3; i++) {
						$(".time_info_div").eq(dayTemp+1).append('<p class="time_info_p"></p>');
					}
	 				$(".time_info_div").eq(dayTemp+1).children().eq(0).text(day);
					$(".time_info_div").eq(dayTemp+1).children().eq(1).text(startTime);
					$(".time_info_div").eq(dayTemp+1).children().eq(2).text(endTime);
 				} else {
 					$("#pt_time_notice").after('<div class="time_info_div"></div>');
	 				for(var i = 0; i < 3; i++) {
						$(".time_info_div").eq(0).append('<p class="time_info_p"></p>');
					}
	 				$(".time_info_div").eq(0).children().eq(0).text(day);
					$(".time_info_div").eq(0).children().eq(1).text(startTime);
					$(".time_info_div").eq(0).children().eq(2).text(endTime);
 				}
				
			}
		});
		
		$("#pt_submit_button").click(ptSubmit);

		function ptSubmit() {
			console.log("제출");
			$("#pt_time_info").val("test");
			console.log($("#pt_time_info").val());
			console.log($('.time_info_div'));
			var time_info_str = "";
			for(var i = 0; i < $('.time_info_div').length; i++) {
				time_info_str += $(".time_info_div").eq(i).children().eq(0).text();
				time_info_str += ",";
				time_info_str += $(".time_info_div").eq(i).children().eq(1).text();
				time_info_str += ",";
				time_info_str += $(".time_info_div").eq(i).children().eq(2).text();
				if(i != $('.time_info_div').length - 1) {
					time_info_str += "|";
				}
			}
			console.log($("#pt_time_info").val(time_info_str));
			console.log($("#pt_time_info").val());
			
			
			
			
			var frm = document.pt_time_form;
			frm.action = "ptinsert.do";
			frm.method = "post";
			frm.submit();
		}
	</script>
</body>
</html>





















