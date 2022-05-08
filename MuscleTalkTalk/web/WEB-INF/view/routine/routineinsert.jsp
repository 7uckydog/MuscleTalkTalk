<%@ include file="/WEB-INF/view/csslink.jsp"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
<%@ include file="/WEB-INF/view/font.jsp"%>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>루틴 생성</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
* {
	text-decoration: none;
	font-family: 'THEmpgtM';
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

.week_routinecreat:default:focus {
	background-color: #4B4DB2;
	color: white;
}

.day_routinecreat:focus, .week_routinecreat:focus {
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
	margin-left: 221px;
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

.routine_name {
	margin-left: 65px;
}

.routine_nameBox {
	width: 233px;
	margin-left: 65px;
	height: 25px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_tagetSelect {
	margin-left: 44px;
	width: 163.5px;
	height: 30px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_weekSelect {
	margin-left: 10px;
	width: 163.5px;
	height: 30px;
	border-radius: 5px;
	border: gray solid 1px;
}

.routine_daySelect {
	margin-left: 12px;
	width: 163.5px;
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

.taget_sort button:nth-child(1), .taget_sort button:nth-child(5) {
	margin-left: 0px;
}

.taget_sort>input:nth-child(1), .taget_sort>input:nth-child(2),
	.taget_sort>input:nth-child(3), .taget_sort>input:nth-child(4),
	.taget_sort>input:nth-child(5), .taget_sort>input:nth-child(6),
	.taget_sort>input:nth-child(7), .taget_sort>input:nth-child(8) {
	display: none;
}

.taget_sort>button:nth-child(9) {
	margin-left: 0px;
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

.taget_sort ~ input[type=checkbox]:checked {
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
.taget_sort>input[type=checkbox]:checked ~ label {
	background-color: #4B4DB2;
	color: white;
}
/* input[type=radio]:nth-of-type(1):checked */
.dayroutine_tagetSelect {
	display: none;
	margin-left: 227.5px;
	width: 163.5px;
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
	margin-left: 11.5px;
	width: 163.5px;
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
	margin-left: 207px;
}

.set_timeup {
	margin-left: 39px;
}

.set_timeup, .set_timedawn {
	width: 28px;
	height: 28px;
	vertical-align: bottom;
}

#count_settime {
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

.set_timeup2, .set_timedawn2 {
	width: 28px;
	height: 28px;
	vertical-align: bottom;
}

.set_timeup2 {
	margin-left: 12px;
}

#count_settime2 {
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

.set_time_title2 {
	margin-left: 92px;
}

.week_import {
	margin-left: 96px;
}

.week_import_Select {
	width: 163.5px;
	height: 30px;
	margin-left: 12px;
	border-radius: 5px;
	border: gray solid 1px;
}

.workout_main {
	margin: 45px 65px 0 65px;
}

.worksearch {
	margin-top: 10px;
	margin-left: 65px;
	width: 167px;
	height: 25px;
	margin-bottom: 15px;
}

.btn_worksearch {
	width: 50px;
	margin-left: 5px;
	border-radius: 5px;
}

.workout_category {
	margin: 0 64px 0 64px;
	border: #4B4DB2 solid 1px;
	/* height: 170px; */
	border-top: 0px;
}
/* .workout_category >*/
input[type=radio] {
	display: none;
}
/* .workout_category_Name{
            margin: 20px 65px 0 65px;
        } */
.tab_btn {
	display: inline-block;
	width: 800px;
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

label {
	cursor: pointer;
	display: block;
}

input[type=radio]:nth-of-type(1):checked ~ .workout_category_Name>label:nth-of-type(1),
	input[type=radio]:nth-of-type(2):checked ~ .workout_category_Name>label:nth-of-type(2),
	input[type=radio]:nth-of-type(3):checked ~ .workout_category_Name>label:nth-of-type(3),
	input[type=radio]:nth-of-type(4):checked ~ .workout_category_Name>label:nth-of-type(4),
	input[type=radio]:nth-of-type(5):checked ~ .workout_category_Name>label:nth-of-type(5)
	{
	background-color: #4B4DB2;
	color: white;
}

.tab_btn:nth-child(1), .tab_btn:nth-child(2), .tab_btn:nth-child(3),
	.tab_btn:nth-child(4), .tab_btn:nth-child(5) {
	border-right: 0px;
}

.tab_btn:nth-child(1) {
	border-left: 0px;
}

.workouts {
	/* border: #4B4DB2 solid 1px;
            height: 100px;
            overflow-x: hidden; */
	
}
/* 운동 카테고리 안보이게 함 */
input[type=radio] ~ .workouts>div {
	display: none;
}
/* 운동 카테고리 클릭시 보이게 함 1-전체 2-프리 3-머신 4-맨몸 5-유산소*/
.workout_category>input[type=radio]:nth-of-type(1):checked ~ .workouts>div:nth-of-type(1)
	{
	display: block;
}

.workout_category>input[type=radio]:nth-of-type(2):checked ~ .workouts>div:nth-of-type(2)
	{
	display: block;
}

.workout_category>input[type=radio]:nth-of-type(3):checked ~ .workouts>div:nth-of-type(3)
	{
	display: block;
}

.workout_category>input[type=radio]:nth-of-type(4):checked ~ .workouts>div:nth-of-type(4)
	{
	display: block;
}

.workout_category>input[type=radio]:nth-of-type(5):checked ~ .workouts>div:nth-of-type(5)
	{
	display: block;
}
/* 카테고리 선택시 div */
.workout_AllList, .workout_freeweightList, .workout_machineList,
	.workout_bodyList, .workout_aerobicList {
	height: 120px;
	width: 800px;
	padding-left: 10px;
	overflow-y: auto;
	box-sizing: border-box;
}

.workoutAll, .workoutfreeweight, .workoutmachine, .workoutbody,
	.workoutaerobic {
	line-height: 16px;
	box-sizing: content-box;
	width: auto;
	display: inline-block;
}

.hr1 {
	margin-top: 30px;
	width: 800px;
	text-align: center;
}

.workoutSettingDiv {
	width: 800px;
	margin-left: 0;
	margin-right: 0;
	display: inline;
}

.workoutSettingTitle {
	margin-top: 30px;
	margin-left: 65px;
	margin-bottom: 25px;
}

.workoutSettingName {
	margin-left: 65px;
	background-color: #4B4DB2;
	color: white;
}

.workoutSettingName, .workoutSettingWeight, .workoutSettingNumber {
	width: 140px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	display: inline-block;
	float: left;
}

.workoutSettingWeight, .workoutSettingNumber {
	color: #4B4DB2;
	background-color: white;
	box-sizing: border-box;
	border: #4B4DB2 solid 1px;
}

.workoutSettingWeight {
	border-right: 0px;
}

.set_timeup3, .set_timedawn3 {
	width: 28px;
	height: 28px;
	line-height: 28px;
	vertical-align: bottom;
}

.set_timeup3 {
	margin-left: 40px;
}

#count_settime3 {
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

table {
	/* display: inline-block; */
	border-collapse: separate;
	border-spacing: 0 5px;
	float: left;
}

.allsettingBtn {
	margin-left: 20px;
	font-size: 12px;
	height: 28px;
	width: 75px;
}

.timesettingBtn {
	padding-top: 5px;
	border-radius: 5px;
}

.workout_inputBtn {
	width: 60px;
	height: 28px;
	outline: 0px;
	border: 0px;
	background-color: #4B4DB2;
	color: white;
	margin-left: 20px;
	border-radius: 5px;
	cursor: pointer;
}

.hr2 {
	margin-top: 50px;
	width: 800px;
	text-align: center;
}

.addworkoutTitle {
	margin-top: 50px;
	margin-left: 65px;
	margin-bottom: 20px;
}

.addworkoutDay {
	margin-left: 65px;
	width: 140px;
	text-align: center;
	height: 30px;
	line-height: 30px;
	background-color: #4B4DB2;
	color: white;
	/* display: none; */
	float: left;
}

.addworkoutPart {
	/* display: none; */
	margin-left: 10px;
	width: 50px;
	height: 26px;
	line-height: 26px;
	text-align: center;
	border: 1px solid #4B4DB2;
	background-color: white;
	color: #4B4DB2;
	border-radius: 2.5px;
	outline: none;
	float: left;
}

.addworkoutDiv {
	margin-left: 65px;
	overflow: hidden;
}

.addworkoutTable td {
	width: 140px;
	height: 30px;
	line-height: 30px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
	text-align: center;
}
.addworkoutset{
border-left: 0px !important;
}

.addworkoutTable td:nth-child(2), .addworkoutTable td:nth-child(3),
	.addworkoutTable td:nth-child(4) {
	border-left: 0px;
}

.addworkoutTable {
	/* display: none; */
	box-sizing: border-box;
	height: auto;
	float: left;
}

.addworkoutAllDiv {
	overflow: hidden;
}

.addworkoutAllDivTop {
	overflow: hidden;
}

.MemoTitle {
	margin-top: 50px;
	margin-left: 65px;
	margin-bottom: 20px;
}

#routineMemo {
	resize: none;
	width: 800px;
	height: 208px;
	overflow-y: scroll;
	margin-left: 65px;
}

#routineinsertcancelBtn {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}

#routineinsertBtn {
	width: 155px;
	height: 30px;
	font-size: 12px;
	color: white;
	background-color: #4B4DB2;
	border: 1px solid #4B4DB2;
}

.Btn_cancel_inset {
	margin-top: 62px;
	text-align: center;
}

.workout_AllList p {
	width: auto;
	cursor: pointer;
}
.addworkoutAllDiv input {
/* 	display: none; */
}
</style>
</head>

<body bgcolor=" #ECECEC">
	<%@ include file="/WEB-INF/view/template.jsp"%>

	<section>
		<form class="routineForm" name="routineFormName">
			<div id="routinecreat_main">
				루틴생성
				<button class="day_routinecreat">일간루틴</button>
				<button class="week_routinecreat">주간루틴</button>
			</div>
			<div class="routine_title">
				<span class="routine_name">루틴명 설정</span> <span class="routine_taget">루틴
					목표</span> <span class="routine_taget2">루틴 목표</span> <span
					class="routine_week">루틴 수행 주차</span> <span class="routine_day">루틴
					수행 요일</span> <span class="routine_day2">루틴 수행 일자</span>
			</div>
			<div>
				<input type="text" name="routine_nameBox" class="routine_nameBox" placeholder="루틴명을 입력하세요." required>
				<select name="routine_tagetName"
					class="routine_tagetSelect">
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
				</select> <select name="routine_weekName" class="routine_weekSelect">
					<option value="none" selected hidden>주차 선택</option>
					<option value="1주차">1주차</option>
					<option value="2주차">2주차</option>
					<option value="3주차">3주차</option>
					<option value="4주차">4주차</option>
					<option value="5주차">5주차</option>
					<option value="6주차">6주차</option>
				</select> <select name="routine_dayName" class="routine_daySelect">
					<option value="none" selected hidden>요일 선택</option>
					<option value="월">월</option>
					<option value="화">화</option>
					<option value="수">수</option>
					<option value="목">목</option>
					<option value="금">금</option>
					<option value="토">토</option>
					<option value="일">일</option>
				</select> <select name="dayroutine_dayName" class="dayroutine_daySelect">
					<option value="none" selected hidden>일자 선택</option>
					<option value="day1">day1</option>
					<option value="day2">day2</option>
					<option value="day3">day3</option>
					<option value="day4">day4</option>
					<option value="day5">day5</option>
					<option value="day6">day6</option>
					<option value="day7">day7</option>
				</select>
			</div>
			<div class="taget_timeDiv">
				<span class="taget_btn">운동 부위 선택</span> <span class="set_time_title">세트별
					휴식시간</span> <span class="set_time_title2">운동별 휴식시간</span> <span
					class="week_import">N주차 불러오기</span>
				<div class="taget_sort">
					<input type="checkbox" name="taget_sort" value="B" id="taget_value1"> <input
						type="checkbox" name="taget_sort" value="C" id="taget_value2"> <input
						type="checkbox" name="taget_sort" value="S" id="taget_value3"> <input
						type="checkbox" name="taget_sort" value="L" id="taget_value4"> <input
						type="checkbox" name="taget_sort" value="A" id="taget_value5"> <input
						type="checkbox" name="taget_sort" value="E" id="taget_value6"> <input
						type="checkbox" name="taget_sort" value="H" id="taget_value7"> <input
						type="checkbox" name="taget_sort" value="T" id="taget_value8">
					<button type="button" name="taget_sort" class="taget_value" value="B">등</button>
					<button type="button" name="taget_sort" class="taget_value" value="C">가슴</button>
					<button type="button" name="taget_sort" class="taget_value" value="S">어깨</button>
					<button type="button" name="taget_sort" class="taget_value" value="L">하체</button>
					<!-- 세트별 시간 -->
					<input type='button' class="set_timeup" onclick='count("plus")'
						value='+'> <input type="text" name="settime" maxlength="4" min="0초"
						id='count_settime' value="0초"> <input type='button'
						class="set_timedawn" onclick='count("minus")' value='-'>
					<!-- 운동별 시간 -->
					<input type='button' class="set_timeup2" onclick='count2("plus2")'
						value='+'> <input type="text" name="worktime" maxlength="4"
						id='count_settime2' value="0초"> <input type='button'
						class="set_timedawn2" onclick='count2("minus2")' value='-'>
					<select name="week_import_Select" class="week_import_Select">
						<option value="1주차">1주차</option>
						<option value="2주차">2주차</option>
						<option value="3주차">3주차</option>
						<option value="4주차">4주차</option>
						<option value="5주차">5주차</option>
						<option value="6주차">6주차</option>
					</select>
				</div>
				<div class="taget_sort">
					<button type="button" name="taget_sort" class="taget_value" value="A">복근</button>
					<button type="button" name="taget_sort" class="taget_value" value="E">팔</button>
					<button type="button" name="taget_sort" class="taget_value" value="H">엉덩이</button>
					<button type="button" name="taget_sort" class="taget_value" value="T">유산소</button>
				</div>
			</div>
			<div class="workout_main">
				<span>운동 추가</span>
			</div>
			<input class="worksearch" type="text" placeholder="검색어를 입력하세요.">
			<button class="btn_worksearch" type="button">검색</button>
			</div>
			<div class="workout_category">
				<input type="radio" name="tab" id="category1" value="1" checked>
<!-- 				<input type="radio" name="tab" id="category2" value="2"> <input
					type="radio" name="tab" id="category3" value="3"> <input
					type="radio" name="tab" id="category4" value="4"> <input
					type="radio" name="tab" id="category5" value="5"> -->
				<div class="workout_category_Name">
					<label for="category1" class="tab_btn">선택 부위 운동 리스트</label>
					<!--                 <label for="category2" class="tab_btn">프리웨이트</label>
                <label for="category3" class="tab_btn">머신 운동</label>
                <label for="category4" class="tab_btn">맨몸 운동</label>
                <label for="category5" class="tab_btn">유산소</label> -->
				</div>
				<div class="workouts">
					<!--전체 카테고리 클릭시 보임-->
					<div class="workout_All">
						<input type="radio" name="workout" id="workouta1" value="a1">
						<input type="radio" name="workout" id="workouta2" value="a2">
						<input type="radio" name="workout" id="workouta3" value="a3">
						<input type="radio" name="workout" id="workouta4" value="a4">
						<input type="radio" name="workout" id="workouta5" value="a5">
						<div class="workout_AllList"></div>
					</div>
					<!--프리웨이트 카테고리 클릭시 보임-->
					<div class="workout_freeweight">
						<input type="radio" name="workout" id="workoutf1" value="f1">
						<input type="radio" name="workout" id="workoutf2" value="f2">
						<input type="radio" name="workout" id="workoutf3" value="f3">
						<input type="radio" name="workout" id="workoutf4" value="f4">
						<input type="radio" name="workout" id="workoutf5" value="f5">
						<div class="workout_freeweightList">
							<label for="workoutf1" class="workoutfreeweight">컨벤셔널
								데드리프트</label><br> <label for="workoutf2" class="workoutfreeweight">벤치프레스</label><br>
							<label for="workoutf3" class="workoutfreeweight">스쿼트</label><br>
							<label for="workoutf4" class="workoutfreeweight">덤벨 컬</label><br>
							<label for="workoutf5" class="workoutfreeweight">인클라인
								벤치프레스</label>
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
							<label for="workoutm2" class="workoutmachine">스미스 인클라인
								벤치프레스</label><br> <label for="workoutm3" class="workoutmachine">레그프레스</label><br>
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
							<label for="workoutb1" class="workoutbody">푸쉬업</label><br> <label
								for="workoutb2" class="workoutbody">풀업</label><br> <label
								for="workoutb3" class="workoutbody">윗몸일으키기</label><br> <label
								for="workoutb4" class="workoutbody">크런치</label><br> <label
								for="workoutb5" class="workoutbody">맨몸스쿼트</label>
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
				<div class="workoutSettingTitle">선택한 운동 설정</div>
				<table id="workoutSettingTable">
					<tr class="workoutSettingTr">
						<td class="workoutSettingName" name="workoutSettingName">운동명</td>
						<td><input maxlength="5" class="workoutSettingWeight" name="workoutSettingWeight"
							value="0kg"></td>
						<td><input maxlength="3" class="workoutSettingNumber" name="workoutSettingNumber"
							value="0회"></td>
					</tr>
				</table>
			</div>
			<div class="timesettingBtn">
				<input type='button' class="set_timeup3" onclick='count3("plus3")'
					value='+'> <input type="text" readonly maxlength="10"
					min="1세트" id='count_settime3' name="setNumber" value="1세트"> <input
					type='button' class="set_timedawn3" onclick='count3("minus3")'
					value='-'> <input class="allsettingBtn" type="button"
					value="일괄적용"> <input type="button" class="workout_inputBtn"
					value="추가">
			</div>

			<hr class="hr2">
			<div class="addworkoutTitle">추가된 운동</div>
			<hr class="hr2">
			<div class="MemoTitle">메모</div>
			<textarea id="routineMemo" name="routineMemo" placeholder="내용을 입력하세요."></textarea>
			<div class="Btn_cancel_inset">
				<button id="routineinsertcancelBtn" type="button">취소</button>
				<button id="routineinsertBtn" type="button" onclick="formSubmit()">루틴
					생성</button>
			</div>
			<!-- <input type="text" value="" class="routineAllData"> -->
		</form>
	</section>




	<%@ include file="/WEB-INF/view/footer.jsp"%>

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
            // $(".week_routinecreat").hide();
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



        // 선택한 운동 설정
        $(".workoutAll").on({
            click : function(){
                // console.log($(this));
                // console.log($(this).position());
                // console.log($(this).index());
            $('.workoutSettingName').text($(this).text());
            }
        });
        $(".workout_AllList p").on({
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

        // 루틴요일 클릭 이벤트 - 요일 
        // $(".routine_daySelect").change(function(){
        //     if($(".addworkoutDay").html() =="요일"){
        //     $(".addworkoutDay").html($(".routine_daySelect").val());
        //     // console.log("확인용"+$(".routine_daySelect").val());
        //     }

        // });
        // show -요일 - 부위 -선택부위를 true,faluse로 알아냄 *중요*
        var partArray = [false,false,false,false,false,false,false,false];
        $(".taget_value").click(function(){
			var $tagetValueThis = $(this);
            var partBtnIndex = 0;
            for(var i = 0; i<$(".taget_value").length; i++){
                if($(".taget_value").eq(i)[0]==$(this)[0]){  //왜 .eq(i)[0] 이렇게 써야하는지 .eq(i)로 비교하면 안되는지
                    partBtnIndex = i;
/* 		            console.log($(".taget_value").eq(i)[0]);
		            console.log($(this)[0]);
		            console.log("파트어레이1"+!($(partArray)[partBtnIndex])); */

                }
            }
            partArray[partBtnIndex] = !partArray[partBtnIndex];
            /* console.log("파트어레이2"+$(partArray)[1]); */
            
            
            //부위 선택 
           
       	   	$.ajax({
       	   		url:"exerciseread",
       	   		type:"post",
       	   		dataType: 'json',
       	   		data:{tagetValue:$(this).val()},
       	   		success: function(result) {
       				console.log("부위에이작스 성공시");
       				/* console.log(result); */
       				/* console.log($(this)[0]);
       				console.log($(partArray).eq(0)[0]);
       				console.log($(partArray).length); */
       				var exerciseNameEqual = false;
       				var workoutAllListLength = $('.workout_AllList p').length;
       				// 운동 추가 
       				for(var i=0; i<result.length; i++){
       					if(workoutAllListLength  == 0) {
       						$('.workout_AllList').append('<p>'+result[i].exerciseName+'</p>');
       					} else {
	       					for(var j=0; j<workoutAllListLength;j++){
		       					if(result[i].exerciseName == $('.workout_AllList p').eq(j).text()){
		       						exerciseNameEqual = true;
		       					}
	       					}// 중복으로 클릭시 해당부위의 운동종목이 없다면 추가함
	       					if(exerciseNameEqual == false) {
	       						$('.workout_AllList').append('<p>'+result[i].exerciseName+'</p>');
	       					}
       					}
       				}
       				// 운동 중복 제거 
       				var deleteTempIndex = -1;
       			 	for(var k =0; k<partArray.length;k++){
 				 		if($(".taget_value").eq(k)[0] ==$tagetValueThis[0]){
 				 			deleteTempIndex = k;
				 		} 
					}
       			 	if(partArray[deleteTempIndex] == false) {  
	       			 	for(var i=0; i<result.length; i++) {
		       			 	for(var j=0; j<$('.workout_AllList p').length;j++){
		       					if(result[i].exerciseName == $('.workout_AllList p').eq(j).text()){
		       						$('.workout_AllList p').eq(j).remove();
		       						break;
		       					}
	       					}
	       			 	}
       			 	}
       			 	// 추가된 p태그에 이벤트 걸기
       			 	$(".workout_AllList p").off('click');
	       			$(".workout_AllList p").on({
	       	            click : function(){
	       	                // console.log($(this));
	       	                // console.log($(this).position());
	       	                // console.log($(this).index());
	       	            $('.workoutSettingName').text($(this).text());
	       	            }
	       	       });
       			 	
       			}
       	   	});
        	
        });
        
        
        // show -요일 - 부위 -위를 토대로 선택부위를 보여줌
        // 추가버튼 클릭 이벤트 - 요일, - 추가된 운동명
        $(".workout_inputBtn").on("click",function(){
/*             console.log($(".routine_daySelect").val());
            console.log(partArray);
            console.log($(".taget_value")[0]); */
            if($(".routine_daySelect").val()=="none" && $(".dayroutine_daySelect").val()=="none"){
                alert("일자/요일을 선택해주세요");
                return;
            }

 
            var arrayLength = $(".workoutSettingTr").length;
/*             console.log($(".workoutSettingTr").length); */
            var chkEqualDay = true;
            var dayTemp = -1;
            if($(".addworkoutAllDiv").length ==0){
                $(".addworkoutTitle").after('<div class="addworkoutAllDiv" name="addworkoutAllDiv"></div>');
                $(".addworkoutAllDiv").append('<div class="addworkoutAllDivTop" name="addworkoutAllDivTop"></div>');
            }else{
                for(var i = 0; i < $(".addworkoutAllDiv").length; i++) {
                    if($(".addworkoutDay").eq(i).text() == $(".routine_daySelect").val()) {
                        chkEqualDay = false;
                        dayTemp = i;
                    }
                }
                if(chkEqualDay) {
                    $('.addworkoutDiv').eq($('.addworkoutDiv').length-1).after('<div class="addworkoutAllDiv name="addworkoutAllDiv""><div class="addworkoutAllDivTop" name="addworkoutAllDivTop"></div></div>');
                }
            }
            if($(".dayroutine_daySelect").val()=="none"){ //요일
                if(chkEqualDay) {
                    $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).append('<div class="addworkoutDay" name="addworkoutDay">'+($(".routine_weekSelect").val())+'&nbsp;'+'&nbsp;'+'&nbsp;'+($(".routine_daySelect").val())+'</div>');
                 	// 주차 인풋생성 및 담기
                    $('.addworkoutAllDivTop').eq($(".addworkoutAllDivTop").length-1).append('<input class=addworkoutDayweekinput name="addworkoutDayweekinput"></input>');
                    $('.addworkoutDayweekinput').eq($(".addworkoutAllDivTop").length-1).val($(".routine_weekSelect").val());
                 	// 요일 인풋생성 및 담기
                    $('.addworkoutAllDivTop').eq($(".addworkoutAllDivTop").length-1).append('<input class=addworkDayinput name="addworkDay"></input>');
                    $('.addworkDayinput').eq($(".addworkoutAllDivTop").length-1).val($(".routine_daySelect").val());
                }
            }else if($(".routine_daySelect").val()=="none"){ //1,2,3day
                $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).append('<div class="addworkoutDay" name="addworkoutDay">'+($(".dayroutine_daySelect").val())+'</div>');
             	// day 인풋생성 및 담기
                $('.addworkoutAllDivTop').eq($(".addworkoutAllDivTop").length-1).append('<input class=addworkoutDayinput name="addworkoutoneDay"></input>');
                $('.addworkoutDayinput').eq($(".addworkoutAllDivTop").length-1).val($(".dayroutine_daySelect").val());
            }
            
            if(chkEqualDay) {
                for(var i = 0; i < partArray.length; i++){
                    if(partArray[i]){
                        $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).append('<div class="addworkoutPart" name="addworkoutPart">'+($(".taget_value").eq(i).text())+'</div>');
                    }
                }
                $(".addworkoutAllDivTop").eq($(".addworkoutAllDivTop").length-1).after('<div class="addworkoutDiv" name="addworkoutDiv"><table class="addworkoutTable" name="addworkoutTable"></table></div>');
            } else {
                var $divTopPark = $(".addworkoutAllDivTop").eq(dayTemp).children('.addworkoutPart');
                for(var i = 0; i < partArray.length; i++){
                    if(partArray[i]){
                        for(var j = 0; j < $divTopPark.length; j++) {
                            if($divTopPark.eq(j).text() != $(".taget_value").eq(i).text()) {
                                $(".addworkoutAllDivTop").eq(dayTemp).append('<div class="addworkoutPart" name="addworkoutPart">'+($(".taget_value").eq(i).text())+'</div>');
                            }
                        }
                    }
                }
            }
            if(dayTemp == -1) {
                var prevTrLength = $(".addworkoutTr").length;
                for(var i = 0; i < arrayLength; i++) {
                    $('.addworkoutTable').eq($(".addworkoutTable").length-1).append('<tr class="addworkoutTr" name="addworkoutTr"></tr>');
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutname" name="addworkoutname">'+($(".workoutSettingName").eq(i).text())+'</td>');                 
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutweight" name="addworkoutweight">'+($(".workoutSettingWeight").eq(i).val())+'</td>');
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutsettingname" name="addworkoutsettingname">'+($(".workoutSettingNumber").eq(i).val())+'</td>');
                    $('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutset" name="addworkoutset">'+(i+1)+'세트</td>');
                    // 운동명 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutnameinput name="addworkoutname"></input>');
                    $('.addworkoutnameinput').eq(prevTrLength+i).val($(".workoutSettingName").eq(i).text());
                    // 무게 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutweightinput name="addworkoutweight"></input>');
                    $('.addworkoutweightinput').eq(prevTrLength+i).val($(".workoutSettingWeight").eq(i).val());
                    // 횟수 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutsettingnameinput name="addworkoutsettingname"></input>');
                    $('.addworkoutsettingnameinput').eq(prevTrLength+i).val($(".workoutSettingNumber").eq(i).val());
                    // 세트 인풋생성 및 담기
                    $('.addworkoutTr').eq(prevTrLength+i).append('<input class=addworkoutsetinput name="addworkoutset"></input>');
                    $('.addworkoutsetinput').eq(prevTrLength+i).val((i+1)+"세트");
                    //$('.Btn_cancel_inset').after('<input type="text" value="" class="routineAllData" name="routineAllData">');
                }
            } else {
                console.log("여기????");
                var prevTrLength = $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').length;
/*                 console.log(prevTrLength); */
                for(var i = 0; i < arrayLength; i++) {
                    $('.addworkoutTable').eq(dayTemp).append('<tr class="addworkoutTr"></tr>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutname" name="addworkoutname">'+($(".workoutSettingName").eq(i).text())+'</td>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutweight" name="addworkoutweight">'+($(".workoutSettingWeight").eq(i).val())+'</td>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutsettingname" name="addworkoutsettingname">'+($(".workoutSettingNumber").eq(i).val())+'</td>');
                    $('.addworkoutTable').eq(dayTemp).children('.addworkoutTr').eq(prevTrLength+i).append('<td class="addworkoutset" name="addworkoutset">'+(i+1)+'세트</td>');
                    // 운동명 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutnameinput name="addworkoutname"></input>');
                    $('.addworkoutnameinput').eq(dayTemp).val($(".workoutSettingName").eq(i).text());
                    // 무게 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutweightinput name="addworkoutweight"></input>');
                    $('.addworkoutweightinput').eq(dayTemp).val($(".workoutSettingWeight").eq(i).val());
                 	// 횟수 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutsettingnameinput name="addworkoutsettingname"></input>');
                    $('.addworkoutsettingnameinput').eq(dayTemp).val($(".workoutSettingNumber").eq(i).val());
                    // 세트 인풋생성 및 담기
                    $('.addworkoutTr').eq(dayTemp).append('<input class=addworkoutsetinput name="addworkoutset"></input>');
                    $('.addworkoutsetinput').eq(dayTemp).val((i+1)+"세트");
                    //$('.Btn_cancel_inset').after('<input type="text" value="" class="routineAllData" name="routineAllData">');
                }
            }
/*             	// 운동이름 담을 인풋박스 만들기
                $('.addworkoutname').eq($('.addworkoutname').length-1).append('<input class="addworkoutnameinput" name="addworkoutname"></input>');
	            // 운동이름 담기
	            $(".addworkoutnameinput").val($('.addworkoutname').eq(0).text()); */
/*             console.log($("#count_settime").eq(0).val());
            console.log($(".addworkoutAllDiv").text()); */

            console.log('운동이름'+$(".addworkoutname").eq(0).text());
            console.log('운동부위'+$(".addworkoutPart").text());
            console.log('운동무게'+$(".addworkoutweight").text());
            console.log('운동횟수'+$(".addworkoutsettingname").text());
            console.log('운동세트'+$(".addworkoutset").text());
            console.log("시리얼"+$('.routineForm').serialize());

            
            
            
/*             console.log($(".routineAllData").val()); //배열로 들어옴 */

            // 루틴생성정보담기
/*             for(var j =0; j < arrayLength; j++){
                $(".routineAllData").eq(j).val($(".addworkoutname").text());
                $(".routineAllData").eq(j+1).val($(".addworkoutset").text());
            }; */


            // 시간초기화
            $("#count_settime").val("0초");
            $("#count_settime2").val("0초");
			
            //무게 및 횟수 초기화
            $(".workoutSettingWeight").val("0kg");
            $(".workoutSettingNumber").val("0회");
            
            for(var i = 0;i<arrayLength - 1;i++){
                //tr 삭제
                count3("minus3");
                $(".workoutSettingTr").eq(length).remove();
            }
            $(".workoutSettingName").text('운동명');
            return;
        });


        $("#routineinsertBtn").on("click",function(){
            if($(".addworkoutTable").length == 0){
                alert("추가된 운동이 없습니다.");
            } 
        });
        
        console.log("div네임");

        var name_by_class = $('div[name="addworkoutname"]');
        console.log("네임으로가져옴"+name_by_class);

        var aWN = $(".addworkoutname").attr('name');
        
        
        
    	// form  serialize()
    	function formSubmit() {
    	    var params = $('.routineForm').serialize();
    	    console.log(params);
    	     $.ajax({
    	    	url: "routineinsert.a",
    	    	type: "post",
    	    	data: params,
    	    	success:function(result){
    	    		console.log(result);
    	    		alert("루틴이 생성되었습니다.");
    	    	},
    	    	error:{
    	    		
    	    	}
    	   	});
    	    
    	}
    	
    	
    	
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
        
        
        
            


    </script>
</body>

</html>