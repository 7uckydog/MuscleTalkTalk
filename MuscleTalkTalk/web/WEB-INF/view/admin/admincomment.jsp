<%@ include file="/WEB-INF/view/csslink2.jsp" %>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="kh.semi.mtt.comment.model.vo.CommentVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-board</title>
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
#li_3 {
	text-decoration: underline;
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
#btn_read_all, #btn_read_all_report{
        width: 130px;
        height: 30px;
        font-size: 12px;
        color: white;
        background-color: #4B4DB2;
        border: 1px solid #4B4DB2;
        line-height: 30px;
    }
#btn_read_all:hover, #btn_read_all_report:hover{
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}
.btn_readall_readallreport{
	text-align: right;
    float: right;
    margin-right: 65px;
    display: inline-block;
    margin-bottom: 0;
    position: absolute;
    bottom: 0;
    right: 0;
}
.board_top{
	position: relative;
}

#pageing_all {
	margin: 45px auto 20px auto;
	text-align: center;
	font-family: 'THEmpgtM';
	font-size: 0px;
}

.page {
	background-color: rgb(236, 236, 236);
	border-radius: 3px;
	color: rgb(127, 127, 127);
	padding: 8px 11px 8px 11px;
	display: inline-block;
	margin: 0px 2px;
	font-size: 10.5px;
}

.npage{
	cursor: pointer;
}

