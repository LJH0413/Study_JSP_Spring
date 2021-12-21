<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<%-- 이전 페이지에서 넘긴 변수의 값을 받을때 : request.getParameter("변수명") --%>
	<p> 아이디 : <%= request.getParameter("id") %>
		<% 
			String name = request.getParameter("name");
		%>
		
	<p> 이름 : <%= URLDecoder.decode(name) %>

</body>
</html>