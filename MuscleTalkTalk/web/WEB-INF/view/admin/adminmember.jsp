<%@ include file="/WEB-INF/view/csslink2.jsp"%>
<%@page import="kh.semi.mtt.member.model.vo.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-member</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp"%>

<style>
section {
	font-family: 'THEmpgtM';
}

a, a:visited, a:link {
	color: rgb(94, 94, 94);
}

.menu>ul>li {
	display: list-item;
	text-align: center;
	padding-top: 12px;
}

#li_5 {
	text-decoration: underline;
}
/* #member_main {
	padding-top: 65px;
	padding-bottom: 15px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 0;
	font-size: 15px;
} */
#member_table {
	margin: 20px auto;
	width: 650px;
	font-size: 12px;
	clear: both;
}

.board_top {
	position: relative;
}
#sort {
	width: 105px;
	height: 30px;
	margin-top: 10px;
	margin-bottom: 0px;
	margin-right: 65px;
	float: right;
	font-size: 12px;
	position: absolute;
	bottom: 0;
	right: 0;
	border-color: rgb(200, 200, 200);
	color: #404299;
	border-radius: 3px;
	font-family: 'THEmpgtM'
}

#member_main {
	padding-top: 65px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	padding-bottom: 15px;
	font-size: 15px;
}

#member_top_button {
	padding-top: 65px;
	margin-bottom: 0;
	float: right;
	position: absolute;
	bottom: 0;
	right: 0;
}

#write_btn {
	color: white;
	border: 1px solid white;
	background-color: #4B4DB2;
	width: 152px;
	height: 30px;
	line-height: 30px;
	font-size: 12px;
	margin-right: 65px;
	cursor: pointer;
}

#write_btn:hover {
	color: #4B4DB2;
	background-color: white;
	border: 1px solid #4B4DB2;
}

#board_category {
	padding-top: 65px;
	margin-right: 65px;
	float: right;
	font-size: 12px;
}

#btn_search {
	height: 27px;
	width: 63px;
	font-size: 12px;
	padding: 12px auto;
	float: right;
}

#input_search {
	height: 24px;
	width: 203px;
	margin-top: 2.5px;
	margin-right: 10px;
	float: right;
	font-size: 12px;
}

#input_search::placeholder {
	font-size: 12px;
}

#input_search:focus {
	outline: none;
}

.table_line {
	background: gray;
	background-clip: content-box;
	height: 1px !important;
}

#table_title {
	height: 38px;
	line-height: 38px;
}

.table_content {
	height: 50px;
	line-height: 50px;
}

.table_content :first-child {
	width: 60px;
	padding-left: 10px;
	box-sizing: border-box;
}

.search_member {
	display: inline-block;
	float: right;
	margin-right: 65px;
}


#pageing_all {
	margin: 45px auto 60px auto;
	text-align: center;
	font-family: 'THEmpgtM';
	font-size: 0px;
}

.page {
	background-color: rgb(236, 236, 236);
	border-radius: 3px;
	color: rgb(127, 127, 127);
	padding: 8px 11px 8px 11px;
	display: inline-block;
	margin: 0px 2px;
	font-size: 10.5px;
}

.npage{
	cursor: pointer;
}
</style>

