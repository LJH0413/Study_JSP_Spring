<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.Calendar"%>
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
	<h3> Param 액션 테그 : include </h3>
	
	<jsp:include page = "param02_data.jsp">
		<jsp:param name = "title" value ='<%= URLEncoder.encode("오늘날짜와 시간 ") %>' />
		<jsp:param name = "date" value = "<%= Calendar.getInstance().getTime() %>" />
	</jsp:include>
	
	<p>========================= </p>

</body>
</html>