<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<script>
		var msgVal = '${msg}';
		if(msgVal != '') {
			alert(msgVal);
			location.href= "membermypage";
		}
	</script>
</body>
</html>