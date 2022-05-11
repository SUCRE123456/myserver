<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>목록</h3>
${users[0] }<br>
${users[1] }<br>
${param.page }<br>
${param.keyword }<br>
<script type="text/javascript">
if('${message}' != ''){
	alert('${message}')
}
</script>
</body>
</html>