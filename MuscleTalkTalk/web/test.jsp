<%@ include file="/WEB-INF/view/csslink.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머슬톡톡</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@ include file="/WEB-INF/view/font.jsp" %>
<style>
	section {
		padding: 60px;
	}
	
	#btn_wrap {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
	}
	
	.btn_test {
		display: block;
		width: 150px;
		height: 30px;
		font-size: 15px;
		font-family:'THEmpgtM';
		background-color: #4B4DB2;
		color: white;
		margin-bottom: 20px;
		border: 1px solid #4B4DB2;
	}
	.btn_test:hover {
		background-color: white;
		color: black;
	}
</style>
</head>
<body>
    <%@ include file="/WEB-INF/view/template.jsp" %>
        <section>
        	<div id="btn_wrap">
        	</div>
        	<form name="testLoginForm">
        		<input type="hidden" name="memberId" id="memberId">
        		<input type="hidden" name="memberPassword" id="memberPassword">
        	</form>
        </section>

    <%@ include file="/WEB-INF/view/footer.jsp" %>
    <script type="text/javascript">
    	for(var i = 0; i < 10; i++) {
    		$('#btn_wrap').append('<button type="button" id="user'+(i+1)+'" class="btn_test">유저'+(i+1)+'</button>');
    		$('#btn_wrap').append('<button type="button" id="admin'+(i+1)+'" class="btn_test">관리자'+(i+1)+'</button>');
    		$('#btn_wrap').append('<button type="button" id="trainer'+(i+1)+'" class="btn_test">트레이너'+(i+1)+'</button>');
    		$('#btn_wrap').append('<button type="button" id="trainerR'+(i+1)+'" class="btn_test">트레이너R'+(i+1)+'</button>');
    	}
    	$('#user1').text('유저1(서유빈)');
    	$('#user2').text('유저1(민승택)');
    	$('#user3').text('유저1(이진정)');
    	$('#user4').text('유저1(박재민)');
    	
    	$('.btn_test').click(function() {
			console.log('test');
			$('#memberId').val($(this).attr('id'));
			$('#memberPassword').val('1234');
			testLoginForm.action = "login.do";
			testLoginForm.method = "post";
			testLoginForm.submit();
		});
    </script>
</body>
</html>