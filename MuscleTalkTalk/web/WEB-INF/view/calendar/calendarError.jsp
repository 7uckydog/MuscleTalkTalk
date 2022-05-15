<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		var msgVal = '${msg}';
		var hrefStr = '${href}';
		if(msgVal != '') {
			alert(msgVal);
			location.href= hrefStr;
		}
	</script>
</body>
</html>