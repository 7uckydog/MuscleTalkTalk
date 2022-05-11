<%@ include file="/WEB-INF/view/font.jsp"%>
<%@ include file="/WEB-INF/view/csslink3_mp.jsp"%>
<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 프로그램 조회</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	body{
	    width: 1200px;
	    margin: 0 auto;
	    color: rgb(51, 51, 51);
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
	a {
		color: rgb(51, 51, 51);
	}
</style>
<style>
		#mp_main_text{
            margin: 63px 0px 32px 63px;
            font-size: 15px;
            font-family:'THEmpgtB';
            color: rgb(51, 51, 51);
            line-height: 20px;
            overflow: hidden;
            width: 650px;
        }
        input::placeholder{
        	font-family:'THEmpgtM';
            font-size: 10.5px;
        }
        #edit_btn{
            margin: 50px 80px 100px 630px;
            width: 70px;
            height: 30px;
            background-color: rgb(224, 224, 224);
            color: rgb(64, 64, 64);
            font-size: 10.5px;
            font-family:'THEmpgtM';
            border: 0px;
            cursor: pointer;
        }
        #board_table{
            width: 650px;
            margin: 20px auto;
            clear: both;
            border-spacing: 25px;
        }
        .tb{
            padding: 14.5px;
            font-size: 11px;
            font-family: 'THEmpgtM';
        }
        .tb_s{
            padding: 9.5px 14.5px;
            font-size: 11px;
            font-family: 'THEmpgtR';
        }
        .line{
        	border-top: 1px solid rgb(188, 188, 188);
        }
        #table_title{
			font-family:'THEmpgtM';
            font-size: 11.5px;
        }
        #table_content{
            font-family:'THEmpgtR';
            font-size: 11.5px;
        }
        #pageing_all{
            margin: 45px auto 60px auto;
            text-align: center;
            font-family: 'THEmpgtM';
            font-size: 0px;
        }
        .page{
        	background-color: rgb(236, 236, 236);
        	border-radius: 3px;
        	color: rgb(127, 127, 127);
        	padding: 8px 11px 8px 11px;
        	display: inline-block;
        	margin: 0px 2px;
        	font-size: 10.5px;
        }
        #reservation_list{
        	text-decoration: underline;
        }
        .npage{
        	cursor: pointer;
        }
        #rsv_edit, #rsv_cancel{
        	width: 70px;
        	height: 22px;
        	font-family:'THEmpgtR';
            font-size: 10px;
            border: 0px;
            background-color: rgb(224, 224, 224);
            color: rgb(64, 64, 64);
            cursor: pointer;
        }
</style>
</head>
<body>
<c:if test="${empty ssMvo}">
	<jsp:forward page="/WEB-INF/view/member/login.jsp"></jsp:forward>