</head>
<body>
	<%
		MemberVo vo = (MemberVo) request.getAttribute("mvo");
	%>
	<%@ include file="/WEB-INF/view/template.jsp"%>
	<section id="section1">
		<div class="board_top">
			<div id="member_main">회원 관리</div>
			<select id="sort">
				<option class="Filter" name="Filter" value="1">가입순</option>
				<option class="Filter" name="Filter" value="2">누적 결제액순</option>
			</select>
		</div>
		<table id="member_table">
			<tr>
				<td colspan="6" class="table_line"></td>
			</tr>
			<tr id="table_title">
				<td class="first_col" style="width: 10%;"></td>
				<td style="width: 15%;">회원명</td>
				<td style="width: 15%;">회원번호</td>
				<td style="width: 20%;">가입일</td>
				<td style="width: 20%;">누적결제액(원)</td>
				<td style="width: 20%;">누적신고횟수</td>
			</tr>
			<tr>
				<td colspan="6" class="table_line"></td>
			</tr>
			<c:forEach var="vo" items="${memberreadall}">
				<tr class="table_content">
					<td>${vo.rownum}</td>
					<td><a href="adminmemberread?memberNo=${vo.memberNo}">${vo.memberName }</a></td>
					<td><a href="adminmemberread?memberNo=${vo.memberNo}">${vo.memberNo}</a></td>
					<td>${vo.memberJoinDate}</td>
					<td>${vo.sumPrice}</td>
					<td>${vo.boardReportCnt}</td>
				</tr>
			</c:forEach>
		</table>
		<div id="pageing_all">
			<div class="pageing">
				<p id="p_c">
					<c:if test="${startPage > 1 }">
						<a class="page" href="adminmember?page=${startPage-1 }">이전</a>
					</c:if>
					<c:forEach begin="${startPage }" end="${endPage }" var="p">
						<a class="page" href="adminmember?page=${p }">${p }</a>
					</c:forEach>
					<c:if test="${endPage < totalpageCnt}">
						<a class="page" href="adminmember?page=${endPage+1 }">다음</a>
					</c:if>
				</p>
			</div>
		</div>
		<div class="search_member">
			<button type="button" id="btn_search">검색</button>
			<input id="input_search" type="text" name="searchInput"
				placeholder="검색어입력">
		</div>

	</section>
	<section id="section2">
		<div class="profile">
			<c:if test="${not empty ssMvo.memberPhoto}">
            	<img id="prifile" src="${ssMvo.memberPhoto}">
            </c:if>
            <c:if test="${empty ssMvo.memberPhoto}">
            	<img id="prifile" src="<%= request.getContextPath() %>/cssfolder/images/default_pf.png">
            </c:if>
		</div>
		<div class="my_info">
			<div id="member_nickname">${ssMvo.memberNickname}</div>
			<div id="member_id">${ssMvo.memberId}</div>
		</div>
		<div class="logout">
			<input type="button" name="mp_logout" id="mp_logout" value="로그아웃">
		</div>
		<div class="menu">
			<ul>
				<li id="li_1"><a href="dashboard">대시보드</a></li>
				<li id="li_2"><a href="adminboard">게시물 관리</a></li>
				<li id="li_3"><a href="admincomment">댓글 관리</a></li>
				<li id="li_4"><a href="adminnotice">공지사항 관리</a></li>
				<li id="li_5"><a href="adminmember">회원 관리</a></li>
				<li id="li_6"><a href="admintrainer">트레이너 관리</a></li>
				<li id="li_7"><a href="admininquiry">문의 확인</a></li>
			</ul>
		</div>
	</section>
	<script>
		$("#btn_search").click(function() {
			console.log("btn_search CLICK");
			$.ajax({
					url : "memberreadall",
					type : "post",
					data : {inputsearch : $("#input_search").val()},
					dataType : "json",
					success : function(result) {
						console.log(result);
						var html = "";
						for (var i = 0; i < result.memberreadall.length; i++) {
							var vo = result.memberreadall[i];
							html += '<tr class="table_content">';
							html += '<td><a href="memberread?memberNo='
									+ vo.memberNo
									+ '">'
									+ vo.memberNo
									+ '</a></td>';
							html += '<td><a href="memberread?memberNo='
									+ vo.memberNo
									+ '">'
									+ vo.notiTitle
									+ '</a></td>';
							html += '<td>' + vo.notiDate
									+ '</td>';
							html += '</tr>';
						}
						$("#table_title").next().nextAll()
								.remove();
						$("#member_table").append(html);
					},
					error : function(result) {

					}
				});
		});
		
		$("#sort").on("change",function(){
			console.log("test");
			console.log($("#sort").val());
			//$(".Filter").val()
			$.ajax({
				url:"adminmember",
				type:"post",
				data:{filters:$("#sort").val(), page:${currentPage}},
				dataType:"json",
				success: function(result) {
						console.log(result);
						console.log(result+'여기에요에이쟉스!!');
							var html = "";
						for(var i = 0; i < result.memberreadall.length; i++){
		                    var vo = result.memberreadall[i];
		                    html += '<tr class="table_content">';
		                    html += '<td>'+vo.rownum+'</td>';
		                    html += '<td><a href="adminmemberread?memberNo='+vo.memberNo+'">'+vo.memberName+'</a></td>';
		                    html += '<td><a href="adminmemberread?memberNo='+vo.memberNo+'">'+vo.memberNo+'</a></td>';
		                    html += '<td>'+vo.memberJoinDate+'</td>';
		                    html += '<td>'+vo.sumPrice+'</td>';
		                    html += '<td>'+vo.boardReportCnt+'</td>';
		                    html += '</tr>';
		                }
						
						console.log($("#table_title").next());
						$("#table_title").next().nextAll().remove();
						$("#member_table").append(html);
						return;
				} ,
				error: function(result){
					console.log("ajax 오류");
				}
				});
			});
		
		for(var i = 0; i < $('.Page').length; i++) {
			if($('.Page').eq(i).text() == '${currentPage}') {
				$('.Page').eq(i).css({
					backgroundColor : '#4B4DB2',
					color : 'white'
				})
			}
		}
	</script>
	<%@ include file="/WEB-INF/view/footer.jsp"%>


</body>
</html>