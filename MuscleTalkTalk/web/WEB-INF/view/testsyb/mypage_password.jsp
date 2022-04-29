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
		#section1{
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 780px;
            height : 500px;
            float: left;
        }
        #mp_main_text{
            margin: 63px 0px 75px 63px;
            font-size: 15px;
            font-family:'THEmpgtB';
            color: rgb(51, 51, 51);
            line-height: 20px;
        }
        #member_info_read{
        	margin-bottom: 100px;
        }
        #member_info_read > ul {
            color: rgb(94, 94, 94);
            width: 400px;
            font-size: 11.5px;
            line-height: 35px;
            margin: 0 auto;
            text-align: center;
        }
        #member_ctg{
            font-family:'THEmpgtR';
            color: rgb(174, 174, 174);
            width: 75px;
            text-align: center;
        }
        .info_menu{
            float: left;
            font-family:'THEmpgtR';
            width: 75px;
            text-align: center;
            clear: both;
            
        }
        .info_info{
            font-family:'THEmpgtB';
            text-align: center;
        }
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
        }
        input::placeholder{
        	font-family:'THEmpgtM';
            font-size: 11.3px;
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

        #section2{
            color: rgb(94, 94, 94);
            /* background-color: aqua; */
            width: 120px;
            height: 500px;
            margin-left: 30px;
            float: left;
            font-size: 12px;
            text-align: center;
            font-family:'THEmpgtM';
            font-weight: lighter;
        }
        #prifile{
            border-radius: 50%;
            width: 120px;
            height: 120px;
            background-color: lightgray;
            margin-bottom: 40px;
        }
        #member_nickname{
            font-size: 18px;
            font-family:'THEmpgtB';
            color: rgb(51, 51, 51);
            margin-bottom: 7px;
        }
        #member_id{
            font-family:'THEmpgtM';
            font-size: 12px;
            margin-bottom: 50px;
        }
        #mp_logout{
            margin-bottom: 40px;
            font-family:'THEmpgtM';
            width: 90px;
            height: 40px;
            color: white;
            background-color: #4B4DB2;
            font-size: 10.5px;
            font-weight: lighter;
            border: 0;
            cursor: pointer;
        }
        #mypage_menu > li{
            margin: 12px;
            font-family:'THEmpgtM';
            font-size: 11.3px;
            cursor: pointer;
        }
        #password_edit{
        	text-decoration: underline;
        }
</style>
</head>
<body>
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
                        <input class="info_ph" type="text" id="member_password_org" placeholder="기존 비밀번호 입력">
                    </li> 
                    <li class="info_menu">변경 비밀번호</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="text" id="member_password_edit" placeholder="변경 비밀번호 입력">
                    </li>
                    <li class="info_menu">비밀번호 확인</li>
                    <li class="info_info" style="float: left; margin-left: 85px;">
                        <input class="info_ph" type="text" id="member_password_edit2" placeholder="변경 비밀번호 입력">
                    </li>
                </ul>
                <input type="button" id="edit_btn" value="수정">
            </div>
        </section>
        <section id="section2">
            <div>
                <div id="prifile"></div>
                <ul>
                    <li id="member_nickname">닉네임</li>
                    <li id="member_id">아이디</li>
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
</script>

<%@ include file="/WEB-INF/view/footer.jsp"%>
</body>
</html>