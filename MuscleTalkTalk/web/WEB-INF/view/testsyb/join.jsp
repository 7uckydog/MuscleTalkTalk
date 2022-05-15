<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
        @font-face {
            font-family: THEmpgtM;
            src: url("<%= request.getContextPath() %>/cssfolder/fonts/THEmpgtM.woff");
        }
        @font-face {
            font-family: THEmpgtB;
            src: url("<%= request.getContextPath() %>/cssfolder/fonts/THEmpgtB.woff");
        }
        body{
            width: 1200px;
            margin: 0 auto;
        }
        *{
            text-decoration: none;
        }

/* header css */
        header{
            font-family:'THEmpgtM';
            font-weight: light;
            margin: 0 auto;
            height: 140px;
            background-color: #ECECEC;
            position: relative;
        }
        #header_logo{
            margin-left: 50px;
            margin-top: 40px;
            float: left;
            transition: .3s;
        }
        #header_logo:hover, #member_icon:hover, #bell_icon:hover, #home_icon:hover{
            opacity: 0.3;
        }

/* session */
        section{
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 930px;
            height: 2370px;
            margin: 0 auto;
            font-size: 12px;
            font-family:'THEmpgtM';
        }
        #noti_text{
            padding-top: 70px;
            padding-bottom: 40px;
        }
        #title{
            font-family:'THEmpgtB';
            font-size: 24px;
            color:#5E5E5E;
            font-weight: bold;
            margin: 0;
            text-align: center;
        }
        #subtext {
            padding-top: 30px;
            color:#5E5E5E;
            text-align: center;
            line-height: 17px;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #user_input > form > div {
            width: 530px;
            margin-left: 255px;
            text-align: left;
        }
        #user_input > form > div > p {
            width: 420px;
            margin-left: 0px;
            padding-left: 0px;
            text-align: left;
        }
        #file_upload{
            width: 900px;
            margin-left: 0px;
            padding-left: 0px;
            text-align: left;
            margin-bottom: 20px;
        }
        hr{
            width: 420px;
            margin-top: 40px;
            margin-bottom: 40px;
        }
        #thirteenth_line{
            margin-bottom: 35px;
        }
        input[type="flie"]{
            font-family:'THEmpgtM';
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
        
        #member_name, #member_email, #member_id, #member_password, #member_password_check, #member_nickname, #member_phone, #member_gender, #member_age, #member_height, #member_weight, #member_purpose, #member_concern, #gym_name, #gym_location {
            width: 415px;
            height: 40px;
            margin-bottom: 15px;
            background-color: #E0E0E0;
            border: 0;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #member_id{
          margin-bottom: 25px;   
        }
        input::placeholder{
            font-family:'THEmpgtM';
            color: #9E9E9E;
            padding-left: 8px;
            font-size: 12px;
        }
        input:focus {
            outline:none;
        }
        #second_line{
            margin-left: 105px;
        }
        #member_mail_check, #member_nickname_check, #member_id_check{
            color: rgb(64, 64, 64);
            background-color: rgb(224, 224, 224);
            border: none;
            width: 90px;
            height: 40px;
            font-family: "THEmpgtM";
            font-size: 11px;
            margin-left: 10px;
            cursor: pointer;
        }
        #member_mail_check2, #member_nickname_check2, #member_id_check2{
            color: white;
            background-color: #4B4DB2;
            border: none;
            width: 90px;
            height: 40px;
            font-family: "THEmpgtM";
            font-size: 11px;
            margin-left: 10px;
            cursor: pointer;
            display:none;
        } 
        #member_id, #member_id_check{
            float: left;
        }
        #trainer_join{
            text-align: center;
            margin-left: 110px;
        }#agree_checkbox{
            text-align: center;
            margin-left: 15px;
            margin-bottom: 60px;
        }
        #next_btn{
            color: white;
            background-color: rgb(75, 77, 178);
            border: none;
            width: 90px;
            height: 40px;
            font-family: "THEmpgtM";
            font-size: 11px;
            margin-left: 10px;
            cursor: pointer;
        }

        /* footer css */
        footer > div{
            margin-left: 210px;
            text-align: left;
            width: 930px;
            background-color: lightgray;
            border-radius: 0 0 10px 10px;
            font-size: 9px;
            font-family: "THEmpgtM";
            margin: 0 auto;
            margin-bottom: 15%;
        }
        footer > div > ul{
            margin-left: 20px;
            margin-top: 0px;
            padding: 30px;
            color: gray;
            line-height: 15px;
            list-style: none;
        }
        #go_to_top {
            width: 30px;
            height: 45px;
            position: fixed;
            bottom: 35px;
            right: 45px;
            cursor: pointer;
        }
    </style>
