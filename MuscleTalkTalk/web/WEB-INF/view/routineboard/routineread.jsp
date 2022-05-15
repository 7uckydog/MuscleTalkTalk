<%@page import="kh.semi.mtt.routineboard.model.vo.RoutineBoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="kh.semi.mtt.comment.model.vo.CommentVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>루틴게시판 읽기</title>
    <%@ include file="/WEB-INF/view/font.jsp" %>
</head>
<body>
	<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>routineboardread</title>
    <link rel="stylesheet" href="">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
        body{
            width: 1200px;
            margin: 0 auto;
        }
        *{
            text-decoration: none;
            font-family: THEmpgtM;
            
        }
        button{
        cursor: pointer;
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
        #icon_menu{
            position: absolute;
            right: 50px;
        }
        #member_icon{
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
        #bell_icon{
            float: left;
            margin-right: 20px;
            margin-top: 58px;
            transition: .3s;
            width: 24px;
        }
        #home_icon{
            float: left;
            margin-right: 20px;
            margin-top: 58px;
            transition: .3s;
            width: 24px;
        }
        #member_icon_menu{
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
        #member_icon_menu > :first-child{
            margin-top: 15px;
            margin-bottom: -6px;
        }
        #member_icon_menu > :first-child > a > p, #member_icon_menu > :nth-of-type(2) > a > p {
            padding-top: 8px;
            color: #4B4DB2;
            font-weight: lighter;
        }
        #login_icon{
            float: left; 
            margin-left: 30px; 
            margin-right: -10px;
        }
        #sign_icon{
            float: left;
            margin-left: 30px; 
            margin-right: -10px;
        }

        #bell_icon_notice{
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
        #header_notice_all{
            margin-left: 20px;
        }
        #header_notice_all > div{
            position: relative;
            margin-top: 20px;
            margin-bottom: 20px;
        }
        #header_notice_all > div > img{
            position: absolute;
            right: 15px;
        }
        .header_notice{
            color: #4B4DB2;
            font-size: 12px;
            overflow: hidden;
            width: 120px;
        }
        .header_notice > :nth-child(1){
            font-weight: bolder;
            margin-bottom: 5px;
        }
        .header_notice > :nth-child(2){
            color: #4B4DB2;
            font-size: 9px;
            width: 125px;
            line-height: 12px;
        }

/* aside css */
        aside{
            position: fixed;
            margin-left: 50px;
            width: 125px;
            height: 550px;
            background-color: #4B4DB2;
            border-radius: 10px;
            font-family:'THEmpgtM';
        }
        #aside_all > :first-child{
            margin-top: 115px;
        }
        #aside_all > div{
            width: 80px;
            left: 30px;
            margin-left: 25px;
        }
        #aside_all > div:hover{
            opacity: 0.3;
            transition: .3s ease;
        }
        #aside_all > div > a > img{
            width: 25px;
            margin-left: 27px;
            margin-top: 20px;
            margin-bottom: 7px;
            display: inline-block;
            transition: .3s ease;
        }
        #aside_all > :first-child > img {
            margin-top: 103px;
            transition: .3s;
        }
        #aside_all > div > a > p{
            font-size: 9px;
            text-align: center;
            color: white;
            margin-bottom: 15px;
            transition: .3s ease;
            font-weight: lighter;
        }
        #triangle_4{
            width: 0px;
            height: 0px;
            border-left: 18px solid #4B4DB2;
            border-top: 15px solid transparent;
            border-bottom: 15px solid transparent;
            position: relative;
            right: -100%;
            display: none;
        }
        #aside_1{
            background-color: blanchedalmond;
            width: 45px;
            height: 45px;
            margin-left: 18px;
        }

