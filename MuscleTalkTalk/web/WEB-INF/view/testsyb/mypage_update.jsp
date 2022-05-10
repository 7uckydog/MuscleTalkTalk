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
        #modal_all{
            position: fixed; top: 0; left: 0; 
            width: 100%; height: 100%;
            z-index: 1;
            background-color: rgba(128, 128, 128, 0.356);
            display: none;
        }
        #modal{
            width: 280px;
            height: 270px;
            position: relative;  top:30%;
            margin: auto;
            background-color: white;
            text-align: center;
        }
        #modal_title{
            font-family:'THEmpgtB';
            font-size: 12px;
            color: rgb(64, 64, 64);
            padding-top: 50px;
            padding-bottom: 10px;
        }
        #modal_subtext{
            font-family:'THEmpgtM';
            font-size: 12px;
            color: rgb(158, 158, 158);
            padding-bottom: 20px;
            padding-top: 20px;
            line-height: 15px;
            margin-bottom: 11px;
        }
         #modal_accept, #modal_cancel{
            font-family:'THEmpgtM';
            font-size: 12px;
            background-color: white;
            border: none;
            padding: 20px 45px;
            cursor: pointer;
        }
        #modal_accept{
            color: #4B4DB2;
        }
        #modal_cancel{
            color: #9E9E9E;
        }
        #modal_code{
            width: 200px;
            height: 30px;
            margin-bottom: 5px;
            font-family:'THEmpgtM';
            font-size: 12px;
            color: #9E9E9E;
            padding-left: 8px;
        }
        #modal_hr{
            margin-top: 25px;
            margin-bottom: 0px;
            border: 0.1px solid rgb(240, 240, 240);
            width: 280px;
        }
        #user_input{
            text-align: center;
        }
        #info_edit{
        	text-decoration: underline;
        }
        #p_all{
        	float: left;
        	margin-left: 105px;
        	margin-top: 20px;
        	margin-right: 30px;
        }
        #p_button{
        	clear:both;
        	margin-top: 60px;
        	cursor: pointer;
        	width: 110px;
        	height: 28px;
        	font-size: 12px;
        	font-size: 10.5px;
        	border: 0px;
    		font-family: 'THEmpgtM';
        	background-color:  rgb(224, 224, 224);
        	color: rgb(64, 64, 64);
        	text-align: center;
        	border: 0px;
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
                    <li class="info_info" id="member_id_update">${ssMvo.memberId}</li>
                    <li class="info_menu">닉네임</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" id="member_nickname_update" type="text" value="${ssMvo.memberNickname}">
                    </li>
                    <input type="button" value="중복 확인" id="member_nickname_check">
                    <input type="button" value="확인 완료" id="member_nickname_check2">
                    <li class="info_menu">이메일</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="text" id="member_email_update" value="${ssMvo.memberEmail}">
                    </li>
                    <input type="button" value="인증하기" id="member_mail_check">
                    <input type="button" value="인증 완료" id="member_mail_check2">            
                    <li class="info_menu">전화번호</li>
                    <li class="info_info">
                        <input class="info_ph" id="member_phone" type="text" value="${ssMvo.memberPhone}">
                    </li>
                    <li class="info_menu">성별</li>
                    <li class="info_info">${ssMvo.memberGender}</li>
                    <li class="info_menu">가입일</li>
                    <li class="info_info">${ssMvo.memberJoinDate}</li>
                    <li class="info_menu">나이</li>
                    <li class="info_info">
                        <input class="info_ph" id="member_age" type="text" value="${ssMvo.memberAge}">
                    </li>
                    <li class="info_menu">신장(cm)</li>
                    <li class="info_info">
                        <input class="info_ph" id="member_height" type="text" value="${ssMvo.memberHeight}">
                    </li>
                    <li class="info_menu">몸무게(kg)</li>
                    <li class="info_info">
                        <input class="info_ph" id="member_weight" type="text" value="${ssMvo.memberWeight}">
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
 				
 				<li class="info_menu">프로필 사진</li>
 				<li class="info_info">
 					<div id="p_all">
						<c:if test="${not empty ssMvo.memberPhoto}">
			            	<img id="prifile" src="${ssMvo.memberPhoto}">
			            </c:if>
			            <c:if test="${empty ssMvo.memberPhoto}">
			            	<img id="prifile" src="<%= request.getContextPath() %>/cssfolder/images/default_pf.png">
			            </c:if>
	            		<input type="file" id="file" name="file" style="display:none" onchange="f_check(this)" accept="image/jpg, image/jpeg, image/png"> 
            		</div>
 				</li>
 			</ul>
 			<input type="button" id="p_button" value="프로필 사진 변경">
 			<div id="modal_all" class="modal">
                <div id="modal" class="modal">
                    <!-- 모달창내용작성 -->
                    <div class="modal_text" class="modal">
                        <p id="modal_title" class="modal">
                            이메일 인증
                        </p>
                        <p id="modal_subtext" class="modal">
                            이메일 인증을 위해,<br>
                            이메일로 발송된 인증번호를 입력해 주세요.
                        </p>
                        <input type="text" id="modal_code" name="modal_code" placeholder="인증번호 입력" required class="modal"><br>
                        <hr id="modal_hr" class="modal">
                        <input type="button" id="modal_cancel" name="modal_cancel" value="취소" class="modal">
                        <input type="submit" id="modal_accept" name="modal_accept" value="확인" class="modal">
                    	<div id="hide_section"></div>
                    </div>
                </div>
            </div>
            <input type="button" id="edit_btn" value="수정">                    		
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

                    <!-- <li id="program_list">예약 프로그램 조회</li>
                    <li id="to_trainer">트레이너 계정 전환</li> -->
                    
                    <li id="inquiry">1:1 문의</li>
                    <li id="secession">탈퇴하기</li>
                </ul>
            </div>
			          
        </section>
	<script>
		// 마이페이지 내 로그아웃 버튼 클릭
        $("#mp_logout").click(function(){
        	alert("로그아웃 되었습니다.");
        	location.href="logout";
        }) 
        
    	// 회원가입 시 선택했던 목표와 관심사 선택되어있게
        $("#member_purpose").val("${ssMvo.memberPurpose}").prop("selected", true);
        $("#member_concern").val("${ssMvo.memberConcern}").prop("selected", true);
	</script>
    
    <!-- 회원정보 수정용 script -->
    <script>
