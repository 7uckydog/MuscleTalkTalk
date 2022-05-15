<%@ include file="/WEB-INF/view/csslink.jsp" %>
<link rel="stylesheet" href="<%= request.getContextPath() %>/cssfolder/css/main.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머슬톡톡</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>
</head>
<body>
    <%@ include file="/WEB-INF/view/template.jsp" %>
        <section id="main_section">
			<div id="main_board_wrap" class="back_white radius">
				<div id="main_board">
					<p id="main_board_title" class="font_THEmpgtB font_15px">인기 게시물</p>
					<p class="font_THEmpgtM font_12px font_color_rgb">오늘의 인기 게시물</p>					
					<p id="main_free_board_title" class="font_THEmpgtB font_15px font_color_rgb">자유 게시물</p>
					<hr class="font_color_rgb">
					<div id="board_input_div">
					</div>
					<p id="main_routine_board_title" class="font_THEmpgtB font_15px font_color_rgb">루틴 게시물</p>
					<hr class="font_color_rgb">
					<div id="routineboard_input_div">
					</div>
				</div>
			</div>
			<div id="main_user_wrap" class="back_white radius">
				<c:if test="${not empty ssMvo }">
					<p id="main_user_title" class="font_THEmpgtB font_15px">반갑습니다!</p>
					<p class="font_THEmpgtM font_12px font_color_rgb">${ssMvo.memberNickname }님을 환영합니다.</p>
					<button id="main_logout_btn" type="button" class="main_btn">로그아웃</button>
					<button id="main_mypage_btn" type="button" class="main_btn">마이페이지</button>
				</c:if>
				<c:if test="${empty ssMvo }">
					<p id="main_user_title" class="font_THEmpgtB font_15px">머슬톡톡을 둘러보세요!</p>
					<p class="font_THEmpgtM font_12px font_color_rgb">로그인/회원가입시 보다 많은 기능 사용이 가능합니다.</p>
					<button id="main_login_btn" type="button" class="main_btn">로그인</button>
					<button id="main_join_btn" type="button" class="main_btn">회원가입</button>
					<div id="main_find_wrap">				
						<p id="main_find_id" class="font_THEmpgtM font_12px font_color_rgb display_linline_block width_auto">아이디 찾기</p>
						<p class="font_THEmpgtM font_12px font_color_rgb display_linline_block width_auto">/</p>
						<p id="main_find_pwd" class="font_THEmpgtM font_12px font_color_rgb display_linline_block width_auto">비밀번호 찾기</p>
					</div>
				</c:if>
			</div>
			<div id="main_pt_wrap" class="back_white radius">
				<p id="main_pt_title" class="font_THEmpgtB font_15px">인기 프로그램</p>
				<p class="font_THEmpgtM font_12px font_color_rgb">회원이 많이 찾는 인기 프로그램</p>
				<p id="main_pt_board_title" class="font_THEmpgtB font_15px font_color_rgb">PT 프로그램</p>
				<hr class="font_color_rgb">
				<div id="pt_input_div">
				</div>
			</div>
			<div id="main_notice_wrap" class="back_white radius">
				<p id="main_notice_title" class="font_THEmpgtB font_15px">공지사항</p>
				<div id="notice_input_div">
				</div>
			</div>
        </section>

    <%@ include file="/WEB-INF/view/footer.jsp" %>
    <script type="text/javascript">
		$("#main_free_board_title").click(function() {
			location.href = "BoardReadAll";
		});
		
		$("#main_routine_board_title").click(function() {
			location.href = "";
		});
		
		$("#main_pt_board_title").click(function() {
			location.href = "ptlist";
		});
		
		$("#main_notice_title").click(function() {
			location.href = "";
		});
		
		$("#main_login_btn").click(function() {
			location.href = "login";
		});
		
		$("#main_join_btn").click(function() {
			location.href = "memberjoin";
		});
		
		$("#main_find_id").click(function() {
			location.href = "FindId";
		});
		
		$("#main_find_pwd").click(function() {
			location.href = "findpwd";			
		});
		
		$("#main_logout_btn").click(function() {
			location.href = "logout";
		});
		
		$("#main_mypage_btn").click(function() {
			<c:if test="${not empty ssMvo && ssMvo.memberNo < 11}">
     		location.href= "dashboard";
    		</c:if>
     		<c:if test="${not empty ssMvo && ssMvo.memberNo > 10}">
     		location.href= "membermypage";
    		</c:if>
		});
		
		var boardVoList = [];
		<c:forEach var="vo" items="${boardVoList}">
			var vo = {
				boardNo : ${vo.boardNo},
				boardTitle : "${vo.boardTitle}",
				rCnt : ${vo.rCnt}
			}
			boardVoList.push(vo);
		</c:forEach>
		
		var ptVoList = [];
		<c:forEach var="vo" items="${ptVoList}">
			var vo = {
				ptNo : ${vo.ptNo},
				ptName : "${vo.ptName}",
				favoriteCnt : ${vo.favoriteCnt}
			}
			ptVoList.push(vo);
		</c:forEach>
		
		var noticeVoList = [];
		<c:forEach var="vo" items="${noticeVoList}">
			var vo = {
				noticeNo : ${vo.noticeNo},
				notiTitle : "${vo.notiTitle}",
				notiDate : new Date('${vo.notiDate}')
			}
			noticeVoList.push(vo);
		</c:forEach>
		
		var routineVoList = [];
		<c:forEach var="vo" items="${routineVoList}">
			var vo = {
				routineboardNo : ${vo.routineboardNo},
				routineboardTitle : "${vo.routineboardTitle}",
				rCnt : '${vo.rCnt}'
			}
			routineVoList.push(vo);
		</c:forEach>
		
		function getFormatDate(date) {
			var year = date.getFullYear(); //yyyy
			var month = (1 + date.getMonth()); //M
			month = month >= 10 ? month : '0' + month; //month 두자리로 저장
			var day = date.getDate(); //d
			day = day >= 10 ? day : '0' + day; //day 두자리로 저장
			return year + '-' + month + '-' + day; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
		}
		
		$(function () {
			for(var i = 0; i < boardVoList.length; i++) {
				$("#board_input_div").append('<p class="board_input_title font_THEmpgtM font_12px font_color_rgb"><span>'+boardVoList[i].boardTitle +'['+boardVoList[i].rCnt+']</span></p>');
				$('.board_input_title span').eq(i).click(function() {
					location.href = "boardread?bno=" + boardVoList[$('.board_input_title span').index(this)].boardNo;
				});
				$('.board_input_title span').eq(i).css('cursor', 'pointer');
			}
			
			for(var i = 0; i < routineVoList.length; i++) {
				$("#routineboard_input_div").append('<p class="routineboard_input_title font_THEmpgtM font_12px font_color_rgb"><span>'+routineVoList[i].routineboardTitle +'['+routineVoList[i].rCnt+']</span></p>');
				$('.board_input_title span').eq(i).click(function() {
					location.href = "routineboardread?bno=" + routineVoList[$('.board_input_title span').index(this)].routineboardNo;
				});
				$('.routineboard_input_title span').eq(i).css('cursor', 'pointer');
			}
			
			for(var i = 0; i < ptVoList.length; i++) {
				$("#pt_input_div").append('<p class="pt_input_title font_THEmpgtM font_12px font_color_rgb"><span class="pt_lacation_href">'+ptVoList[i].ptName +'<span class="float_right cursor_none">즐겨찾기:'+ptVoList[i].favoriteCnt+'</span></p>');
				$('.pt_lacation_href').eq(i).click(function() {
					location.href = "ptread?ptNo=" + ptVoList[$('.pt_lacation_href').index(this)].ptNo;
				});
				$('.pt_lacation_href').eq(i).css('cursor', 'pointer');
				$('.cursor_none').eq(i).css('cursor', 'none');
			}
			for(var i = 0; i < noticeVoList.length; i++) {
				$("#notice_input_div").append('<div class="notice_div"></div>');
				$('.notice_div').eq(i).append('<p class="notice_input_date font_THEmpgtM font_12px font_color_rgb">'+ getFormatDate(noticeVoList[i].notiDate) +'</p>');
				$('.notice_div').eq(i).append('<p class="notice_input_title font_THEmpgtM font_12px font_color_rgb"><span>'+ noticeVoList[i].notiTitle +'</span></p>');
				$('.notice_input_title span').eq(i).click(function() {
					location.href = "noticeread?noticeNo=" + noticeVoList[$('.notice_input_title span').index(this)].noticeNo;
				});
				$('.notice_input_title span').eq(i).css('cursor', 'pointer');
			}
		})
    </script>
</body>
</html>