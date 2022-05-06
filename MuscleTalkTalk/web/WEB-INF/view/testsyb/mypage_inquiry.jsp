<%@ include file="/WEB-INF/view/font.jsp"%>
<%@ include file="/WEB-INF/view/csslink3_mp.jsp"%>
<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@page import="kh.semi.mtt.inquiry.model.vo.InquiryVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 조회</title>
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
            margin: 63px 0px 20px 63px;
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
		#btn_inquiry{
            width: 130px;
            height: 30px;
            font-size: 10.5px;
            font-family: 'THEmpgtR';
            color: white;
            background-color: #4B4DB2;
            border: 1px solid #4B4DB2;
            line-height: 30px;
            float: right;
            cursor: pointer;
        }
        #btn_inquiry:hover{
            color: #4B4DB2;
            background-color: white;
            border: 1px solid #4B4DB2;
            transition: ease 0.3s;
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
        #inquiry{
        	text-decoration: underline;
        }
        .npage{
        	cursor: pointer;
        }
</style>
</head>
<body>
<%@ include file="/WEB-INF/view/template.jsp"%>
		<section id="section1">
            <div id="mp_main_text">
                <p id="b_title" style="height: 20px; width: 150px; float: left;">
                    1:1 문의 조회
                </p>
                <button type="button"  id="btn_inquiry">문의하기</button>
            </div>
            <div>
                <table id="board_table">
                    <tr class="tb" class="line">
                        <td colspan="10" class="line"></td>
                    </tr class="tb">
                    <tr id="table_title" class="tb">
                        <td style="width: 10%;" class="tb">번호</td>
                        <td style="width: 43%;" class="tb">제목</td>
                        <td style="width: 25%;" class="tb">문의일</td>
                        <td style="width: 22%;" class="tb" id="cnt"></td>
                    </tr>
	                <tr class="tb tb_last" class="line">
	                    <td colspan="10" class="line"></td>
	                </tr>
	                <c:forEach items="${memberinquiry}" var="volist">
						<tr class="table_content">
							<td style="width: 10%;" class="tb">${volist.inquiryNo }</td>
							<td style="width: 43%;" class="tb"><a href="memberinquiryread?ititle=${volist.inquiryTitle }">${volist.inquiryTitle}</a></td>
							<td style="width: 25%;" class="tb">${volist.inquiryDate }</td>
							<td style="width: 22%;" class="tb"></td>
						</tr>
					</c:forEach>
                </table>
            </div>
            <div id="pageing_all">
                <div class="pageing">
                	<p id="p_c">
							<c:if test="${startPage > 1 }">
								<a class="page" href="memberinquiry?page=${startPage-1 }">이전</a>
							</c:if>
							<c:forEach begin="${startPage }" end="${endPage }" var="p">
								<a class="page" href="memberinquiry?page=${p }">${p }</a>
							</c:forEach>
							<c:if test="${endPage < totalpageCnt}">
								<a class="page" href="memberinquiry?page=${endPage+1 }">다음</a>
							</c:if>
					</p>
                        
                </div>
            </div>
            <%@ include file="/WEB-INF/view/footer.jsp"%>
        </section>
        <section id="section2">
            <div>
                <div id="prifile"></div>
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
	$("#mp_logout").click(function(){
		alert("로그아웃 되었습니다.");
		location.href="logout";
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
	$("#btn_inquiry").click(function(){
		location.href="";
	})
</script>
</body>
</html>