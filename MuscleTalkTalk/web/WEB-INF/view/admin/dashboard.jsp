<%@ include file="/WEB-INF/view/csslink2.jsp" %>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-dashboard</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>

<style>
section{
font-family:'THEmpgtM';
}
a:active {
	text-decoration: underline;
}
a, a:visited, a:link{
    color: rgb(94, 94, 94);
}
.menu>ul>li {
	display: list-item;
	text-align: center;
	padding-top: 12px;
}
#board_main {
	padding-top: 65px;
	padding-bottom: 15px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 0;
	font-size: 15px;
}

#board_table {
	margin: 20px auto;
	width: 650px;
	font-size: 12px;
}


.board_top{
	position: relative;
}





</style>
<script>

	

	
	
</script>
</head>
<body>
	<%
		BoardVo vo = (BoardVo) request.getAttribute("bvo");
	%>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="section1">
		<div class="board_top">
			<div id="board_main">대시보드</div>
			
		</div>
		
	
	</section>
	<section id="section2">
		<div class="profile">
			<img src="">
			<div id="camera">
				<img src="<%=request.getContextPath()%>/cssfolder/images/camera.png">
			</div>
		</div>
		<div class="my_info">
			<div>Admin</div>
			<div>admin 2</div>
		</div>
		<div class="logout">
			<button>로그아웃</button>
		</div>
		<div class="menu">
			<ul>
				<li id="li_1"><a href="dashboard">대시보드</a></li>
				<li id="li_2"><a href="adminboard">게시물 관리</a></li>
				<li id="li_3"><a href="admincomment">댓글 관리</a></li>
				<li id="li_4"><a href="adminnotice">공지사항 관리</a></li>
				<li id="li_5">회원 관리</li>
				<li id="li_6">트레이너 관리</li>
				<li id="li_7">문의 확인</li>
			</ul>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	
	
</body>
</html>