/* section css */
        section{
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 930px;
            height: auto;
            font-size: 12px;
            position: relative;
            
        }
        #board_main{
           /* margin-top: 65px; */
            /* margin-left: 65px; */
            padding-top: 65px;
            margin-left: 65px;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 40px;
            font-size: 15px;
        }
        #board_category{
            padding-top: 65px;
            margin-right: 65px;
            float: right;
            font-size: 12px;
        }
        #board_note{
            border:1px solid #4B4DB2; 
            border-bottom: 0;
            width: 800px;
            box-sizing: border-box;
            height: 150px;
            /* padding: 40px 30px 30px 30px; */
            padding-left: 50px;
            margin: 0 65px;
            text-align: left;
        }
        #note_title{
            margin-top: 30px;
           margin-bottom: 20px;
           font-size: 12px;
        }
        .note_content_1{
            font-weight: 100;
            margin-top: 20px;
        }
        .note_content_2{
            font-weight: 100;
            margin-top: 15px;
            margin-bottom: 15px;
        }
        .note_content_3{
            font-weight: 100;
            /* margin-top: 20px; */
        }
        .note_content_1,.note_content_2,.note_content_3{
            font-size: 12px;
        }
        #board_information{ 
            border:1px solid #4B4DB2; 
            background-color: #4B4DB2;
            width: 800px;
            box-sizing: border-box;
            height: 55px;
            padding: 10px 30px 10px 50px;
            margin: 0px auto;
            text-align: left;
            position: relative;
            overflow: hidden;
            vertical-align: middle;
        }
        #writer_board{
            display: inline-block;
            /* margin: auto; */
            line-height: 30px;
            font-size: 12px;
            color: white;
        }
        #board_write1{
            margin: 60px 0 0 65px;
            display: inline-block;
            font-size: 12px;
        }
        #board_title{
            margin: 15px 0 0 65px;
            width: 260px;
            height: 25px;
            font-size: 12px;
        }
        #board_content{
            margin: 35px 0 25px 65px;
            font-size: 12px;
        }
        #board_content1{
            margin: 10px 65px 0 65px;
            width: 790px;
            height: 228px;
            box-sizing: content-box;
            resize: none;
            overflow: hidden,scroll,auto;
  			text-overflow: clip;
        }
        #board_cancel{
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: #4B4DB2;
            background-color: white;
            border: 1px solid #4B4DB2;
        }
        #board_register{
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: white;
            background-color: #4B4DB2;
            border: 1px solid #4B4DB2;
        }
        #btn_cancel_register{
            margin-top: 62px;
            text-align: center;
            padding-bottom: 100px;
        }
        #read_title{
            margin: 15px 0 0 65px;
            width: 260px;
            height: 25px;
            font-size: 12px;
            border: black;
        }
        #board_write1,#boardread_1,#boardread_2,#boardread_3,#boardread_4{
            display: inline-block;
        }
        #read_title,#read_title_1,#read_title_2,#read_title_3,#read_title_4{
            display: inline-block;
        }
        #boardread_1{
            margin-left: 280px;
        }
        #boardread_2{
            margin-left: 90px;
        }
        #boardread_3{
            margin-left: 50px;
        }
        #boardread_4{
            margin-left: 60px;
        }
        #read_title_1{
            width: 90px;
            margin-left: 64px;
        }
        #read_title_2{
            margin-left: 60.5px;
        }
        #read_title_3{
            width: 50px;
            margin-left: 77px;
        }
        #read_title_4{
            width: 100px;
            margin-left: 30px;
        }
        hr{
            margin-top: 25px;
            margin-left: 65px;
            width: 798px;
        }
        #read_content{
            height: auto;
            margin-bottom: 60px;
            width: 798px;
            margin-left: 65px;
            text-overflow: clip;
        }
        #recomment{
            margin-left: 65px;
            margin-bottom: 30px;
        }
        #member_image{
			margin-left: 55px;
			/* display: inline-block; */
        }
        #memberName{
            display: inline-block;
            margin-left: 10px;
        }
        #readrecomment{
            margin-top: 20px;
            margin-left: 115px;
            width: 630px;
            height: 40px;
        }
        #recommentContent{
            margin-top: 20px;
            margin-left: 115px;
            resize: none;
            height: 130px;
            width: 580px;
        }
        #recommentBtn{
            vertical-align: top;
            width: 155px;
            height: 30px;
            font-size: 12px;
            color: #4B4DB2;
            background-color: white;
            border: 1px solid #4B4DB2;
            margin-top: 20px;
            margin-left: 15px;
        }
        #prifile {
		   background-color: rgb(200, 200, 200);
		   width: 45px;
		   height: 45px;
		   border-radius: 50%;
		   position: relative;
		   float: left;
		   box-sizing: border-box;
		   grid-row: 1;
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
        }
        footer > div > ul{
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
        /*  section  */
        .routine_modal{
        width: 800px;
        height: auto;
        /* border: #4B4DB2 solid 1px; */
        background-color: white;
        top: 40%;
        left: 50%;
        margin-left: 65px;
        margin-bottom: 60px;
        /* position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%); */
        
        }
        .modal_content{
            overflow: hidden;
            height: 110px;
            background-color: white;
        }
        .weekDiv{
            overflow: hidden;
            box-sizing: border-box;
            /* margin-left: 8%; */
            margin-top: 20px;
            display: flex;
            flex-wrap: nowrap;
        }
        .weekDiv input[type=radio]{
            display: none;
        }
        .weekDiv label{
            float: left;
            flex-basis: 160px;
            flex-grow: 1;
/*             display: inline-block;
            width: 160px; */
            height: 30px;
            line-height: 30px;
            text-align: center;
            cursor: pointer;
            background-color: white;
            color: #4B4DB2;
            font-size: 11px;
            border: #4B4DB2 1px solid;
        }
        .weekDiv label:nth-of-type(2),.weekDiv label:nth-of-type(3)
        ,.weekDiv label:nth-of-type(4),.weekDiv label:nth-of-type(5){
            border-left: 0px;
        }
        .weekDiv input[type=radio]:nth-of-type(1):checked ~ label:nth-of-type(1)
        ,.weekDiv input[type=radio]:nth-of-type(2):checked ~ label:nth-of-type(2)
        ,.weekDiv input[type=radio]:nth-of-type(3):checked ~ label:nth-of-type(3)
        ,.weekDiv input[type=radio]:nth-of-type(4):checked ~ label:nth-of-type(4)
        ,.weekDiv input[type=radio]:nth-of-type(5):checked ~ label:nth-of-type(5){
            background-color: #4B4DB2;
            color: white ;
        }
        .dayDiv{
            /* margin-left: 8%; */
            overflow: hidden;
            display: flex;
            flex-wrap: nowrap;
        }
        .dayDiv input[type=radio]{
            display: none;
        }
        .dayDiv label{
            float: left;
            flex-basis: 114px;
            /* display: inline-block; */
            /* width: 114px; */
            height: 30px;
            line-height: 30px;
            text-align: center;
            cursor: pointer;
            background-color: white;
            color: #4B4DB2;
            font-size: 11px;
            border: #4B4DB2 1px solid;
            border-top: 0px;
        }
        .dayDiv input[type=radio]:nth-of-type(1):checked ~ label:nth-of-type(1)
        ,.dayDiv input[type=radio]:nth-of-type(2):checked ~ label:nth-of-type(2)
        ,.dayDiv input[type=radio]:nth-of-type(3):checked ~ label:nth-of-type(3)
        ,.dayDiv input[type=radio]:nth-of-type(4):checked ~ label:nth-of-type(4)
        ,.dayDiv input[type=radio]:nth-of-type(5):checked ~ label:nth-of-type(5)
        ,.dayDiv input[type=radio]:nth-of-type(6):checked ~ label:nth-of-type(6)
        ,.dayDiv input[type=radio]:nth-of-type(7):checked ~ label:nth-of-type(7){
            background-color: #4B4DB2;
            color: white ;
        }



        .dayDiv label:nth-of-type(2),.dayDiv label:nth-of-type(3),.dayDiv label:nth-of-type(4),
        .dayDiv label:nth-of-type(5),.dayDiv label:nth-of-type(6),.dayDiv label:nth-of-type(7){
            border-left: 0px;
        }
        
        .modalTable td:nth-child(1),.modalTable td:nth-child(2),.modalTable td:nth-child(3){
            border-right: 0px;
            width:161px;
        }
        
        button{
            cursor: pointer;
        }

        .modalDay{
            width: 640px;
            height: 28px;
            line-height: 28px;
            background-color: #4B4DB2;
            color: white ;
            font-size: 11px;
            margin : 0 auto;
            margin-top: 30px;
            margin-bottom : 10px;
            text-align: center;
        }
        .modalTableDiv{
            width : 640px;
        	margin : 0 auto;
        	display: grid;
        	grid-template-columns : 640px;
        	gap : 10px;
            font-size: 11px;
        }
        .grid_content {
        	height: auto;
        	display : grid;
        	grid-template-columns : repeat(4, 160px);
        	border-top : 1px solid #4B4DB2;
        	border-left : 1px solid #4B4DB2;
        }
        
        .grid_content > div {
        	border-bottom : 1px solid #4B4DB2;
        	border-right : 1px solid #4B4DB2;
        	color : #4B4DB2;
        	text-align: center;
        	line-height: 29px;
        }
        .modalTable{
            margin-top: 10px;
            text-align: center;
            background-color: white;
            color:  #4B4DB2;
            margin-left: 58px;
        }
        .modalTable td{
            border: solid 1px #4B4DB2;
            height: 28px;
            line-height: 28px;
            width: 160px;
           	float: left;
        }
        #modal_RoutineMemo{
            margin-top: 30px;
            margin-left: 60px;
            width: 800px;
            height: 80px;
            resize: none;
            margin-bottom: 60px;
            overflow-y: auto;
            border: 0px;
        }
        .modal_RoutineMainDiv{
            height: auto;
            margin-bottom: 60px;
            overflow-y: auto;
        }
        .btn_more_recomment{
			width: 155px;
			height: 30px;
			font-size: 12px;
			color: #4B4DB2;
			background-color: white;
			border: 1px solid #4B4DB2;
			margin-top: 20px;
			margin-left: 150px;
		}
		.rest_column {
        	grid-column: 1/5;
        }
		ul{
		margin-top: 0px;
		}
		.more_recomment{
		margin-left:60px;
		display: none;
		}
		.myRoutineListTableDiv{
		display: none;
		}
		.report_modal{
    display: none;
    width: 350px;
    height: 300px;
    border: #4B4DB2 solid 1px;
    background-color: white;
    position: fixed;  
    top: 40%;
    left: 50%;
    transform: translate(-25%,-25%); 
    /* position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%); */
    z-index: 2;
    
}
.btn_close{
    text-align: right;
    box-sizing: border-box;
}
.modal_content{
    box-sizing: content-box;
}
.report_title{
	margin-top: 30px;
    text-align: center;
}
.report_content{
	margin-top: 30px;
    text-align: center;
    color: gray;
}
.report_reason{
    text-align: center;
}
.report_selete{
    width: 240px;
    margin-top: 30px;
    height: 40px;
    border: #4B4DB2 solid .5px;
    margin-bottom: 25px
}
.report_cancel{
    height: 50px;
    width: 175px;
    font-size: 12px;
    color: #4B4DB2;
    background-color: white;
    outline: 0;
    border: 0;
    border-top: #4B4DB2 solid 1px;
}
.btn_closeX{
	width: 30px;
	height: 35px;
}
.report_ok{
    width: 175px;
    height: 50px;
    font-size: 12px;
    color: white;
    background-color: #4B4DB2;
    outline: 0;
    border: 0;
    border-left: #4B4DB2 solid 1px;
    border-top: #4B4DB2 solid 1px;
}
.btn_cancel_ok{
    margin-top: 38px;
    border-bottom: #4B4DB2 solid 1px;
}
.modal{
        display: none;
        position: fixed; top: 0; left: 0; 
        width: 100%; height: 100%;
        z-index: 1;
        background-color: rgba(128, 128, 128, .5);
        }