//파일 유효성 체크
	var bool = false;
	
	function f_check(obj) {
		bool = false;
		var test1 = obj.value.lastIndexOf('.');
		var test2 = obj.value.substring(test1 + 1, obj.length);
		var type = test2.toLowerCase();
		if(type == 'jpg' || type == 'png' || type == 'jpeg'){
			bool = true;
		} else {
			alert("이미지 파일만 업로드 가능합니다.");
			obj.value = null;
			return false;
		}
	};    
    
 // 닉네임
	var chkNickname = false;
	var checkNicknameDu = 0;
	
		// 닉네임 형식 확인
    	$("#member_nickname_update").on("input", (function(){
    		checkIdDu = 0;
    		$("#member_nickname_check").show();
			$("#member_nickname_check2").hide();
    		
    		var nickname = /^[0-9a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]{4,10}$/;
    		var nicknameVal = $("#member_nickname_update").val();
    		
    		if(!nickname.test(nicknameVal)){
    			/* alert("닉네임 형식이 맞지 않습니다. 특수문자를 제외한 4~10자리로 설정해주세요."); */
    			chkNickname = false;
    		} else {
    			chkNickname = true;
    		}
    	}));

		// 닉네임 중복 확인 - 버튼 클릭
    	$("#member_nickname_check").click(function(){
    		if($("#member_nickname_update").val() == "${ssMvo.memberNickname}"){
            	alert("닉네임 수정 시 중복 확인이 가능합니다.");
            } else{
            	// 아이디 입력 칸에 입력한 값이 있다면
        		if($("#member_nickname_update").val() != "") {
        			if(chkNickname){
    	    				$.ajax({
    	    					url:"memberdunickname.ax",
    	    					type: "post",
    	    					data: {memberNickname: $("#member_nickname_update").val()},
    	    					success: function(result){
    	    						if(result == 0){
    	    							checkNicknameDu = 0;
    	    							alert("사용 가능한 닉네임입니다.")
    	    							$("#member_nickname_check").hide();
    	    							$("#member_nickname_check2").show();
    	    							
    	    						} else if(result > 0) {
    	    							checkNicknameDu = 1;
    	    							alert("이미 사용 중인 닉네임입니다. 다시 입력해 주세요.");
    	    							$("#member_nickname_update").focus();
    	    						} else {
    	    							checkNicknameDu = 2;
    	    							alert("오류 발생. 다시 시도해 주세요.")
    	    						}
    	    					},
    	    					error: function(result){
    	    						alert("ajax 오류 발생");
    	    					}
    	    				})
    	    		} else {
    	    			alert("닉네임 형식이 맞지 않습니다. 특수문자를 제외한 4~10자리로 설정해주세요.");
    	    		}	
        		} else if($("#member_nickname_update").val() == ""){
        			alert("닉네임을 입력해주세요.");
        		} else if(!nickname.test(nicknameVal)){
        			alert("닉네임 형식이 맞지 않습니다. 특수문자를 제외한 4~10자리로 설정해주세요.");
        			chkNickname = false;
        		}
            }
    	});
    
