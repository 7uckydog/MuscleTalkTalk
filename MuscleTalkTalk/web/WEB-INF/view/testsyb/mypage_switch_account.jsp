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
<title>트레이너 계정 전환</title>
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
</style>
<style>
	#info_section{
            margin-top: 55px;
            margin-left: 160px;
        }
        .menu_name{
            text-align: left;
            margin-left: 63px;
            margin-bottom: 10px;
            font-family:'THEmpgtM';
            font-size : 12px;
        }
        .menu_val{
            text-align: left;
            margin-left: 63px;
            margin-bottom: 35px;
            font-size: 11.5px;
            color: rgb(94, 94, 94);
            width: 300px;
            height: 27px;
            background-color: rgb(236, 236, 236);
            border: 0px;
            border-radius: 3px;
            font-family:'THEmpgtM';
        }
        #file_upload{
            font-family:'THEmpgtM';
            font-size: 10.5px;
            color: rgb(94, 94, 94);
            background-color: transparent;
        }
        input::placeholder{
        	font-family:'THEmpgtM';
            font-size: 10.5px;
        }
        textarea::placeholder{
            font-family:'THEmpgtM';
            font-size: 10.5px;
            padding-top: 2px;
            
        }
        #gym_location_txt{
            resize: none;
            height: 40px;
            margin-bottom: 10px;
        }
        #rq_btn{
            margin: 50px 80px 100px 630px;
            width: 70px;
            height: 30px;
            background-color: rgb(224, 224, 224);
            color: rgb(64, 64, 64);
            font-size: 10.5px;
            font-family:'THEmpgtM';
            border: 0px;
            cursor: pointer;
        }
        #to_trainer{
        	text-decoration: underline;
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
                <p>트레이너 계정 전환
                </p>
                <p style="height: 20px;"></p>
            </div>
            <form id="submit" action="memberDoswitchaccount" method="post" enctype="multipart/form-data">
            	<div id="info_section">
	                <div id="certification_file">
	                    <p class="menu_name">인증 서류</p>
	                    <input type="file" id="file_upload" value="file_upload" name="file_upload" accept="image/*" class="menu_val" required> 
	                </div>
	                <div id="gym_name">
	                    <p class="menu_name">헬스장명</p>
	                    <input type="text" id="gym_name_txt" name="gym_name_txt" placeholder=" 헬스장명을 입력해주세요." class="menu_val" required> 
	                </div>
	                <div id="gym_location">
	                    <p class="menu_name">헬스장 주소</p>
	                    <textarea id="gym_location_txt" name="gym_location_txt" placeholder=" 헬스장 주소를 입력해주세요." class="menu_val" required></textarea>
	                </div>
            	</div>
            	<input type="submit" id="rq_btn" value="심사요청">
            </form>
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
                <input type="button" name="logout" id="mp_logout" value="로그아웃">
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
                    	<c:if test="${ssMvo.memberTrainer == 'T'}">
                    		예약 프로그램 조회
                    	</c:if>
                    </li>
                    <li id="to_trainer">
                    	<c:if test="${ssMvo.memberTrainer == 'F'}">
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
	$("#to_trainer").click(function(){
		location.href="memberswitchaccount";
	})

</script>
</body>
</html>