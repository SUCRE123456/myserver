<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>jstl 테스트</h3>
	<a href="/myserver">홈으로</a>
	<a href="${pageContext.request.contextPath }">홈으로2(컨텍스트패스 바뀌어도 가능.)</a>
	

	
	<a href="${pageContext.request.contextPath }/empList">사원목록.</a>
	<a href="<c:url value="/empList"/>">사원목록 컨텍스트패스 바뀌어도 가능 C URL)</a>  ***********이건 기억.!!

	
	
	<a href="${pageContext.request.contextPath }/empList?page=1&search=111">사원</a>
	
	<c:url value="/empList" var="linkEmp">
		<c:param name="page" value="1"/>
		<c:param name="search" value="111"/>
	</c:url>
	<a href="${linkEmp }">사원</a>
	
	<hr>
	<h3>jstl 테스트2</h3>
	
	<c:set var="cp" value="${pageContext.request.contextPath }"/>
	<a href="${cp }">홈으로</a>
	
	
	<%out.print(12123434);%>
	<hr>
	 	<!-- String[] strs = {"alpha", "beta", "charlie"};
      System.out.println(Arrays.toString(strs));   // [alpha, beta, charlie]
 
      List<String> lst = Arrays.asList(strs); -->
	
	****************<%-- <c:set var="list" value="<%=Arrays.asList(\"mon\",\"tue\",\"sat\")%>"/>
	<c:forEach items="${list }" var="week">
		${week }<br>
	</c:forEach> --%>
	
	<hr>
	<c:set var="hobby" value="read,ski,golf,degine"/>
	총 갯수 : ${fn:length(hobby)}<br>
	
	<c:set var="hbList" value="${fn:split(hobby,',')}"/>
		총갯수 : ${fn:length(hbList)}
	
	
	
	<ul>
	<c:forTokens items="${hobby }" var="hb" delims=",">
		<li>${hb }
	</c:forTokens>
	</ul>
	
	<select>
	<c:forEach items="${fn:split(hobby,',')}" var="hb" varStatus="st">
		<option <c:if test="${hb eq 'degine'}">selected="selected"</c:if> >${st.count} ${st.count%2==0} 또는 ${st.index} ${hb }</option>
	</c:forEach>
	</select>
	
	<hr>
	FMT--------------------------------------------
	<c:set var="wdate" value="<%=new Date() %>"/>
	${wdate }<br>
	<fmt:formatDate value="${wdate }" pattern="yyyy-MM-dd"/> 
	
	<br>	
	<c:set var="sdate" value="2022-01-05 12:34"/>
	<fmt:parseDate var="psdate" value="${sdate}" pattern="yyyy-MM-dd hh:mm"/>
	<fmt:formatDate value="${psdate }" pattern="MM-dd"/>
	
</body>
</html>