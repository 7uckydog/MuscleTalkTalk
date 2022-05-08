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
	<section id="pt_my_page_section">
		<div id="pt_my_page_div">
			<div id="pt_my_page_title">
				<p>내 PT 프로그램 관리</p>
				<button id="pt_my_student_btn" type="button">내 프로그램 회원 조회</button>
				<button id="pt_my_page_insert_btn" type="button">새로운 프로그램 등록</button>
			</div>
			<div id="pt_my_page_container">
				<div class="pt_my_page_row" id="pt_my_page_first_row">
					<div class="pt_my_page_no">pt번호</div>
					<div class="pt_my_page_program_title">프로그램명</div>
					<div class="pt_my_page_regist_date">등록일</div>
					<div class="pt_my_page_category">카테고리</div>
					<div class="pt_my_page_favorite">즐겨찾기수</div>
				</div>
			<c:forEach var="vo" items="${ptVoList }">
				<div class="pt_my_page_row">
					<div class="pt_my_page_no"><a href="ptread?ptNo=${vo.ptNo }">${vo.ptNo }</a></div>
					<div class="pt_my_page_program_title"><a href="ptread?ptNo=${vo.ptNo }">${vo.ptName }</a></div>
					<div class="pt_my_page_regist_date">${vo.ptRegistDate }</div>
					<div class="pt_my_page_category">${vo.ptCategoryStr }</div>
					<div class="pt_my_page_favorite">100</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	<script type="text/javascript">
		$("#pt_my_page_insert_btn").click(function() {
			location.href = "ptinsert";
		});
		
		$("#pt_my_student_btn").click(function() {
			location.href = "myptstudent";
		});
		
		$("a").hover(
		function() {
			$(this).css("color","#4B4DB2");
		}, 
		function() {
			$(this).css("color","black");
		})
	</script>
</body>
</html>