// 이메일    
		// 이메일 형식 확인
        var chkEmail = false;
        
        $("#member_email_update").on("input", function(){
        	var emailVal = $("#member_email_update").val();
			var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+)*$/;
			
			if(!email.test(emailVal)){
	    		chkEmail = false;
	    	} else {
	    		chkEmail = true;
	    	}
        })
        
    	// 이메일 인증하기 버튼 클릭 시
    	var checkEmailDu = 0;
        $("#member_mail_check").on("click", function(){
        if($("#member_email_update").val() == "${ssMvo.memberEmail}"){
        	alert("이메일 수정 후 이메일 인증이 가능합니다.");
        } else{
        	if(chkEmail == true){
           	 memberEmail = $("#member_email_update").val();
                console.log(memberEmail);
                if(memberEmail == "") {
                    alert("이메일를 입력하세요");
                    return;
                // 이메일 중복 여부 확인
                } else {
                	if($("#member_email_update").val() != "") {
    		    				$.ajax({
    		    				url:"memberduemail.ax",
    		    				type: "post",
    		    				data: {memberEmail: $("#member_email_update").val()},
    		    				success: function(result){
    		    					console.log(result);
    		    						if(result == 0){
    		    							checkNicknameDu = 0;
    		    							// 이메일 번호 전송을 위한 난수 insert - ajax
    		    				            $.ajax({
    		    				               url: "insertmailforjoin",
    		    				               type: "post",
    		    				               data:{email_certification_email: $("#member_email_update").val()},
    		    				               success: function(result){
    		    				                  console.log("난수 insert 성공");
    		    				                  $("#modal_all").show(); // 이메일 번호 입력용 모달 생성
    		    				               	  // 이메일 전송
    		    				                  $.ajax({
    		    				                	 url:"SendMailForJoinController",
    		    				                	 type:"post",
    		    				                	 data:{member_email:$("#member_email_update").val()},
    		    				                	 success: function(result){
    		    											console.log("이메일 전송 완료");
    		    											// 모달 내 취소 버튼 클릭 시, 테이블에서 정보 삭제
    		    					                        $("#modal_cancel").on("click", function(){
    		    					                        	$.ajax({
    		    					                          	  url:"deleteemailtablecontroller",
    		    					                              type:"post",
    		    					                              data:{member_email:$("#member_email_update").val()},
    		    					                              success: function(result){
    		    						                                console.log("이메일, 번호 일치 확인 & 테이블 정보 삭제 완료");
    		    						                                // 모달창 닫기
    		    						                                $("#modal_all").hide();
    		    						                                return;
    		    					                              },
    		    					                              error: function(request, status, error){
    		    					                              	 console.log(error);
    		    					                              }
    		    					                         });
    		    					                       })
    		    					                       // 모달 내 확인 버튼 클릭 시,
    		    					                       $("#modal_accept").on("click", function(){
    		    					                       // 인증번호를 미입력하고 확인버튼 클릭 시, 경고창
    		    					                       		if($("#modal_code").val()==""){
    		    					                        		alert("인증번호를 입력해주세요.");
    		    					                        		return;
    		    					                        	}
    		    					                       		else{
    		    					                        	// 인증번호 입력 후 확인 버튼 클릭 시, 이메일과 난수 번호 일치 확인 - ajax -> 테이블에 정보 삭제
    			    						                            $.ajax({
    			    						                                url:"checkemailandcodeforjoin",
    			    						                                type:"post",
    			    						                                data:{modal_code:$("#modal_code").val(), member_email:$("#member_email_update").val()},
    			    						                                success: function(result){
    					    						                                  console.log("이메일, 번호 일치 확인 & 테이블 정보 삭제 완료");
    					    						                                  // 모달창 닫기
    					    						                                  $("#modal_all").hide();
    					    						                                  // 인증하기 버튼 => 인증 완료 버튼으로 변경
    					    						                                  $("#member_mail_check2").show();
    					    						                                  $("#member_mail_check").hide();
    					    						                                  
    					    						                                  $("#member_email").on("input", (function(){
    					    						                                	  $("#member_mail_check").show();
    						    						                                  $("#member_mail_check2").hide();
    					    						                                  }));
    			    						                                },
    			    						                                error: function(request, status, error){
    					    						                            console.log(error);
    					    						                            $("#modal_all").hide();
    					    						                        }
    			    						                           });
    		    					                        	// 일치하지 않을 시 TODO
     		    					                       		}
    		    					                       });
    		    				                	 },
    		    				                	 error: function(request, status, error){
    		    				                         console.log(error);
    		    				                      }
    		    				                  });
    		    				               },
    		    				               error: function(request, status, error){
    		    				                  console.log(error);
    		    				                  location.href="memberjoin";
    		    				                  return;
    		    				               }
    		    				            });
    		    						} else if(result = 1) {
    		    							checkNicknameDu = 1;
    		    							alert("이미 사용 중인 이메일입니다. 다시 입력해 주세요.");
    		    							$("#member_email_update").focus();
    		    						} else {
    		    							checkNicknameDu = 2;
    		    							alert("다시 시도해 주세요.")
    		    						}
    		    					},
    		    					error: function(){
    		    						alert("이메일 중복 확인 ajax 오류 발생");
    		    					}
    		    				})
    		    		} else {
    		        		alert("이메일을 바르게 입력해주세요.");
    		    		}	
    	    	}
           } else {
   	    		alert("이메일을 형식에 맞게 입력하세요.");
   	    	}
        }
    });
        
        