</head>
<body bgcolor=" #ECECEC">
    <header id="header_all">
        <div id="header_logo">
            <a href="main">
                <img src="<%= request.getContextPath() %>/cssfolder/images/logo.png">
            </a>
        </div>
    </header>
    <section>
        <div id="noti_text">
            <p id="title">
                회원가입
            </p>
            <p id="subtext">
                반갑습니다. <br>똑똑하게 운동하자 머슬톡톡의 회원가입 페이지입니다.<br><br>
                머슬톡톡의 보다 다양한 기능 사용을 위해 회원가입을 진행해주세요.
            </p>
        </div>

        <div id="user_input">
            <form id="submit" action="memberjoin.do" method="post" enctype="multipart/form-data">
                <div id="first_line">
                    <p id="id_html">아이디 *</p>
                    <input type="text" id="member_id" name="member_id" placeholder="아이디 입력" required>
                    <input type="button" id="member_id_check" name="member_id_check" value="중복 확인">
                    <input type="button" id="member_id_check2" name="member_id_check2" value="확인 완료">
                </div>
                <div id="second_line">
                    <p id="pwd_html">비밀번호 *</p>
                    <input type="text" id="member_password" name="member_password" placeholder="비밀번호 입력" required><br>
                </div>
                <div id="third_line">
                    <p id="pwd_check_html">비밀번호 확인 *</p>
                    <input type="text" id="member_password_check" name="member_password_check" placeholder="비밀번호 입력" required><br>
                </div>
                <div id="fourth_line">
                    <p id="nickname_html">닉네임 *</p>
                    <input type="text" id="member_nickname" name="member_nickname" placeholder="닉네임 입력" required>
                    <input type="button" id="member_nickname_check" name="member_nickname_check" value="중복 확인">
                    <input type="button" id="member_nickname_check2" name="member_nickname_check2" value="확인 완료">
                </div>
                <div id="fifth_line">
                    <p id="email_html">이메일 *</p>
                    <input type="text" id="member_email" name="member_email" placeholder="이메일 입력" required>
                    <input type="button" id="member_mail_check" name="member_mail_check" value="인증하기">
                    <input type="button" id="member_mail_check2" name="member_mail_check2" value="인증완료">
                </div>
                <div id="sixth_line">
                    <p id="name_html">성명 *</p>
                    <input type="text" id="member_name" name="member_name" placeholder="성명 입력" required><br>
                </div>
                <div id="sixth_line">
                    <p id="phone_html">개인 핸드폰 번호 *</p>
                    <input type="text" id="member_phone" name="member_phone" placeholder="번호: 숫자만 입력" required><br>
                </div>
                <div id="seventh_line">
                    <p>성별 *</p>
                    <select name="member_gender" id="member_gender">
                        <option value="남자" selected> 남자</option>
                        <option value="여자"> 여자</option>
                    </select>
                </div>
                <br>
                <hr>
                <br>
                <div id="eighth_line">
                    <p id="age_html">나이 *</p>
                    <input type="text" id="member_age" name="member_age" placeholder="나이: 숫자만 입력" required><br>
                </div>
                <div id="ninth_line">
                    <p id="height_html">신장(cm) *</p>
                    <input type="text" id="member_height" name="member_height" placeholder="신장: 숫자만 입력" required><br>
                </div>
                <div id="tenth_line">
                    <p id="weight_html">몸무게(kg) *</p>
                    <input type="text" id="member_weight" name="member_weight" placeholder="몸무게: 숫자만 입력" required><br>
                </div>
                <div id="eleventh_line">
                    <p>운동목표 *</p>
                    <select name="member_purpose" id="member_purpose">
                        <option value="선택안함" selected> 선택안함</option>
                        <option value="감량"> 감량</option>
                        <option value="증량"> 증량</option>
                        <option value="체력관리"> 체력관리</option>
                        <option value="바디프로필"> 바디프로필</option>
                        <option value="기타"> 기타</option>
                    </select>
                </div>
                <div id="twelfth_line">
                    <p>관심사 *</p>
                    <select name="member_concern" id="member_concern">
                        <option value="선택안함" selected> 선택안함</option>
                        <option value="웨이트트레이닝"> 웨이트트레이닝</option>
                        <option value="필라테스"> 필라테스</option>
                        <option value="요가"> 요가</option>
                        <option value="기타"> 기타</option>
                    </select>
                </div>
                <br>
                <hr>
                <br>
                <div id="thirteenth_line">
                    <input type="checkbox" name="trainer_join" id="trainer_join"> 
                    <label for="trainer_join">
                        트레이너용 회원가입을 원하십니까?
                    </label>
                </div>
                <div id="fourteenth_line">
                    <p>인증 서류</p>
                    <input type="file" id="file_upload" onchange="f_check(this)" value="file_upload" name="file_upload" accept="image/jpg, image/jpeg, image/png"> 
                </div>
                <div id="fifteenth_line">
                    <p>헬스장명</p>
                    <input type="text" id="gym_name" name="gym_name" placeholder="소속된 헬스장명 입력"><br>
                </div>
                <div id="sixteen_line">
                    <p>헬스장 주소</p>
                    <input type="text" id="gym_location" name="gym_location" placeholder="소속된 헬스장 주소 입력"><br>
                </div>
                <br>
                <hr>
                <br>
                <div>
                    <input type="checkbox" name="agree" value="agree" id="agree_checkbox"> 
                    <label for="agree_checkbox">
                        서비스 이용약관 및 개인정보 취급 방침을 확인하였으며 이에 동의합니다.
                    </label>
                </div>
                <input type="submit" id="next_btn" name="next_btn" value="완료">
                
            </form>

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
        </div>
    </section>
    <footer>
        <div>
            <ul>
                <li>대한민국 &copy; 주식회사 머슬톡톡 무단 전재와 무단 복제를 금함.</li>
                <li>Muscle TalkTalk Co.Ltd ㅣ 주소 및 연락처 : 화성시 무슨로 몇몇 (031)-000-0000</li>
                <li>대표자 : 박재민 ㅣ사업자등록번호 : 124-82-10324</li>
                <li>메일문의 : muscleTalkTalk@gmail.com ㅣ호스팅서비스 : aws</li>
                <li>Copyright © 2022 MuscleTalkTalk All Right Reserved</li>
            </ul>
        </div>
        <a href="#header_all" id="go_to_top">
            <img src="<%= request.getContextPath() %>/cssfolder/images/gototop.png">
        </a>
    </footer>
    <script>
    	//아이디
    	var chkId = false;
    	var checkIdDu = 0;
    	
    		// 아이디 형식 확인
	    	$("#member_id").on("input", (function(){
	    		checkIdDu = 0;
	    		$("#member_id_check").show();
				$("#member_id_check2").hide();
	    		
	    		var id = /^[0-9a-zA-Z]{4,20}$/;
	    		var idVal = $("#member_id").val();
	    		
	    		if(!id.test(idVal)){
	    			$("#id_html").html("아이디 * &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;아이디 형식이 맞지 않습니다.");
	    			chkId = false;
	    		} else {
	    			$("#id_html").html("아이디 *");
	    			chkId = true;
	    		}
	    	}));

    		// 아이디 중복 확인 - 버튼 클릭
	    	$("#member_id_check").click(function(){
	    		// 아이디 입력 칸에 입력한 값이 있다면
	    		if($("#member_id").val() != "") {
	    			if(chkId){
		    			console.log("아이디 중복 체크하러 갑니다.");
		    				$.ajax({
		    					url:"memberduid.ax",
		    					type: "post",
		    					data: {memberId: $("#member_id").val()},
		    					success: function(result){
		    						if(result == 0){
		    							checkIdDu = 0;
		    							alert("사용 가능한 아이디입니다.")
		    							$("#member_id_check").hide();
		    							$("#member_id_check2").show();
		    							
		    						} else if(result > 0) {
		    							checkIdDu = 1;
		    							alert("이미 사용 중인 아이디입니다. 다시 입력해 주세요.");
		    							$("#member_id").focus();
		    						} else {
		    							checkIdDu = 2;
		    							alert("오류 발생. 다시 시도해 주세요.")
		    						}
		    					},
		    					error: function(){
		    						alert("ajax 오류 발생");
		    					}
		    				})
		    		} else {
		        		alert("아이디를 바르게 입력해주세요.");
		    		}	
	    		} else if($("#member_id").val() == ""){
	    			alert("아이디를 입력해주세요.");
	    		}
	    	});
   
