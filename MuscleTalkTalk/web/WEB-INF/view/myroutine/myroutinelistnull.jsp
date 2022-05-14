<%@ include file="/WEB-INF/view/csslink.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 루틴 리스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>
    
    <style>

      body{
            width: 1200px;
            margin: 0 auto;
      }
        *{
            text-decoration: none;
        }



/* myroutinelist section css */
        section{
            margin-left: 210px;
            background-color: white;
            border-radius: 10px 10px 0 0;
            width: 930px;
            height: auto;
            overflow: hidden;
            position: relative;
            font-family: THEmpgtM;
            padding-bottom: 60px;
        }
        #board_main{
           /* margin-top: 65px; */
            /* margin-left: 65px; */
            padding-top: 65px;
            margin-left: 65px;
            font-weight: bold;
            display: inline-block;
            margin-bottom: 10px;
            font-size: 15px;
            width: 800px;
            margin-right: 65px;
        }
        .createRoutineDiv{
            height: auto;
            overflow: hidden;
        }
        .createRoutineBtn{
            margin-right: 65px;
            font-size: 11px;
            float: right;
            width: 154px;
            height: 30px;
            color: white;
            background-color: #4B4DB2;
        }
        .myRoutineListTitle{
            margin-left: 65px;
            margin-top: 45px;
        }
        .myRoutineListTitle p{
            font-size: 12px;
            display: inline-block;
            width: 158px;
            text-align: center;
            background-color: rgb(236, 236, 236);
            height: 30px;
            line-height: 30px;
        }
        .myRoutineListTableDiv{
            margin-top: 20px;
            margin-left: 65px;
            width: 850px;
        }
        .myRoutineListTable{
            font-size: 12px;
            width: 632px;
            box-sizing: border-box;
            display: inline-block;
       	    margin-bottom: 10px;
        }
        .myRoutineListTable th,td {
            width: 158px;
            text-align: center;
            height: 30px;
            line-height: 30px;
        }
        .myRoutineListTable th{
            color: white;
            background-color: #4B4DB2;
            border: 1px solid #4B4DB2;
        }
        .myRoutineListTable td{
            border: 1px solid #4B4DB2;
            border-left: 0px;
            color: #4B4DB2;
            background-color: white;
        }
        .routineview{
            cursor: pointer;
        }
        .routine_modal{
        display: none;
        width: 950px;
        height: 600px;
        border: #4B4DB2 solid 1px;
        background-color: white;
        position: fixed;  
        top: 40%;
        left: 50%;
        transform: translate(-42%,-25%); 
        /* position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%); */
        z-index: 2;
        
        }
        .modal{
        display: none;
        position: fixed; top: 0; left: 0; 
        width: 100%; height: 100%;
        z-index: 1;
        background-color: rgba(128, 128, 128, .5);
        }
        .btn_close{
            overflow: hidden;
            margin-top: 25px;
            margin-right: 25px;
        }
        .btn_closeX{
            float: right;
            cursor: pointer;
            width: 20px;
            height: 20px;
        }
        .routineDetail{
            font-size: 15px;
            font-weight: bold;
            margin-left: 110PX;
            margin-top: 10PX;
        }
        .modal_content{
            overflow: hidden;
            height: 180px;
            background-color: rgb(236, 236, 236);
        }
        .weekDiv{
            overflow: hidden;
            box-sizing: border-box;
            /* margin-left: 8%; */
            margin : 0 auto;
            margin-top: 20px;
            display: flex;
            flex-wrap: nowrap;
            width : 812px;
        }
        .weekDiv input[type=radio]{
            display: none;
        }
        .weekDiv label{
            /* float: left; */
            /* flex-basis: auto; */
            flex-grow : 1;
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
        	width : 812px;
            /* margin-left: 8%; */
            margin : 0 auto;
            overflow: hidden;
            display: flex;
            flex-wrap: nowrap;
        }
        .dayDiv input[type=radio]{
            display: none;
        }
        .dayDiv label{
            float: left;
            /* flex-basis: 114px; */
            flex-grow : 1;
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
            margin-left: 155px;
        }
        .modalTable td{
            border: solid 1px #4B4DB2;
            height: 28px;
            line-height: 28px;
        }
        #modal_RoutineMemo{
            margin-top: 30px;
            margin-left: 146.5px;
            width: 640px;
            height: 80px;
            resize: none;
            overflow-y: scroll;
            border: 1px solid gray;
        }
        .modal_RoutineMainDiv{
            height: 420px;
            overflow-y: scroll;
        }
        .routineBtnDiv{
            margin-top: 50px;
            margin-left: 155px;
        }
        .routineModalUpdateBtn{
            font-size: 11px;
            width: 70px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            background-color: #4B4DB2;
            color: white ;
            margin-left: 180px;
        }
        .routineCalendarBtn{
            font-size: 11px;
            width: 110px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            background-color: #4B4DB2;
            color: white ;
            margin-left: 10px;
        }
        .routineshareBtn{
            font-size: 11px;
            width: 70px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            background-color: #4B4DB2;
            color: white ;
            margin-left: 10px;
        }
        .DeleteP{
            font-size: 12px;
            cursor: pointer;
            display: inline-block;
            background-color: white;
            color:  #4B4DB2;
            line-height: 32px;
            margin-left: 70px;
            vertical-align: top;
        }
        .modalTable td:nth-child(1){
            border-right: 0px;
        }
        .rest_column {
        	grid-column: 1/5;
        }
        table{
        table-layout: fixed;
        word-break: break-all;
        }
    </style>
    
</head>
<body bgcolor=" #ECECEC">

<%-- <c:forEach var="i" begin="0" end="${rvolist.size()-1 }" step="1">
${rvolist.get(i).routineName }
</c:forEach>
<hr>
<c:forEach var="i" begin="1" end="${rvolist.size() }" step="1">
${rvolist.get(rvolist.size() - 1).routineName }
</c:forEach>
<hr>
${rvolist.get(revolist.size() - 1) }
<hr>
${rvolist.size() }
<hr>
${rvolist.get(3) }
<hr>
${revolist.get(revolist.size() - 1).routineWeek } --%>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	
<%-- 	<c:if test="${empty ssMvo}">
   		<jsp:forward page="/WEB-INF/view/member/login.jsp"></jsp:forward>
	</c:if> --%>


    <section>
   
		        <div id="board_main">
		            내 루틴 리스트
		        </div>
		        <div class="createRoutineDiv">
		            <button class="createRoutineBtn" type="button" onclick="location.href='routineinsert'">루틴 생성하기</button>
		        </div>
		        <div class="myRoutineListTitle">
		            <p>루틴명</p><p>목표</p><p>기간</p><p>구분</p>
		        </div>
		        <div id="board_main">
		            내 루틴 리스트
		        </div>
		        <div class="createRoutineDiv">
		            <button class="createRoutineBtn" type="button" onclick="location.href='routineinsert'">루틴 생성하기</button>
		        </div>
		        <div class="myRoutineListTitle">
		            <p>루틴명</p><p>목표</p><p>기간</p><p>구분</p>
		        </div>
        
    </section>

    	<%@ include file="/WEB-INF/view/footer.jsp" %>

    <script>

    $(".td_routineTarget").text();
    
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
    

</body>
</html>