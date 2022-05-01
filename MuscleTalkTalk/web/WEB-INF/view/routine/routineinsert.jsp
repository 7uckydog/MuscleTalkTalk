<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/csslink.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>routinecreate</title>
    <link href="./css/reset.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        @font-face {
            font-family: THEmpgtM;
            src: url("./fonts/THEmpgtM.woff");
        }

        body {
            width: 1200px;
            margin: 0 auto;
        }

        * {
            text-decoration: none;
            font-family: 'THEmpgtM';
        }

        /* header css */
        header {
            font-family: 'THEmpgtM';
            font-weight: light;
            margin: 0 auto;
            height: 140px;
            background-color: #ECECEC;
            position: relative;
        }

        #header_logo {
            margin-left: 50px;
            margin-top: 40px;
            float: left;
            transition: .3s;
        }

        #header_logo:hover,
        #member_icon:hover,
        #bell_icon:hover,
        #home_icon:hover {
            opacity: 0.3;
        }

        #icon_menu {
            position: absolute;
            right: 50px;
        }

        #member_icon {
            float: left;
            /* padding-left: 18px; */
            /* padding-right: 18px; */
            margin-right: 18px;
            margin-top: 58px;
            padding-bottom: 58px;
            /* margin-bottom: 58px; */
            transition: .3s;
            width: 24px;
        }

        #bell_icon {
            float: left;
            margin-right: 20px;
            margin-top: 58px;
            transition: .3s;
            width: 24px;
        }

        #home_icon {
            float: left;
            margin-right: 20px;
            margin-top: 58px;
            transition: .3s;
            width: 24px;
        }

        #member_icon_menu {
            display: none;
            overflow: hidden;
            position: absolute;
            right: 93px;
            top: 100px;
            background-color: white;
            box-shadow: 5px 5px 10px lightgray;
            border-radius: 10px;
            width: 140px;
            height: 100px;
            text-align: center;
            font-size: 12px;
            z-index: 9999999;
        }

        #member_icon_menu> :first-child {
            margin-top: 15px;
            margin-bottom: -6px;
        }

        #member_icon_menu> :first-child>a>p,
        #member_icon_menu> :nth-of-type(2)>a>p {
            padding-top: 8px;
            color: #4B4DB2;
            font-weight: lighter;
        }

        #login_icon {
            float: left;
            margin-left: 30px;
            margin-right: -10px;
        }

        #sign_icon {
            float: left;
            margin-left: 30px;
            margin-right: -10px;
        }

        #bell_icon_notice {
            display: none;
            overflow: hidden;
            position: absolute;
            right: 38px;
            top: 100px;
            background-color: white;
            box-shadow: 5px 5px 10px lightgray;
            border-radius: 10px;
            width: 180px;
            z-index: 9999;
        }

        #header_notice_all {
            margin-left: 20px;
        }

        #header_notice_all>div {
            position: relative;
            margin-top: 20px;
            margin-bottom: 20px;
        }

        #header_notice_all>div>img {
            position: absolute;
            right: 15px;
        }

        .header_notice {
            color: #4B4DB2;
            font-size: 12px;
            overflow: hidden;
            width: 120px;
        }

        .header_notice> :nth-child(1) {
            font-weight: bolder;
            margin-bottom: 5px;
        }

        .header_notice> :nth-child(2) {
            color: #4B4DB2;
            font-size: 9px;
            width: 125px;
            line-height: 12px;
        }

        /* aside css */
        aside {
            position: fixed;
            margin-left: 50px;
            width: 125px;
            height: 550px;
            background-color: #4B4DB2;
            border-radius: 10px;
            font-family: 'THEmpgtM';
        }

        #aside_all> :first-child {
            margin-top: 115px;
        }

        #aside_all>div {
            width: 80px;
            left: 30px;
            margin-left: 25px;
        }

        #aside_all>div:hover {
            opacity: 0.3;
            transition: .3s ease;
        }

        #aside_all>div>a>img {
            width: 25px;
            margin-left: 27px;
            margin-top: 20px;
            margin-bottom: 7px;
            display: inline-block;
            transition: .3s ease;
        }

        #aside_all> :first-child>img {
            margin-top: 103px;
            transition: .3s;
        }

        #aside_all>div>a>p {
            font-size: 9px;
            text-align: center;
            color: white;
            margin-bottom: 15px;
            transition: .3s ease;
            font-weight: lighter;
        }

        #triangle_4 {
            width: 0px;
            height: 0px;
            border-left: 18px solid #4B4DB2;
            border-top: 15px solid transparent;
            border-bottom: 15px solid transparent;
            position: relative;
            right: -100%;
            display: none;
        }

        #aside_1 {
            background-color: blanchedalmond;
            width: 45px;
            height: 45px;
            margin-left: 18px;
        }

        /* section css */
        section {
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 930px;
            height: 2000px;
            position: relative;
            font-size: 12px;
            font-family: 'THEmpgtM';

        }

        #routinecreat_main {
            /* margin-top: 65px; */
            /* margin-left: 65px; */
            padding-top: 65px;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 60px;
            font-size: 15px;
            margin-left: 65px;
            margin-right: 65px;
        }

        button {
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: #4B4DB2;
            background-color: white;
            border: 1px solid #4B4DB2;
            cursor: pointer;
        }
        .week_routinecreat:default:focus{
            background-color: #4B4DB2;
            color: white;
        }

        .day_routinecreat:focus,
        .week_routinecreat:focus {
            background-color: #4B4DB2;
            color: white;
        }

        .day_routinecreat {
            margin-left: 405px;
        }

        .week_routinecreat {
            margin-left: 20px;
            
        }

        .routine_taget {
            margin-left: 227px;
        }

        .routine_week {
            margin-left: 124px;
        }

        .routine_day {
            margin-left: 102px;
        }

        .routine_title {
            margin-bottom: 10px;
        }
        .routine_name{
            margin-left: 65px;
        }

        .routine_nameBox {
            width: 225px;
            margin-left: 65px;
            height: 25px;
            border-radius: 5px;
            border: gray solid 1px;
        }

        .routine_tagetSelect {
            margin-left: 55px;
            width: 158px;
            height: 30px;
            border-radius: 5px;
            border: gray solid 1px;
        }

        .routine_weekSelect {
            margin-left: 13px;
            width: 158px;
            height: 30px;
            border-radius: 5px;
            border: gray solid 1px;
        }

        .routine_daySelect {
            margin-left: 18px;
            width: 158.5px;
            height: 30px;
            border-radius: 5px;
            border: gray solid 1px;
        }

        .taget_timeDiv {
            margin-top: 50px;
            margin-left: 65px;
        }

        .taget_sort>button {
            width: 50px;
            height: 30px;
            margin-left: 10px;
            margin-top: 10px;
            border-radius: 5px;
        }

        .taget_sort button:nth-child(1),
        .taget_sort button:nth-child(5) {
            margin-left: 0px;
        }
        .taget_sort > input:nth-child(1),.taget_sort > input:nth-child(2),.taget_sort > input:nth-child(3),
        .taget_sort > input:nth-child(4),.taget_sort > input:nth-child(5),.taget_sort > input:nth-child(6),
        .taget_sort > input:nth-child(7),.taget_sort > input:nth-child(8) {
            display: none;
        }

        .taget_sort>label {
            width: 50px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            margin-right: 10px;
            margin-top: 10px;
            border-radius: 5px;
            border: gray solid 1px;
            color: black;
            background-color: rgb(224, 224, 224);
            display: inline-block;
        }
        .taget_sort ~ input[type=checkbox]:checked{
            background-color: #4B4DB2;
            color: white;
        }
        /* .taget_sort > label:nth-child(1), .taget_sort > label:nth-child(8){
            margin-left: 0px;
        } */
        /* 
        .taget_sort label:nth-child(1),
        .taget_sort button:nth-child(5) {
            margin-left: 0px;
        } */
        .taget_sort > input[type=checkbox]:checked ~ label{
            background-color: #4B4DB2;
            color: white;
        }
        /* input[type=radio]:nth-of-type(1):checked */

        .dayroutine_tagetSelect {
            display: none;
            margin-left: 230px;
            width: 158px;
            height: 30px;
            border-radius: 5px;
            border: gray solid 1px;
        }

        .routine_taget2 {
            display: none;
            margin-left: 403px;
        }

        .dayroutine_daySelect {
            display: none;
            margin-left: 18px;
            width: 158px;
            height: 30px;
            border-radius: 5px;
            border: gray solid 1px;
        }

        .routine_day2 {
            display: none;
            margin-left: 127.5px;
        }

        .active {
            background-color: #4B4DB2;
            color: white;
        }

        /* 세트-운동별 시간 css */
        .set_time_title {
            margin-left: 213px;
        }
        .set_timeup{
            margin-left: 33px;
        }
        .set_timeup,.set_timedawn{
            width: 28px;
            height: 28px;
            vertical-align: bottom;
        }
        #count_settime{
            width: 98px;
            display: inline-block;
            vertical-align: bottom;
            font-size: 12px;
            border: gray solid 1px;
            box-sizing: border-box;
            text-align: center;
            height: 29px;
            line-height: 29px;
        }
        .set_timeup2,.set_timedawn2{
            width: 28px;
            height: 28px;
            vertical-align: bottom;
        }
        .set_timeup2{
            margin-left: 12px;
        }
        #count_settime2{
            width: 98px;
            display: inline-block;
            vertical-align: bottom;
            font-size: 12px;
            text-align: center;
            border: gray solid 1px;
            box-sizing: border-box;
            text-align: center;
            height: 29px;
            line-height: 29px;
        }
        .set_time_title2{
            margin-left: 90px;
        }
        .week_import{
            margin-left: 96px;
        }
        .week_import_Select{
            width: 158px;
            height: 30px;
            margin-left: 15px;
            border-radius: 5px;
            border: gray solid 1px;
        }
        .workout_main{
            margin: 45px 65px 0 65px;
        }
        .worksearch{
            margin-top: 10px;
            margin-left: 65px;
            width: 167px;
            height: 25px;
            margin-bottom: 15px;
        }
        .btn_worksearch{
            width: 50px;
            margin-left: 5px;
            border-radius: 5px;
        }
        .workout_category{
            margin: 0 64px 0 64px;
            border: #4B4DB2 solid 1px;
            /* height: 170px; */
            border-top: 0px;
        }
        /* .workout_category >*/ input[type=radio]{ 
            display: none;
        }
        /* .workout_category_Name{
            margin: 20px 65px 0 65px;
        } */
        .tab_btn{
            display: inline-block;
            width: 159.2px;
            height: 28px;
            font-size: 12px;
            color: #4B4DB2;
            background-color: white;
            border: 1px solid #4B4DB2;
            cursor: pointer;
            text-align: center;
            line-height: 28px;
            margin-bottom: 10px;
            float: left;
        }
        label{
            cursor: pointer;
            display: block;
        }
        input[type=radio]:nth-of-type(1):checked ~ .workout_category_Name > label:nth-of-type(1),
        input[type=radio]:nth-of-type(2):checked ~ .workout_category_Name > label:nth-of-type(2),
        input[type=radio]:nth-of-type(3):checked ~ .workout_category_Name > label:nth-of-type(3),
        input[type=radio]:nth-of-type(4):checked ~ .workout_category_Name > label:nth-of-type(4),
        input[type=radio]:nth-of-type(5):checked ~ .workout_category_Name > label:nth-of-type(5){
            background-color: #4B4DB2;
            color: white;
        }
        .tab_btn:nth-child(1),.tab_btn:nth-child(2),.tab_btn:nth-child(3),.tab_btn:nth-child(4),.tab_btn:nth-child(5){
            border-right: 0px;
        }
        .tab_btn:nth-child(1){
            border-left: 0px;
        }
        .workouts{
            /* border: #4B4DB2 solid 1px;
            height: 100px;
            overflow-x: hidden; */
        }
        /* 운동 카테고리 안보이게 함 */
        input[type=radio] ~ .workouts > div{
            display: none;
        }    
        /* 운동 카테고리 클릭시 보이게 함 1-전체 2-프리 3-머신 4-맨몸 5-유산소*/
        .workout_category > input[type=radio]:nth-of-type(1):checked ~ .workouts > div:nth-of-type(1){
            display: block;
        }
        .workout_category > input[type=radio]:nth-of-type(2):checked ~ .workouts > div:nth-of-type(2){
            display: block;
        }
        .workout_category > input[type=radio]:nth-of-type(3):checked ~ .workouts > div:nth-of-type(3){
            display: block;
        }
        .workout_category > input[type=radio]:nth-of-type(4):checked ~ .workouts > div:nth-of-type(4){
            display: block;
        }
        .workout_category > input[type=radio]:nth-of-type(5):checked ~ .workouts > div:nth-of-type(5){
            display: block;
        }
        /* 카테고리 선택시 div */
        .workout_AllList,.workout_freeweightList,.workout_machineList,.workout_bodyList,.workout_aerobicList{ 
            height: 120px;
            width: 800px;
            padding-left: 10px;
            overflow-y: auto;
            box-sizing: border-box;
        }
        .workoutAll,.workoutfreeweight,.workoutmachine,.workoutbody,.workoutaerobic{
            line-height: 16px;
            box-sizing: content-box;
            width: auto;
            display: inline-block;
        }
        .hr1{
            margin-top: 30px;
            width: 800px;
            text-align: center;
        }
        .workoutSettingDiv{
            width: 800px;
            margin-left: 0;
            margin-right: 0;
            display: inline;
        }
        .workoutSettingTitle{
            margin-top: 30px;
            margin-left: 65px;
            margin-bottom: 25px;
        }
        .workoutSettingName{
            margin-left: 65px;
            background-color: #4B4DB2;
            color: white;
        }
        .workoutSettingName,.workoutSettingWeight,.workoutSettingNumber{
            width: 140px;
            text-align: center;
            height: 30px;
            line-height: 30px;
            display: inline-block;
            float: left;
        }
        .workoutSettingWeight,.workoutSettingNumber{
            color: #4B4DB2;
            background-color: white;
            box-sizing: border-box;
            border: #4B4DB2 solid 1px;
        }
        .workoutSettingWeight{
            border-right: 0px;
        }
        .set_timeup3,.set_timedawn3{
            width: 28px;
            height: 28px;
            line-height: 28px;
            vertical-align: bottom;
        }
        .set_timeup3{
            margin-left: 40px;
        }
        #count_settime3{
            width: 88px;
            display: inline-block;
            vertical-align: bottom;
            font-size: 12px;
            border: gray solid 1px;
            box-sizing: border-box;
            text-align: center;
            height: 29px;
            line-height: 29px;
        }
        table{
            /* display: inline-block; */
            border-collapse: separate;
            border-spacing: 0 5px;
            float: left;
        }
        .allsettingBtn{
            margin-left: 20px;
            font-size: 12px;
            height: 28px;
            width: 75px;
        }
        .timesettingBtn{
            padding-top: 5px;
            border-radius: 5px;
        }
        .workout_inputBtn{
            width: 60px;
            height: 28px;
            background-color: #4B4DB2;
            color: white;
            margin-left: 20px;
            border-radius: 5px;
        }
        .hr2{
            margin-top: 50px;
            width: 800px;
            text-align: center;
        }
        .addworkoutTitle{
            margin-top: 50px;
            margin-left: 65px;
            margin-bottom: 20px;
        }
        .addworkoutDay{
            margin-left: 65px;
            width: 140px;
            text-align: center;
            height: 30px;
            line-height: 30px;
            background-color: #4B4DB2;
            color: white;
            display: none;
            float: left;
        }
        .aw1,.aw2,.aw3,.aw4,.aw5,.aw6,.aw7,.aw8{
            display: none;
            margin-left: 10px;
            width: 50px;
            height: 23px;
            line-height: 25px;
            text-align: center;
            border: 1px solid #4B4DB2;
            background-color: white;
            color: #4B4DB2;
            padding-top: 5px;
            border-radius: 2.5px;
            outline: none;
        }




        /* footer css */
        footer {
            margin-left: 210px;
            text-align: left;
            width: 930px;
            background-color: lightgray;
            border-radius: 0 0 10px 10px;
            font-size: 9px;
            margin-bottom: 15%;
        }

        footer>div>ul {
            margin-left: 20px;
            padding: 30px;
            color: gray;
            line-height: 15px;
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
            <a href="">
                <img src="./images/logo.png">
            </a>
        </div>
        <div id="icon_menu">
            <div id="member_icon">
                <div>
                    <img src="./images/회원.svg" id="member_icon_img">
                </div>
            </div>
            <div id="bell_icon">
                <div>
                    <img src="./images/알림.svg" id="bell_icon_img">
                </div>
            </div>
            <div id="home_icon">
                <a href="">
                    <img src="./images/메인홈.svg">
                </a>
            </div>
        </div>

        <!-- 멤버 아이콘 영역 -->
        <div id="member_icon_menu">
            <div>
                <a href="">
                    <img src="./images/login.png" id="login_icon">
                    <p style="padding-bottom: 25px;">로그인</p>
                </a>
            </div>
            <div>
                <a href="">
                    <img src="./images/join.png" id="sign_icon">
                    <p>회원가입</p>
                </a>
            </div>
        </div>

        <!-- 알림 아이콘 영역 -->
        <!-- Flexbox 사용 예정-->
        <div id="bell_icon_notice">
            <div id="header_notice_all">
                <div>
                    <a class="header_notice">
                        <div style="color: gray; text-align: center; margin-left: -20px; font-weight:normal;">알림 없음
                        </div>
                    </a>
                </div>

                <div>
                    <img src="./images/x_icon.svg" style="width: 10px;" class="bell_notice_x">
                    <a href="" class="header_notice">
                        <div>알림 1</div>
                        <div>알림 내용 1</div>
                    </a>
                </div>
                <div>
                    <img src="./images/x_icon.svg" style="width: 10px;" class="bell_notice_x">
                    <a href="" class="header_notice">
                        <div>알림 2</div>
                        <div>알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2 알림 내용 2</div>
                    </a>
                </div>
                <div>
                    <img src="./images/x_icon.svg" style="width: 10px;" class="bell_notice_x">
                    <a href="" class="header_notice">
                        <div>알림 3</div>
                        <div>새로운 공지사항이 등록되었습니다. 알림을 클릭하여 확인해 주세요.</div>
                    </a>
                </div>
            </div>
        </div>
    </header>

    <aside>
        <div id="aside_all">
            <div>
                <a href="">
                    <img src="./images/exe.png">
                    <p>운동관리</p>
                </a>
            </div>
            <div>
                <a href="">
                    <img src="./images/cal.png">
                    <p>캘린더</p>
                </a>
            </div>
            <div>
                <a href="">
                    <img src="./images/com.png">
                    <p>커뮤니티</p>
                </a>
            </div>
            <div>
                <a href="">
                    <img src="./images/pt.png">
                    <p>PT프로그램</p>
                </a>
            </div>
        </div>

        <div id="triangle_4">
        </div>
    </aside>

    <section>
        <div id="routinecreat_main">
            루틴생성
            <button class="day_routinecreat" onclick="taget()">일간루틴</button>
            <button class="week_routinecreat">주간루틴</button>
        </div>
        <div class="routine_title">
            <span class="routine_name">루틴명 설정</span>
            <span class="routine_taget">루틴 목표</span>
            <span class="routine_taget2">루틴 목표</span>
            <span class="routine_week">루틴 수행 주차</span>
            <span class="routine_day">루틴 수행 요일</span>
            <span class="routine_day2">루틴 수행 일자</span>
        </div>
        <div>
            <input type="text" class="routine_nameBox" placeholder="루틴명을 입력하세요." required>
            <select name="routine_tagetName" class="routine_tagetSelect">
                <option value="N" selected>전체</option>
                <option value="M">근비대</option>
                <option value="D">다이어트</option>
                <option value="S">스트랭스</option>
                <option value="B">맨몸운동</option>
            </select>
            <select name="dayroutine_tagetName" class="dayroutine_tagetSelect">
                <option value="N" selected>전체</option>
                <option value="M">근비대</option>
                <option value="D">다이어트</option>
                <option value="S">스트랭스</option>
                <option value="B">맨몸운동</option>
            </select>
            <select name="routine_weekName" class="routine_weekSelect">
                <option value="none" selected hidden>주차 선택</option>
                <option value="w1">1주차</option>
                <option value="w2">2주차</option>
                <option value="w3">3주차</option>
                <option value="w4">4주차</option>
                <option value="w5">5주차</option>
                <option value="w6">6주차</option>
            </select>
            <select name="routine_dayName" class="routine_daySelect">
                <option value="none" selected hidden>요일 선택</option>
                <option value="월">월</option>
                <option value="화">화</option>
                <option value="수">수</option>
                <option value="목">목</option>
                <option value="금">금</option>
                <option value="토">토</option>
                <option value="일">일</option>
            </select>
            <select name="dayroutine_dayName" class="dayroutine_daySelect">
                <option value="none" selected hidden>일자 선택</option>
                <option value="d1">day1</option>
                <option value="d2">day2</option>
                <option value="d3">day3</option>
                <option value="d4">day4</option>
                <option value="d5">day5</option>
                <option value="d6">day6</option>
                <option value="d7">day7</option>
            </select>
        </div>
        <div class="taget_timeDiv">
            <span class="taget_btn">운동 부위 선택</span>
            <span class="set_time_title">세트별 휴식시간</span>
            <span class="set_time_title2">운동별 휴식시간</span>
            <span class="week_import">N주차 불러오기</span>
            <div class="taget_sort">
                <input type="checkbox" value="B" id="taget_value1">
                <input type="checkbox" value="C" id="taget_value2">
                <input type="checkbox" value="S" id="taget_value3">
                <input type="checkbox" value="L" id="taget_value4">
                <input type="checkbox" value="A" id="taget_value5">
                <input type="checkbox" value="E" id="taget_value6">
                <input type="checkbox" value="H" id="taget_value7">
                <input type="checkbox" value="T" id="taget_value8">
                <button class="taget_value" value="B">등</button><button class="taget_value" value="C">가슴</button>
                <button class="taget_value" value="S">어깨</button><button class="taget_value" value="L">하체</button>
                        <!-- 세트별 시간 -->
                        <input type='button' class="set_timeup" onclick='count("plus")' value='+'>
                        <input type="text" maxlength="4" min="0초" id='count_settime' value="0초">
                        <input type='button' class="set_timedawn" onclick='count("minus")' value='-'>
                        <!-- 운동별 시간 -->
                        <input type='button' class="set_timeup2" onclick='count2("plus2")' value='+'>
                        <input type="text" maxlength="4" id='count_settime2' value="0초">
                        <input type='button' class="set_timedawn2" onclick='count2("minus2")' value='-'>
                        <select name="week_import_Select" class="week_import_Select">
                            <option value="w1">1주차</option>
                            <option value="w2">2주차</option>
                            <option value="w3">3주차</option>
                            <option value="w4">4주차</option>
                            <option value="w5">5주차</option>
                            <option value="w6">6주차</option>
                        </select>
            </div>
            <div class="taget_sort">
                <button class="taget_value" value="A">복근</button><button class="taget_value" value="E">팔</button>
                <button class="taget_value" value="H">엉덩이</button><button class="taget_value" value="T">유산소</button>
            </div>
        </div>
        <div class="workout_main">
            <span>운동 추가</span>
        </div>
        <form action="" method="" class="worksearchform">
            <input class="worksearch" type="text" placeholder="검색어를 입력하세요.">
            <button class="btn_worksearch" type="submit">검색</button>
        </form>
        </div>
        <div class="workout_category">
            <input type="radio" name="tab" id="category1" value="1" checked>
            <input type="radio" name="tab" id="category2" value="2">
            <input type="radio" name="tab" id="category3" value="3">
            <input type="radio" name="tab" id="category4" value="4">
            <input type="radio" name="tab" id="category5" value="5">
            <div class="workout_category_Name">
                <label for="category1" class="tab_btn">전체</label>
                <label for="category2" class="tab_btn">프리웨이트</label>
                <label for="category3" class="tab_btn">머신 운동</label>
                <label for="category4" class="tab_btn">맨몸 운동</label>
                <label for="category5" class="tab_btn">유산소</label>
            </div>
            <div class="workouts">
                <!--전체 카테고리 클릭시 보임-->
                <div class="workout_All"> 
                    <input type="radio" name="workout" id="workouta1" value="a1">
                    <input type="radio" name="workout" id="workouta2" value="a2">
                    <input type="radio" name="workout" id="workouta3" value="a3">
                    <input type="radio" name="workout" id="workouta4" value="a4">
                    <input type="radio" name="workout" id="workouta5" value="a5">
                    <div class="workout_AllList">
                        <label for="workouta1" class="workoutAll">데드리프트</label><br>
                        <label for="workouta2" class="workoutAll">벤치프레스</label><br>
                        <label for="workouta3" class="workoutAll">스쿼트</label><br>
                        <label for="workouta4" class="workoutAll">로우 머신</label><br>
                        <label for="workouta5" class="workoutAll">풀업</label>
                    </div>
                </div>
                 <!--프리웨이트 카테고리 클릭시 보임-->
                <div class="workout_freeweight">
                    <input type="radio" name="workout" id="workoutf1" value="f1">
                    <input type="radio" name="workout" id="workoutf2" value="f2">
                    <input type="radio" name="workout" id="workoutf3" value="f3">
                    <input type="radio" name="workout" id="workoutf4" value="f4">
                    <input type="radio" name="workout" id="workoutf5" value="f5">
                    <div class="workout_freeweightList">
                        <label for="workoutf1" class="workoutfreeweight">컨벤셔널 데드리프트</label><br>
                        <label for="workoutf2" class="workoutfreeweight">벤치프레스</label><br>
                        <label for="workoutf3" class="workoutfreeweight">스쿼트</label><br>
                        <label for="workoutf4" class="workoutfreeweight">덤벨 컬</label><br>
                        <label for="workoutf5" class="workoutfreeweight">인클라인 벤치프레스</label>
                    </div>
                </div>
                <!-- 머신운동 카테고리 클릭시 보임-->
                <div class="workout_machine">
                    <input type="radio" name="workout" id="workoutm1" value="m1">
                    <input type="radio" name="workout" id="workoutm2" value="m2">
                    <input type="radio" name="workout" id="workoutm3" value="m3">
                    <input type="radio" name="workout" id="workoutm4" value="m4">
                    <input type="radio" name="workout" id="workoutm5" value="m5">
                    <div class="workout_machineList">
                        <label for="workoutm1" class="workoutmachine">로우 머신</label><br>
                        <label for="workoutm2" class="workoutmachine">스미스 인클라인 벤치프레스</label><br>
                        <label for="workoutm3" class="workoutmachine">레그프레스</label><br>
                        <label for="workoutm4" class="workoutmachine">케이블 플라이</label><br>
                        <label for="workoutm5" class="workoutmachine">이너타이</label>
                    </div>
                </div>
                <!--맨몸운동 카테고리 클릭시 보임-->
                <div class="workout_body">
                    <input type="radio" name="workout" id="workoutb1" value="b1">
                    <input type="radio" name="workout" id="workoutb2" value="b2">
                    <input type="radio" name="workout" id="workoutb3" value="b3">
                    <input type="radio" name="workout" id="workoutb4" value="b4">
                    <input type="radio" name="workout" id="workoutb5" value="b5">
                    <div class="workout_bodyList">
                        <label for="workoutb1" class="workoutbody">푸쉬업</label><br>
                        <label for="workoutb2" class="workoutbody">풀업</label><br>
                        <label for="workoutb3" class="workoutbody">윗몸일으키기</label><br>
                        <label for="workoutb4" class="workoutbody">크런치</label><br>
                        <label for="workoutb5" class="workoutbody">맨몸스쿼트</label>
                    </div>
                </div>
                <!--유산소 카테고리 클릭시 보임-->
                <div class="workout_aerobic">
                    <input type="radio" name="workout" id="workoute1" value="b1">
                    <input type="radio" name="workout" id="workoute2" value="b2">
                    <input type="radio" name="workout" id="workoute3" value="b3">
                    <input type="radio" name="workout" id="workoute4" value="b4">
                    <input type="radio" name="workout" id="workoute5" value="b5">
                    <div class="workout_aerobicList">
                        <label for="workoute1" class="workoutaerobic">런닝머신</label><br>
                        <label for="workoute2" class="workoutaerobic">사이클</label><br>
                        <label for="workoute3" class="workoutaerobic">일립티컬</label><br>
                        <label for="workoute4" class="workoutaerobic">스텝퍼</label><br>
                        <label for="workoute5" class="workoutaerobic">맨몸스쿼트</label>
                    </div>
                </div>
            </div>
        </div>
        <hr class="hr1">
        <div class="workoutSettingDiv">
            <div class="workoutSettingTitle">
                선택한 운동 설정
            </div>
            <table id="workoutSettingTable">
                <form action="" method="" >
                    <tr class="workoutSettingTr">
                        <td class="workoutSettingName">운동명</td>
                        <td>
                            <input class="workoutSettingWeight" value="0kg">
                        </td>
                        <td>
                            <input class="workoutSettingNumber" value="0회">
                        </td>
                    </tr>
                </form>
            </table>
        </div>
        <div class="timesettingBtn">
            <input type='button' class="set_timeup3" onclick='count3("plus3")' value='+'>
            <input type="text" readonly maxlength="10" min="1세트" id='count_settime3' value="1세트">
            <input type='button' class="set_timedawn3" onclick='count3("minus3")' value='-'>
            <input class="allsettingBtn" type="button" value="일괄적용">
            <input type="button" class="workout_inputBtn" value="추가">
        </div>

        <hr class="hr2">
        <div class="addworkoutTitle">
            추가된 운동
        </div>
        <div class="addworkoutDay">요일</div>
        <input class="aw1" type="text" readonly value="등">
        <input class="aw2" type="text" readonly value="가슴">
        <input class="aw3" type="text" readonly value="어깨">
        <input class="aw4" type="text" readonly value="하체">
        <input class="aw5" type="text" readonly value="복근">
        <input class="aw6" type="text" readonly value="팔">
        <input class="aw7" type="text" readonly value="엉덩이">
        <input class="aw8" type="text" readonly value="유산소">
        

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
            <img src="./images/gototop.svg">
        </a>
    </footer>

    <script>
        $("#member_icon_img").mouseenter(function (event) {
            // console.log(event);
            $("#member_icon_menu").fadeIn("fast");
        });
        $("#member_icon").mousemove(function (event) {
            // console.log("X:" + event.offsetX + " Y:" + event.offsetY);
        });
        $("#member_icon").mouseleave(function (event) {
            console.log("X:" + event.offsetX + " Y:" + event.offsetY);
            if (event.offsetX < 0 || event.offsetY < 0 || event.offsetX > 23) {
                $("#member_icon_menu").fadeOut("fast");
            }
        });
        $("#member_icon_menu").mouseenter(function (event) {
            // console.log(event);
            // $("#member_icon_menu").css("display","block");
        })
        $("#member_icon_menu").mouseleave(function (event) {
            $("#member_icon_menu").fadeOut("fast");
        })


        $("#bell_icon_img").mouseenter(function (event) {
            // console.log(event);
            $("#bell_icon_notice").fadeIn("fast");
        });
        $("#bell_icon").mousemove(function (event) {
            // console.log("X:" + event.offsetX + " Y:" + event.offsetY);
        });
        $("#bell_icon").mouseleave(function (event) {
            console.log("X:" + event.offsetX + " Y:" + event.offsetY);
            if (event.offsetX < 0 || event.offsetX > 23 || event.offsetY < 0) {
                $("#bell_icon_notice").fadeOut("fast");
            }
            // if(event.offsetY < 5 || event.offsetY > -5) {
            //     $("#bell_icon_notice").fadeOut();
            // }
        });
        $("#bell_icon_notice").mouseenter(function (event) {
            $("#bell_icon_notice").show("fast");
        });
        $("#bell_icon_notice").mouseleave(function (event) {
            $("#bell_icon_notice").fadeOut("fast");
        });

        // header 알림 - x 클릭 시 알림 삭제
        $(".bell_notice_x").click(function () {
            console.log($(this).next().remove());
            $(this).remove();
        });
        //
        $(".day_routinecreat").click(function () {
            $(".routine_taget").hide();
            $(".routine_tagetSelect").hide();
            $(".routine_week").hide();
            $(".routine_weekSelect").hide();
            $(".routine_day").hide();
            $(".routine_daySelect").hide();
            $(".dayroutine_tagetSelect").show();
            $(".routine_taget2").show();
            $(".dayroutine_daySelect").show();
            $(".routine_day2").show();
        });
        $(".week_routinecreat").click(function () {
            $(".routine_taget").show();
            $(".routine_tagetSelect").show();
            $(".routine_week").show();
            $(".routine_weekSelect").show();
            $(".routine_day").show();
            $(".routine_daySelect").show();
            $(".dayroutine_tagetSelect").hide();
            $(".routine_taget2").hide();
            $(".dayroutine_daySelect").hide();
            $(".routine_day2").hide();
        });
        
        // 부위선택시 색변경
        $(".taget_sort")>$("button").click(function () {
            $(this).toggleClass("active");
        });
        // $(".taget_sort")>$("label").click(function () {
        //     $(this).toggleClass("active");
        // });
        // $(".taget_value1").click(function () {
        //     $(this).toggleClass("active");
        // });

        //타이머
        function count(type) {

            const resultElement = document.getElementById('count_settime');

            let number = resultElement.value;
            
            if (type === 'plus' && resultElement.value !== "180초") {
                number = parseInt(number) + 10+'초';
            } else if (type === 'minus' && resultElement.value !== "0초") {
                number = parseInt(number) - 10+'초';
            }
            resultElement.value = number;
        }

        function count2(type) {

            const resultElement2 = document.getElementById('count_settime2');

            let number2 = resultElement2.value;

            if (type === 'plus2' && resultElement2.value !== "300초") {
                number2 = parseInt(number2) + 30+'초';
            } else if (type === 'minus2' && resultElement2.value !== "0초") {
                number2 = parseInt(number2) - 30+'초';
            }
            resultElement2.value = number2;
        }
        //세트카운트
        function count3(type) {

            const resultElement3 = document.getElementById('count_settime3');

            let number3 = resultElement3.value;

            if (type === 'plus3' && resultElement3.value !== "10세트") {
                number3 = parseInt(number3) + 1 +'세트';
            } else if (type === 'minus3' && resultElement3.value !== "1세트") {
                number3 = parseInt(number3) - 1 +'세트';
            }
            resultElement3.value = number3;
        }
        //세트 늘어남
        $(".set_timeup3").on("click",function(){
            // $(".workoutSettingTr");
            var str = $("#count_settime3").val();
            var num = str.replace(/[^0-9]/g,'');
            console.log(num);
            $(".workoutSettingTr").eq(length - 1).after($(".workoutSettingTr").eq(length - 1).clone());
            if(num < 10){
            };

            //console.log($(".workoutSettingTr").get());
            //console.log($($(".workoutSettingTr").get(0)));
            //console.log($(".workoutSettingTr").get()[0]);
            //$("#workoutSettingTable").find();
            //$("#workoutSettingTable").children();
            //parent
            //parents
            //prev
            //next
            //console.log($("body").find("div"));
            //console.log($("#workoutSettingTable").children("tr"));
        });

        //세트삭제
        $(".set_timedawn3").on("click",function(){
            //console.log("test =");
            var str = $("#count_settime3").val();
            //console.log("test =" + str);
            var num = str.replace(/[^0-9]/g,'');
            //console.log("num ="+num)
            if(num > 0){
                $(".workoutSettingTr").eq(length + 1).remove();
            }
            // if(num > 1){
            // $(".workoutSettingTr").eq(length - 1).after($(".workoutSettingTr").eq(length - 1).remove());
            // }
        });

        // 선택한 운동 설정
        $(".workoutAll").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutfreeweight").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutmachine").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutbody").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workoutaerobic").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });

        // 추가버튼 클릭 이벤트 - 요일
        $(".routine_daySelect").change(function(){
            if($(".addworkoutDay").html() =="요일"){
            $(".addworkoutDay").html($(".routine_daySelect").val());
            // console.log("확인용"+$(".routine_daySelect").val());
            }
        });
        // show -요일 - 부위 -선택부위를 true,faluse로 알아냄 *중요*
        var partArray = [false,false,false,false,false,false,false,false];
        $(".taget_value").click(function(){

            var partBtnIndex = 0;
            for(var i = 0; i<$(".taget_value").length; i++){
                if($(".taget_value").eq(i)[0]==$(this)[0]){  //왜 .eq(i)[0] 이렇게 써야하는지 .eq(i)로 비교하면 안되는지
                    partBtnIndex = i;
                }
            }
            partArray[partBtnIndex] = !partArray[partBtnIndex];
        });
        // show -요일 - 부위 -위를 토대로 선택부위를 보여줌
        $(".workout_inputBtn").on("click",function(){
            if($(".addworkoutDay").html()=="요일"){
                alert("요일을 선택해주세요");
            }else{
                $(".addworkoutDay").show();
                for(var i =0; i<partArray.length;i++){
                    if(partArray[i]){
                        var awStr = '.aw' + (i + 1);
                        $(awStr).show();
                    }
                }
            }
        });





        // $(".workout_inputBtn").on("click",function(){

        //     // console.log("확인용2"+$(".taget_value2").html());

        //     if($(".addworkoutDay").html() =="요일"){
        //         alert("요일을 선택해주세요")
        //     }
        //     else if($(".taget_value1").html()=="등"){
        //         $(".aw1").show();
        //         $(".addworkoutDay").show();
        //         console.log("1");
        //     }
        //     else if($(".taget_value2").html()=="가슴"){
        //         $(".aw2").show();
        //         $(".addworkoutDay").show();
        //         console.log("2");
        //     }
        //     else if($(".taget_value3").html()=="어깨"){
        //         $(".aw3").show();
        //         $(".addworkoutDay").show();
        //         console.log("3");
        //     }
        //     else if($(".taget_value4").html()=="하체"){
        //         $(".aw4").show();
        //         $(".addworkoutDay").show();
        //         console.log("4");
        //     }
        //     else if($(".taget_value5").html()=="복근"){
        //         $(".aw5").show();
        //         $(".addworkoutDay").show();
        //         console.log("5");
        //     }
        //     else if($(".taget_value6").html()=="팔"){
        //         $(".aw6").show();
        //         $(".addworkoutDay").show();
        //         console.log("6");
        //     }
        //     else if($(".taget_value7").html()=="엉덩이"){
        //         $(".aw7").show();
        //         $(".addworkoutDay").show();
        //         console.log("7");
        //     }
        //     else if($(".taget_value8").html()=="유산소"){
        //         $(".aw8").show();
        //         $(".addworkoutDay").show();
        //         console.log("8");
        //     }
            
        //     else{
        //     $(".addworkoutDay").show();
        //     }
        //  });

        // 추가버튼 클릭 이벤트 - 부위
        // $()







        // function taget(){
        //     $(".routine_nameBox").css("margin-left","200px");
        // };
    </script>
</body>

</html>