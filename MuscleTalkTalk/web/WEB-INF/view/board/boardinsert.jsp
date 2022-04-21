<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="boardinsert.do" method="post">
		제목: <input type="text" name="boardTitle" maxlength="200" required><br>
		내용: <textarea name="boardContent" placeholder="한글1000자까지" maxlength="1000" required></textarea>
		<button type="submit">자유게시글등록</button>
	</form>
</body>
</html>