.btn_delete{
	width: 100px;
	height: 30px;
	float: right;
	margin-right: 65px;
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}
		
		
		
		
    </style>
</head>
<body bgcolor=" #ECECEC">
    
    
	<%@ include file="/WEB-INF/view/template.jsp" %>
	
	<%
		RoutineBoardVo rvo = (RoutineBoardVo)request.getAttribute("bvo");
		ArrayList<CommentVo> rcVoList = (ArrayList<CommentVo>)request.getAttribute("cVoList");
	%>

	
    <section>
        <div id="board_main">
           루틴 게시판 상세 조회
        </div>
        <div id="board_category">
            <a href="totalboardreadall">통합 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="BoardReadAll">자유 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="routineboardreadall">루틴 게시판</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">공지사항</a>
        </div>
        <div id="board_note">
            <div id="note_title">게시판 유의사항</div>
            <div class="note_content_1">
                - 욕설,상업적 내용,광고,정치,특정 회원 및 트레이너 혹은 프로그램 등을 비방하는 내용의 악의적인 게시물은 신고 및 삭제될 수 있습니다.
            </div>
            <div class="note_content_2">
                - 친목,금전거래,재산권 침해,근거 없는 허위사실 유포 또한 신고 및 삭제될 수 있습니다.
            </div>
            <div class="note_content_3">
                - 전 회원의 보다 편리한 게시판 사용 및 홈페이지 관리를 위한 에티켓을 지켜주세요.
            </div>
        </div>
        <div id="board_information">
            <div id="writer_board">
                루틴 게시물
            </div>
        </div>
        <div>
            <p id="board_write1">게시물 제목</p>
            <p id="boardread_1">등록일</p>
            <p id="boardread_2">조회수</p>
            <p id="boardread_3">댓글수</p>
            <p id="boardread_4">작성자</p>
        </div>
        <div>
        </div>
        <div>
        	<p id="read_title">${bvo.routineboardTitle } </p>
            <p id="read_title_1">${bvo.routineboardDate }</p>
            <p id="read_title_2">${bvo.routineboardCount }</p>
            <p id="read_title_3">${bvo.rCnt }</p>
            <p id="read_title_4">${bvo.memberNickname }</p>
        </div>
        <div><hr></div>
        <!-- <div id="board_content">
            게시물 내용
        </div> -->
         <div class="myRoutineListTableDiv">
        	
        </div>
        <div>
            <textarea id="modal_RoutineMemo" name="" readonly>루틴메모내용</textarea>
        </div>
        <div class="routine_modal">
        <input type="hidden" id="hidden_routine_no" >
            <div class="modal_content">
                <!-- 모달창내용작성 -->
                    <div class="routineDetail">
                        루틴정보
                    </div>
                    <div class="weekDiv">