// -----------------------------------------------------------------    		
		// 비밀번호 형식 확인
		var chkPwd = false;
		$("#member_password").on("input", (function(){
		
	    	var pwd = /^[0-9a-zA-Z]{4,20}$/;
	    	var pwdVal = $("#member_password").val();
	    		
	    	if(!pwd.test(pwdVal)){
	    		$("#pwd_html").html("비밀번호 * &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;비밀번호 형식이 맞지 않습니다.");
	    		chkPwd = false;
	    	} else {
	    		$("#pwd_html").html("비밀번호 *");
	    		chkPwd = true;
	    		if($(this).val() == $("#member_password_check").val()) {
	    			$("#pwd_check_html").html("비밀번호 확인 *");
	    		}
	    	}
	    }));
		
		// 비밀번호 & 비밀번호 확인 동일 여부 체크
		$("#member_password_check").on("input", (function(){
			if($("#member_password").val() != $("#member_password_check").val()){
				// 비밀번호와 비밀번호 확인이 다르다면
 		    	$("#pwd_check_html").html("비밀번호 확인 * &emsp;&emsp;&nbsp;&nbsp;&nbsp;비밀번호와 일치하지 않습니다.");
 		    } else {
 		    	// 비밀번호와 비밀번호 확인이 같다면
	    		$("#pwd_check_html").html("비밀번호 확인 *");
	    		
 		    	// 비밀번화와 비밀번호 확인이 같았으나, 비밀번호를 수정하면
	    		$("#member_password").on("input", (function(){
	    			console.log("tesstests");
	    			console.log($(this).val() == $("#member_password_check").val());
	    			if($(this).val() == $("#member_password_check").val()){
	    				$("#pwd_check_html").html("비밀번호 확인 *");
	    			} else {
		    			$("#pwd_check_html").html("비밀번호 확인 * &emsp;&emsp;&nbsp;&nbsp;&nbsp;비밀번호와 일치하지 않습니다.");
	    			}
	    		}));
	    	}
	    }));
	    
