<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@page import="kh.semi.mtt.notice.model.vo.NoticeVo"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReadAllNotice</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<table border="1">
		<tr>
			<td>글번호</td>
			<td>제목</td>
			<td>작성일</td>
		</tr>
		<c:forEach var="vo" items="${notilist}">
			<tr>
				<td><a href="boardread?bno=${vo.noticeNo}">${vo.noticeNo }</a></td>
				<td><a href="boardread?bno=${vo.noticeNo}">${vo.notiTitle}</a></td>
				<td>${vo.bWriteDate}</td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<c:if test="${startPage > 1 }">
			<a href="boardlist?page=${startPage-1 }">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" var="p">
			<a href="boardlist?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
		</c:forEach>
		<c:if test="${endPage < totalPageCnt }">
			<a href="boardlist?page=${endPage+1 }">다음</a>
		</c:if>
	<p>
</body>
</html>