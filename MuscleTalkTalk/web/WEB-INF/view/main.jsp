<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MTT Main Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	main<br>
	<button id="testpjm">testpjm</button> <br>
	<button id="testjjlee">testjjlee</button>
	
	<script>
    {// Test Pjm
    	$("#testpjm").click(function() {
			location.href="testpjm";
		});
    }
    {// Test jjlee
    	$("#testjjlee").click(function() {
			location.href="testjjlee";
		});
    }
    
	</script>
	
</body>
</html>