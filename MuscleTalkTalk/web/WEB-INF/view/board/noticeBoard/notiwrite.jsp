<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="<%= request.getContextPath() %>/css/reset.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- private int noticeNo;
	private int memberNo;
	private String notiTitle;
	private String notiContent;
	private int notiCnt;
	private Timestamp notiDate;
	
	
	private ArrayList<BoardReCommentVo> reCommentList; -->
	<form action="noticewrite.do" method="post">   <!-- 길이가 길어 post로 -->
		제목: <input type="text" name="notiTitle" maxlength="100" required><br>
		내용: <textarea name="notiContent" placeholder="한글 1000자까지" maxlength="1000" required></textarea><br>
		<button type="submit">글등록</button>
	</form>
</body>
</html>