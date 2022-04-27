<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<script>
	window.onload = function(){
		var con = confirm("회원가입이 완료되었습니다. 로그인을 진행해주세요.");
		if(con == true){
			location.href="login";
		}
	}
</script>
</head>
<body>
	
</body>
</html>