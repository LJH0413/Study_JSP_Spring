<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3> Param 액션 태그 : forward </h3>
	<jsp:forward page = "param1_data.jsp" >
		<jsp:param name = "id" value = "admin" />
		<jsp:param name = "name" value = '<%= URLEncoder.encode("관리자") %>' />
	</jsp:forward>
	
	<p> Java Server Page</p>
	
	

</body>
</html>