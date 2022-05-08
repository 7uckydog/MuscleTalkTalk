<%@ include file="/WEB-INF/view/csslink.jsp" %>
<link rel="stylesheet" href="<%=request.getContextPath()%>/cssfolder/css/ptpage.css">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>템플릿 테스트</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>

</head>
<body>
	<%@ include file="/WEB-INF/view/template.jsp" %>
	<section id="pt_blacklist_section">
		<div id="pt_blacklist_div">
			<div id="pt_blacklist_title">
				<p>블랙 리스트 조회</p>
				<button id="pt_my_student_btn" type="button">내 프로그램 회원 조회</button>
			</div>
			<div id="pt_blacklist_container">
				<div class="pt_blacklist_row" id="pt_blacklist_first_row">
					<div class="pt_blacklist_no"></div>
					<div class="pt_blacklist_name">회원명</div>
					<div class="pt_blacklist_regist_date">블랙리스트 등록일</div>
					<div class="pt_blacklist_delete"></div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/WEB-INF/view/footer.jsp" %>
	<script type="text/javascript">
	var blacklist = [];
	<c:forEach var="vo" items="${blackListArray }">
		var blacklistVo = {
			blacklistNo : ${vo.blacklistNo},
			trainerNo : ${vo.trainerNo},
			memberNo : ${vo.memberNo},
			blacklistDate : new Date('${vo.blacklistDate}'),
			memberName : '${vo.memberName}'
		};
		blacklist.push(blacklistVo);
	</c:forEach>
	inputDivFormDb();
	
	function getFormatDate(date) {
		var year = date.getFullYear(); //yyyy
		var month = (1 + date.getMonth()); //M
		month = month >= 10 ? month : '0' + month; //month 두자리로 저장
		var day = date.getDate(); //d
		day = day >= 10 ? day : '0' + day; //day 두자리로 저장
		var hours = date.getHours(); // hh
		hours = hours >= 10 ? hours : '0' + hours; //day 두자리로 저장
		return year + '-' + month + '-' + day + ' ' + hours + ':00'; //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	}
	
	function inputDivFormDb() {
		console.log('test2');
		$('.pt_blacklist_delete').off('click');
		for(var i = 0; i < blacklist.length; i++) {				
			$('#pt_blacklist_container').append('<div class="pt_blacklist_row"></div>');
			$('.pt_blacklist_row').eq(i+1).append('<div class="pt_blacklist_no">'+blacklist[i].blacklistNo+'</div>');
			$('.pt_blacklist_row').eq(i+1).append('<div class="pt_blacklist_name">'+blacklist[i].memberName+'</div>');
			$('.pt_blacklist_row').eq(i+1).append('<div class="pt_blacklist_regist_date">'+getFormatDate(blacklist[i].blacklistDate)+'</div>');
			$('.pt_blacklist_row').eq(i+1).append('<div class="pt_blacklist_delete"><button type="button" class="black_list_delete_btn">삭제</button></div>');
			$('.black_list_delete_btn').eq(i).on('click',function(){
				 $.ajax({
					url : 'blacklistdelete.ax',
					type : 'post',
					data : {
						blacklistNo : blacklist[$('.black_list_delete_btn').index(this)].blacklistNo
					},
					success : function(result) {
						console.log(result);
						if(result == '1') {
							alert("블랙리스트 삭제에 성공했습니다.");
						} else {
							alert("블랙리스트 삭제에 실패했습니다.");
						}
					},
					error : function(request, status, error) {
						console.log(request);
						console.log(status);
						console.log(error);
					}
				}); 
			});
		}
	}
	
	
	
	
		$('#pt_my_student_btn').click(function() {
			location.href = "myptstudent";
		});
	</script>
</body>
</html>