// 수정 버튼 클릭 시
	$("#edit_btn").click(function(){
			if($("#member_phone").val() == null || $("#member_phone").val() == ""){
				alert("핸드폰 번호 정보를 입력해주세요.");
                return;
			}
			if($("#member_age").val() == null || $("#member_age").val() == ""){
				alert("나이 정보를 입력해주세요.");
                return;
			}
			if($("#member_height").val() == null || $("#member_height").val() == ""){
				alert("신장 정보를 입력해주세요.");
                return;
			}
			if($("#member_weight").val() == null || $("#member_weight").val() == ""){
				alert("몸무게 정보를 입력해주세요.");
                return;
			}
			
	        // 이메일 값을 변경했으나 이메일 인증을 하지 않았다면
	        if($("#member_email_update").val() != "${ssMvo.memberEmail}"){
	        	if($("#member_mail_check").is(":visible")){
	                alert("이메일 인증 완료해주세요.");
	                return;
	            }
	        }
	     	// 닉네임 값을 변경했으나 닉네임 중복 확인을 하지 않았다면
	        if($("#member_nickname_update").val() != "${ssMvo.memberNickname}"){
	            if($("#member_nickname_check").is(":visible")){
	                alert("닉네임 중복 확인을 완료해주세요.");
	                return;
	            }
	        }
	     	
	     	// 나이, 신장, 몸무게에 number만 넣을 수 있도록 유효성 검사
	    	var ageVal = $("#member_age").val();
	    	var age = /^[0-9]{1,3}$/;
	    	if(!age.test(ageVal)){
	    	    alert("나이를 0이상의 숫자 값으로 입력해 주세요.");
	    	    return;
	    	}
	    	
	    	var heightVal = $("#member_height").val();
	    	var height = /^[0-9]{1,3}$/;
	    	if(!height.test(heightVal)){
	    	    alert("신장을 0이상의 숫자 값으로 입력해 주세요.");
	    	    return;
	    	}
	    	
	    	var weightVal = $("#member_weight").val();
	    	var weight = /^[0-9]{1,3}$/;
	    	if(!height.test(heightVal)){
	    	    alert("몸무게를 0이상의 숫자 값으로 입력해 주세요.");
	    	    return;
	    	}
	    	/* data: {
				memberId: $("#member_id_update").html(),
				memberNickname: $("#member_nickname_update").val(),
				memberEmail: $("#member_email_update").val(),
				memberPhone: $("#member_phone").val(),
				memberAge: $("#member_age").val(),
				memberHeight: $("#member_height").val(),
				memberWeight: $("#member_weight").val(),
				memberPurpose: $("#member_purpose").val(),
				memberConcern: $("#member_concern").val()
				/* memberProfile:  */
		var data = new FormData();
		if(bool == true){
			data.append('file', $("#file")[0].files[0]);
			data.append('bool', "true");
		} else if(bool == false) {
			data.append('bool', "false");
		}
		data.append('memberId', $("#member_id_update").html());
		data.append('memberNickname',$("#member_nickname_update").val() );
		data.append('memberEmail', $("#member_email_update").val());
		data.append('memberPhone', $("#member_phone").val());
		data.append('memberAge', $("#member_age").val());
		data.append('memberHeight', $("#member_height").val());
		data.append('memberWeight', $("#member_weight").val());
		data.append('memberPurpose', $("#member_purpose").val());
		data.append('memberConcern', $("#member_concern").val());
		$.ajax({
			url:"memberupdateprofile.ax",
			type: "post",
			data: data,
			contentType : false,
			processData : false,
			success: function(result){
					alert("회원 정보 수정 완료");	
					location.href="membermypage";
			},
			error: function(){
				alert("프로필 수정 ajax 오류 발생");
			}
		})
	})
	
	$('input[name="file"]').change(function(){
	    priviewFile(this, '#prifile');
	});
	
	function priviewFile(input, expression) {
	    if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function (e) {
		    	$(expression).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

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
		$("#p_button").click(function(){
			document.all.file.click();
		})
		$("#reservation_list").click(function(){
			location.href="memberreadreservationlist";
		})
	</script>

</body>
</html>