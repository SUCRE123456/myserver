<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>webapp/tagTest.jsp</title>
</head>
<body>
<% List<String> list = Arrays.asList("사과", "바나나", "키위"); %>
<my:select list='<%=list %>'/>
<my:paging ></my:paging>
</body>
</html>