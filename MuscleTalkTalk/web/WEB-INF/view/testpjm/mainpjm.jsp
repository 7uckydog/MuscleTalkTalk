<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MTT PJM MAIN PAGE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	testpjm<br>
	<button id="test_jdbc">jdbc test</button>
	<br>
	${memberId}
	<br>
	${memberPassword}
	<script>
    {// Test jdbc test
    	$("#test_jdbc").click(function() {
			location.href="TestJdbcControllerServlet";
		});
    }
	</script>
</body>
</html>