<!--                         <input type="radio" name="weekradio" id="weekradio1" value="1" checked>
                        <input type="radio" name="weekradio" id="weekradio2" value="2">
                        <input type="radio" name="weekradio" id="weekradio3" value="3">
                        <input type="radio" name="weekradio" id="weekradio4" value="4">
                        <input type="radio" name="weekradio" id="weekradio5" value="5">
                        <label for="weekradio1">1주차</label>
                        <label for="weekradio2">2주차</label>
                        <label for="weekradio3">3주차</label>
                        <label for="weekradio4">4주차</label>
                        <label for="weekradio5">5주차</label> -->
                    </div>
                    <div class="dayDiv">
                        <input type="radio" name="dayradio" id="dayradio1" class="dayradio" value="1">
                        <input type="radio" name="dayradio" id="dayradio2" class="dayradio" value="2">
                        <input type="radio" name="dayradio" id="dayradio3" class="dayradio" value="3">
                        <input type="radio" name="dayradio" id="dayradio4" class="dayradio" value="4">
                        <input type="radio" name="dayradio" id="dayradio5" class="dayradio" value="5">
                        <input type="radio" name="dayradio" id="dayradio6" class="dayradio" value="6">
                        <input type="radio" name="dayradio" id="dayradio7" class="dayradio" value="7">
                        <label for="dayradio1">월요일</label>
                        <label for="dayradio2">화요일</label>
                        <label for="dayradio3">수요일</label>
                        <label for="dayradio4">목요일</label>
                        <label for="dayradio5">금요일</label>
                        <label for="dayradio6">토요일</label>
                        <label for="dayradio7">일요일</label>
                    </div>
            </div>
                <div class="modal_RoutineMainDiv">
                    <div class="modalDay">
                        월요일
                    </div>
                    <div class="modalTableDiv">
                        <div class="grid_content">
                       	
                       	</div>
                    </div>
                    
                </div>
        </div>  
        <div id="recomment">
            댓글
        </div>
        <c:forEach var="cvo" items="${cVoList }">
        	<div class="more_recomment">
	           <div id="member_image"><c:if test="${not empty ssMvo.memberPhoto}">
	               <img id="prifile" src="${ssMvo.memberPhoto}">
	            </c:if>
	            <c:if test="${empty ssMvo.memberPhoto}">
	               <img id="prifile" src="<%= request.getContextPath() %>/cssfolder/images/default_pf.png">
	            </c:if>
	            </div>
	             <!--댓글 맴버닉네임 - 날짜 -->
					<div id="memberName">${cvo.memberNickname } -
						${cvo.commentDate }
						</div>
					<div id="readrecomment">${cvo.commentContent }</div>
				</div>
       		</c:forEach>
		<div>
			<button class="btn_more_recomment">더보기</button>
		</div>
		<form action="routincommentinsert.ax" method="post">
			<input type="hidden" name="bNo" value="<%=rvo.getRoutineboardNo()%>">
			<textarea id="recommentContent" name="reComment"
				placeholder="댓글 내용을 입력하세요." required></textarea>
			<button id="recommentBtn" type="submit">댓글 등록</button>
		</form>
		
        <div id="btn_cancel_register">
        	<c:if test="${not empty ssMvo }">
            <button id="board_cancel">글 신고하기</button>
            </c:if>
            <c:if test = "${ssMvo.memberNickname ==  bvo.memberNickname}">
            <button type="button" class="btn_delete">글삭제</button>
            </c:if>
            <button onclick = "location.href = 'routineboardreadall'" id="board_register">확인</button>
        </div>
        		<div class="report_modal">
            <div class="modal_report_content">
                <!-- 모달창내용작성 -->
                <div class="btn_close"><button class="btn_closeX">&#9932;</button></div>
                    <p class="report_title">글 신고하기</p>
                    <p class="report_content">게시글을 신고하기 위해 사유를 선택해 주세요.</p>
                    <p class="report_reason"><select name="" class="report_selete">
                        <option value="" selected disabled hidden>사유선택</option>
                        <option value="부적절한 내용">부적절한 내용</option>
                        <option value="개인 정보 노출">개인 정보 노출</option>
                        <option value="욕설/비하/비방 발언">욕설/비하/비방 발언</option>
                        <option value="스팸 홍보/도배">스팸 홍보/도배</option>
                        <option value="기타">기타</option>
                    </select></p>
                    <div class="btn_cancel_ok"><button class="report_cancel">취소</button><button type="button" class="report_ok">신고하기</button></div>
            </div>
        </div>      
        <div class="modal">
        </div>
    </section>


	<%@ include file="/WEB-INF/view/footer.jsp" %>

    
    <script type="text/javascript">
	$(function() {
		var itemCnt = $(".more_recomment").length;
		const recommentItemSize = 3;			
		var totalViewCnt = 0;
		for (var i = 0; i < recommentItemSize; i++) {
			 $(".more_recomment").eq(i).show(); 
			
			totalViewCnt++;
		}
		$(".btn_more_recomment").click(
				function() {
					var nowViewCnt = totalViewCnt;
					if (totalViewCnt >= itemCnt) {
						alert("더이상 작성된 댓글이 없습니다.")
						$(".btn_more_recomment").hide();
						return;
					}
					for (var i = nowViewCnt; i < nowViewCnt
							+ recommentItemSize; i++) {
						console.log($(".more_recomment").eq(i))
						if ($(".more_recomment").eq(i).length == 0) {
							break;
						}
						$(".more_recomment").eq(i).show();
						totalViewCnt++;
					}
				});
	});
        // 게시판 선택시 색변경
        $(function() {
            $("#board_select1").click(function() {
                $(this).toggleClass("select_click");
            });
        });
    </script>

    <script>
        $("#member_icon_img").mouseenter(function(event){
            // console.log(event);
            $("#member_icon_menu").fadeIn("fast");
        });
        $("#member_icon").mousemove(function(event){
            // console.log("X:" + event.offsetX + " Y:" + event.offsetY);
        });
        $("#member_icon").mouseleave(function(event){
            console.log("X:" + event.offsetX + " Y:" + event.offsetY);
            if(event.offsetX < 0 || event.offsetY < 0 || event.offsetX > 23) {
                $("#member_icon_menu").fadeOut("fast");
            }
        });
        $("#member_icon_menu").mouseenter(function(event){
            // console.log(event);
            // $("#member_icon_menu").css("display","block");
        })
        $("#member_icon_menu").mouseleave(function(event){
            $("#member_icon_menu").fadeOut("fast");
        })


        $("#bell_icon_img").mouseenter(function(event){
            // console.log(event);
            $("#bell_icon_notice").fadeIn("fast");
        });
        $("#bell_icon").mousemove(function(event){
            // console.log("X:" + event.offsetX + " Y:" + event.offsetY);
        });
        $("#bell_icon").mouseleave(function(event){
            console.log("X:" + event.offsetX + " Y:" + event.offsetY);
            if(event.offsetX < 0 || event.offsetX > 23 || event.offsetY < 0) {
                $("#bell_icon_notice").fadeOut("fast");
            }
            // if(event.offsetY < 5 || event.offsetY > -5) {
            //     $("#bell_icon_notice").fadeOut();
            // }
        });
        $("#bell_icon_notice").mouseenter(function(event){
            $("#bell_icon_notice").show("fast");
        });
        $("#bell_icon_notice").mouseleave(function(event){
            $("#bell_icon_notice").fadeOut("fast");
        });

        // header 알림 - x 클릭 시 알림 삭제
        $(".bell_notice_x").click(function(){
            console.log($(this).next().remove());
            $(this).remove();
        });
    </script>
    <script type="text/javascript">
	var voList = [];
	<c:forEach var="i" begin="0" end="${rvolist.size()-1 }" step="1">
	console.log(${rvolist.get(i).routineNo});
		var vo = {
				routineNo : ${rvolist.get(i).routineNo},
				memberNo : ${rvolist.get(i).memberNo},
				routineName : "${rvolist.get(i).routineName}",
				routineDisable : "${rvolist.get(i).routineDisable}",
				routineTarget : "${rvolist.get(i).routineTarget}",
				routineContent : "${rvolist.get(i).routineContent}",
				routineSetRestTime : ${rvolist.get(i).routineSetRestTime},
				routineExerciseRestTime : ${rvolist.get(i).routineExerciseRestTime},
				
				routineExerciseNo : ${revolist.get(i).routineExerciseNo},
				exerciseNo : ${revolist.get(i).exerciseNo},
				routineExerciseDay : ${revolist.get(i).routineExerciseDay},
				routineWeek : ${revolist.get(i).routineWeek},
				routineDay : ${revolist.get(i).routineDay},
				routineExerciseSet : ${revolist.get(i).routineExerciseSet},
				routineExerciseRepeat : ${revolist.get(i).routineExerciseRepeat},
				routineExerciseWeight : ${revolist.get(i).routineExerciseWeight},
				routineExerciseCopy : "${revolist.get(i).routineExerciseCopy}",
				
				exerciseName : "${evolist.get(i).exerciseName}",
				exerciseNo : ${evolist.get(i).exerciseNo},
				exercisePart : "${evolist.get(i).exercisePart}"
				};
		
		voList.push(vo);
	</c:forEach>
    console.log(voList);
    
    $(function() {
    	var tableIndex = 0;
    	if(voList.length != 0) {
			$(".myRoutineListTableDiv").append('<table class="myRoutineListTable"></table>');
			var routineTarget;
			switch (voList[tableIndex].routineTarget) {
			case 'N':
				routineTarget = '전체';
				break;
			case 'M':
				routineTarget = '근비대';
				break;
			case 'D':
				routineTarget = '다이어트';
				break;
			case 'S':
				routineTarget = '스트랭스';
				break;
			case 'B':
				routineTarget = '맨몸운동';
				break;

			default:
				break;
			}
			var routineDayWeek;
			if(voList[tableIndex].routineDay == 0) {
				routineDayWeek = '주간';
			} else {
				routineDayWeek = '일간';
			}
			var htmlText = '<tr><th class="routineview">'+ voList[tableIndex].routineName +'</th>';
			htmlText += '<td class="td_routineTarget">'+routineTarget+'</td>';
			htmlText += '<td class="td_routine_duration"></td>';
			htmlText += '<td class="td_routine_day_week">'+routineDayWeek+'</td>';
			htmlText += '</tr>';
			$(".myRoutineListTable").eq(tableIndex).append(htmlText);
			$(".myRoutineListTable").eq(tableIndex).after('<p class="DeleteP">'+"삭제하기"+'</p>');
			$(".myRoutineListTable").eq(tableIndex).after('<input type = "hidden" class="routinte_no_hidden" value="'+voList[tableIndex].routineNo+'">');
    	} else {
    		return;
    	}
    	
		var voListIndex = 0;
		var prevTemp = voList[0].routineNo;
		var currTemp = -1;
		while(true) {
			currTemp = voList[voListIndex].routineNo;
			if(prevTemp != currTemp) {
				if($('.td_routine_day_week').eq(tableIndex).text() == '주간') {
					$('.td_routine_duration').eq(tableIndex++).text(voList[voListIndex - 1].routineWeek + '주');
				} else {
					$('.td_routine_duration').eq(tableIndex++).text(voList[voListIndex - 1].routineDay + '일');
				}
				$(".myRoutineListTableDiv").append('<table class="myRoutineListTable"></table>');
				var routineTarget;
				switch (voList[tableIndex].routineTarget) {
				case 'N':
					routineTarget = '전체';
					break;
				case 'M':
					routineTarget = '근비대';
					break;
				case 'D':
					routineTarget = '다이어트';
					break;
				case 'S':
					routineTarget = '스트랭스';
					break;
				case 'B':
					routineTarget = '맨몸운동';
					break;

				default:
					break;
				}
				var routineDayWeek;
				if(voList[tableIndex].routineDay == 0) {
					routineDayWeek = '주간';
				} else {
					routineDayWeek = '일간';
				}
				var htmlText = '<tr><th class="routineview">'+ voList[voListIndex].routineName +'</th>';
				htmlText += '<td class="td_routineTarget">'+routineTarget+'</td>';
				htmlText += '<td class="td_routine_duration"></td>';
				htmlText += '<td class="td_routine_day_week">'+routineDayWeek+'</td>';
				htmlText += '</tr>';
				$(".myRoutineListTable").eq(tableIndex).append(htmlText);
				$(".myRoutineListTable").eq(tableIndex).after('<p class="DeleteP">'+"삭제하기"+'</p>');
				$(".myRoutineListTable").eq(tableIndex).after('<input type = "hidden" class="routinte_no_hidden" value="'+currTemp+'">');
			}
			
			voListIndex++;
			prevTemp = currTemp;
			if(voListIndex == voList.length) {
				if($('.td_routine_day_week').eq(tableIndex).text() == '주간') {
					$('.td_routine_duration').eq(tableIndex++).text(voList[voListIndex - 1].routineWeek + '주');
				} else {
					$('.td_routine_duration').eq(tableIndex++).text(voList[voListIndex - 1].routineDay + '일');
				}
				break;
			}
		}
	});

				
		$(function() {		
           /*  var routineNo = 1; */
            //var routineNo = $(this).parents('.myRoutineListTable').next().val();
            var routineNo = $('.routinte_no_hidden').val();
            var routineDayWeekTemp = "";
            var routineIndexTemp = 0;
            var routineExerciseDayTemp = 0;
            $('#hidden_routine_no').val(routineNo);
            for(var i  = 0; i < voList.length; i++) {
            	if(voList[i].routineNo == routineNo) {
            		if(voList[i].routineDay == 0) {
            			 routineDayWeekTemp = 'week';
            				if(voList[i].routineWeek != routineIndexTemp) {
	            			routineIndexTemp = voList[i].routineWeek;
	            			$('.weekDiv').append('<input type="radio" class="weekradio" name="weekradio" id="weekradio'+routineIndexTemp+'" value="'+routineIndexTemp+'">');
	            			$('.weekDiv').append('<label for="weekradio'+routineIndexTemp+'">'+routineIndexTemp+'주차</label>');
	            			$('#modal_RoutineMemo').text(voList[i].routineContent);
	            			routineExerciseDayTemp = 0;
	            			$thisTemp1 = $('.weekradio').eq($('.weekradio').length - 1);
	            			$thisTemp2 = $('.weekDiv label').eq($('.weekDiv label').length - 1);
	            				 if($('.weekradio').length != 1) {
	            					for(var j = $('.weekradio').length - 1; j > 0; j--) {
	            						for(var k = 0; k < j; k++) {
											if($('.weekradio').eq(k).val() > $('.weekradio').eq(k+1).val() ) {
												$('.weekradio').eq(k).before($('.weekradio').eq(k+1));
												$('.weekradio').eq(k).after($('.weekDiv label').eq(k+1));
											}    						
		            					}
	            					}
	            				}
	            			} 
            			}
            			if(voList[i].routineWeek == routineIndexTemp) {
            				if(voList[i].routineExerciseDay != routineExerciseDayTemp) {
            					// 운동하는 날
            				} else {
            					// 쉬는 날
            				}
            			}
            		} else {
            			routineDayWeekTemp = 'day';
            		}
            		
            	}
        
            
            //console.log(vo);
            //console.log($('.routinte_no_hidden').val());
            
            $('.weekradio').eq(0).prop('checked',true);
            $('.dayradio').eq(0).prop('checked',true);
            
            
            $('input[name="dayradio"]').off('change');
            
            $('input[name="dayradio"]').change(function() {
            	console.log("데이라디오눌림");
            	${voList}
            	console.log(voList);
      			modal_exercise_input()
    		});
      		$('input[name="weekradio"]').change(function() {
      			console.log("윜라디오눌림")
      			modal_exercise_input()
    		});
            modal_exercise_input();
        
    	});
		
    
  	function modal_exercise_input() {
  		modalDayInput();
  		$('.grid_content').empty();
		//console.log($("#hidden_routine_no").val());
		//console.log($('input[name=weekradio]:checked').val());
		//console.log($('input[name=dayradio]:checked').val());
		var hrn = $("#hidden_routine_no").val();
		var iwc = $('input[name=weekradio]:checked').val();
		var idc = $('input[name=dayradio]:checked').val();
		var flagTemp = false;
		for(var i = 0; i < voList.length; i++) {
			var vli = voList[i];
			if(vli.routineNo == hrn && vli.routineWeek == iwc && vli.routineExerciseDay == idc) {
				console.log(vli);
				$('.grid_content').append('<div>'+vli.exerciseName+'</div>');
				$('.grid_content').append('<div>'+vli.routineExerciseWeight+'kg</div>');
				$('.grid_content').append('<div>'+vli.routineExerciseRepeat+'회</div>');
				$('.grid_content').append('<div>'+vli.routineExerciseSet+'세트</div>');
				flagTemp = true;
			}
		}
		if(!flagTemp) {
			$('.grid_content').append('<div class="rest_column">휴식</div>');
		}
	}
  	
  	function modalDayInput() {
  		if($('.dayradio:checked').val() == 1){
			$('.modalDay').text("월요일");
		}else if($('.dayradio:checked').val() == 2){
			$('.modalDay').text("화요일");
		}else if($('.dayradio:checked').val() == 3){
			$('.modalDay').text("수요일");
		}else if($('.dayradio:checked').val() == 4){
			$('.modalDay').text("목요일");
		}else if($('.dayradio:checked').val() == 5){
			$('.modalDay').text("금요일");
		}else if($('.dayradio:checked').val() == 6){
			$('.modalDay').text("토요일");
		}else if($('.dayradio:checked').val() == 7){
			$('.modalDay').text("일요일");
		}
	}
  	
  	
  	
  	
  	
  	
  	
  	
	$(function(){ //모달
        // const eleModal = document.getElementsByClassName("modal")[0];
        const eleModal = document.querySelector(".report_modal");
        const bagModal = document.querySelector(".modal");

        function openModalHandler(){
            bagModal.style.display ="block";
            eleModal.style.display ="block";
        };        
        function closeModalHandler(){
            bagModal.style.display ="none";
            eleModal.style.display ="none";
        };
        function closeModalWindowHandler(){
        	console.log(this);
            console.log(event.target);
            if(event.target == this){
                bagModal.style.display ="none";
                eleModal.style.display ="none";
               console.log(this);
               console.log(event.target);
            }
        }
        
    document.querySelector("#board_cancel").addEventListener("click",openModalHandler);
    document.querySelector(".btn_closeX").addEventListener("click",closeModalHandler); 
    document.querySelector(".report_modal").addEventListener("click",closeModalWindowHandler);
    document.querySelector(".modal").addEventListener("click",closeModalWindowHandler);
    $(".report_ok").click(function(){
        eleModal.style.display="none"
        bagModal.style.display ="none"
        alert("신고되었습니다")
        $.ajax({
			url:"boardreport",
			type:"post",
			data:{boardNo:${bvo.routineboardNo}, reportContent:$(".report_selete").val()}
			
		});
        
    });
    $(".report_cancel").click(function(){
        eleModal.style.display="none"
        bagModal.style.display ="none"
    })
});
/* 		$(".report_ok").click(function() {
	
}); */




$(window).click(function(event) {
	console.log(event.target);
	if(event.target == $(".modal")[0]) {
		//$(".modal").hide();
		//$(".report_modal").hide();
	}
});
    
    </script>


</body>
</html>