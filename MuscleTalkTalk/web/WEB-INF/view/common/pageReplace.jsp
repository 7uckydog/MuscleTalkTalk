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
		var locationVal = '${location}';
		if(locationVal != '') {
			location.replace('<%=request.getContextPath()%>/'+locationVal);
		}
	</script>
</body>
</html>