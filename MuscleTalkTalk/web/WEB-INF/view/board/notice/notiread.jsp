<%@page import="kh.semi.mtt.member.model.service.MemberService"%>
<%@page import="kh.semi.mtt.notice.model.vo.NoticeVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/view/font.jsp"%>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Read</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>
<style>
	@font-face {
		font-family: THEmpgtM;
		src: url("./fonts/THEmpgtM.woff");
	}
	@font-face {
		font-family: THEmpgtR;
		src: url("./fonts/THEmpgtR.woff");
	}
	
	#notice_main, #note_title, #writer_board, .table_title, a, button{
		font-family: THEmpgtM;
	}
	.note_content_1, .note_content_2, .note_content_3, .table_content{
		font-family: THEmpgtR;
	}
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
	}
	#board_category {
		padding-top: 65px;
		margin-right: 65px;
		float: right;
		font-size: 12px;
	}
	
	#notice_main {
		padding-top: 65px;
		margin-left: 65px;
		font-weight: bold;
		display: inline-block;
		margin-bottom: 40px;
		font-size: 15px;
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
        
    #notice_table {
	margin: 50px auto;
	padding-bottom: 30px;
	width: 800px;
	font-size: 12px;
	}

	.table_line {
		background: rgb(204, 204, 204);
		background-clip: content-box;
		height: 2px !important;
	}

	.table_title {
		height: 30px;
		line-height: 30px;
	}
	
	.table_content {
		height: 30px;
		line-height: 30px;
	}
    button {
		cursor: pointer;
	}
	.btn_ok{
        margin-top: 62px;
        text-align: center;
    }
    #notice_ok{
        width: 155px;
        height: 30px;
        font-size: 12px;
        color: white;
        background-color: #4B4DB2;
        border: 1px solid #4B4DB2;
    }
	.btn_update_delete{
        margin-top: 5px;
        margin-right: 65px;
        text-align: right;
        flote: right;
        display: none;
    }
    #notice_delete, #notice_update {
        width: 100px;
        height: 30px;
        font-size: 12px;
        color: #4B4DB2;
        background-color: white;
        border: 1px solid #4B4DB2;
    }
     
</style>

</head>
<body>

	<%@ include file="/WEB-INF/view/template.jsp"%>
<%
	NoticeVo vo = (NoticeVo) request.getAttribute("nvo");
%>
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
        <div class="btn_update_delete">
            <button type="button" onclick="location.href='noticeupdate?noticeNo=${nvo.noticeNo}'" id="notice_update">수정</button>
            <button type="button" onclick="location.href='noticedelete?noticeNo=${nvo.noticeNo}'" id="notice_delete">삭제</button>
        </div>
        
		<table id="notice_table">
			
			<tr class="table_title">
				<td style="width: 80%;">&nbsp;&nbsp;&nbsp;&nbsp;공지사항 제목</td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;등록일</td>
			</tr>
			<tr class="table_content">
				<td style="width: 70%; padding-bottom: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;<%=vo.getNotiTitle()%></td>
				<td>&nbsp;&nbsp;&nbsp;&nbsp;<%=vo.getNotiDate()%></td>
			</tr>
			<tr id="table_line">
				<td colspan="2" class="table_line"></td>
			</tr>
			<tr class="table_title">
				<td colspan="2" style= "padding-top: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;공지사항 내용</td>
			</tr>
			<tr class="table_content">
				<td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;<%=vo.getNotiContent()%></td>
			</tr>
			
		</table>
		
		<div class="btn_ok">
            <button type="button" onclick="location.href = 'noticereadall';" id="notice_ok">확인</button>
        </div>

	
	</section>

	<%@ include file="/WEB-INF/view/footer.jsp"%>
	<script type="text/javascript">
	<c:if test="${not empty ssMvo && ssMvo.memberNo < 11}">
		$('.btn_update_delete').css('display','block');
	</c:if>
</script>
</body>
</html>