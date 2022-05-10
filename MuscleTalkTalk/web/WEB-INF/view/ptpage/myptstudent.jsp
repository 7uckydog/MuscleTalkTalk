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
<script src="https://kit.fontawesome.com/d61a9a42f0.js" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
</head>
<body>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="pt_my_student_section">
		<div id="pt_my_student_div">
			<div id="pt_my_student_title">
				<p>내 PT 프로그램 회원 조회</p>
				<button id="pt_black_list_btn" type="button">블랙리스트 조회</button>
				<button id="pt_my_page_btn" type="button">내 프로그램 조회</button>
			</div>
			<div id="pt_my_student_container">
				<div class="pt_my_student_row" id="pt_my_student_first_row">
					<div class="pt_my_pt_no">pt번호</div>
					<div class="pt_my_student_program_title">프로그램명</div>
					<div class="pt_my_student_reservation_date">예약일</div>
					<div class="pt_my_student_name">회원</div>
				</div>
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
		<form name="ptMyStudentFrm">
			<input type="hidden" id="pt_my_student_member_id" name="memberId">
		</form>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	<script type="text/javascript">
	$('.pt_list_page_prev_btn').click(function() {
		console.log(${startPage});
		console.log(${startPage - 1});
		location.href="myptstudent?page=${startPage-1 }";
	});
	for(var i = 0; i < $('.pt_list_page_btn').length; i++) {	
		$('.pt_list_page_btn').eq(i).click(function() {
			location.href="myptstudent?page="+$(this).text();
		});
		if($('.pt_list_page_btn').eq(i).text() == Number(${pageInt})) {
			$('.pt_list_page_btn').eq(i).css({
				color: 'white',
				backgroundColor : '#4B4DB2'
			})
		}
	}
	$('.pt_list_page_next_btn').click(function() {
		location.href="myptstudent?page=${endPage+1 }";
	});
	
		var ptCalVoList = [];
		<c:forEach var="vo" items="${ptCalVoList }">
			var ptCalVo = {
				ptName : '${vo.ptName}',
				ptCalendarStartTime : '${vo.ptCalendarStartTime}',
				memberName : '${vo.memberName}',
				ptNo : ${vo.ptNo},
				memberNo : ${vo.memberNo},
				memberId : '${vo.memberId}'
			};
			ptCalVoList.push(ptCalVo);
		</c:forEach>
		inputDivFormDb();
		
		function getFormatDate(date) {
			var year = date.getFullYear(); //yyyy
			var month = (1 + date.getMonth()); //M
			month = month >= 10 ? month : '0' + month; //month 두자리로 저장
			var day = date.getDate(); //d
			day = day >= 10 ? day : '0' + day; //day 두자리로 저장
			var hours = date.getHours(); // hh
			hours = hours >= 10 ? hours : '0' + hours; //day 두자리로 저장
			return year + '-' + month + '-' + day + ' ' + hours + ':00'; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
		
		function inputDivFormDb() {
			$('.pt_my_student_name').off('click');
			$('.pt_my_student_name').off('mouseenter');
			$('.pt_my_student_name').off('mouseleave');
			for(var i = 0; i < ptCalVoList.length; i++) {				
				$('#pt_my_student_container').append('<div class="pt_my_student_row"></div>');
				$('.pt_my_student_row').eq(i+1).append('<div class="pt_my_pt_no"><a href="ptread?ptNo='+ptCalVoList[i].ptNo+'">'+ptCalVoList[i].ptNo+'</a></div>');
				$('.pt_my_student_row').eq(i+1).append('<div class="pt_my_student_program_title"><a href="ptread?ptNo='+ptCalVoList[i].ptNo+'">'+ptCalVoList[i].ptName+'</a></div>');
				$('.pt_my_student_row').eq(i+1).append('<div class="pt_my_student_reservation_date">'+getFormatDate(new Date(ptCalVoList[i].ptCalendarStartTime))+'</div>');
				$('.pt_my_student_row').eq(i+1).append('<div class="pt_my_student_name"><p class="pt_my_student_name_p">'+ptCalVoList[i].memberName+'</p></div>');
				$('.pt_my_student_name').eq(i+1).children('p').css("cursor", "pointer");
				$('.pt_my_student_name').eq(i+1).children('p').on({
					click : studentClick,
					mouseenter : function() {
						$(this).css("color","#4B4DB2");
					},
					mouseleave : function() {
						$(this).css("color","black");
					}
				});
			}
		}
		
		function studentClick() {
			$("#pt_my_student_member_id").val(ptCalVoList[$('.pt_my_student_name p').index(this)].memberId);
			ptMyStudentFrm.action = "ptreadstudent";
			ptMyStudentFrm.method = "post";
			ptMyStudentFrm.submit();
		};
		
		$("#pt_my_page_btn").click(function() {
			location.href = "myptprogram";
		});
		
		$('#pt_black_list_btn').click(function() {
			location.href = "blacklist";
		});
		
		$("a").hover(
		function() {
			$(this).css("color","#4B4DB2");
		}, 
		function() {
			$(this).css("color","black");
		});
		
		
	</script>
</body>
</html>