<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<head>
    <meta charset="UTF-8">
    <%@ include file="/WEB-INF/view/csslink.jsp"%>
    <%@ include file="/WEB-INF/view/font.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 루틴보기</title>
    <link href="./css/reset.css" rel="stylesheet"> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <style>
        @font-face {
            font-family: THEmpgtM;
            src: url("./fonts/THEmpgtM.woff");
        }
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
            height: 2000px;
            overflow: hidden;
            position: relative;
            font-family: THEmpgtM;
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
            margin-right: 65px;
            width: 800px;
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
            margin-left: 8%;
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
            margin-left: 8%;
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
        button{
            cursor: pointer;
        }

        .modalDay{
            width: 160px;
            height: 28px;
            line-height: 28px;
            background-color: #4B4DB2;
            color: white ;
            font-size: 11px;
            margin-left: 155px;
            margin-top: 30px;
            text-align: center;
        }
        .modalTableDiv{
            font-size: 11px;
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
            margin-top: 20px;
            margin-left: 155px;
            width: 640px;
            height: 80px;
            resize: none;
            overflow-y: scroll;
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

    </style>
    
</head>
<body bgcolor=" #ECECEC">

	<%@ include file="/WEB-INF/view/template.jsp"%>

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
        <div class="myRoutineListTableDiv">
            <table class="myRoutineListTable">
                <tr>
                    <th class="routineview">박재민의 파워루틴</th>
                    <td>근비대</td>
                    <td>4주</td>
                    <td>주간</td>
                </tr>
            </table>
            <p class="DeleteP">삭제하기</p>
        </div>
        <script type="text/javascript">
        	$(".routineview").click(function() {
				console.log("루틴뷰누름")
				$.ajax({
					url:"myroutineread",
					
				});
			});
        	
        	
        	
        	
        </script>
        <div class="routine_modal">
            <div class="modal_content">
                <!-- 모달창내용작성 -->
                    <div class="btn_close"><button class="btn_closeX">&#9932;</button></div>
                    <div class="routineDetail">
                        루틴 상세 조회
                    </div>
                    <div class="weekDiv">
                        <input type="radio" name="weekradio" id="weekradio1" value="1">
                        <input type="radio" name="weekradio" id="weekradio2" value="2">
                        <input type="radio" name="weekradio" id="weekradio3" value="3">
                        <input type="radio" name="weekradio" id="weekradio4" value="4">
                        <input type="radio" name="weekradio" id="weekradio5" value="5">
                        <label for="weekradio1">1주차</label>
                        <label for="weekradio2">2주차</label>
                        <label for="weekradio3">3주차</label>
                        <label for="weekradio4">4주차</label>
                        <label for="weekradio5">5주차</label>
                    </div>
                    <div class="dayDiv">
                        <input type="radio" name="dayradio" id="dayradio1" value="1">
                        <input type="radio" name="dayradio" id="dayradio2" value="2">
                        <input type="radio" name="dayradio" id="dayradio3" value="3">
                        <input type="radio" name="dayradio" id="dayradio4" value="4">
                        <input type="radio" name="dayradio" id="dayradio5" value="5">
                        <input type="radio" name="dayradio" id="dayradio6" value="6">
                        <input type="radio" name="dayradio" id="dayradio7" value="7">
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
                        <table class="modalTable">
                            <tr>
                                <td>
                                    운동명
                                </td>
                                <td>
                                    무게
                                </td>
                                <td>
                                    횟수
                                </td>
                                <td>
                                    세트
                                </td>
                            </tr>
                        </table>
                    </div>
                    <textarea id="modal_RoutineMemo" name="">루틴메모내용</textarea>
                    <div class="routineBtnDiv">
                        <button type="button" class="routineModalUpdateBtn">
                            수정
                        </button>
                        <button type="button" class="routineCalendarBtn">
                            캘린더로 보내기
                        </button>
                        <button type="button" class="routineshareBtn">
                            루틴 공유
                        </button>
                    </div>
                </div>
        </div>      
        <div class="modal">
        </div>
    </section>

    	<%@ include file="/WEB-INF/view/footer.jsp"%>

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

        //루틴상세보기 모달 이벤트
        $(function(){ //모달
            // const eleModal = document.getElementsByClassName("modal")[0];
            const eleModal = document.querySelector(".routine_modal");
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
            // 안됨 css속성 쓸수 없음. html tag속성가능 document.getElementsByClassName("modal")[0].display = "block";
            document.querySelector(".routineview").addEventListener("click",openModalHandler);
            document.querySelector(".btn_closeX").addEventListener("click",closeModalHandler); 
            // document.querySelector(".report_modal").addEventListener("click",closeModalWindowHandler);
            document.querySelector(".modal").addEventListener("click",closeModalWindowHandler);
            $(".report_ok").click(function(){
                eleModal.style.display="none"
                bagModal.style.display ="none"
                alert("신고되었습니다")
            });
            $(".report_cancel").click(function(){
                eleModal.style.display="none"
                bagModal.style.display ="none"
            })

        });



    </script>
</body>
</html>