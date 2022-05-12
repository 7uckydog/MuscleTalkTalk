<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@page import="kh.semi.mtt.notice.model.vo.NoticeVo"%>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<%@ include file="/WEB-INF/view/font.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ReadAllNotice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<style>
a{
      text-decoration: none;
      color: black;
}
a:visited {
      text-decoration: none;
      color: black;
}
a:link{
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
	font-family:'THEmpgtM';
	}

#notice_main {
	/* margin-top: 65px; */
	/* margin-left: 65px; */
	padding-top: 65px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 40px; 
	font-size: 15px;
}

#notice_top_button{
	padding-top: 65px;
	/* margin-bottom: 40px; */
	float: right;
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
	#writer_board{
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

#notice_table {
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

.search_notice {
	display: inline-block;
	float: right;
	margin-right: 60px;
}

#pageing_all {
	margin: 45px auto 60px auto;
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


</style>
</head>
<body bgcolor="#ECECEC">
<%@ include file="/WEB-INF/view/template.jsp"%>
	<section>
		<div id="notice_main">공지사항</div>
		<div id="board_category">
			<a href="totalboard">통합 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="BoardReadAll">자유 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="routineboardreadall">루틴 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="noticereadall">공지사항</a>
		</div>
		<div id="board_note">
            <div id="note_title">게시판 유의사항</div>
            <div class="note_content_1">
                - 욕설,상업적 내용,광고,정치,특정 회원 및 트레이너 혹은 프로그램 등을 비방하는 내용의 악의적인 게시물은 신고 및 삭제될 수 있습니다.
            </div>
            <div class="note_content_2">
                - 친목,금전거래,재산권 침해,근거 없는 허위사실 유포 또한 신고 및 삭제될 수 있습니다.
            </div>
            <div class="note_content_3">
                - 전 회원의 보다 편리한 게시판 사용 및 홈페이지 관리를 위한 에티켓을 지켜주세요.
            </div>
        </div>
        <div id="board_information">
            <div id="writer_board">
                공지사항
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
		<div id="pageing_all">
		<div class="Pageing">
			<p>
				<c:if test="${startPage > 1 }">
					<a class="Page" href="noticereadall?page=${startPage-1 }">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:if>
				<c:forEach begin="${startPage }" end="${endPage }" var="p">
					<a class="Page" href="noticereadall?page=${p }">${p }</a>&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach>
				<c:if test="${endPage < totalPageCnt }">
					<a class="Page" href="noticereadall?page=${endPage+1 }">다음</a>
				</c:if>
			<p>
		</div>
		</div>
		<div class="search_notice">
				<button type="button" id="btn_search">검색</button>
				<input id="input_search" type="text" name="searchInput" 
					placeholder="검색어입력">
		</div>
		
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp"%>
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
</body>
</html>