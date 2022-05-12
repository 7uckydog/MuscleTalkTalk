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
<title>마이페이지</title>
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
</head>
<body>
<c:if test="${empty ssMvo}">
	<jsp:forward page="/WEB-INF/view/member/login.jsp"></jsp:forward>
</c:if>
<%@ include file="/WEB-INF/view/template.jsp"%>
		<section id="section1">
            <div id="mp_main_text">
	            <c:if test="${ssMvo.memberTrainer == 'F'}">
	 				<p>안녕하세요, ${ssMvo.memberNickname} 회원님!<br>
	                머슬톡톡입니다.</p>
	 			</c:if>
	 			<c:if test="${ssMvo.memberTrainer == 'R'}">
	 				<p>안녕하세요, ${ssMvo.memberNickname} 회원님!<br>
	                머슬톡톡입니다.</p>
	 			</c:if>
	 			<c:if test="${ssMvo.memberTrainer == 'T'}">
	 				<p>안녕하세요, ${ssMvo.memberNickname} 트레이너님!<br>
	                머슬톡톡입니다.</p>
	 			</c:if>
            </div>
            <div id="member_info_read">
            <!-- 트레이너라면 다르게 보여야 하기 때문에 추가 예정 TODO -->
                <ul>
	                <li id="member_ctg">
	                	<c:if test="${ssMvo.memberTrainer == 'F'}">
		 					회원
		 				</c:if>
		 				<c:if test="${ssMvo.memberTrainer == 'R'}">
		 					회원
		 				</c:if>
		 				<c:if test="${ssMvo.memberTrainer == 'T'}">
		 					트레이너
		 				</c:if>
		 			</li>
                    <li class="info_menu">성명</li>
                    <li class="info_info">${ssMvo.memberName}</li>
                    <li class="info_menu">아이디</li>
                    <li class="info_info">${ssMvo.memberId}</li>
                    <li class="info_menu">닉네임</li>
                    <li class="info_info">${ssMvo.memberNickname}</li>
                    <li class="info_menu">이메일</li>
                    <li class="info_info">${ssMvo.memberEmail}</li>
                    <li class="info_menu">전화번호</li>
                    <li class="info_info">${ssMvo.memberPhone}</li>
                    <li class="info_menu">성별</li>
                    <li class="info_info">${ssMvo.memberGender}</li>
                    <li class="info_menu">가입일</li>
                    <li class="info_info">${ssMvo.memberJoinDate}</li>
                    <li class="info_menu">나이</li>
                    <li class="info_info">${ssMvo.memberAge} 살</li>
                    <li class="info_menu">신장(cm)</li>
                    <li class="info_info">${ssMvo.memberHeight} cm</li>
                    <li class="info_menu">몸무게(kg)</li>
                    <li class="info_info">${ssMvo.memberWeight} kg</li>
                    <li class="info_menu">운동목표</li>
                    <li class="info_info">
	                    <c:choose>
		                    <c:when test="${ssMvo.memberPurpose == 1}">
							선택안함
		                    </c:when>
		                    <c:when test="${ssMvo.memberPurpose == 2}">
							감량
		                    </c:when>
		                    <c:when test="${ssMvo.memberPurpose == 3}">
							증량
		                    </c:when>
		                    <c:when test="${ssMvo.memberPurpose == 4}">
							체력관리
		                    </c:when>
		                    <c:when test="${ssMvo.memberPurpose == 5}">
							바디프로필
		                    </c:when>
		                    <c:when test="${ssMvo.memberPurpose == 6}">
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
		                    <c:when test="${ssMvo.memberConcern == 1}">
							선택안함
		                    </c:when>
		                    <c:when test="${ssMvo.memberConcern == 2}">
							웨이트트레이닝
		                    </c:when>
		                    <c:when test="${ssMvo.memberConcern == 3}">
							필라테스
		                    </c:when>
		                    <c:when test="${ssMvo.memberConcern == 4}">
							요가
		                    </c:when>
		                    <c:when test="${ssMvo.memberConcern == 5}">
							기타
		                    </c:when>
		                    <c:otherwise>
		                    error
		                    </c:otherwise>
	                    </c:choose>
 					</li>
		 			<!-- 트레이너라면 더 보이게 -->
		 			<c:if test="${ssMvo.memberTrainer == 'T' }">
		 				<li class="info_menu">헬스장명</li>
		                <li class="info_info">${ssMvo.gymName}</li>
		                <li class="info_menu">헬스장 주소</li>
		                <li class="info_info">${ssMvo.gymLocation}</li>
		 			</c:if>
		 		</ul>
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
                <ul id="mypage_menu">
                    <li id="info_edit">프로필 정보 수정</li>
                    <li id="password_edit">비밀번호 변경</li>
                    <li id="content_list">내 콘텐츠 조회</li>
                    <li id="reservation_list">
                    	<c:if test="${ssMvo.memberTrainer == 'F'}">
                    		예약 프로그램 조회
                    	</c:if>
                    	<c:if test="${ssMvo.memberTrainer == 'R'}">
                    		예약 프로그램 조회
                    	</c:if>
                    </li>
                    <li id="to_trainer">
                    	<c:if test="${ssMvo.memberTrainer == 'F'}">
                    		트레이너 계정 전환
                    	</c:if>
                    	<c:if test="${ssMvo.memberTrainer == 'R'}">
                    		트레이너 계정 전환
                    	</c:if>
                    </li>
                    <li id="program_list">
                    	<c:if test="${ssMvo.memberTrainer == 'T'}">
                    		내 프로그램 조회
                    	</c:if>
                    </li>
                    
                    <li id="inquiry">1:1 문의</li>
                    <li id="withdrawal">탈퇴하기</li>
                </ul>
            </div>
        </div>    
        </section>
	<script>
	    $("#mp_logout").click(function(){
	    	alert("로그아웃 되었습니다.");
	    	location.href="logout";
	    })
	    $("#info_edit").click(function(){
	    	location.href="memberupdateprofile";
	    })
	    $("#password_edit").click(function(){
	    	location.href="memberupdatepassword";
	    })
	    $("#info_edit").click(function(){
	    	location.href="memberupdateprofile";
	    })
	    $("#content_list").click(function(){
	    	location.href="memberreadcontent";
	    })
	    $("#inquiry").click(function(){
			location.href="memberinquiry";
		})
		$("#reservation_list").click(function(){
			location.href="memberreadreservationlist";
		})
		$("#program_list").click(function(){
			location.href="myptprogram";
		})
		$("#withdrawal").click(function(){
			location.href="memberwithdrawalcontroller";
		})
	</script>
        
</body>
</html>