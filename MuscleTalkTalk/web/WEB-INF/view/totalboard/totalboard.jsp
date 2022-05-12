<%-- <link rel="stylesheet"
	href="<%=request.getContextPath()%>/cssfolder/css/board.css"> --%>
<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>통합 게시판</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
<style>
/* section boardcss */
a {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:link {
	text-decoration: none;
	color: black;
}

section {
	margin-left: 210px;
	background-color: white;
	border-radius: 10px 10px 0 0;
	width: 930px;
	height: 2000px;
	position: relative;
	font-family: 'THEmpgtM';
	text-decoration: none;
}

#board_main {
	/* margin-top: 65px; */
	/* margin-left: 65px; */
	padding-top: 65px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 40px;
	font-size: 15px;
}

#board_category {
	padding-top: 65px;
	margin-right: 65px;
	float: right;
	font-size: 12px;
}

#board_note {
	border: 1px solid #4B4DB2;
	border-bottom: 0;
	width: 800px;
	box-sizing: border-box;
	height: 150px;
	/* padding: 40px 30px 30px 30px; */
	padding-left: 50px;
	margin: 0 65px;
	text-align: left;
}

#note_title {
	margin-top: 20.5px;
	margin-bottom: 20px;
	font-size: 12px;
}

.note_content_1 {
	font-weight: 100;
	margin-top: 20px;
}

.note_content_2 {
	font-weight: 100;
	margin-top: 15px;
	margin-bottom: 15px;
}

.note_content_3 {
	font-weight: 100;
	/* margin-top: 20px; */
}

.note_content_1, .note_content_2, .note_content_3 {
	font-size: 12px;
}

#board_information {
	border: 1px solid #4B4DB2;
	background-color: #4B4DB2;
	width: 800px;
	box-sizing: border-box;
	height: 55px;
	padding: 10px 30px 10px 50px;
	margin: 0px auto;
	text-align: left;
	position: relative;
	overflow: hidden;
	vertical-align: middle;
}

#board_count {
	display: inline-block;
	/* margin: auto; */
	line-height: 30px;
	font-size: 12px;
	color: white;
}

#btn_search {
	height: 27px;
	width: 63px;
	font-size: 12px;
	padding: 12px auto;
	float: right;
	cursor: pointer;
}

#input_search {
	height: 24px;
	width: 203px;
	margin-top: 2.5px;
	margin-right: 10px;
	float: right;
	font-size: 12px;
}

#input_search::placeholder {
	font-size: 12px;
}

#input_search:focus {
	outline: none;
}

#sort {
	width: 94.5px;
	height: 32px;
	margin-top: 10px;
	margin-bottom: 10px;
	margin-right: 65px;
	float: right;
	font-size: 12px;
}

#board_table {
	margin: 50px auto;
	width: 800px;
	font-size: 12px;
}

.table_line {
	background: gray;
	background-clip: content-box;
	height: 1px !important;
}

#table_title {
	height: 38px;
	line-height: 38px;
}

.table_content {
	height: 50px;
	line-height: 50px;
}

.table_content :first-child {
	width: 60px;
	padding-left: 17px;
	box-sizing: border-box;
}

.search_board {
	display: inline-block;
	float: right;
}

.Pageing {
	text-align: center;
}

.Pageing a {
	border: 1px solid #4B4DB2;
}

.Pageingclick {
	background-color: #4B4DB2;
}

.Page {
	width: 30px;
	height: 30px;
	box-sizing: content-box;
}

#write_btn {
	color: white;
	border: 1px solid white;
	background-color: #4B4DB2;
	width: 152px;
	height: 28px;
	float: right;
	font-size: 12px;
	margin-right: 60px;
	cursor: pointer;
	/* position: absolute; */
	/* right: 60px; */
}
.Pageingclick:focus {
	background-color: #4B4DB2;
	color: white;
}
</style>
<script>
	$(function() {
		$(".Page").click(function() {
			$(this).toggleClass("Pageingclick");
		});
	});
