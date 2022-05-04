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
	<div id="pt_reservation_time_info_modal_div">
		<div id="pt_reservation_time_info_div">
			<p id="time_info_title">프로그램 진행표</p>
			<div id="time_info_day_hour">${pVo.ptTimeInfo }<hr>${pVo.ptPrice }<p>* 모든 PT 프로그램은 1시간 단위로 진행됩니다.</p></div>
			<button type="button" id="pt_reservation_time_info_cancle">취소</button>
			<button type="button" id="pt_reservation_time_info_select">확인</button>
		</div>
	</div>
<%@ include file="/WEB-INF/view/template.jsp" %>
 	<section id="pt_read_page_section">
 		<div id="pt_read_page_div">
			<div id="pt_read_title">
				<p id="pt_read_title_p">${pVo.ptName }</p>
				<button type="button" id="pt_read_page_reseration_btn">예약하기</button>
			</div>
			<div id="pt_read_second_row">
				<p>${pVo.ptTrainerName}&bull;${pVo.ptCategoryStr }</p>
			</div>
			<div id="pt_read_img_container">
				<div id="pt_read_img1" class="pt_read_img_div">
					<img alt="" src="${pVo.ptFilePathList[0]}">
				</div>
				<div id="pt_read_img2" class="pt_read_img_div">
					<img alt="" src="${pVo.ptFilePathList[1]}">
				</div>
				<div id="pt_read_img3" class="pt_read_img_div">
					<img alt="" src="${pVo.ptFilePathList[2]}">
				</div>
			</div>
			<hr>
			<div class="pt_read_content_div">
				<p class="pt_read_content_label">프로그램 간단 설명</p>
				<p class="pt_read_content_text">${pVo.ptIntroduce }</p>
			</div>
			<div class="pt_read_content_div">
				<p class="pt_read_content_label">프로그램 상세 설명</p>
				<p class="pt_read_content_text">${pVo.ptInformation }</p>
			</div>
			<div class="pt_read_content_div">
				<p class="pt_read_content_label">수강 추천 회원</p>
				<p class="pt_read_content_text">${pVo.ptTargetStudent }</p>
			</div>
			<div class="pt_read_content_div">
				<p class="pt_read_content_label">트레이너 소개</p>
				<p class="pt_read_content_text">${pVo.ptNotice }</p>
			</div>
			<div class="pt_read_content_div">
				<p class="pt_read_content_label">유의사항</p>
				<p class="pt_read_content_text">${pVo.ptTrainerInfo }</p>
			</div>
			<div class="pt_read_content_div">
				<p class="pt_read_content_label">헬스장 정보</p>
				<p class="pt_read_content_text">${pVo.ptGymName }<br>${pVo.ptLocation }</p>
			</div>
			<hr>
		</div>
	</section>
<%@ include file="/WEB-INF/view/footer.jsp" %>
<script type="text/javascript">
	$("#pt_read_page_reseration_btn").click(function() {
		$("#pt_reservation_time_info_modal_div").css("display", "block");
	});
	$("#pt_reservation_time_info_cancle").click(function() {
		$("#pt_reservation_time_info_modal_div").css("display", "none");
	});
	$("#pt_reservation_time_info_modal_div").click(function(event) {
		if(event.target == $("#pt_reservation_time_info_modal_div")[0]) {
			$("#pt_reservation_time_info_modal_div").css("display", "none");
		}
	});
	$("#pt_reservation_time_info_select").click(function() {
		location.href = "ptreservation?ptNo="+"${pVo.ptNo }";
	});
</script>
</body>
</html>