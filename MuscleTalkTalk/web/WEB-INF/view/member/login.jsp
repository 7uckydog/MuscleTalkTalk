<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
        
        input[type="text"], input[type="password"]{
            width: 415px;
            height: 40px;
            margin-bottom: 15px;
            background-color: #E0E0E0;
            border: 0;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        input::placeholder {
            color: #9E9E9E;
            padding-left: 10px;
        }
        input:focus {
            outline:none;
            
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
        #login:hover , #join:hover{
            opacity: 0.6;
            transition: 0.3s;
        }
        #join{
            width: 200px;
            height: 40px;
            border: 1px solid #4B4DB2;
            color: #4B4DB2;
            background-color: white;
            cursor: pointer;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #id_save{
            width: 430px;
            margin:  0 auto;
            margin-top: 10px;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #find_some{
            width: 430px;
            margin:  0 auto;
            margin-top: 35px;
            text-align: center;
            font-family:'THEmpgtM';
            font-size: 12px;
        }
        #find_some > a{
            color: #5E5E5E;
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
                로그인
            </p>
            <p id="subtext">
                어서오세요! <br>
                똑똑하게 운동하자, 머슬톡톡 로그인 페이지입니다.
            </p>
        </div>

        <div id="user_input">
            <form action="login.do" method="post">
                <input type="text" id="memberId" name="memberId" placeholder="아이디 입력" required><br>
                <input type="password" id="memberPassword" name="memberPassword" placeholder="비밀번호 입력" required><br>
                <input type="submit" id="login" name="login" value="로그인">
                <input type="button" id="join" name="join" value="회원가입">
            </form>
        </div>

        <div id="id_save">
            <input type="checkbox" id="idSave" name="idSave"> <label for="idSave">아이디 저장</label>
        </div>

        <div id="find_some">
            <a href="TestFindId" id="findId">아이디 찾기</a>
             / <a href="" id="findPwd">비밀번호 찾기</a>
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
		/* $("#findId").click(function(){
			location.href = "TestFindId";
		}); */
		/*
		$("#findId").click(function(){
			location.href = "";
		});
		$("#findPwd").click(function(){
			location.href = "";
		}); */
	</script>
</body>
</html>