// -----------------------------------------------------------------	    
    	// 닉네임
    	var chkNickname = false;
    	var checkNicknameDu = 0;
    	
    		// 닉네임 형식 확인
	    	$("#member_nickname").on("input", (function(){
	    		checkIdDu = 0;
	    		$("#member_nickname_check").show();
				$("#member_nickname_check2").hide();
	    		
	    		var nickname = /^[0-9a-zA-Zㄱ-ㅎ|ㅏ-ㅣ|가-힣]{4,10}$/;
	    		var nicknameVal = $("#member_nickname").val();
	    		
	    		if(!nickname.test(nicknameVal)){
	    			$("#nickname_html").html("닉네임 * &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;닉네임 형식이 맞지 않습니다.");
	    			chkNickname = false;
	    		} else {
	    			$("#nickname_html").html("닉네임 *");
	    			chkNickname = true;
	    		}
	    	}));

    		// 닉네임 중복 확인 - 버튼 클릭
	    	$("#member_nickname_check").click(function(){
	    		// 아이디 입력 칸에 입력한 값이 있다면
	    		if($("#member_nickname").val() != "") {
	    			if(chkNickname){
		    				$.ajax({
		    					url:"memberdunickname.ax",
		    					type: "post",
		    					data: {memberNickname: $("#member_nickname").val()},
		    					success: function(result){
		    						if(result == 0){
		    							checkNicknameDu = 0;
		    							alert("사용 가능한 닉네임입니다.")
		    							$("#member_nickname_check").hide();
		    							$("#member_nickname_check2").show();
		    							
		    						} else if(result > 0) {
		    							checkNicknameDu = 1;
		    							alert("이미 사용 중인 닉네임입니다. 다시 입력해 주세요.");
		    							$("#member_nickname").focus();
		    						} else {
		    							checkNicknameDu = 2;
		    							alert("오류 발생. 다시 시도해 주세요.");
		    						}
		    					},
		    					error: function(){
		    						alert("ajax 오류 발생");
		    					}
		    				})
		    		} else {
		        		alert("닉네임을 바르게 입력해주세요.");
		    		}	
	    		} else if($("#member_nickname").val() == ""){
	    			alert("닉네임을 입력해주세요.");
	    		}
	    	});
    
