<%@page import="java.util.ArrayList"%>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="kh.semi.mtt.comment.model.vo.CommentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>자유 게시판 상세보기</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>

<style>
@font-face {
	font-family: THEmpgtM;
	src: url("./fonts/THEmpgtM.woff");
}

body {
	width: 1200px;
	margin: 0 auto;
	src: url("./fonts/THEmpgtM.woff");
}

* {
	text-decoration: none;
}

/* readboard-section css */
section {
	margin-left: 210px;
	background-color: white;
	border-radius: 10px 10px 0 0;
	width: 930px;
	height: 2000px;
	font-size: 12px;
	position: relative;
	font-family: 'THEmpgtM';
	text-decoration: none;
}

button {
	cursor: pointer;
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
	margin-top: 30px;
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

#writer_board {
	display: inline-block;
	/* margin: auto; */
	line-height: 30px;
	font-size: 12px;
	color: white;
}

#board_write1 {
	margin: 60px 0 0 65px;
	display: inline-block;
	font-size: 12px;
}

#board_title {
	margin: 15px 0 0 65px;
	width: 260px;
	height: 25px;
	font-size: 12px;
}

#board_content {
	margin: 35px 0 25px 65px;
	font-size: 12px;
}

#board_content1 {
	margin: 10px 65px 0 65px;
	width: 790px;
	height: 228px;
	box-sizing: content-box;
	resize: none;
	overflow: hidden, scroll, auto;
	text-overflow: clip;
}

#board_cancel {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}

#board_register {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: white;
	background-color: #4B4DB2;
	border: 1px solid #4B4DB2;
}

#btn_cancel_register {
	margin-top: 62px;
	text-align: center;
}

#read_title {
	margin: 15px 0 0 65px;
	width: 260px;
	height: 25px;
	font-size: 12px;
	border: black;
}

#board_write1, #boardread_1, #boardread_2, #boardread_3, #boardread_4 {
	display: inline-block;
}

#read_title, #read_title_1, #read_title_2, #read_title_3, #read_title_4
	{
	display: inline-block;
}

#boardread_1 {
	margin-left: 280px;
}

#boardread_2 {
	margin-left: 90px;
}

#boardread_3 {
	margin-left: 60px;
}

#boardread_4 {
	margin-left: 70px;
}

#read_title_1 {
	width: 90px;
	margin-left: 60px;
}

#read_title_2 {
	margin-left: 41px;
	text-align: center;
	width: 50px;
	overflow: hidden;
}

#read_title_3 {
	margin-left: 45px;
	width: 50px;
	overflow: hidden;
	text-align: center;
}

#read_title_4 {
	width: 100px;
	margin-left: 35px;
	width: 90px;
	overflow: hidden;
	text-align: center;
}

hr {
	margin-top: 25px;
	margin-left: 65px;
	width: 798px;
}

#read_content {
	height: 228px;
	width: 798px;
	margin-left: 65px;
	overflow: auto;
	text-overflow: clip;
}

#recomment {
	margin-left: 65px;
	margin-bottom: 30px
}

#member_image {
	margin-left: 65px;
	display: inline-block;
}

#memberName {
	display: inline-block;
	margin-left: 10px;
}

#readrecomment {
	margin-top: 20px;
	margin-left: 115px;
	width: 500px;
	height: 50px;
}

#recommentContent {
	margin-top: 20px;
	margin-left: 115px;
	resize: none;
	height: 130px;
	width: 580px;
}

#recommentBtn {
	vertical-align: top;
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
	margin-top: 20px;
	margin-left: 15px;
}

.more_recomment{
	margin-left:60px;
	display: none;
}


.btn_more_recomment{
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
	margin-top: 20px;
	margin-left: 150px;
}
.btn_update{
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}
.report_modal{
    display: none;
    width: 350px;
    height: 300px;
    border: #4B4DB2 solid 1px;
    background-color: white;
    position: fixed;  
    top: 40%;
    left: 50%;
    transform: translate(-25%,-25%); 
    /* position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%); */
    z-index: 2;
    
}
.btn_close{
    text-align: right;
    box-sizing: border-box;
}
.modal_content{
    box-sizing: content-box;
}
.report_title{
	margin-top: 30px;
    text-align: center;
}
.report_content{
	margin-top: 30px;
    text-align: center;
    color: gray;
}
.report_reason{
    text-align: center;
}
.report_selete{
    width: 240px;
    margin-top: 30px;
    height: 40px;
    border: #4B4DB2 solid .5px;
    margin-bottom: 25px
}
.report_cancel{
    height: 50px;
    width: 175px;
    font-size: 12px;
    color: #4B4DB2;
    background-color: white;
    outline: 0;
    border: 0;
    border-top: #4B4DB2 solid 1px;
}
.btn_closeX{
	width: 30px;
	height: 35px;
}
.report_ok{
    width: 175px;
    height: 50px;
    font-size: 12px;
    color: white;
    background-color: #4B4DB2;
    outline: 0;
    border: 0;
    border-left: #4B4DB2 solid 1px;
    border-top: #4B4DB2 solid 1px;
}
.btn_cancel_ok{
    margin-top: 38px;
    border-bottom: #4B4DB2 solid 1px;
}
.modal{
        display: none;
        position: fixed; top: 0; left: 0; 
        width: 100%; height: 100%;
        z-index: 1;
        background-color: rgba(128, 128, 128, .5);
        }

