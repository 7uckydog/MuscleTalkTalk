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
<title>비밀번호 변경</title>
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
       	.info_ph{
            font-family:'THEmpgtB';
            font-size: 11.5px;
            color: rgb(94, 94, 94);
            width: 200px;
            height: 27px;
            background-color: rgb(236, 236, 236);
            border: 0px;
            border-radius: 3px;
            text-align: center;
            vertical-align: middle;
        }
        input::placeholder{
        	font-family:'THEmpgtM';
            font-size: 10.5px;
        }
        #edit_btn{
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
        #pwd_see_1, #pwd_see_2, #pwd_see_3{
        	position: absolute;
        	margin-top: 4px;
        	width: 70px; 
            margin-left: 8px; 
            height: 27px;
            border: 0px;
            font-size: 10.5px;
            font-family:'THEmpgtM';
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
            cursor: pointer;
        }
        #password_edit{
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
                <p>비밀번호 변경
                </p>
                <p style="height: 20px;"></p>
            </div>
            <div id="member_info_read">
                <ul>
                    <li class="info_menu">기존 비밀번호</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="password" id="member_password_org" placeholder="기존 비밀번호 입력" required>
                        <input type="button" id="pwd_see_1" value="보기">
                    </li> 
                    <li class="info_menu">변경 비밀번호</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="password" id="member_password_edit" placeholder="변경 비밀번호 입력" required>
                        <input type="button" id="pwd_see_2" value="보기">
                    </li>
                    <li class="info_menu">비밀번호 확인</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="password" id="member_password_edit2" placeholder="변경 비밀번호 입력" required>
                        <input type="button" id="pwd_see_3" value="보기">
                    </li>
                </ul>
                <input type="button" id="edit_btn" value="수정">
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
                <input type="button" name="logout" id="mp_logout" value="로그아웃">
            </div>
            <div>
                <ul id="mypage_menu">
                    <li id="info_edit">프로필 정보 수정</li>
                    <li id="password_edit">비밀번호 변경</li>
                    <li id="content_list">내 콘텐츠 조회</li>
                    <li id="program_list">예약 프로그램 조회</li>
                    <li id="to_trainer">트레이너 계정 전환</li>
                    <li id="inquiry">1:1 문의</li>
                    <li id="secession">탈퇴하기</li>
                </ul>
            </div>
        </section>
        
<script>
	//보기 버튼 클릭 시
	$("#pwd_see_1").click(function(){
		if($("#member_password_org").val() == "" || $("#member_password_org").val() == null){
			
		} else {
			if($("#member_password_org").attr("type") == "password"){
				$("#member_password_org").attr("type","text");
				$("#pwd_see_1").val("숨기기");
			} else {
				$("#member_password_org").attr("type","password");
				$("#pwd_see_1").val("보기");
			}			
		}	
	})
	
	$("#pwd_see_2").click(function(){
		if($("#member_password_edit").val() == "" || $("#member_password_edit").val() == null) {
			
		} else {
			if($("#member_password_edit").attr("type") == "password"){
				$("#member_password_edit").attr("type","text");
				$("#pwd_see_2").val("숨기기");
			} else {
				$("#member_password_edit").attr("type","password");
				$("#pwd_see_2").val("보기");
			}
		}
	})
	
	$("#pwd_see_3").click(function(){
		if($("#member_password_edit2").val() == "" || $("#member_password_edit2").val() == null){
			
		} else {
			if($("#member_password_edit2").attr("type") == "password"){
				$("#member_password_edit2").attr("type","text");
				$("#pwd_see_3").val("숨기기");
			} else {
				$("#member_password_edit2").attr("type","password");
				$("#pwd_see_3").val("보기");
			}
		}
	})

	// 수정하기 버튼 클릭 시
	$("#edit_btn").click(function(){
		if($("#member_password_org").val() == "" || $("#member_password_org").val() == null){
			alert("기존 비밀번호를 입력해주세요.");
			return;
		}
		if($("#member_password_edit").val() == "" || $("#member_password_edit").val() == null){
			alert("변경 비밀번호를 입력해주세요.");
			return;
		}
		if($("#member_password_edit2").val() == "" || $("#member_password_edit2").val() == null){
			alert("비밀번호 확인을 입력해주세요.");
			return;
		}
		if($("#member_password_org").val() != "${ssMvo.memberPassword}"){
			alert("기존 비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			return;
		}
		if($("#member_password_org").val() == $("#member_password_edit").val()){
			alert("기존 비밀번호와 변경 비밀번호는 동일할 수 없습니다. 다른 비밀번호를 입력해주세요.");
			return;
		}
		if($("#member_password_edit").val() != $("#member_password_edit2").val()){
			alert("변경 비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
			return;
		}
		
		// 비밀번호 형식 확인
		var chkPwd = false;
	    var pwd = /^[0-9a-zA-Z]{4,20}$/;
	    var pwdVal = $("#member_password_edit").val();
	    		
	    if(!pwd.test(pwdVal)){
	    	chkPwd = false;
	    	alert("비밀번호 형식에 맞지 않습니다. 특수문자 및 한글을 제외한 4~20자리 숫자의 비밀번호를 입력해주세요. ");
	    } else {
	    	chkPwd = true;
	    	if($(this).val() == $("#member_password_edit2").val()) {
	    		chkPwd = true;
	    	}
	    }
		
	    if(chkPwd == true){
	    	$.ajax({
		    	url:"memberupdatepassword.ax",
				type: "post",
				data: {
					memberId: "${ssMvo.memberId}",
					memberPassword: $("#member_password_org").val(),
					memberNewPassword: $("#member_password_edit").val(),
				},
				success: function(result){
						alert("비밀번호 수정 완료");	
						location.href= "membermypage";
				},
				error: function(){
					alert("비밀번호 수정 ajax 오류 발생");
				}
		    })	    	
	    }
	})
</script>        
        
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
	    $("#mp_logout").click(function(){
	    	alert("로그아웃 되었습니다.");
	    	location.href="logout";
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
	</script>
</body>
</html>