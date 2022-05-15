<%@ include file="/WEB-INF/view/csslink.jsp"%>
<link rel="stylesheet" href="<%=request.getContextPath()%>/cssfolder/css/ptpage.css">
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
<script src="https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.11.0,npm/fullcalendar@5.11.0/locales-all.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css' rel='stylesheet' />
</head>
<body>
	<div id="pt_insert_regist_modal_div">
		<div id="modal_spin_div">
			<i class="fa-solid fa-spinner fa-spin-pulse" id="modal_spin"></i>
		</div>
	</div>
	<div id="pt_insert_calendar_modal_div">
		<div id="pt_insert_calendar_input_div">
			<div id="calendar"></div>
			<div id="fullcalendar_div1"></div>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/template.jsp"%>
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
					<div class="col_75 position_relative">
						<input class="pt_write_input_text" type="text" id="pt_name" name="pt_name" autocomplete="off">
						<p id="pt_name_textCount" class="pt_insert_textCount">00/30자</p>
					</div>
				</div>
				<div class="row">
					<input type="file" class="input_ptimg_file" id="input_ptimg_file1" name="input_ptimg_file1""> <input type="file" class="input_ptimg_file" id="input_ptimg_file2" name="input_ptimg_file2""> <input type="file" class="input_ptimg_file" id="input_ptimg_file3" name="input_ptimg_file3"">
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
					<div class="col_75 position_none">
						<div id="pt_category_div">
							<p>카테고리 선택</p>
							<i class="fa-solid fa-sort-up pt_category_arrow"></i> <i class="fa-solid fa-sort-down pt_category_arrow"></i>
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
					<div class="col_75 position_relative">
						<textarea class="pt_write_textarea" name="pt_introduce" id="pt_introduce" cols="30" rows="10"></textarea>
						<p id="pt_introduce_textCount" class="pt_insert_textCount2">000/500자</p>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">프로그램 상세 설명</label>
					</div>
					<div class="col_75 position_relative">
						<textarea class="pt_write_textarea" name="pt_information" id="pt_information" cols="30" rows="10"></textarea>
						<p id="pt_information_textCount" class="pt_insert_textCount2">000/500자</p>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">수업 추천 회원</label>
					</div>
					<div class="col_75 position_relative">
						<textarea class="pt_write_textarea" name="pt_target_student" id="pt_target_student" cols="30" rows="10"></textarea>
						<p id="pt_target_student_textCount" class="pt_insert_textCount2">000/150자</p>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">트레이너 소개</label>
					</div>
					<div class="col_75 position_relative">
						<textarea class="pt_write_textarea" name="pt_trainer_info" id="pt_trainer_info" cols="30" rows="10"></textarea>
						<p id="pt_trainer_info_textCount" class="pt_insert_textCount2">000/150자</p>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">유의사항</label>
					</div>
					<div class="col_75 position_relative">
						<textarea class="pt_write_textarea" name="pt_notice" id="pt_notice" cols="30" rows="10"></textarea>
						<p id="pt_notice_textCount" class="pt_insert_textCount2">000/150자</p>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">수업 진행 기간</label>
					</div>
					<div class="col_75" id="pt_insert_page_date_div">
						<p id="pt_start_date_label">시작 일자</p>
						<input id="pt_start_date_input" name="pt_start_date" type="hidden">
						<div id="pt_start_date"></div>
						<p id="pt_end_date_label">종료 일자</p>
						<input id="pt_end_date_input" name="pt_end_date" type="hidden">
						<div id="pt_end_date"></div>
					</div>
				</div>
				<div class="row">
					<div class="col_25">
						<label for="">수업 진행 요일</label>
					</div>
					<div class="col_75" id="pt_time_info_list">
						<div id="pt_day_div" class="pt_time_div">
							<p>요일 선택</p>
							<i class="fa-solid fa-sort-up pt_time_arrow"></i> <i class="fa-solid fa-sort-down pt_time_arrow"></i>
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
							<i class="fa-solid fa-sort-up pt_time_arrow"></i> <i class="fa-solid fa-sort-down pt_time_arrow"></i>
						</div>
						<div id="pt_start_time_list">
							<ul id="pt_start_time_list_box">
							</ul>
						</div>
						<div id="pt_end_time_div" class="pt_time_div">
							<p>종료 시간 선택</p>
							<i class="fa-solid fa-sort-up pt_time_arrow"></i> <i class="fa-solid fa-sort-down pt_time_arrow"></i>
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
						<input class="pt_write_input_text" type="text" id="pt_price" name="pt_price" autocomplete="off">
						<p id="pt_time_notice">*최소 1,000원 부터 최대 1,000,000원 까지 가능</p>
					</div>
				</div>
				<div class="row">
					<button type="button" id="pt_submit_button">등록</button>
				</div>
			</form>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp"%>





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
							"background-repeat" : "no-repeat",
							"background-position" : "center"
						});
				$(".input_ptimg_file")[$(this).index()].files = files;
			} else {
				alert("이미지 파일을 올려주세요");
				return;
			}
		}

		//인풋 글자수 체크
		$("#pt_name").on('input',function(e) {
			let content = $(this).val();
			
			if (content.length == 0 || content == '') {
				$("#pt_name_textCount").text('00/30자');
			} else if (content.length < 10) {
				$("#pt_name_textCount").text('0' + content.length + '/30자');
			} else {
				$("#pt_name_textCount").text(content.length + '/30자');
			}
			
			if(content.length > 30) {
				alert("30글자까지 가능합니다.");
				$(this).val($(this).val().substr(0, 30));
				content = $(this).val();
				if (content.length == 0 || content == '') {
					$("#pt_name_textCount").text('00/30자');
				} else if (content.length < 10) {
					$("#pt_name_textCount").text('0' + content.length + '/30자');
				} else {
					$("#pt_name_textCount").text(content.length + '/30자');
				}
			} 
			
		});
		
		$('.pt_write_textarea').on('input', textCountFunction);
		
		function textCountFunction(event) {
			let $this = $(this);
			var $nextP = $(this).next();
			var maxLengthTemp = $(this).next().text().substr(4,3);
			let content = $this.val();
			
			if (content.length == 0 || content == '') {
				$nextP.text('000/'+maxLengthTemp+'자');
			} else if (content.length < 10) {
				$nextP.text('00' + content.length + '/'+maxLengthTemp+'자');
			} else if (content.length < 100) {
				$nextP.text('0' + content.length + '/'+maxLengthTemp+'자');
			} else {
				$nextP.text(content.length + '/'+maxLengthTemp+'자');
			}
			
			if(content.length > maxLengthTemp) {
				alert(maxLengthTemp+"글자까지 가능합니다.");
				$(this).val($(this).val().substr(0, maxLengthTemp));
				content = $(this).val();
				if (content.length == 0 || content == '') {
					$nextP.text('000/'+maxLengthTemp+'자');
				} else if (content.length < 10) {
					$nextP.text('00' + content.length + '/'+maxLengthTemp+'자');
				} else if (content.length < 100) {
					$nextP.text('0' + content.length + '/'+maxLengthTemp+'자');
				} else {
					$nextP.text(content.length + '/'+maxLengthTemp+'자');
				}
			} 
		}
		
		$("#pt_price").on('blur', function() {
			$(this).val();
			var priceTest = /^[0-9]{4,7}$/;
			if(priceTest.test($(this).val())) {
				if($(this).val() > 1000000) {
					alert("PT 프로그램 가격은 최소 1,000원 부터 최대 1,000,000원 까지 가능");
				} else {
					$(this).val($(this).val().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원");
				}
			} else {
				alert("PT 프로그램 가격은 최소 1,000원 부터 최대 1,000,000원 까지 가능");
				$(this).val('');
			}
		});
		
		

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
			$("#pt_introduce")
					.text(
							"프로그램 시작 전, 회원이 숙지해야 할 사항을 적어주세요.\n준비물, 추가 비용 등 프로그램에 필요한 안내 및 공지 내용을 반드시 작성해 주세요.");
			$("#pt_information")
					.val(
							"프로그램이 진행되는 과정.\n프로그램의 최종 목표 등 프로그램을 설명해 주세요.\n추가로 타 프로그램과의 차이점 및 장점을 작성해 주세요");
			$("#pt_target_student").val("이런 회원님이 들었으면 좋겠다하는 추천 대상을 작성해 주세요");
			$("#pt_trainer_info")
					.val(
							"트레이너의 경력, 방식, 프로그램을 시작하게 된 계기 등과\n자신을 표현할 간다한 소개 글을 작서해 주세요.");
			$("#pt_notice").val(
					"프로그램을 수강하 때 주의해야하는 사항, 예약 취소 관련 안내 사항등을 작성해 주세요.");
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
					$(e.target)
							.val(
									"프로그램 시작 전, 회원이 숙지해야 할 사항을 적어주세요.\n준비물, 추가 비용 등 프로그램에 필요한 안내 및 공지 내용을 반드시 작성해 주세요.");
				} else if (e.target.id == "pt_information") {
					console.log("pt_information textarea text");
					$(e.target)
							.val(
									"프로그램이 진행되는 과정.\n프로그램의 최종 목표 등 프로그램을 설명해 주세요.\n추가로 타 프로그램과의 차이점 및 장점을 작성해 주세요");
				} else if (e.target.id == "pt_target_student") {
					console.log("pt_target_student textarea text");
					$(e.target).val("이런 회원님이 들었으면 좋겠다하는 추천 대상을 작성해 주세요");
				} else if (e.target.id == "pt_trainer_info") {
					console.log("pt_trainer_info textarea text");
					$(e.target)
							.val(
									"트레이너의 경력, 방식, 프로그램을 시작하게 된 계기 등과\n자신을 표현할 간다한 소개 글을 작서해 주세요.");
				} else if (e.target.id == "pt_notice") {
					console.log("pt_notice textarea text");
					$(e.target).val(
							"프로그램을 수강하 때 주의해야하는 사항, 예약 취소 관련 안내 사항등을 작성해 주세요.");
				} else if (e.target.id == "pt_price") {
					console.log("pt_price input text");
					$(e.target).val("가격 입력 (원)");
				}
			}
		}

		//카테고리 리스트 박스
		$("#pt_category_div")
				.click(
						function() {
							if ($("#pt_category_list").css("height") != '0px') {
								$("#pt_category_list").css("height", "0px");
								$("#pt_category_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
							} else {
								$("#pt_category_list").css("height", "90px");
								$("#pt_category_list").css("border", "1px solid rgba(75, 77, 178, 1)");
							}
							if ($("#pt_category_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
								$("#pt_category_div").css("border",
										'1px solid rgba(75, 77, 178, 1)');
							} else {
								$("#pt_category_div").css("border",
										'1px solid rgba(75, 77, 178, 0.3)');
							}
						});

		//요일 리스트 박스
		$("#pt_day_div")
				.click(
						function() {
							if ($("#pt_day_list").css("height") != '0px') {
								$("#pt_day_list").css("height", "0px");
								$("#pt_day_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
							} else {
								$("#pt_day_list").css("height", "210px");
								$("#pt_day_list").css("border", "1px solid rgba(75, 77, 178, 1)");
							}
							if ($("#pt_day_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
								$("#pt_day_div").css("border",
										'1px solid rgba(75, 77, 178, 1)');
							} else {
								$("#pt_day_div").css("border",
										'1px solid rgba(75, 77, 178, 0.3)');
							}
						});

		//시작시간 리스트 박스
		$("#pt_start_time_div")
				.click(
						function() {
							if ($("#pt_start_time_list").css("height") != '0px') {
								$("#pt_start_time_list").css("height", "0px");
								$("#pt_start_time_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
							} else {
								$("#pt_start_time_list").css("height", "210px");
								$("#pt_start_time_list").css("border", "1px solid rgba(75, 77, 178, 1)");
							}
							if ($("#pt_start_time_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
								$("#pt_start_time_div").css("border",
										'1px solid rgba(75, 77, 178, 1)');
							} else {
								$("#pt_start_time_div").css("border",
										'1px solid rgba(75, 77, 178, 0.3)');
							}
						});

		//종료시간 리스트 박스
		$("#pt_end_time_div")
				.click(
						function() {
							if ($("#pt_end_time_list").css("height") != '0px') {
								$("#pt_end_time_list").css("height", "0px");
								$("#pt_end_time_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
							} else {
								$("#pt_end_time_list").css("height", "210px");
								$("#pt_end_time_list").css("border", "1px solid rgba(75, 77, 178, 1)");
							}
							if ($("#pt_end_time_div").css("border") == '1px solid rgba(75, 77, 178, 0.3)') {
								$("#pt_end_time_div").css("border",
										'1px solid rgba(75, 77, 178, 1)');
							} else {
								$("#pt_end_time_div").css("border",
										'1px solid rgba(75, 77, 178, 0.3)');
							}
						});

		$(window).resize(function() {
			$("#pt_category_list").css({
				top : $("#pt_category_div").offset().top + 40,
				left : $("#pt_category_div").offset().left
			});
			$("#pt_day_list").css({
				top : $("#pt_day_div").offset().top + 40,
				left : $("#pt_day_div").offset().left
			});
			$("#pt_start_time_list").css({
				top : $("#pt_start_time_div").offset().top + 40,
				left : $("#pt_start_time_div").offset().left
			});
			$("#pt_end_time_list").css({
				top : $("#pt_end_time_div").offset().top + 40,
				left : $("#pt_end_time_div").offset().left
			});
		});

		window.onclick = function(event) {
			var temp_category = true;
			if (event.target != $("#pt_category_div").children('p')[0]) {
				for (var i = 0; i < $("#pt_category_list_box").children().length; i++) {
					if (event.target == $("#pt_category_list_box").children()[i]) {
						temp_category = false;
					}
				}
				if (temp_category) {
					$("#pt_category_list").css("height", "0px");
					$("#pt_category_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
					$("#pt_category_div").css("border",
							'1px solid rgba(75, 77, 178, 0.3)');
				}
			}
			var temp_day = true;
			if (event.target != $("#pt_day_div").children('p')[0]) {
				for (var i = 0; i < $("#pt_day_list_box").children().length; i++) {
					if (event.target == $("#pt_day_list_box").children()[i]) {
						temp_day = false;
					}
				}
				if (temp_day) {
					$("#pt_day_list").css("height", "0px");
					$("#pt_day_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
					$("#pt_day_div").css("border",
							'1px solid rgba(75, 77, 178, 0.3)');
				}
			}
			var temp_start_time = true;
			if (event.target != $("#pt_start_time_div").children('p')[0]) {
				for (var i = 0; i < $("#pt_start_time_list_box").children().length; i++) {
					if (event.target == $("#pt_start_time_list_box").children()[i]) {
						temp_start_time = false;
					}
				}
				if (temp_start_time) {
					$("#pt_start_time_list").css("height", "0px");
					$("#pt_start_time_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
					$("#pt_start_time_div").css("border",
							'1px solid rgba(75, 77, 178, 0.3)');
				}
			}
			var temp_end_time = true;
			if (event.target != $("#pt_end_time_div").children('p')[0]) {
				for (var i = 0; i < $("#pt_end_time_list_box").children().length; i++) {
					if (event.target == $("#pt_end_time_list_box").children()[i]) {
						temp_end_time = false;
					}
				}
				if (temp_end_time) {
					$("#pt_end_time_list").css("height", "0px");
					$("#pt_end_time_list").css("border", "1px solid rgba(75, 77, 178, 0.0)");
					$("#pt_end_time_div").css("border",
							'1px solid rgba(75, 77, 178, 0.3)');
				}
			}
		};

		// 리스트 박스 초기 설정
		$(function() {
			for (var i = 0; i <= 24; i++) {
				$("#pt_start_time_list_box").append("<li>" + i + ":00</li>");
				$("#pt_end_time_list_box").append("<li>" + i + ":00</li>");
			}
			$("#pt_category_list").css({
				top : $("#pt_category_div").offset().top + 40,
				left : $("#pt_category_div").offset().left
			});
			$("#pt_day_list").css({
				top : $("#pt_day_div").offset().top + 40,
				left : $("#pt_day_div").offset().left
			});
			$("#pt_start_time_list").css({
				top : $("#pt_start_time_div").offset().top + 40,
				left : $("#pt_start_time_div").offset().left
			});
			$("#pt_end_time_list").css({
				top : $("#pt_end_time_div").offset().top + 40,
				left : $("#pt_end_time_div").offset().left
			});
			// 리스트 li 호버 추가
			$(
					"#pt_category_list_box li, #pt_day_list_box li, #pt_start_time_list_box li, #pt_end_time_list_box li")
					.hover(function() {
						$(this).css({
							backgroundColor : '#4B4DB2',
							color : 'white'
						});
					}, function() {
						$(this).css({
							/* backgroundColor: '#c8c9e8', */
							backgroundColor : 'white',
							color : 'black'
						});
					});

			// 리스트 li 클릭시 값 변경
			$(
					"#pt_category_list_box li, #pt_day_list_box li, #pt_start_time_list_box li, #pt_end_time_list_box li")
					.click(
							function() {
								$(this).parents().eq(1).prev().children('p').text($(this).text());
								$(this).parents().eq(1).prev().children('p').css("color", "black");
								$(this).parents().eq(1).css({
									height : '0px',
									border : '1px solid rgba(75, 77, 178, 0.0)'
								});
								$(this).parents().eq(1).prev().css('border','1px solid rgba(75, 77, 178, 0.3)');
							});
			$("#pt_category_list_box li").click(function() {
				if ($(this).text() == "웨이트") {
					$("#pt_category").val(1);
				} else if ($(this).text() == "다이어트") {
					$("#pt_category").val(2);
				} else if ($(this).text() == "재활") {
					$("#pt_category").val(3);
				}

			});
		});

		$("#pt_time_add_btn")
				.click(
						function() {
							var dayInfo = [ '월요일', '화요일', '수요일', '목요일', '금요일',
									'토요일', '일요일' ];
							var dayInfoTemp = [];
							var day = $(".pt_time_div p").eq(0).text();
							var startTime = $(".pt_time_div p").eq(1).text();
							var endTime = $(".pt_time_div p").eq(2).text();
							if(Number(startTime.split(":")[0]) >= Number(endTime.split(":")[0])) {
								alert('종료 시간은 시작 시간 이후 여야 합니다.');
								return;
							}
							if(day == '요일 선택') {
								alert('요일을 선택해주세요.');
								return;
							}
							if(startTime == '시작 시간 선택') {
								alert('시작 시간을 선택해주세요.');
								return;
							}
							if(endTime == '종료 시간 선택') {
								alert('종료 시간을 선택해주세요.');
								return;
							}
							if (day != '요일 선택' && startTime != '시작 시간 선택'
									&& endTime != '종료 시간 선택') {
								for (var i = 0; i < $(".time_info_div").length; i++) {
									dayInfoTemp.push($(".time_info_div").eq(i)
											.children().eq(0).text());
									if (day == $(".time_info_div").eq(i)
											.children().eq(0).text()) { //해당하는 요일이 있다면
										$(".time_info_div").eq(i).children()
												.eq(1).text(startTime);
										$(".time_info_div").eq(i).children()
												.eq(2).text(endTime);
										// 해당요일에 시간 업데이트
										return;
									}
								}
								//만약 해당요일이 없다면 요일 추가
								var temp = 0;
								var dayTemp = -1;
								for (var i = 0; i < dayInfo.length; i++) {
									if (day == dayInfo[i]) {
										temp = i;
									}
								}
								for (var i = 0; i < dayInfoTemp.length; i++) {
									for (var j = 0; j < dayInfo.length; j++) {
										if (dayInfoTemp[i] == dayInfo[j]) {
											if (j < temp) {
												dayTemp = i;
											}
										}
									}
								}
								if (dayTemp != -1) {
									$(".time_info_div")
											.eq(dayTemp)
											.after(
													'<div class="time_info_div"></div>');
									for (var i = 0; i < 3; i++) {
										$(".time_info_div")
												.eq(dayTemp + 1)
												.append(
														'<p class="time_info_p"></p>');
									}
									$(".time_info_div")
											.eq(dayTemp + 1)
											.append(
													"<button type='button' class='pt_time_delete_btn'>제거</button>");
									$(".time_info_div").eq(dayTemp + 1)
											.children().eq(0).text(day);
									$(".time_info_div").eq(dayTemp + 1)
											.children().eq(1).text(startTime);
									$(".time_info_div").eq(dayTemp + 1)
											.children().eq(2).text(endTime);
								} else {
									$("#pt_time_notice")
											.after(
													'<div class="time_info_div"></div>');
									for (var i = 0; i < 3; i++) {
										$(".time_info_div").eq(0).append(
												'<p class="time_info_p"></p>');
									}
									$(".time_info_div")
											.eq(0)
											.append(
													"<button type='button' class='pt_time_delete_btn'>제거</button>");
									$(".time_info_div").eq(0).children().eq(0)
											.text(day);
									$(".time_info_div").eq(0).children().eq(1)
											.text(startTime);
									$(".time_info_div").eq(0).children().eq(2)
											.text(endTime);
								}

								$(".pt_time_delete_btn").off('click');

								$(".pt_time_delete_btn").on('click',function() {
											console.log("cancle btn click");
											console.log($(this));
											console.log($(".pt_time_delete_btn"));
											console.log($(".pt_time_delete_btn").index(this));
											console.log($(".time_info_div").eq($(".pt_time_delete_btn").index(this)).children());
											$(".time_info_div").eq($(".pt_time_delete_btn").index(this)).remove();
										});

							}
						});

		$("#pt_submit_button").click(ptSubmit);

		function ptSubmit() {
			if(Number($("#pt_name_textCount").text().substr(0,2)) == 0) {
				alert('PT 프로그램 명을 입력해주세요.');
				return;
			}
			for(var i = 0 ; i < 3; i++) {				
				if($('.input_ptimg_file').eq(i)[0].files.length == 0) {
					alert(i+1+'번째 커버 이미지를 등록해주세요.');
					return;
				}
			}
			if($("#pt_category_div p").text() == '카테고리 선택') {
				alert('카테고리를 선택해주세요.');
				return;
			}
			if(Number($('#pt_introduce_textCount').text().substr(0,3)) == 0) {
				alert('프로그램 간단 설명을 입력해주세요.');
				return;
			}
			if(Number($('#pt_information_textCount').text().substr(0,3)) == 0) {
				alert('프로그램 상세 설명을 입력해주세요.');
				return;
			}
			if(Number($('#pt_target_student_textCount').text().substr(0,3)) == 0) {
				alert('수업 추천 회원을 입력해주세요.');
				return;
			}
			if(Number($('#pt_trainer_info_textCount').text().substr(0,3)) == 0) {
				alert('트레이너 소개를 입력해주세요.');
				return;
			}
			if(Number($('#pt_notice_textCount').text().substr(0,3)) == 0) {
				alert('유의사항을 입력해주세요.');
				return;
			}
			if($('.time_info_div').length == 0 ) {
				alert('수업 요일, 시작 시간, 종료 시간을 입력해주세요.');
				return;
			}
			$("#pt_time_info").val("test");
			console.log($("#pt_time_info").val());
			console.log($('.time_info_div'));
			var time_info_str = "";
			for (var i = 0; i < $('.time_info_div').length; i++) {
				time_info_str += $(".time_info_div").eq(i).children().eq(0)
						.text();
				time_info_str += ",";
				time_info_str += $(".time_info_div").eq(i).children().eq(1)
						.text();
				time_info_str += ",";
				time_info_str += $(".time_info_div").eq(i).children().eq(2)
						.text();
				if (i != $('.time_info_div').length - 1) {
					time_info_str += ",";
				}
			}
			$("#pt_time_info").val(time_info_str);
			$("#pt_price").val($("#pt_price").val().replace(/[^\d]+/g, "").replace("원", ""));
			
			var frm = document.pt_time_form;
			frm.action = "ptinsert.do";
			frm.method = "post";
			frm.submit();
			$('#pt_insert_regist_modal_div').css("display", 'block');
		}


		
		

		
		
		
		
		var dateTypeOption = 0;
		// 일자 선택시 모달창 출력
		$("#pt_start_date").click(function() {
			$("#pt_insert_calendar_modal_div").css("display", "block");
			dateTypeOption = 1;
			openFC();
		});
		
		$("#pt_end_date").click(function() {
			$("#pt_insert_calendar_modal_div").css("display", "block");
			dateTypeOption = 2;
			openFC();
		});

		// 캘린더
		// 캘린더
		// 캘린더
		// 캘린더
		// 캘린더
		// 캘린더
		// 캘린더
		// 캘린더
		// 캘린더



		function getFormatDate(date) {
			var year = date.getFullYear(); //yyyy
			var month = (1 + date.getMonth()); //M
			month = month >= 10 ? month : '0' + month; //month 두자리로 저장
			var day = date.getDate(); //d
			day = day >= 10 ? day : '0' + day; //day 두자리로 저장
			return year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}

		var firstInsert = true;
		var calendar;
		function dateStrFormatYMD(date) {
			var dateStrFormatYMD = date.getFullYear()+'년 '+(date.getMonth()+1)+'월 '+date.getDate()+'일';
			return dateStrFormatYMD;
		}
		$(function() {

			var nextDay = new Date();
			nextDay.setDate(nextDay.getDate() + 1);
			$("#pt_start_date").text(getFormatDate(nextDay));
			$("#pt_start_date_input").val(getFormatDate(nextDay));
			nextDay.setDate(nextDay.getDate() + 1);
			$("#pt_end_date").text(getFormatDate(nextDay));
			$("#pt_end_date_input").val(getFormatDate(nextDay));

		});

		function openFC() {
			var calendarEl = $('#calendar')[0];
			var initialDateStr = "";
			if(dateTypeOption == 1) {
				initialDateStr = $("#pt_start_date").text();
			} else if(dateTypeOption == 2) {
				initialDateStr = $("#pt_end_date").text();
			}
			
			console.log("test:" + initialDateStr);
			console.log("test");
			calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth',
				locale : 'ko',
				selectable : false,
				editable : false,
				eventDurationEditable : false,
				eventStartEditable : false,
				navLinks : false,
				dayMaxEventRows : true, // for all non-TimeGrid views
				height : '700px', // calendar 높이 설정
				expandRows : true, // 화면에 맞게 높이 재설정
				initialDate: initialDateStr,
				eventTimeFormat : {
					hour : '2-digit',
					hour12 : false
				},
				slotLabelFormat : {
					hour : '2-digit',
					hour12 : false
				},
				allDaySlot : false,
				headerToolbar : {
					left : 'prev,next',
					center : 'title',
					right : 'dayGridMonth'
				},
				footerToolbar : {
					center : 'customCancleBtn'
				},
				customButtons : {
					customCancleBtn : {
						text : '취소',
						click : function() {
							$("#pt_insert_calendar_modal_div").css("display","none");
							dateTypeOption = 0;
						}
					}
				},

				select : function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
					var title = prompt('Event Title:');
					if (title) {
						calendar.addEvent({
							title : title,
							start : arg.start,
							end : arg.end,
							allDay : arg.allDay
						});
					}
				},

				eventClick : function(info) {

					console.log(info.event.start);
					console.log(info.event.end);
				},

				dateClick : function(info) {
					console.log(info);
					console.log('Clicked on: ' + info.dateStr);
					console.log('Clicked on: ' + info.date);
					console.log('Coordinates: ' + info.jsEvent.pageX + ','
							+ info.jsEvent.pageY);
					console.log('Current view: ' + info.view.type);
					if(dateTypeOption == 1) {
						var dateStart1 = new Date();
						dateStart1.setDate(dateStart1.getDate() + 1);
						var dateStartStr1 = dateStrFormatYMD(dateStart1);
						var dateStart2 = new Date();
						dateStart2.setMonth(dateStart2.getMonth() + 1);
						var dateStartStr2 = dateStrFormatYMD(dateStart2);
						if(info.date <= dateStart1 || info.date >= dateStart2) {
							alert("시작 날짜는 다음날(" + dateStartStr1 + ")부터 한달후(" + dateStartStr2 + ")까지 가능합니다.");
						} else {
							$("#pt_start_date").text(getFormatDate(info.date));
							$("#pt_insert_calendar_modal_div").css("display","none");
							$("#pt_start_date_input").val(getFormatDate(info.date));
							dateTypeOption = 0;
							console.log("test");
							if($("#pt_end_date").text() <= $("#pt_start_date").text()) {
								info.date.setDate(info.date.getDate() + 1);
								$("#pt_end_date").text(getFormatDate(info.date));
							}
							console.log("test");
						}
					} else if(dateTypeOption == 2) {
						var dateSplitArray = $('#pt_start_date').text().split("-");
						var dateEnd1 = new Date();
						dateEnd1.setFullYear(dateSplitArray[0]);
						dateEnd1.setMonth(dateSplitArray[1] - 1);
						dateEnd1.setDate(dateSplitArray[2]);
						var dateEndStr1 = dateStrFormatYMD(dateEnd1);
						var dateEnd2 = new Date();
						dateEnd2.setFullYear(dateEnd1.getFullYear() + 1);
						dateEnd2.setMonth(dateEnd1.getMonth());
						dateEnd2.setDate(dateEnd1.getDate());
						var dateEndStr2 = dateStrFormatYMD(dateEnd2);
						if(info.date < dateEnd1 || info.date > dateEnd2) {
							alert("종료 날짜는 시작 날짜 다음날(" + dateEndStr1 + ")부터 일년후(" + dateEndStr2 + ")까지 가능합니다.");
						} else {
							$("#pt_end_date").text(getFormatDate(info.date));
							$("#pt_insert_calendar_modal_div").css("display","none");
							dateTypeOption = 0;
							$("#pt_end_date_input").val(getFormatDate(info.date));
						}
					}
					
				},

				eventMouseEnter : function(info) {
					console.log(info);
				}

			});

			calendar.render();
			
 			$(".fc-day-today").css("backgroundColor",'white');
 			$(".fc-day").css("backgroundColor",'white');
			$('.fc-day[data-date='+$("#pt_start_date").text()+']').css('backgroundColor', "rgba(255,220,40,.15)");
			$('.fc-day[data-date='+$("#pt_end_date").text()+']').css('backgroundColor', "rgba(255,220,40,.15)");
			calendar.addEventSource({
				events : [
					{
						title : "시작 일자",
						start : $("#pt_start_date").text()
					},
					{
						title : "종료 일자",
						start : $("#pt_end_date").text()
					}
				]	
			});
			
			calendar.addEvent([
				{
					title : "시작 일자",
					start : $("#pt_start_date").text()
				},
				{
					title : '종료 일자',
					start : $("#pt_end_date").text()
				}
			]);
			
			$(".fc-customAddBtn-button, .fc-customCancleBtn-button").css({
				color : "white",
				backgroundColor : "#4B4DB2",
				border : 'none'
			});
			
			$('.fc-next-button').on('click', function() {
				$(".fc-day-today").css("backgroundColor",'white');
				$('.fc-day[data-date='+$("#pt_start_date").text()+']').css('backgroundColor', "rgba(255,220,40,.15)");
				$('.fc-day[data-date='+$("#pt_end_date").text()+']').css('backgroundColor', "rgba(255,220,40,.15)");
				$('.fc-daygrid-day-frame').off('mouseenter');
				$('.fc-daygrid-day-frame').off('mouseleave');
				fcDayGridHover();
			});
			
			$('.fc-prev-button').on('click', function() {
				$(".fc-day-today").css("backgroundColor",'white');
				$('.fc-day[data-date='+$("#pt_start_date").text()+']').css('backgroundColor', "rgba(255,220,40,.15)");
				$('.fc-day[data-date='+$("#pt_end_date").text()+']').css('backgroundColor', "rgba(255,220,40,.15)");
				$('.fc-daygrid-day-frame').off('mouseenter');
				$('.fc-daygrid-day-frame').off('mouseleave');
				fcDayGridHover();
			});
			fcDayGridHover();
			function fcDayGridHover() {
				$('.fc-daygrid-day').on({
					mouseenter : function() {
						if($(this).attr('data-date') != $("#pt_start_date").text() && $(this).attr('data-date') != $("#pt_end_date").text()) {					
							$(this).css("backgroundColor", "rgba(75, 77, 178, 0.3)");
						} else {
							$(this).css("backgroundColor", "rgba(255,220,40,.15)");
						}
					},
					mouseleave : function() {
						if($(this).attr('data-date') != $("#pt_start_date").text() && $(this).attr('data-date') != $("#pt_end_date").text()) {					
							$(this).css("backgroundColor", "white");
						} else {
							$(this).css("backgroundColor", "rgba(255,220,40,.15)");
						}
					}
				});	
			}

		};
		
	</script>
</body>
</html>





















