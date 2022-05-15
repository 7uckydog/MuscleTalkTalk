<%@ include file="/WEB-INF/view/font.jsp"%>
<%@ include file="/WEB-INF/view/csslink3_mp.jsp"%>
<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	body{
	    width: 1200px;
	    margin: 0 auto;
	}
	*{
	    text-decoration: none;
	}
	footer > div > ul{
    	margin-left: 20px;
    	padding: 30px;
    	color: gray;
    	line-height: 15px;
	}
	#member_info_read{
		margin-bottom: 100px;
	}
</style>
<style>
.menu>li {
	display: list-item;
	text-align: center;
	padding-top: 12px;
}
#li_6 {
	text-decoration: underline;
}
a, a:visited, a:link{
    color: rgb(94, 94, 94);
}
#btn_reject, #btn_confirm{
        width: 130px;
        height: 30px;
        font-size: 12px;
        color: white;
        background-color: #4B4DB2;
        border: 1px solid #4B4DB2;
        line-height: 30px;
        cursor: pointer;
    }
#btn_reject:hover, #btn_confirm:hover{
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}
.btn_reject_confirm{
	font-family:'THEmpgtR';
	text-align: right;
    float: right;
    margin-right: 65px;
    display: inline-block;
    margin-bottom: 65px;
   /*  position: absolute; */
}
</style>
</head>
<body>
<%
	MemberVo vo = (MemberVo) request.getAttribute("mvo");
	
	request.setAttribute("memberNo", vo.getMemberNo());
	request.setAttribute("trainerConfirm", vo.getTrainerConfirm());
	request.setAttribute("memberTrainer", vo.getMemberTrainer());
	
%>
<c:if test="${empty ssMvo}">
	<jsp:forward page="/WEB-INF/view/member/login.jsp"></jsp:forward>
