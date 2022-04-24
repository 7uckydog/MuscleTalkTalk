<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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

   #user_input{
       text-align: center;
   }

   #login{
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
   #login:hover , #find_password:hover{
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
   #result{
       padding-bottom: 114px;
   }
   #idis{
       width: 100px;
       margin-left: 255px;
       margin-right: 90px;
       float: left;
       font-family:'THEmpgtB';
       font-size: 12px;
   }
   #idresult{
       float: left;
       font-family:'THEmpgtM';
       font-size: 12px;
   }
   #buttons{
       clear: both;
       text-align: center;
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
                아이디 찾기 완료! <br>
                아이디 확인 후, 올바른 회원 정보로 로그인 해주세요.
            </p>
        </div>
   
        <div id="result">
            <p id="idis">
                아이디
             </p>
            <p id="idresult">
                <!-- 회원 아이디 출력 -->
                ${vo.memberId}
            </p>
        </div>
        <div id="buttons">
            <input type="button" id="login" name="login" value="로그인">
            <input type="button" id="find_password" name="find_password" value="비밀번호 찾기">
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
    $("#login").click(function(){
		location.href = "login";
	});
    </script>
</body>
</html>