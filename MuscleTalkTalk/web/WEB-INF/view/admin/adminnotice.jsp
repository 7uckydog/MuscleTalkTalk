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
a, a:visited, a:link{
    color: rgb(94, 94, 94);
}
.menu>ul>li {
	display: list-item;
	text-align: center;
	padding-top: 12px;
}
#li_4 {
	text-decoration: underline;
}
/* #notice_main {
	padding-top: 65px;
	padding-bottom: 15px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 0;
	font-size: 15px;
} */

#notice_table {
	margin: 20px auto;
	width: 650px;
	font-size: 12px;
	clear: both;
}


.board_top{
	position: relative;
}
 #notice_main {
	padding-top: 65px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	padding-bottom: 15px;
	font-size: 15px;
} 

#notice_top_button{
	padding-top: 65px;
	margin-bottom: 0;
	float: right;
	position: absolute;
    bottom: 0;
    right: 0;
}
#write_btn {
	color: white;
	border: 1px solid white;
	background-color: #4B4DB2;
	width: 152px;
	height: 30px;
	line-height: 30px;
	font-size: 12px;
	margin-right: 65px;
	cursor: pointer;

}
#write_btn:hover{
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}

#board_category {
	padding-top: 65px;
	margin-right: 65px;
	float: right;
	font-size: 12px;
}




#btn_search {
	height: 27px;
	width: 63px;
	font-size: 12px;
	padding: 12px auto;
	float: right;
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
	padding-left: 10px;
	box-sizing: border-box;
}

.search_notice {
	display: inline-block;
	float: right;
	margin-right: 65px;
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




</style>

</head>
<body>
	<%
		BoardVo vo = (BoardVo) request.getAttribute("bvo");
	%>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="section1">
		<div class="board_top">
			<div id="notice_main">공지사항 관리</div>
			<div id="notice_top_button">
				<button onclick="location.href = 'noticeinsert';" id="write_btn">공지사항 작성</button>
			</div>
		</div>
		<table id="notice_table">
			<tr>
				<td colspan="3" class="table_line"></td>
			</tr>
			<tr id="table_title">
				<td class="first_col"></td>
				<td style="width: 50%;">&nbsp;&nbsp;&nbsp;&nbsp;제목</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;등록일</td>
			</tr>
			<tr>
				<td colspan="3" class="table_line"></td>
			</tr>
			<c:forEach var="vo" items="${noticereadall}">
				<tr class="table_content">
					<td><a href="noticeread?noticeNo=${vo.noticeNo}">${vo.noticeNo }</a></td>
					<td><a href="noticeread?noticeNo=${vo.noticeNo}">${vo.notiTitle}</a></td>
					<td>${vo.notiDate}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="Pageing">
			<p>
				<c:if test="${startPage > 1 }">
					<a class="Page" href="adminnotice?page=${startPage-1 }">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="p">
					<a class="Page" href="adminnotice?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				<c:if test="${endPage < totalPageCnt }">
					<a class="Page" href="adminnotice?page=${endPage+1 }">다음</a>
				</c:if>
			<p>
		</div>
		<div class="search_notice">
				<button type="button" id="btn_search">검색</button>
				<input id="input_search" type="text" name="searchInput" 
					placeholder="검색어입력">
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
				<li id="li_5"><a href="adminmember">회원 관리</a></li>
				<li id="li_6">트레이너 관리</li>
				<li id="li_7">문의 확인</li>
			</ul>
		</div>
	</section>
	<script>
	$("#btn_search").click(function(){
		console.log("btn_search CLICK");
		$.ajax({
			url:"noticereadall",
			type:"post",
			data:{inputsearch:$("#input_search").val()},
			dataType:"json",
			success: function(result){
				console.log(result);
				var html = "";
				for(var i = 0; i < result.noticereadall.length; i++){
                    var vo = result.noticereadall[i];
                    html += '<tr class="table_content">';
                    html += '<td><a href="noticeread?noticeNo='+vo.noticeNo+'">'+vo.noticeNo+'</a></td>';
                    html += '<td><a href="noticeread?noticeNo='+vo.noticeNo+'">'+vo.notiTitle+'</a></td>';
                    html += '<td>'+vo.notiDate+'</td>';
                    html += '</tr>';
                }
				$("#table_title").next().nextAll().remove();
				$("#notice_table").append(html);
			},
			error: function(result){
				
			}
		});
	});
	</script>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	
	
</body>
</html>