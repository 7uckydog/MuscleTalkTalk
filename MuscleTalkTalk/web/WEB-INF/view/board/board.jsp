<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet">
<style>
	table, td{
	border: 1px solid black;
	}
</style>
</head>
<body>
	게시판 출력테스트
	<div>
		<table>
			<tr>
				<td>게시글 번호 </td>
				<td>제목 </td>
				<td>등록일 </td>
				<td>조회수 </td>
				<td>댓글수 </td>
				<td>작성자 </td>
				<%-- <td>test: ${boardreadall}</td> --%>
			</tr>
			<c:forEach items="${boardreadall}" var = "vo">
			<tr>
				<td><a href="boardread?bno=${vo.boardNo}">${vo.boardNo }</a></td>
				<td><a href="boardread?bno=${vo.boardNo }">${vo.boardTitle }</a> </td>	
				<td>${vo.boardDate } </td>	
				<td>0 </td>
				<td>${vo.boardCount } </td>
				<td>${vo.memberNickname } </td>
			</tr>
			</c:forEach>
		</table>
		<p>
			<c:if test="${startPage > 1 }">
			<a href="boardreadall?page=${startPage-1 }">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" var="p">
				<a href="boardreadall?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
			<c:if test="${endPage < totalpageCnt}">
			<a href="boardreadall?page=${endPage+1 }">다음</a>
			</c:if>
		</p>
		<button id="list_button">글불러오기 버튼</button>
	</div>
	<script type="text/javascript">
		$("#list_button").on("click", function(){
			location.href="boardreadall";
		});
	</script>
</body>
</html>