</c:if>
<%@ include file="/WEB-INF/view/template.jsp"%>
		<section id="section1">
            <div id="mp_main_text">
                <p id="b_title" style="height: 20px; width: 150px; float: left;">
                    예약 프로그램 조회
                </p>
            </div>
            <div>
                <table id="board_table">
                    <tr class="tb" class="line">
                        <td colspan="10" class="line"></td>
                    </tr class="tb">
                    <tr id="table_title" class="tb">
                        <td style="width: 10%;" class="tb">번호</td>
                        <td style="width: 43%;" class="tb">프로그램명</td>
                        <td style="width: 25%;" class="tb">프로그램 진행일</td>
                        <td style="width: 11%;" class="tb" id="cnt"><!-- 수정 --></td>
                        <td style="width: 11%;" class="tb" id="cnt"><!-- 취소 --></td>
                    </tr>
	                <tr class="tb" class="line">
	                    <td colspan="10" class="line"></td>
	                </tr>
	                
	                <!-- 게시물 -->
	                <c:if test="${not empty memberreservation}">
		                <c:forEach items="${memberreservation}" var="volist">
							<tr class="table_content">
								<input type="hidden" id="pt_no_hidden" value="${volist.ptCalendarNo}">
								<td style="width: 10%;" class="tb_s"><a href="ptread?ptNo=${volist.ptNo}">${volist.rNo}</a></td>
								<td style="width: 43%;" class="tb_s"><a href="ptread?ptNo=${volist.ptNo}">${volist.ptName}</a></td>
								<td style="width: 25%;" class="tb_s">${volist.ptCalendarStartTime}</td>
								<td style="width: 11%; padding-right: 0px;" class="tb_s">
									<input type=button value="수정" id="rsv_edit">
								</td>
								<td style="width: 11%;" class="tb_s">
									<input type=button value="취소" id="rsv_cancel">
								</td>
							</tr>
						</c:forEach>
					</c:if>	
                </table>
            </div>
            <div id="pageing_all">
                <div class="pageing">
                	<p id="p_c">
                		<c:if test="${not empty memberreservation}">
							<c:if test="${startPage > 1 }">
								<a class="page" href="memberreadreservationlist?page=${startPage-1 }">이전</a>
							</c:if>
							<c:forEach begin="${startPage }" end="${endPage }" var="p">
								<a class="page" href="memberreadreservationlist?page=${p }">${p }</a>
							</c:forEach>
							<c:if test="${endPage < totalpageCnt}">
								<a class="page" href="memberreadreservationlist=${endPage+1 }">다음</a>
							</c:if>
						</c:if>
					</p>
                </div>
            </div>
            <%@ include file="/WEB-INF/view/footer.jsp"%>
        </section>
        <section id="section2">
            <div>
                <c:if test="${not empty ssMvo.memberPhoto}">
	            	<img id="prifile" src="${ssMvo.memberPhoto}">
	            </c:if>
	            <c:if test="${empty ssMvo.memberPhoto}">
	            	<img id="prifile" src="<%= request.getContextPath() %>/cssfolder/images/default_pf.png">
	            </c:if>
                <ul>
                    <li id="member_nickname">${ssMvo.memberNickname}</li>
                    <li id="member_id">${ssMvo.memberId}</li>
                </ul>
                <input type="button" name="logout" id="mp_logout" value="로그아웃">
            </div>
            <div>
                <ul id="mypage_menu">
                    <li id="info_edit">프로필 정보 수정</li>
                    <li id="password_edit">비밀번호 변경</li>
                    <li id="content_list">내 콘텐츠 조회</li>
                    <li id="reservation_list">
                    	<c:if test="${ssMvo.memberTrainer == 'F'}">
                    		예약 프로그램 조회
                    	</c:if>
                    	<c:if test="${ssMvo.memberTrainer == 'R'}">
                    		예약 프로그램 조회
                    	</c:if>
                    </li>
                    <li id="to_trainer">
                    	<c:if test="${ssMvo.memberTrainer == 'F'}">
                    		트레이너 계정 전환
                    	</c:if>
                    	<c:if test="${ssMvo.memberTrainer == 'R'}">
                    		트레이너 계정 전환
                    	</c:if>
                    </li>
                    <li id="program_list">
                    	<c:if test="${ssMvo.memberTrainer == 'T'}">
                    		내 프로그램 조회
                    	</c:if>
                    </li>
                    
                    <li id="inquiry">1:1 문의</li>
                    <li id="withdrawal">탈퇴하기</li>
                </ul>
            </div>
        </section>
        <script>
        // 예약 취소 버튼 클릭 시
        $("#rsv_cancel").click(function(){
        	console.log("tq");
        	var pt_calendar_no = $(this).parent().prevAll("#pt_no_hidden").val();
        	$.ajax({
        		url:"membercancelreservation.ax",
        		type:"post",
        		data:{ptCalendarNo : pt_calendar_no,
        			  memberNo : ${ssMvo.memberNo}},
        		success: function(result){
        			if(result == 1){
        				alert("예약 취소되었습니다.");
        				location.href="memberreadreservationlist"
        			} else if (result == 0){
        				alert("예약 취소 실패했습니다.");
        			} else {
        				alert("걍 오류");
        			}
        		},
        		error: function(result){
        			alert("ajax 오류");
        		}
        	})
        })
        </script>
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
	    $("#info_edit").click(function(){
	    	location.href="memberupdateprofile";
	    })
	    $("#content_list").click(function(){
	    	location.href="memberreadcontent";
	    })
	    $("#inquiry").click(function(){
			location.href="memberinquiry";
		})
		$("#reservation_list").click(function(){
			location.href="memberreadreservationlist";
		})
		$("#program_list").click(function(){
			location.href="myptprogram";
		})
		$("#withdrawal").click(function(){
			location.href="memberwithdrawalcontroller";
		})
	</script>
</body>
</html>