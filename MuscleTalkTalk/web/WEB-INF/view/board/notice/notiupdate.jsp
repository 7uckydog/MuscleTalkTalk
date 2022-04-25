<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	번호: ${nvo.noticeNo}
	<form action="noticeupdate.do" method="post">  
		제목: <input type="text" name="notiTitle" maxlength="100" required value="${nvo.notiTitle }"><br>
		내용: <textarea name="notiContent" placeholder="한글 1000자까지" maxlength="1000" required value="${nvo.notiContent }"></textarea><br>
		<hr>
		<input type="hidden" name="noticeNo" value="${nvo.noticeNo}">
		
		<button type="submit">수정완료</button>
	</form>
</body>
</html>