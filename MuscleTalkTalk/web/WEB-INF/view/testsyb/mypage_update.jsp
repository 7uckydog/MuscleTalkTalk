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
<title>프로필 정보 수정</title>
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
	.info_ph{
            font-family:'THEmpgtB';
            font-size: 11.5px;
            color: rgb(94, 94, 94);
            width: 150px;
            height: 27px;
            background-color: rgb(236, 236, 236);
            border: 0px;
            border-radius: 3px;
            text-align: center;
            margin-left:4px;
        }
        #member_nickname_check, #member_mail_check{
            width: 70px; 
            margin-left: 8px; 
            height: 27px;
            border: 0px;
            font-size: 10.5px;
            font-family:'THEmpgtM';
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
            cursor: pointer;
           margin-top: 3.5px;
        }
        #member_mail_check{
        	margin-top: 7.5px;
        }
        #member_nickname_check2, #member_mail_check2{
            display: none;
            width: 70px; 
            margin-left: 8px; 
            height: 27px;
            border: 0px;
            font-size: 10.5px;
            font-family:'THEmpgtM';
            color: white;
            background-color: #4B4DB2;
            cursor: pointer;
            margin-top: 3.5px;
        }
        select {
            width: 150px;
            height: 27px;
            background-color: rgb(236, 236, 236);
            border: 0px;
            border-radius: 3px;
            text-align: center;
            font-family:'THEmpgtB';
            font-size: 11.5px;
            color: rgb(94, 94, 94);
            cursor: pointer;
            margin-left: 4px;
        }
        #edit_btn{
            margin: 50px 80px 0px 630px;
            width: 70px;
            height: 30px;
            background-color: rgb(224, 224, 224);
            color: rgb(64, 64, 64);
            font-size: 10.5px;
            font-family:'THEmpgtM';
            border: 0px;
            cursor: pointer;
        }
</style>
</head>
<body>
<%@ include file="/WEB-INF/view/template.jsp"%>

		<section id="section1">
            <div id="mp_main_text">
                <p>회원 정보 수정
                </p>
                <p style="height: 20px;"></p>
            </div>
            
            <div id="member_info_read">
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
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="text" value="${ssMvo.memberNickname}">
                    </li>
                    <input type="button" value="중복 확인" id="member_nickname_check">
                    <input type="button" value="확인 완료" id="member_nickname_check2">
                    <li class="info_menu">이메일</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="text" value="${ssMvo.memberEmail}">
                    </li>
                    <input type="button" value="인증하기" id="member_mail_check">
                    <input type="button" value="인증 완료" id="member_mail_check2">            
                    <li class="info_menu">전화번호</li>
                    <li class="info_info">
                        <input class="info_ph" type="text" value="${ssMvo.memberPhone}">
                    </li>
                    <li class="info_menu">성별</li>
                    <li class="info_info">${ssMvo.memberGender}</li>
                    <li class="info_menu">가입일</li>
                    <li class="info_info">${ssMvo.memberJoinDate}</li>
                    <li class="info_menu">나이</li>
                    <li class="info_info">
                        <input class="info_ph" type="text" value="${ssMvo.memberAge}">
                    </li>
                    <li class="info_menu">신장(cm)</li>
                    <li class="info_info">
                        <input class="info_ph" type="text" value="${ssMvo.memberHeight} cm">
                    </li>
                    <li class="info_menu">몸무게(kg)</li>
                    <li class="info_info">
                        <input class="info_ph" type="text" value="${ssMvo.memberWeight} kg">
                    </li>
                    <li class="info_menu">운동목표</li>
                    <li class="info_info">
                    	<select name="member_purpose" id="member_purpose">
                    		<option value="1"> 선택안함</option>
                            <option value="2"> 감량</option>
                            <option value="3"> 증량</option>
                            <option value="4"> 체력관리</option>
                            <option value="5"> 바디프로필</option>
                            <option value="6"> 기타</option>
                        </select>
 					</li>
                    <li class="info_menu">관심사</li>
                    <li class="info_info">
	                    <select name="member_concern" id="member_concern">
                        <option value="1"> 선택안함</option>
                        <option value="2"> 웨이트트레이닝</option>
                        <option value="3"> 필라테스</option>
                        <option value="4"> 요가</option>
                        <option value="5"> 기타</option>
                    </select>
 					</li>	
	 			<!-- 트레이너라면 더 보이게 -->
	 			<c:if test="${ssMvo.memberTrainer == 'T' }">
	 				<li class="info_menu">헬스장명</li>
	                <li class="info_info">${ssMvo.gymName}</li>
	                <li class="info_menu">헬스장 주소</li>
	                <li class="info_info">${ssMvo.gymLocation}</li>
	              
 				</c:if>
 			</ul>  		
        </section>
        <section id="section2">
            <div>
                <div id="prifile"></div>
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
                    <li id="program_list">
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

                    <!-- <li id="program_list">예약 프로그램 조회</li>
                    <li id="to_trainer">트레이너 계정 전환</li> -->
                    
                    <li id="inquiry">1:1 문의</li>
                    <li id="secession">탈퇴하기</li>
                </ul>
            </div>
        </div>    
        </section>
	<script>
        $("#mp_logout").click(function(){
        	alert("로그아웃 되었습니다.");
        	location.href="logout";
        })
        $("#member_purpose").val("${ssMvo.memberPurpose}").prop("selected", true);
        $("#member_concern").val("${ssMvo.memberConcern}").prop("selected", true);
	</script>
        
<%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>