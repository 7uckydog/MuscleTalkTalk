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
				<c:if test="${not empty ssMvo && myPtPageChk == 'N'}">
					<button type="button" id="pt_read_page_reseration_btn">예약하기</button>
				</c:if>
				<c:if test="${not empty ssMvo && myPtPageChk == 'Y'}">
					<button type="button" class="pt_read_page_update_btns" id="pt_read_page_delete">삭제</button>
					<button type="button" class="pt_read_page_update_btns" id="pt_read_page_update">수정</button>
				</c:if>
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
			<div id="pt_read_review_wrap">
				<p id="pt_read_review_title">리뷰</p>
				<c:forEach var="vo" items="${reviewVoList }">
					<div class="pt_read_review_div">
						<div class="pt_read_review_top">
						<c:if test="${vo.memberPhoto == null }">
							<div class="pt_read_review_default_pf"></div>
						</c:if>
						<c:if test="${vo.memberPhoto != null }">
							<img class="pt_read_review_pf" src="${vo.memberPhoto}">
						</c:if>
							<div class="pt_read_review_member_info">
								<div class="pt_read_review_member_name font_THEmpgtM font_12px">${vo.memberNickname }</div>
								<div class="pt_read_review_regist_time font_THEmpgtM font_12px">2022-05-20 20:30:20</div>
							</div>
							<c:if test="${ssMvo.memberNo == vo.memberNo}">
								<div class="pr_read_review_btns">
									<button type="button" class="font_THEmpgtM font_12px">수정</button>
									<button type="button" class="font_THEmpgtM font_12px">삭제</button>
								</div>
							</c:if>
						</div>
						<div class="pt_read_review_content font_THEmpgtM font_12px">12311231232312312</div>
						<input type="hidden" class="pt_read_review_member_no" value="${vo.memberNo }">
					</div>
				</c:forEach>
				<c:if test="${reviewOpen == 'true' }">
					<div id="pt_read_review_write_div">
						<div id="pt_read_review_write_title" class="font_THEmpgtM font_12px">리뷰 작성하기</div>
						<button type="button" id="pt_read_review_write_btn" class="font_THEmpgtM font_12px">등록하기</button>
						<br>
						<textarea class="pt_write_textarea" name="pt_review" id="pt_review" cols="30" rows="10"></textarea>
					</div>
				</c:if>
			</div>
		</div>
		<form name="update">
			<input type="hidden" name="ptNo" id="pt_read_page_ptNo">
		</form>
	</section>
<%@ include file="/WEB-INF/view/footer.jsp" %>
<script type="text/javascript">
	var blacklistMember = ${blacklistMember };
	<c:if test="${empty ssMvo}">
	var memberNo = 0;
	</c:if>
	<c:if test="${not empty ssMvo}">
	var memberNo = ${ssMvo.memberNo};
	</c:if>

	$("#pt_read_page_reseration_btn").click(function() {
		if(blacklistMember.includes(memberNo)) {
			alert("블랙리스트에 등록되어 예약이 불가능 합니다.");
			return;
		}
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
		$('#pt_read_page_ptNo').val(${pVo.ptNo});
		update.action = "ptreservation";
		update.method = "post";
		update.submit();
	});
	
	$("#pt_read_page_update").click(function() {
		$('#pt_read_page_ptNo').val(${pVo.ptNo});
		update.action = "ptupdate";
		update.method = "post";
		update.submit();
	});
	
	$("#pt_read_page_delete").click(function() {
		$('#pt_read_page_ptNo').val(${pVo.ptNo});
		update.action = "ptdelete";
		update.method = "post";
		update.submit();
	});
	
	$("#pt_read_review_write_btn").click(function() {
		console.log("ptinsert.ax ajax로 호출");
		 $.ajax({
			url : 'ptinsert.ax',
			type : 'post',
			data : {
				ptNo : ${pVo.ptNo},
				memberNo : ${ssMvo.memberNo},
				reviewContent : $("#pt_review").val()
			},
			success : function(result) {
				console.log(result);
			},
			error : function(request, status, error) {
				console.log(request);
				console.log(status);
				console.log(error);
			}
		});  
	});
	

</script>
</body>
</html>