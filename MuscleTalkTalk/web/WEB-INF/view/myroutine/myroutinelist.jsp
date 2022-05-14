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
        height: auto;
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
            height: auto;
            overflow-y: scroll;
        }
        .routineBtnDiv{
            margin-top: 50px;
            margin-left: 155px;
            margin-bottom: 65px;
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
        <div class="myRoutineListTableDiv">
        	
        </div>
        
<!--         <script type="text/javascript">
        	$(".routineview").click(function() {
				console.log("루틴뷰누름")
				console.log(myroutinelist)
				$.ajax({
					url:"myroutineread",
					
				});
			});
        		
        </script> -->
        
        <div class="routine_modal">
        <input type="hidden" id="hidden_routine_no" >
            <div class="modal_content">
                <!-- 모달창내용작성 -->
                    <div class="btn_close"><button class="btn_closeX">&#9932;</button></div>
                    <div class="routineDetail">
                        루틴 상세 조회
                    </div>
                    <div class="weekDiv">
                        <!-- <input type="radio" name="weekradio" id="weekradio1" value="1">
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
                    <textarea id="modal_RoutineMemo" name="" readonly>루틴메모내용</textarea>
                    <div class="routineBtnDiv">
                        <button type="button" class="routineModalUpdateBtn">
                            수정
                        </button>
                        <button type="button" class="routineCalendarBtn">
                            캘린더로 보내기
                        </button>
                        <button onclick="location.href = 'boardinsert';" type="button" class="routineshareBtn">
                            루틴 공유
                        </button>
                    </div>
                </div>
        </div>      
        <div class="modal">
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
    <script type="text/javascript">
	var voList = [];
	<c:if test="${rvolist.size() > 0}" >
	
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
	</c:if>
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
    

  //루틴상세보기 모달 이벤트
    $(function(){ //모달
        // const eleModal = document.getElementsByClassName("modal")[0];
        const eleModal = document.querySelector(".routine_modal");
        const bagModal = document.querySelector(".modal");

        function openModalHandler(){
            bagModal.style.display ="block";
            eleModal.style.display ="block";
            var routineNo = $(this).parents('.myRoutineListTable').next().val();
            console.log("루틴no에 담긴 디스부모값"+routineNo);
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
      			modal_exercise_input()
    		});
      		$('input[name="weekradio"]').change(function() {
      			modal_exercise_input()
    		});
            modal_exercise_input();
        };        
        function closeModalHandler(){
            bagModal.style.display ="none";
            eleModal.style.display ="none";
        	$('.weekradio').remove();
        	$('.weekDiv label').remove();
        	$('.grid_content').empty();
        };
        function closeModalWindowHandler(){
        	$('.weekradio').remove();
        	$('.weekDiv label').remove();
        	$('.grid_content').empty();
            if(event.target == this){
                bagModal.style.display ="none";
                eleModal.style.display ="none";
            }
        }
        // 안됨 css속성 쓸수 없음. html tag속성가능 document.getElementsByClassName("modal")[0].display = "block";
       // document.querySelector(".routineview").addEventListener("click",openModalHandler);
        $('.routineview').on('click',openModalHandler);
        $('.btn_closeX').on('click',closeModalHandler);
        
        $('input[name="dayradio"]').change(function() {
  			modal_exercise_input()
		});
  		$('input[name="weekradio"]').change(function() {
  			modal_exercise_input()
		});
        $('.modal').on('click',closeModalWindowHandler);
        // document.querySelector(".report_modal").addEventListener("click",closeModalWindowHandler);
		
		
    	function delectRoutine() {
    		var routineNoTemp = $(this).prev().val();
    		console.log(routineNoTemp);
    		$.ajax({
    			url : 'deleteroutine',
    			type : 'post',
    			data : {
    				routineno : routineNoTemp
    			},
    			success : function(result) {
					console.log(result);
					if(result == 1) {
						alert("성공");
						location.href = "myroutinelistall";
					} else {
						alert("실패");
					}
				},
				error : function(error) {
					console.log(error);
				}
    		});
    		
    	};
    	
    	$('.DeleteP').on('click',delectRoutine);
        
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
  	

	</script>

</body>
</html>