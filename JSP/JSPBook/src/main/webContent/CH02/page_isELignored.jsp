<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored = "true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--jsp에서 표현 태그를 사용하지 못하도록 설정 --%>
	<%
	request.setAttribute("RequestAttribute", "request 내장 객체");
	%>
	
	${requestScope.RequestAttribute}

</body>
</html>