<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
<%-- <%@ include file="/WEB-INF/view/csslink.jsp"%> --%>
<script src="https://cdn.ckeditor.com/4.18.0/standard/ckeditor.js"></script>
</head>
<body>
	<section>
		<form action="boardupdate.do" method="post">
		 	<input type="hidden" name="BNO" value="${bvo.boardNo}">
			게시물 제목: <input name="boardTitle" type="text" 
			placeholder="게시물 제목을 입력해 주세요.(최대 10자)" value="${bvo.boardTitle}">
 			<div>
			게시물 내용: <textarea id="board_content2" name="boardContent" 
			placeholder="게시물 내용을 입력해 주세요.(최대 300자)"></textarea>
	        	<script>
        		CKEDITOR.replace('board_content2', {width :'800px', 
        											height : '360px',
        											/* startupFocus : true, */
        											uiColor:'#ffffff',
        											enterMode:'2',
        											resize: 'none'});
        		CKEDITOR.config.resize_enabled=false;
        	</script>
        	</div>
        	<button type="submit">글 수정</button>
		</form>
        	<button onclick="location.href = 'BoardReadAll';">취소</button>
        	<button onclick ="location.href = 'boarddelete?bno=${bvo.boardNo}'" >글 삭제</button>
	</section>
	<script type="text/javascript">
		$("#board_content2").text("${bvo.boardContent}");
	//value="${bvo.boardContent}
	</script>
</body>
</html>