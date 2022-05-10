<%@ include file="/WEB-INF/view/csslink2.jsp" %>
<%@page import="kh.semi.mtt.board.model.vo.BoardVo"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin-dashboard</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script> 
<%@ include file="/WEB-INF/view/font.jsp" %>

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

#li_1 {
	text-decoration: underline;
}

#board_main {
	padding-top: 65px;
	padding-bottom: 15px;
	margin-left: 65px;
	font-weight: bold;
	display: inline-block;
	margin-bottom: 0;
	font-size: 15px;
}

#board_table {
	margin: 20px auto;
	width: 650px;
	font-size: 12px;
}

.board_top {
	position: relative;
}

/*차트*/
#dashboard_title {
	border: 1px solid #4B4DB2;
	background-color: #4B4DB2;
	width: 650px;
	box-sizing: border-box;
	height: 55px;
	padding: 10px 30px 10px 50px;
	margin: 20px auto 0;
	text-align: left;
	position: relative;
	overflow: hidden;
	vertical-align: middle;
}

#dashboard_count {
	display: inline-block;
	/* margin: auto; */
	line-height: 30px;
	font-size: 12px;
	color: white;
}

#dashboard_content {
	border: 1px solid #4B4DB2;
	border-top: 0;
	width: 650px;
	box-sizing: border-box;
	height: 650px;
	padding: 30px 0;
	margin: 0 65px;
	text-align: left;
}

.charts {
	width: 250px;
	height: 250px;
	display: inline-block;
	margin-left: 50px;
	margin-top: 30px;
}
</style>

</head>
<body>
	<%
		BoardVo vo = (BoardVo) request.getAttribute("bvo");
	%>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="section1">
		<div class="board_top">
			<div id="board_main">대시보드</div>
		</div>
		<div id="dashboard_title">
                <div id="dashboard_count">전체게시물 수:</div>  
            </div>
            <div id="dashboard_content">
                <div class="charts">
                    <canvas id="chart1" width="250px" height="250px"></canvas>
                </div>
                <div class="charts">
                    <canvas id="chart2" width="250px" height="250px"></canvas>
                </div>
                <div class="charts">
                    <canvas id="chart3" width="250px" height="250px"></canvas>
                </div>
                <div class="charts">
                    <canvas id="chart4" width="250px" height="250px"></canvas>
                </div>
            </div>
	
	</section>
	<section id="section2">
		<div class="profile">
			<img src="">
			<div id="camera">
				<img src="<%=request.getContextPath()%>/cssfolder/images/camera.png">
			</div>
		</div>
		<div class="my_info">
			<div>Admin</div>
			<div>admin 2</div>
		</div>
		<div class="logout">
			<button>로그아웃</button>
		</div>
		<div class="menu">
			<ul>
				<li id="li_1"><a href="dashboard">대시보드</a></li>
				<li id="li_2"><a href="adminboard">게시물 관리</a></li>
				<li id="li_3"><a href="admincomment">댓글 관리</a></li>
				<li id="li_4"><a href="adminnotice">공지사항 관리</a></li>
				<li id="li_5"><a href="adminmember">회원 관리</a></li>
				<li id="li_6">트레이너 관리</li>
				<li id="li_7"><a href="admininquiry">문의 확인</a></li>
			</ul>
		</div>
	</section>
	
	<%@ include file="/WEB-INF/view/footer.jsp" %>
<script> //차트 스크립트
function getTodayDate() {
    const today = new Date(); // Mon Dec 20 2021 22:04:03 GMT+0900 (한국 표준시)

    const year = today.getFullYear(); // 2021
    const month = ('0' + (today.getMonth() + 1)).slice(-2); // 12
    const day = ('0' + today.getDate()).slice(-2); // 20

    // 원하는 문자열 형태로 날짜 가공하기
    // const dateString = year + month + day; // 20211220
    // const dateString = year + '.' + month + '.' + day; // 2021.12.20

    return dateString;
}

	function formateDate(x1) {
		var month = x1.getMonth() + 1;
		var date = x1.getDate();
		return month + '월' + date + '일';
	}
	var dateStrArray = [];
	for(var i = 0; i < 6; i++) {
		var today = new Date();
		today.setDate(today.getDate() - (5 - i));
		dateStrArray.push(formateDate(today));
	}

	
    const chart1 = document.getElementById('chart1').getContext('2d');
    const myChart1 = new Chart(chart1, {
        type: 'bar',
        data: {
            labels: dateStrArray,
            datasets: [{
                label: '방문자 수',
                data: [1, 2, 3, 4, 5, 6],
                backgroundColor: [
                    '#6B6EFF','#6063E6','#5658CC','#4B4DB2','#404299','#363780'
                ],
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true}
            }
        }
    });
    const chart2 = document.getElementById('chart2').getContext('2d');
    const myChart2 = new Chart(chart2, {
        type: 'bar',
        data: {
            labels: dateStrArray,
            datasets: [{
                label: '회원 수',
                data: [1, 2, 3, 4, 5, ${NOM.memberCnt}],
                backgroundColor: [
                    '#6B6EFF','#6063E6','#5658CC','#4B4DB2','#404299','#363780'
                ],
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true}
            }
        }
    });
    const chart3 = document.getElementById('chart3').getContext('2d');
    const myChart3 = new Chart(chart3, {
        type: 'bar',
        data: {
            labels: dateStrArray,
            datasets: [{
                label: '게시물 수',
                data: [1, 2, 3, 4, 5, ${NOB.totalCnt}],
                backgroundColor: [
                    '#6B6EFF','#6063E6','#5658CC','#4B4DB2','#404299','#363780'
                ],
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true}
            }
        }
    });
    const chart4 = document.getElementById('chart4').getContext('2d');
    const myChart4 = new Chart(chart4, {
        type: 'bar',
        data: {
            labels: dateStrArray,
            datasets: [{
                label: '댓글 수',
                data: [1, 2, 3, 4, 5, 6],
                backgroundColor: [
                    '#6B6EFF','#6063E6','#5658CC','#4B4DB2','#404299','#363780'
                ],
            }]
        },
        options: {
            scales: {
                y: { beginAtZero: true}
            }
        }
    });

/* 	$(window).click(function () {
		console.log("test");
		var testDate1 = new Date();
		var testDate2 = new Date();
		var testDate3 = new Date();
		var testDate4 = new Date();
		var testDate5 = new Date();
		var testDate6 = new Date();
		var testDate7 = new Date();
		testDate2.setDate(testDate2.getDate() - 1);
		testDate3.setDate(testDate3.getDate() - 2);
		testDate4.setDate(testDate4.getDate() - 3);
		testDate5.setDate(testDate5.getDate() - 4);
		testDate6.setDate(testDate6.getDate() - 5);
		testDate7.setDate(testDate7.getDate() - 6);

		console.log(formateDate(testDate1));
	});
	 */
	
	
    </script>	
	
</body>
</html>