</style>
</head>
<body bgcolor=" #ECECEC">
	<%
		BoardVo vo = (BoardVo) request.getAttribute("bvo");
	ArrayList<CommentVo> cVoList = (ArrayList<CommentVo>) request.getAttribute("cVoList");
	%>

	<section>
		<div id="board_main">자유 게시물 상세보기</div>
		<div id="board_category">
			<a href="totalboard">통합 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="BoardReadAll">자유 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a
				href="routineboardreadall">루틴 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">공지사항</a>
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
			<div id="writer_board">자유 게시물</div>
		</div>
		<div>
			<p id="board_write1">게시물 제목</p>
			<p id="boardread_1">등록일</p>
			<p id="boardread_2">조회수</p>
			<p id="boardread_3">댓글수</p>
			<p id="boardread_4">작성자</p>
		</div>
		<div></div>
		<div>
			<p id="read_title">${bvo.boardTitle}</p>
			<p id="read_title_1">${bvo.boardDate}</p>
			<p id="read_title_2">${bvo.boardCount}</p>
			<p id="read_title_3">${bvo.rCnt}</p>
			<p id="read_title_4">${bvo.memberNickname}</p>
		</div>
		<div>
			<hr>
		</div>
		<div id="board_content">게시물 내용</div>
		<div>
			<p id="read_content">${bvo.boardContent}</p>
		</div>
		<div id="recomment">댓글</div>
		<c:forEach var="cvo" items="${cVoList }">
			<div class="more_recomment">
				<div id="member_image">이미지</div>
				<div id="memberName">${cvo.memberNickname } -
					${cvo.commentDate }</div>
				<div id="readrecomment">${cvo.commentContent }</div>
			</div>
		</c:forEach>
		<div>
			<button class="btn_more_recomment">더보기</button>
		</div>
		<form action="commentinsert.ax" method="post">
			<input type="hidden" name="bNo" value="<%=vo.getBoardNo()%>">
			<textarea id="recommentContent" name="reComment"
				placeholder="댓글 내용을 입력하세요." required></textarea>
			<button id="recommentBtn" type="submit">댓글 등록</button>
		</form>
		<div id="btn_cancel_register">
			<button id="board_cancel">글 신고하기</button>
			<button onclick="location.href = 'BoardReadAll'" id="board_register">확인</button>
			<c:if test = "${ssMvo.memberNickname ==  bvo.memberNickname}">

				<button class="btn_update" onclick="location.href = 'boardupdate?bno=${bvo.boardNo}'">수정하기</button>

			</c:if>
		</div>
		<div class="report_modal">
            <div class="modal_content">
                <!-- 모달창내용작성 -->
                <div class="btn_close"><button class="btn_closeX">&#9932;</button></div>
                    <p class="report_title">글 신고하기</p>
                    <p class="report_content">게시글을 신고하기 위해 사유를 선택해 주세요.</p>
                    <p class="report_reason"><select name="" class="report_selete">
                        <option value="" selected disabled hidden>사유선택</option>
                        <option value="1">부적절한 내용</option>
                        <option value="2">개인 정보 노출</option>
                        <option value="3">욕설/비하/비방 발언</option>
                        <option value="4">스팸 홍보/도배</option>
                        <option value="5">기타</option>
                    </select></p>
                    <div class="btn_cancel_ok"><button class="report_cancel">취소</button><button class="report_ok">신고하기</button></div>
            </div>
        </div>      
        <div class="modal">
        </div>
	</section>

	<%@ include file="/WEB-INF/view/footer.jsp"%>
	<script type="text/javascript">
		$(function() {
			var itemCnt = $(".more_recomment").length;
			const recommentItemSize = 3;			
			var totalViewCnt = 0;
			for (var i = 0; i < recommentItemSize; i++) {
				 $(".more_recomment").eq(i).show(); 
				
				totalViewCnt++;
			}
			console.log(itemCnt);
			console.log(totalViewCnt);
			$(".btn_more_recomment").click(
					function() {
						var nowViewCnt = totalViewCnt;
						if (totalViewCnt >= itemCnt) {
							alert("더이상 작성된 댓글이 없습니다.")
							$(".btn_more_recomment").hide();
							return;
						}
						for (var i = nowViewCnt; i < nowViewCnt
								+ recommentItemSize; i++) {
							console.log($(".more_recomment").eq(i))
							if ($(".more_recomment").eq(i).length == 0) {
								break;
							}
							$(".more_recomment").eq(i).show();
							totalViewCnt++;
						}
						console.log(totalViewCnt);
					});
		});
		$(function(){ //모달
            // const eleModal = document.getElementsByClassName("modal")[0];
            const eleModal = document.querySelector(".report_modal");
            const bagModal = document.querySelector(".modal");

            function openModalHandler(){
                bagModal.style.display ="block";
                eleModal.style.display ="block";
            };        
            function closeModalHandler(){
                bagModal.style.display ="none";
                eleModal.style.display ="none";
            };
            function closeModalWindowHandler(){
            	console.log(this);
                console.log(event.target);
                if(event.target == this){
                    bagModal.style.display ="none";
                    eleModal.style.display ="none";
                   console.log(this);
                   console.log(event.target);
                }
            }
            // 안됨 css속성 쓸수 없음. html tag속성가능 document.getElementsByClassName("modal")[0].display = "block";
            document.querySelector("#board_cancel").addEventListener("click",openModalHandler);
            document.querySelector(".btn_closeX").addEventListener("click",closeModalHandler); 
            document.querySelector(".report_modal").addEventListener("click",closeModalWindowHandler);
            document.querySelector(".modal").addEventListener("click",closeModalWindowHandler);
            $(".report_ok").click(function(){
                eleModal.style.display="none"
                bagModal.style.display ="none"
                alert("신고되었습니다")
            });
            $(".report_cancel").click(function(){
                eleModal.style.display="none"
                bagModal.style.display ="none"
            })
        });
		
		$(window).click(function(event) {
			console.log(event.target);
			if(event.target == $(".modal")[0]) {
				//$(".modal").hide();
				//$(".report_modal").hide();
			}
		})
	</script>

</body>
</html>