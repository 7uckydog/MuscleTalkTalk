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
<title>회원탈퇴</title>
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
		#wd_noti{
            text-align: center;
            font-family:'THEmpgtR';
            line-height: 18px;
            margin-bottom: 40px;
            font-size: 12px;
        }
        #pwd{
            text-align: center;
            width: 290px;
            background-color: #ECECEC;
            margin: 0 auto;
        }
        #member_password_org{
            float: left;
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
        #pwd_see{
            float: left;
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
        #wd_btn{
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
        #withdrawal{
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
                <p>회원탈퇴
                </p>
                <p style="height: 20px;"></p>
            </div>
            <div id="member_info_read">
                <p id="wd_noti">
                    회원 탈퇴 시, 정보가 초기화 되며 모든 데이트가 복구할 수 없는 형태로 파기됩니다.
                    <br>
                    신중하게 결정 후 회원 탈퇴를 진행해 주세요.
                </p>
                <div id="pwd">
                    <input type="password" id="member_password_org" placeholder="비밀번호 입력" required>
                    <input type="button" id="pwd_see" value="보기">
                </div>
                <input type="button" id="wd_btn" value="탈퇴하기">
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
                    </li>
                    <li id="program_list">
                    	<c:if test="${ssMvo.memberTrainer == 'T'}">
                    		내 프로그램 조회
                    	</c:if>
                    </li>
                    
                    <li id="inquiry">1:1 문의</li>
                    <li id="secession">탈퇴하기</li>
                </ul>
            </div>
        </section>
	<script type="text/javascript">
		$("#pwd_see").click(function(){
			if($("#member_password_org").val() == "" || $("#member_password_org").val() == null){
				
			} else {
				if($("#member_password_org").attr("type") == "password"){
					$("#member_password_org").attr("type","text");
					$("#pwd_see").val("숨기기");
				} else {
					$("#member_password_org").attr("type","password");
					$("#pwd_see").val("보기");
				}			
			}	
		})
		$("#wd_btn").click(function(){
			// 비밀번호 입력을 안 했다면
			if($("#member_password_org").val() == null || $("#member_password_org").val() == ""){
				alert("비밀번호를 입력해주세요.");
				return;
			}
			// 입력한 비밀번호가 회원 비밀번호와 일치하지 않다면
			if($("#member_password_org").val() != ${ssMvo.memberPassword}){
				alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
				return;
			}
			
			var msg = confirm ("한 번 회원 탈퇴가 진행되면 되돌릴 수 없습니다. 정말 탈퇴하시겠습니까?");
			if(msg){
				$.ajax({
					url:"memberwithdrawal.ax",
					type: "post",
					data: {memberPassword: $("#member_password_org").val()},
					success: function(result){
						if(result == 1){
							alert("회원 탈퇴가 완료되었습니다. 머슬톡톡을 이용해주셔 감사합니다.");
							location.href="main";
						} else if (result == 0){
							alert("회원 탈퇴에 실패했습니다. 탈퇴를 다시 진행해주세요.");
							location.href="memberwithdrawalcontroller";
						}
					},
					error: function(result){
						alert("오류 - 회원 탈퇴 실패");
					}
				})
			} else {
				alert("회원 탈퇴가 취소되었습니다.");
				location.href="memberwithdrawalcontroller";
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
	$("#ok_btn").click(function(){
		location.href="memberinquiry";
	})
</script>        
</body>
</html>