<%@ include file="/WEB-INF/view/csslink.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/cssfolder/css/ptpage.css">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>템플릿 테스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>

</head>
<body>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="pt_read_student_section">
		<div id="pt_read_student_div">
			<div id="pt_read_student_title">
				<p>회원 상세 조회</p>
				<button id="pt_read_student_add_blacklist" type="button">블랙 리스트 추가</button>
			</div>
			<div id="pt_read_student_container">
				<p class="pt_read_student_content_left">성명</p>
				<p class="pt_read_student_content_right">${mVo.memberName }</p>
				<p class="pt_read_student_content_left">아이디</p>
				<p class="pt_read_student_content_right">${mVo.memberId }</p>
				<p class="pt_read_student_content_left">닉네임</p>
				<p class="pt_read_student_content_right">${mVo.memberNickname }</p>
				<p class="pt_read_student_content_left">이메일</p>
				<p class="pt_read_student_content_right">${mVo.memberEmail }</p>
				<p class="pt_read_student_content_left">전화번호</p>
				<p class="pt_read_student_content_right">${mVo.memberPhone }</p>
				<p class="pt_read_student_content_left">성별</p>
				<p class="pt_read_student_content_right">${mVo.memberGender }</p>
				<p class="pt_read_student_content_left">가입일</p>
				<p class="pt_read_student_content_right">${mVo.memberJoinDate }</p>
				<p class="pt_read_student_content_left">나이</p>
				<p class="pt_read_student_content_right">${mVo.memberAge } 살</p>
				<p class="pt_read_student_content_left">신장(cm)</p>
				<p class="pt_read_student_content_right">${mVo.memberHeight } cm</p>
				<p class="pt_read_student_content_left">몸무게(kg)</p>
				<p class="pt_read_student_content_right">${mVo.memberWeight } kg</p>
				<p class="pt_read_student_content_left">운동목표</p>
				<p class="pt_read_student_content_right">${mVo.memberPurpose }</p>
				<p class="pt_read_student_content_left">관심사</p>
				<p class="pt_read_student_content_right">${mVo.memberConcern }</p>
			</div>
			<button type="button" id="pt_read_student_okay_btn">확인</button>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	<script type="text/javascript">
	var memberNo = ${mVo.memberNo};
		$('#pt_read_student_okay_btn').click(function() {
			window.history.back();
		});
		
		$("#pt_read_student_add_blacklist").click(function() {
			$.ajax({
				url : 'blacklistinsert.ax',
				type : 'post',
				data : {
					memberNo : memberNo
				},
				success : function(result) {
					console.log(result);
					if(result == '1') {
						alert('블랙리스트 등록에 성공했습니다.');
					} else if(result == '0') {
						alert('블랙리스트 등록에 실패했습니다.');
					} else if(result == '-1') {
						alert('이미 블랙리스트에 등록 되어있습니다.');
					}
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
