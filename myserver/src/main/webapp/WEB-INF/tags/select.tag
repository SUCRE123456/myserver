<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute required="true" name="list" type="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<select>
	<c:forEach items="${list}" var="item">
		<option>${item}
	</c:forEach>
</select>
