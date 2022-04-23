<%@page import="java.util.ArrayList"%>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="kh.semi.mtt.comment.model.vo.CommentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board read</title>
</head>
<body>
<%
	BoardVo vo = (BoardVo)request.getAttribute("bvo");
	ArrayList<CommentVo> cVoList = (ArrayList<CommentVo>)request.getAttribute("cVoList");
%>
	<p>${vo.boardTitle }</p>
	<p>%{vo.boardContent}</p>
	<hr>
	<form action="commentinsert.ax" method="post">
		<input type="hidden" name="bNo" value="<%= vo.getBoardNo() %>">
		<input type="text" name="reComment">
		<button type="submit">댓글등록</button>
	</form>
	<hr>
	<%
	if(cVoList !=null){
 		for(CommentVo cvo : cVoList) {
			%>
			<%= cvo.getCommentContent() %>&nbsp;&nbsp;&nbsp;&nbsp; &&&&&nbsp;&nbsp;&nbsp;&nbsp; <%=cvo.getMemberNickname() %><hr><hr> 
			<%
		}
	}
	%>
</body>
</html>