</c:if>
<%@ include file="/WEB-INF/view/template.jsp"%>
		<section id="section1">
            <div id="mp_main_text">
	           트레이너 상세 조회
            </div>
            <div id="member_info_read">
            <!-- 트레이너라면 다르게 보여야 하기 때문에 추가 예정 TODO -->
                <ul>
	                <li id="member_ctg">
	                	<c:if test="${mvo.memberTrainer == 'F' && mvo.memberNo>10}">
		 					회원
		 				</c:if>
	                	<c:if test="${mvo.memberTrainer == 'F' && mvo.memberNo<11}">
		 					관리자
		 				</c:if>
		 				<c:if test="${mvo.memberTrainer == 'R'}">
		 					회원
		 				</c:if>
		 				<c:if test="${mvo.memberTrainer == 'T'}">
		 					트레이너
		 				</c:if>
		 			</li>
                    <li class="info_menu">성명</li>
                    <li class="info_info">${mvo.memberName}</li>
                    <li class="info_menu">아이디</li>
                    <li class="info_info">${mvo.memberId}</li>
                    <li class="info_menu">닉네임</li>
                    <li class="info_info">${mvo.memberNickname}</li>
                    <li class="info_menu">이메일</li>
                    <li class="info_info">${mvo.memberEmail}</li>
                    <li class="info_menu">전화번호</li>
                    <li class="info_info">${mvo.memberPhone}</li>
                    <li class="info_menu">성별</li>
                    <li class="info_info">${mvo.memberGender}</li>
                    <li class="info_menu">가입일</li>
                    <li class="info_info">${mvo.memberJoinDate}</li>
                    <li class="info_menu">나이</li>
                    <li class="info_info">${mvo.memberAge} 살</li>
                    <li class="info_menu">신장(cm)</li>
                    <li class="info_info">${mvo.memberHeight} cm</li>
                    <li class="info_menu">몸무게(kg)</li>
                    <li class="info_info">${mvo.memberWeight} kg</li>
                    <li class="info_menu">운동목표</li>
                    <li class="info_info">
	                    <c:choose>
		                    <c:when test="${mvo.memberPurpose == 1}">
							선택안함
		                    </c:when>
		                    <c:when test="${mvo.memberPurpose == 2}">
							감량
		                    </c:when>
		                    <c:when test="${mvo.memberPurpose == 3}">
							증량
		                    </c:when>
		                    <c:when test="${mvo.memberPurpose == 4}">
							체력관리
		                    </c:when>
		                    <c:when test="${mvo.memberPurpose == 5}">
							바디프로필
		                    </c:when>
		                    <c:when test="${mvo.memberPurpose == 6}">
							기타
		                    </c:when>
		                    <c:otherwise>
		                    error
		                    </c:otherwise>
	                    </c:choose>
 					</li>
                    <li class="info_menu">관심사</li>
                    <li class="info_info">
	                    <c:choose>
		                    <c:when test="${mvo.memberConcern == 1}">
							선택안함
		                    </c:when>
		                    <c:when test="${mvo.memberConcern == 2}">
							웨이트트레이닝
		                    </c:when>
		                    <c:when test="${mvo.memberConcern == 3}">
							필라테스
		                    </c:when>
		                    <c:when test="${mvo.memberConcern == 4}">
							요가
		                    </c:when>
		                    <c:when test="${mvo.memberConcern == 5}">
							기타
		                    </c:when>
		                    <c:otherwise>
		                    error
		                    </c:otherwise>
	                    </c:choose>
 					</li>
		 			<!-- 트레이너라면 더 보이게 -->
		 			<c:if test="${mvo.memberTrainer == 'T' }">
		 				<li class="info_menu">헬스장명</li>
		                <li class="info_info">${mvo.gymName}</li>
		                <li class="info_menu">헬스장 주소</li>
		                <li class="info_info">${mvo.gymLocation}</li>
		                <li class="info_menu">인증 여부</li>
		                <li class="info_info">${mvo.trainerConfirm}</li>
		                <li class="info_menu">인증 서류</li>
		                <li class="info_info"><img src="${mvo.trainerFile}"></li>
		 			</c:if>
		 		</ul>
		 	</div>
		 	<div class="btn_reject_confirm">
	            <button type="button"  id="btn_reject">트레이너 신청 반려</button>
	            <button type="button"  id="btn_confirm">트레이너 인증 처리</button>
	            <form name="confirm_form">
	            	<input type="hidden" id="input_hidden_member_no" name="memberNo">
	            	<input type="hidden" id="input_hidden_member_trainer" name="memberTrainer">
	            	<input type="hidden" id="input_hidden_trainer_confirm" name="trainerConfirm">
	            </form>
	        </div>
		 	<%@ include file="/WEB-INF/view/footer.jsp"%>		
        </section>
        <section id="section2">
            <div>
            <c:if test="${not empty ssMvo.memberPhoto}">
            	<img id="prifile" src="${ssMvo.memberPhoto}">
            </c:if>
            <c:if test="${empty ssMvo.memberPhoto}">
            	<img id="prifile" src="<%= request.getContextPath() %>/cssfolder/images/default_pf.png">
            </c:if>
                <ul>
                    <li id="member_nickname">${ssMvo.memberNickname}</li>
                    <li id="member_id">${ssMvo.memberId}</li>
                </ul>
                <input type="button" name="mp_logout" id="mp_logout" value="로그아웃">
            </div>
            <div>
                <ul class="menu">
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
	<script>
	    $("#mp_logout").click(function(){
	    	alert("로그아웃 되었습니다.");
	    	location.href="logout";
	    })
	    $("#btn_confirm").click(function(){
        	$("#input_hidden_member_no").val(${mvo.memberNo});
        	$("#input_hidden_member_trainer").val('${mvo.memberTrainer}');
        	$("#input_hidden_trainer_confirm").val('${mvo.trainerConfirm}');
	    	confirm_form.action = "trainerconfirm";
	    	confirm_form.method = 'post';
	    	confirm_form.submit();
	    })
	    $("#btn_reject").click(function(){
        	$("#input_hidden_member_no").val(${mvo.memberNo});
        	$("#input_hidden_member_trainer").val('${mvo.memberTrainer}');
        	$("#input_hidden_trainer_confirm").val('${mvo.trainerConfirm}');
	    	confirm_form.action = "trainerreject";
	    	confirm_form.method = 'post';
	    	confirm_form.submit();
	    })
	  
	</script>
        
</body>
</html>