</script>
</head>
<body bgcolor=" #ECECEC">

	<%@ include file="/WEB-INF/view/template.jsp"%>

	<section>
		<div id="board_main">게시판</div>
		<div id="board_category">
			<a href="totalboardreadall">통합 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="BoardReadAll">자유 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="routineboardreadall">루틴 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="noticereadall">공지사항</a>
		</div>
		<div id="board_note">
			<div id="note_title">게시판 유의사항</div>
			<div class="note_content_1">- 욕설,상업적 내용,광고,정치,특정 회원 및 트레이너 혹은
				프로그램 등을 비방하는 내용의 악의적인 게시물은 신고 및 삭제될 수 있습니다.</div>
			<div class="note_content_2">- 친목,금전거래,재산권 침해,근거 없는 허위사실 유포 또한
				신고 및 삭제될 수 있습니다.</div>
			<div class="note_content_3">- 전 회원의 보다 편리한 게시판 사용 및 홈페이지 관리를 위한
				에티켓을 지켜주세요.</div>

		</div>
		<div id="board_information">
			<div id="board_count">전체게시물 수:
				&nbsp;${totalboardreadall.size()}</div>
			<!-- <div id="board_search"> -->
			<form class="search_board">
				<button type="button" id="btn_search">검색</button>
				<input id="input_search" type="text" name="searchInput"
					placeholder="검색어입력">
			</form>
			<!-- </div> -->
		</div>
		<select id="sort">
			<option class="Filter" name="Filter" value="1">최신순</option>
			<option class="Filter" name="Filter" value="2">조회순</option>
			<option class="Filter" name="Filter" value="3">댓글순</option>
		</select>
		<script type="text/javascript">
		
		$("#sort").on("change",function(){
					console.log("test");
					console.log($("#sort").val());
					//$(".Filter").val()
					$.ajax({
						url:"filterAjaxController",
						type:"post",
						data:{filters:$("#sort").val(), page:${currentPage}},
						dataType:"json",
						success: function(result) {
								console.log(result);
								//console.log(result);
 								var html = "";
								for(var i = 0; i < result.boardlist.length; i++){
				                    var vo = result.boardlist[i];
				                    html += '<tr class="table_content">';
				                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardNo+'</a></td>';
				                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardTitle+'</a></td>';
				                    html += '<td>'+vo.boardDate+'</td>';
				                    html += '<td>'+vo.boardCount+'</td>';
				                    html += '<td>'+vo.rCnt+'</td>';
				                    html += '<td>'+vo.memberNickname+'</td>';
				                    html += '</tr>';
				                }
								console.log("씨2");
								console.log($("#table_title").next());
								$("#table_title").next().nextAll().remove();
								$("#board_table").append(html);
								console.log("씨3");
								return;
						},
						error: function(result){
							console.log("ajax 오류");
						}
						});
					});
		$("#btn_search").click(function(){
			console.log("test");
			console.log($("#sort").val());
			//$(".Filter").val()
			$.ajax({
				url:"filterAjaxController",
				type:"post",
				data:{inputsearch:$("#input_search").val()},
				dataType:"json",
				success: function(result) {
						console.log(result);
						//console.log(result);
							var html = "";
						for(var i = 0; i < result.boardlist.length; i++){
		                    var vo = result.boardlist[i];
		                    html += '<tr class="table_content">';
		                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardNo+'</a></td>';
		                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardTitle+'</a></td>';
		                    html += '<td>'+vo.boardDate+'</td>';
		                    html += '<td>'+vo.boardCount+'</td>';
		                    html += '<td>'+vo.rCnt+'</td>';
		                    html += '<td>'+vo.memberNickname+'</td>';
		                    html += '</tr>';
		                }
						console.log("씨2");
						console.log($("#table_title").next());
						$("#table_title").next().nextAll().remove();
						$("#board_table").append(html);
						console.log("씨3");
						return;
				},
				error: function(result){
					console.log("ajax 오류");
				}
				});
			});
		</script>
		
		<table id="board_table">
			<tr>
				<td colspan="6" class="table_line"></td>
			</tr>
			<tr id="table_title">
				<td class="first_col"></td>
				<td style="width: 50%;">&nbsp;&nbsp;&nbsp;&nbsp;제목</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;등록일</td>
				<td>조회수</td>
				<td>댓글수</td>
				<td>작성자</td>
			</tr>
			<tr>
				<td colspan="6" class="table_line"></td>
			</tr>
			<c:forEach items="${totalboardreadall}" var="vo">
				<tr class="table_content">
					<td><a href="boardread?bno=${vo.boardNo}">${vo.totalboardR }</a></td>
					<td><a href="boardread?bno=${vo.boardNo }">${vo.boardTitle }</a></td>
					<td>${vo.boardDate }</td>
					<td>&nbsp;&nbsp;&nbsp;${vo.boardCount }</td>
					<td>${vo.rCnt }</td>
					<td>${vo.memberNickname }</td>
				</tr>
			</c:forEach>
		</table>
		<div class="Pageing">
			<p>
				<c:if test="${startPage > 1 }">
					<a class="Page" href="BoardReadAll?page=${startPage-1 }">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="p">
					<a class="Page" id="xxx" href="BoardReadAll?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
			</c:forEach>
				<c:if test="${endPage < totalpageCnt}">
					<a class="Page" href="BoardReadAll?page=${endPage+1 }">다음</a>
				</c:if>
			</p>
		</div>
		<c:if test="${not empty ssMvo }">
		<button onclick="location.href = 'boardinsert';" id="write_btn">글쓰기</button>
		</c:if>
	</section>

	<%@ include file="/WEB-INF/view/footer.jsp"%>


</body>
</html>