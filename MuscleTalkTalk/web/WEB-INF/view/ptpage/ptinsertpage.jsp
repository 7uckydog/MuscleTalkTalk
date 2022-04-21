<link rel="stylesheet" href="<%=request.getContextPath() %>/css/reset.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/ptpage.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<section>
        <div id="pt_write_title"><p>프로그램 등록</p></div>
        <div id="pt_write_content">
            <form action="ptinsert.do" method="post" enctype="multipart/form-data">
                <div class="row">
                    <div class="col_25">
                        <label for="pt_name">프로그램 명</label>
                    </div>
                    <div class="col_75">
                        <input type="text" id="pt_name" name="pt_name" placeholder="프로그램명을 입력하세요" autocomplete="off">
                        <p id="pt_name_textCount">00/30자</p>
                    </div>
                </div>
                <div class="row">
                	<input type="file" class="input_ptimg_file" id="input_ptimg_file1" name="input_ptimg_file1"">
                	<input type="file" class="input_ptimg_file" id="input_ptimg_file2" name="input_ptimg_file2"">
                	<input type="file" class="input_ptimg_file" id="input_ptimg_file3" name="input_ptimg_file3"">
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
                        <select id="pt_category" class="pt_write_listbox" name="pt_category">
                            <option value="1">웨이트</option>
                            <option value="2">다이어트</option>
                            <option value="3">재활</option>
                        </select>
                    </div>
                </div>
                <div class="row">
                    <div class="col_25">
                        <label for="">프로그램 간단 설명</label>
                    </div>
                    <div class="col_75">
                        <textarea class="pt_write_textarea" name="pt_introduce" id="pt_introduce" cols="30" rows="10"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col_25">
                        <label for="">프로그램 상세 설명</label>
                    </div>
                    <div class="col_75">
                        <textarea class="pt_write_textarea" name="pt_information" id="pt_information" cols="30" rows="10" placeholder="프로그램 상세 설명"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col_25">
                        <label for="">수업 추천 회원</label>
                    </div>
                    <div class="col_75">
                        <textarea class="pt_write_textarea" name="pt_target_student" id="pt_target_student" cols="30" rows="10" placeholder="수업 추천 회원"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col_25">
                        <label for="">트레이너 소개</label>
                    </div>
                    <div class="col_75">
                        <textarea class="pt_write_textarea" name="pt_trainer_info" id="pt_trainer_info" cols="30" rows="10" placeholder="트레이너 소개"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col_25">
                        <label for="">유의사항</label>
                    </div>
                    <div class="col_75">
                        <textarea class="pt_write_textarea" name="pt_notice" id="pt_notice" cols="30" rows="10" placeholder="유의사항"></textarea>
                    </div>
                </div>
                <div class="row">
                    <div class="col_25">
                        <label for="">수업 진행 일시</label>
                    </div>
                    <div class="col_75">
                        <select id="pt_day" name="pt_day" class="pt_write_listbox pt_time_listbox">
                            <option value="" selected>요일 선택</option>
                            <option value="">월요일</option>
                            <option value="">화요일</option>
                            <option value="">수요일</option>
                            <option value="">목요일</option>
                            <option value="">금요일</option>
                            <option value="">토요일</option>
                            <option value="">일요일</option>
                        </select>
                        <select id="pt_start_time" name="pt_start_time" class="pt_write_listbox pt_time_listbox">
                            <option value="" selected>시작 시간 선택</option>
							<c:forEach var="i" begin="0" end="24" step="1">
								<option value="">시작 시간 ${i }:00</option>
							</c:forEach>
                        </select>
                        <select id="pt_end_time" name="pt_end_time" class="pt_write_listbox pt_time_listbox">
                            <option value="" selected>종료 시간 선택</option>
							<c:forEach var="i" begin="0" end="24" step="1">
								<option value="">종료 시간 ${i }:00</option>
							</c:forEach>
                        </select>
                        <p id="pt_time_notice">*모든 PT 프로그램은 1시간 단위로 진행됩니다.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col_25">
                        <label for="">프로그램 1회 가격</label>
                    </div>
                    <div class="col_75">
                        <input type="text" id="pt_price" name="pt_price" placeholder="가격 입력 (원)" autocomplete="off">
                    </div>
                </div>
                <div class="row">
                	<button type="submit" id="pt_submit_button">등록</button>
                </div>
            </form>
        </div>
    </section>
<script type="text/javascript">
	$(".input_imgbox_content").on({
		dragover: dragOver,
		dragleave: dragOver,
		drop: uploadFiles
	});
	
	function dragOver(event) {
		event.stopPropagation();
		event.preventDefault();
		if(event.type == "dragover") {
			$(event.target).css({
				"background-color": "rgba(75, 77, 178, 0.5)"
			});
		} else {
			$(event.target).css({
				"background-color": "white"
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
		if(files.length >1) {
			alert("파일을 하나만 올려주세요");
			return;
		}
		if(files[0].type.match(/image.*/)) {
			$(e.target).css({
				"background-image": "url(" + window.URL.createObjectURL(files[0]) + ")",
				"outline": "none",
				"background-size": "contain",
				"background-repeat": "no-repeat"
			});
		} else {
			alert("이미지 파일을 올려주세요");
			return;
		}
	}
	
	$("#pt_name").keydown(function(e) {
		console.log("test");
		let content = $(this).val();
		if (content.length == 0 || content == ''){
			$("#pt_name_textCount").text('00/30자');
		} else if (content.length < 10){
			$("#pt_name_textCount").text('0' + content.length + '/30자');
		} else {
			$("#pt_name_textCount").text(content.length + '/30자');
		}
	})
	
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
	var pt_introduce_first = 0;
	$(function() {
		$("#pt_introduce").text("프로그램 시작 전, 회원이 숙지해야 할 사항을 적어주세요.\n준비물, 추가 비용 등 프로그램에 필요한 안내 및 공지 내용을 반드시 작성해 주세요.");
		pt_introduce_first = 0;
	});
	
	$("#pt_introduce").on({
		focus: ptInformationPlaceholder,
		blur: ptInformationPlaceholder
	})
	
	function ptInformationPlaceholder(e) {
		console.log("test: " + pt_introduce_first);
		console.log("test4:" + e.type);
		if(pt_introduce_first == 0 && e.type == "focus") {
			console.log("test2: " + pt_introduce_first);
			$("#pt_introduce").val("");
			$("#pt_introduce").css("color","black");
			pt_introduce_first = 1;
		} else if($("#pt_introduce").val() == "") {
			console.log("teset3");
			$("#pt_introduce").css("color", "#757575");
			$("#pt_introduce").val("프로그램 시작 전, 회원이 숙지해야 할 사항을 적어주세요.\n준비물, 추가 비용 등 프로그램에 필요한 안내 및 공지 내용을 반드시 작성해 주세요.");
			pt_introduce_first = 0;
		}
	}
	
	$("#pt_submit_button").click(ptSubmit);
	
	function ptSubmit() {
		console.log
	}
	
</script>
</body>
</html>






