.search_comment{
	display: inline-block;
	float: right;
	margin-right: 65px;
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

</style>
<script>

	$(function() {
		$("#btn_read_all_report").click(function(){
			console.log("btn_read_all_report CLICK");
			$.ajax({
				url:"adminboard",
				type:"post",
				data:{filters: "4"},
				dataType:"json",
				success: function(result){
					console.log(result);
					//console.log(result.totalpageCnt);	
					var html = "";
					for(var i = 0; i < result.boardreadall.length; i++){
	                    var vo = result.boardreadall[i];
	                    html += '<tr class="table_content">';
	                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardNo+'</a></td>';
	                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardTitle+'</a></td>';
	                    html += '<td>'+vo.boardDate+'</td>';
	                    html += '<td>'+vo.boardCount+'</td>';
	                    html += '<td>'
	                    if(vo.boardCategoryNumber == 1) {
	                    	html += "자유게시판";
	                    } else if (vo.boardCategoryNumber == 2) {
							html += "루틴게시판";
	                    }
						html += '</td>';
	                    html += '</tr>';
	                }
					$("#table_title").next().nextAll().remove();
					$("#board_table").append(html);
					return;
				},
				error: function(result){
					console.log("ajax 오류");
				}
			});
		});
		
		$("#btn_read_all").click(function(){
			console.log("btn_read_all CLICK");
			$.ajax({
				url:"adminboard",
				type:"post",
				data:{filters: "1"},
				dataType:"json",
				success: function(result){
					console.log(result);
					//console.log(result.totalpageCnt);	
					var html = "";
					for(var i = 0; i < result.boardreadall.length; i++){
	                    var vo = result.boardreadall[i];
	                    html += '<tr class="table_content">';
	                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardNo+'</a></td>';
	                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.boardTitle+'</a></td>';
	                    html += '<td>'+vo.boardDate+'</td>';
	                    html += '<td>'+vo.boardCount+'</td>';
	                    html += '<td>'
	                    if(vo.boardCategoryNumber == 1) {
	                    	html += "자유게시판";
	                    } else if (vo.boardCategoryNumber == 2) {
							html += "루틴게시판";
	                    }
						html += '</td>';
	                    html += '</tr>';
	                }
					$("#table_title").next().nextAll().remove();
					$("#board_table").append(html);
					return;
				},
				error: function(result){
					console.log("ajax 오류");
				}
			});
		});
	});


	
	
</script>
</head>
<body>
	<%
		CommentVo vo = (CommentVo) request.getAttribute("cvo");
	%>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="section1">
		<div class="board_top">
			<div id="board_main">댓글 관리</div>
			<div class="btn_readall_readallreport">
	            <button type="button"  id="btn_read_all">전체 댓글 조회</button>
	            <button type="button"  id="btn_read_all_report">신고 댓글 조회</button>
	        </div>
		</div>
		<table id="board_table">
			<tr>
				<td colspan="5" class="table_line"></td>
			</tr>
			<tr id="table_title">
				<td class="first_col"></td>
				<td style="width: 50%;">&nbsp;&nbsp;&nbsp;&nbsp;내용</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;등록일</td>
				<td>작성자</td>
				<td>&nbsp;&nbsp;&nbsp;글번호</td>
			</tr>
			<tr>
				<td colspan="5" class="table_line"></td>
			</tr>
			<c:forEach items="${commentreadall}" var="vo">
				<tr class="table_content">
					<td>${vo.rownum }</td>
					<td><a href="boardread?bno=${vo.boardNo }">${vo.commentContent }</a></td>
					<td>${vo.commentDate }</td>
					<td>${vo.memberNickname }</td>
					<td>
						<c:if test="${vo.boardNo == 0}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.routineboardNo}
						</c:if>
						<c:if test="${vo.routineboardNo == 0}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${vo.boardNo}
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pageing_all">
			<div class="Pageing">
					<c:if test="${startPage > 1 }">
						<a class="Page" href="admincomment?page=${startPage-1 }">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="p">
						<a class="Page" id="xxx" href="admincomment?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<c:if test="${endPage < totalpageCnt}">
						<a class="Page" href="admincomment?page=${endPage+1 }">다음</a>
					</c:if>
			</div>
		</div>
		<div class="search_comment">
			<button type="button" id="btn_search">검색</button>
			<input id="input_search" type="text" name="searchInput" 
				placeholder="검색어입력">
		</div>
	
	</section>
	<section id="section2">
		<div class="profile">
			<c:if test="${not empty ssMvo.memberPhoto}">
            	<img id="prifile" src="${ssMvo.memberPhoto}">
            </c:if>
            <c:if test="${empty ssMvo.memberPhoto}">
            	<img id="prifile" src="<%= request.getContextPath() %>/cssfolder/images/default_pf.png">
            </c:if>
		</div>
		<div class="my_info">
			<div id="member_nickname">${ssMvo.memberNickname}</div>
			<div id="member_id">${ssMvo.memberId}</div>
		</div>
		<div class="logout">
			<input type="button" name="mp_logout" id="mp_logout" value="로그아웃">
		</div>
		<div class="menu">
			<ul>
				<li id="li_1"><a href="dashboard">대시보드</a></li>
				<li id="li_2"><a href="adminboard">게시물 관리</a></li>
				<li id="li_3"><a href="admincomment">댓글 관리</a></li>
				<li id="li_4"><a href="adminnotice">공지사항 관리</a></li>
				<li id="li_5"><a href="adminmember">회원 관리</a></li>
				<li id="li_6"><a href="admintrainer">트레이너 관리</a></li>
				<li id="li_7"><a href="admininquiry">문의 확인</a></li>
			</ul>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	<script>
	$("#btn_search").click(function(){
		console.log("btn_search CLICK");
		$.ajax({
			url:"admincomment",
			type:"post",
			data:{inputsearch:$("#input_search").val()},
			dataType:"json",
			success: function(result){
				console.log(result);
				var html = "";
				for(var i = 0; i < result.commentreadall.length; i++){
                    var vo = result.commentreadall[i];
                    html += '<tr class="table_content">';
                    html += '<td>'+vo.rownum+'</td>';
                    html += '<td><a href="boardread?bno='+vo.boardNo+'">'+vo.commentContent+'</a></td>';
                    html += '<td>'+vo.commentDate+'</td>';
                    html += '<td>'+vo.memberNickname+'</td>';
                    if(vo.boardNo == 0){
                    	html += '<td>'+vo.routineboardNo+'</td>';
                    } else if (vo.routineboardNo == 0){
                    	html += '<td>'+vo.boardNo+'</td>';
                    }
                    html += '</tr>';
                }
				$("#table_title").next().nextAll().remove();
				$("#board_table").append(html);
			},
			error: function(result){
				
			}
		});
	});
	for(var i = 0; i < $('.Page').length; i++) {
		if($('.Page').eq(i).text() == '${currentPage}') {
			$('.Page').eq(i).css({
				backgroundColor : '#4B4DB2',
				color : 'white'
			})
		}
	}
	
	$("#mp_logout").click(function(){
    	alert("로그아웃 되었습니다.");
    	location.href="logout";
    });
	</script>	
	
</body>
</html>