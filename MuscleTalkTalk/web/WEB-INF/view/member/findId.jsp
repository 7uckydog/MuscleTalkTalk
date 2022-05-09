<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
    <style>
         @font-face {
          font-family: "THEmpgtM";
          src: url("<%= request.getContextPath() %>/cssfolder/fonts/THEmpgtM.woff");
      }
      @font-face {
          font-family: "THEmpgtB";
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
            height: 580px;
            margin: 0 auto;
        }
        #noti_text{
            padding-top: 70px;
            padding-bottom: 110px;
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
            padding: 13px 45px;
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
            border: 0.1px solid rgb(240, 240, 240);
        }
        #user_input{
            text-align: center;
        }
        
        #member_name, #member_email{
            width: 415px;
            height: 40px;
            margin-bottom: 15px;
            background-color: #E0E0E0;
            border: 0;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        input::placeholder {
            font-family:'THEmpgtM';
            color: #9E9E9E;
            padding-left: 8px;
            font-size: 12px;
        }
        input:focus {
            outline:none;
        }
        #find_id{
            width: 200px;
            height: 40px;
            margin-right: 15px;
            border: 1px solid #4B4DB2;
            color: white;
            background-color: #4B4DB2;
            cursor: pointer;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #find_id:hover , #find_password:hover{
            opacity: 0.6;
            transition: 0.3s;
        }
        #find_password{
            width: 200px;
            height: 40px;
            border: 1px solid #4B4DB2;
            color: #4B4DB2;
            background-color: white;
            cursor: pointer;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #second_line{
            margin-left: 105px;
        }
        #mail_check{
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
        #mail_check2{
        	color: white;
            background-color: #4B4DB2;
            border: none;
            width: 90px;
            height: 40px;
            font-family: "THEmpgtM";
            font-size: 11px;
            margin-left: 10px;
            cursor: pointer;
        }
        #mail_check2{
        	display:none;
        }
    

        /* footer css */
        footer{
            margin-left: 210px;
            text-align: left;
            width: 930px;
            background-color: lightgray;
            border-radius: 0 0 10px 10px;
            font-size: 9px;
            margin-bottom: 15%;
            font-family: "THEmpgtM";
            margin: 0 auto;
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
                아이디 찾기
            </p>
            <p id="subtext">
                안녕하세여, 아이디를 찾으시나요? <br>
                아이디 찾기를 위해, 회원 정보에 등록된 성명과 이메일을 작성해 주세요.
            </p>
        </div>
   
        <div id="user_input">
            <form id="submit" action="successfindidcontroller" method="post">
                <input type="text" id="member_name" name="member_name" placeholder="성명 입력" required><br>
                <div id="second_line">
                    <input type="text" id="member_email" name="member_email" placeholder="이메일 입력" required>
                    <input type="button" id="mail_check" name="mail_check" value="인증하기">
                    <input type="button" id="mail_check2" name="mail_check2" value="인증완료">
                </div>
                <input type="submit" id="find_id" name="find_id" value="확인">
                <input type="button" id="find_password" name="find_password" value="비밀번호 찾기">
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
        <a href="" id="go_to_top">
            <img src="<%= request.getContextPath() %>/cssfolder/images/gototop.png">
        </a>
    </footer>
    <script>
    // 이메일 인증 버튼 클릭 시
    var memberName = $("#member_name").val();
    var memberEmail = $("#member_email").val();

        $("#mail_check").on("click", function(){
           memberName = $("#member_name").val();
           memberEmail = $("#member_email").val();
           console.log(memberName);
           console.log(memberEmail);
           if(memberName == "") {
              alert("성명를 입력하세요");
              return;
           }
           if(memberEmail == "") {
              alert("이메일를 입력하세요");
              return;
           }
           // 이메일 번호 전송을 위한 난수 insert - ajax
                  $.ajax({
                     url: "insertmail",
                     type: "post",
                     data:{member_name:$("#member_name").val(), email_certification_email: $("#member_email").val()},
                     success: function(result){
                        console.log("난수 insert 성공");
                        $("#modal_all").show(); // 이메일 번호 입력용 모달 생성
                    
                     	// 이메일 전송
                        $.ajax({
                      	 url:"sendEmail",
                      	 type:"post",
                      	 data:{member_name:$("#member_name").val(), member_email:$("#member_email").val()},
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
			                                location.href="FindId";
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
			                                url:"checkemailandcode",
			                                type:"post",
			                                data:{modal_code:$("#modal_code").val(), member_email:$("#member_email").val()},
			                                success: function(result){
			                                	if(result == '1'){
			                                		console.log("이메일, 번호 일치 확인 & 테이블 정보 삭제 완료");
					                                // 인증하기 버튼 => 인증 완료 버튼으로 변경
					                                $("#mail_check2").show();
					                                $("#mail_check").hide();
			                                	} else if (result == '0') {
			                                		alert('인증번호가 일치하지 않습니다.');
			                                		location.href="FindId";
			                                	}
			                                  
				                               	// 모달창 닫기
				                                $("#modal_all").hide();
				                                $('#modal_code').val("");
				                                
				                                $("#member_email").on("input", (function(){
				                                	  $("#mail_check").show();
					                                  $("#mail_check2").hide();
				                                  }));
			                                },
			                                error: function(request, status, error){
			                                  console.log(error);
			                                  location.href="FindId";
			                                }
			                           });
		                       		}
		                       }) 
                      	 },
                      	 error: function(request, status, error){
                               console.log(error);
                            }
                        });
                     },
                     error: function(request, status, error){
                        console.log(error);
                        location.href="FindId";
                        return;
                     }
                  });   
        }) 
        
    // 인증을 하지 않고 submit 했을 시, submit 불가
	$("#submit").submit(function(){
            var rt = true;
            if($("#mail_check").is(":visible")){
                alert("아메일 인증을 완료해주세요.");
                return rt = false;
            }
	})
	    
	// 비밀번호 찾기 버튼 클릭 시, 비밀번호 찾기 페이지로 이동
	$("#find_password").click(function(){
		location.href="findpwd";
	})
    </script>
</body>
</html>