// -----------------------------------------------------------------

// 이메일 형식 확인
        var chkEmail = false;
        
        $("#member_email").on("input", function(){
        	var emailVal = $("#member_email").val();
			var email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+)*$/;
			
			if(!email.test(emailVal)){
	    		$("#email_html").html("이메일 * &emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;이메일 형식이 맞지 않습니다.");
	    		chkEmail = false;
	    	} else {
	    		$("#email_html").html("이메일 *");
	    		chkEmail = true;
	    	}
        })
        
    	// 이메일 인증하기 버튼 클릭 시
    	var checkEmailDu = 0;
    	
        $("#member_mail_check").on("click", function(){
        if(chkEmail == true){
        	 memberEmail = $("#member_email").val();
             console.log(memberEmail);
             if(memberEmail == "") {
                 alert("이메일를 입력하세요");
                 return;
             // 이메일 중복 여부 확인
             } else {
             	if($("#member_email").val() != "") {
 		    				$.ajax({
 		    				url:"memberduemail.ax",
 		    				type: "post",
 		    				data: {memberEmail: $("#member_email").val()},
 		    				success: function(result){
 		    					console.log(result);
 		    						if(result == 0){
 		    							checkNicknameDu = 0;

 		    							// 이메일 번호 전송을 위한 난수 insert - ajax
 		    				            $.ajax({
 		    				               url: "insertmailforjoin",
 		    				               type: "post",		
               					               data:{email_certification_email: $("#member_email").val()},
 		    				               success: function(result){
 		    				                  console.log("난수 insert 성공");
 		    				                  $("#modal_all").show(); // 이메일 번호 입력용 모달 생성
 		    				              
 		    				               	  // 이메일 전송
 		    				                  $.ajax({
 		    				                	 url:"SendMailForJoinController",
 		    				                	 type:"post",
 		    				                	 data:{member_email:$("#member_email").val()},
 		    				                	 success: function(result){
 		    											console.log("이메일 전송 완료");
 		    											
 		    											// 모달 내 취소 버튼 클릭 시, 테이블에서 정보 삭제
 		    					                        $("#modal_cancel").on("click", function(){
 		    					                        	$.ajax({
 		    					                          	  url:"deleteemailtablecontroller",
 		    					                              type:"post",
 		    					                              data:{member_email:$("#member_email").val()},
 		    					                              success: function(result){
 		    						                                console.log("이메일, 번호 일치 확인 & 테이블 정보 삭제 완료");
 		    						                                // 모달창 닫기
 		    						                                $("#modal_all").hide();
 		    						                                $('#modal_code').val("");
 		    						                                return;
 		    					                              },
 		    					                              error: function(request, status, error){
 		    					                              	 console.log(error);
 		    					                              }
 		    					                         });
 		    					                       })
 		    					                      		
 		    					                       // 모달 내 확인 버튼 클릭 시,
 		    					                       $("#modal_accept").off('click');
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
 			    						                                data:{modal_code:$("#modal_code").val(), member_email:$("#member_email").val()},
 			    						                                success: function(result){
 					    						                                  console.log("이메일, 번호 일치 확인 & 테이블 정보 삭제 완료");
 					    						                                  if(result == '1') {
 					    						                                	  alert('이메일 인증이 완료 되었습니다.');
 					    						                                	  // 인증하기 버튼 => 인증 완료 버튼으로 변경
 	 					    						                                  $("#member_mail_check2").show();
 	 					    						                                  $("#member_mail_check").hide();
 					    						                                	  
 					    						                                  } else {
 					    						                                	  alert('인증번호가 일치하지 않습니다.');
 					    						                                  }
 					    						                              	  // 모달창 닫기
 					    						                                  $("#modal_all").hide();
 					    						                               	  $('#modal_code').val("");
 					    						                                  
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
 		    							$("#member_email").focus();
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
        });
        
        // 이름 형식 확인
        var chkName = false;
        
		$("#member_name").on("input", (function(){
			var nameVal = $("#member_name").val();
			var name = /^[가-힣]{2,5}$/;
	    		
	    	if(!name.test(nameVal)){
	    		$("#name_html").html("성명 * &emsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;성명 형식이 맞지 않습니다.");
	    		chkName = false;
	    	} else {
	    		$("#name_html").html("성명 *");
	    		chkName = true;
	    	}
	    }));
        
        // 전화번호 형식 확인
        var chkPhone = false;
        
		$("#member_phone").on("input", (function(){
			var phoneVal = $("#member_phone").val();
			var phone = /^[0-9]{9,12}$/;
	    		
	    	if(!phone.test(phoneVal)){
	    		$("#phone_html").html("개인 핸드폰 번호 * &emsp;&emsp;번호 형식이 맞지 않습니다.");
	    		chkPhone = false;
	    	} else {
	    		$("#phone_html").html("개인 핸드폰 번호 *");
	    		chkPhone = true;
	    	}
	    }));
        
        // 나이, 신장, 몸무게 형식 확인 (3자리까지 가능)
        var chkAge = false;
        var chkHeight = false;
        var chkWeight = false;
        
        // 나이
		$("#member_age").on("input", (function(){
			var ageVal = $("#member_age").val();
			var age = /^[0-9]{1,3}$/;
	    		
	    	if(!age.test(ageVal)){
	    		$("#age_html").html("나이 * &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;나이 형식이 맞지 않습니다.");
	    		chkAge = false;
	    	} else {
	    		$("#age_html").html("나이 *");
	    		chkAge = true;
	    	}
	    }));
        // 신장
        $("#member_height").on("input", (function(){
			var heightVal = $("#member_height").val();
			var height = /^[0-9]{1,3}$/;
	    		
	    	if(!height.test(heightVal)){
	    		$("#height_html").html("신장 * &emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;신장 형식이 맞지 않습니다.");
	    		chkHeight = false;
	    	} else {
	    		$("#height_html").html("신장 *");
	    		chkHeight = true;
	    	}
	    }));
     	// 몸무게
        $("#member_weight").on("input", (function(){
			var weightVal = $("#member_weight").val();
			var weight = /^[0-9]{1,3}$/;
	    		
	    	if(!weight.test(weightVal)){
	    		$("#weight_html").html("몸무게 * &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;몸무게 형식이 맞지 않습니다.");
	    		weightVal = false;
	    	} else {
	    		$("#weight_html").html("몸무게 *");
	    		weightVal = true;
	    	}
	    }));

// ----------------------------------------------------------
	// 트레이너 인증서류
		
     
     
    var rt = true; 
    // 인증 및 중복확인을 하지 않고 submit 했을 시, submit 불가
    // 트레이너용 가입을 하고자 하지만, 트레이너 정보를 입력하지 않는다면, submit 불가
    // 비밀번호와 비밀번호 확인이 비일치 시, submit 불가
    $("#submit").submit(function(){
        rt = true;
			
        // 비밀번호, 비밀번호 확인 체크
        if($("#member_password").val() != $("#member_password_check").val()){
 		    alert("비밀번호와 비밀번호 확인이 일치하지 않습니다. 다시 입력해주세요.");
 		  	$("#member_password").focus();
 			return rt = false;
 		}
        // 이메일 인증 확인
        if($("#member_mail_check").is(":visible")){
            alert("이메일 인증 완료해주세요.");
            return rt = false;
        }
        // 아이디 중복 확인
        if($("#member_id_check").is(":visible")){
            alert("아이디 중복 확인을 완료해주세요.");
            return rt = false;
        }
        // 닉네임 중복 확인
        if($("#member_nickname_check").is(":visible")){
            alert("닉네임 중복 확인을 완료해주세요.");
            return rt = false;
        }
         
        // 트레이너 체크 박스 체크시 내용 확인
        if($("#trainer_join").prop("checked")){
        	console.log("test 시작");
        	console.log($("#file_upload" == ""));
        	console.log($("#gym_name" == ""));
        	console.log($("#gym_location" == ""));
        	console.log("test 종료");
		    if($("#file_upload")== ""){
		        alert("트레이너임을 인증할 이미지를 첨부해주세요.");
	            return rt = false;
		    }
		    if($("#gym_name") == ""){
		        alert("소속된 헬스장명을 입력해주세요.");
		        return rt = false;
		    }
		    if($("#gym_location")== ""){
		        alert("소속된 헬스장명을 입력해주세요.");
		        return rt = false;
		    }  
        }
         
    	// 개인정보 동의 체크
    	if(!($("#agree_checkbox").prop("checked"))){
    		alert("개인정보 동의 체크박스를 체크해주세요.");
    		return rt = false;
    	}
	});
	
	
	//파일 유효성 체크
	function f_check(obj) {
		var test1 = obj.value.lastIndexOf('.');
		var test2 = obj.value.substring(test1 + 1, obj.length);
		var type = test2.toLowerCase();
		if(type == 'jpg' || type == 'png' || type == 'jpeg'){
			
		} else {
			alert("이미지 파일만 업로드 가능합니다.");
			obj.value = null;
			return false;
		}
	};
	
	$("#trainer_join").click(function(){
		console.log($("#trainer_join").val());
	})
	/* $("#file_upload").on("input", function() {
		console.log($(this)[0].files[0].name);
		var test1 = $(this)[0].files[0].name.lastIndexOf('.');
		var test2 = $(this)[0].files[0].name.substring(test1+1, $(this)[0].files[0].name.length);
		console.log(test1);
		console.log(test2);
		if(test2 == 'jpg' || test2 == 'png' || test2 == 'jpeg'){
			
		} else {
			alert("이미지 파일만 업로드 가능합니다.")
			
			rt = true;
		}	
	}); */
    </script>
</body>
</html>