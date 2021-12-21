<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id = "date" class = "java.util.Date" />
	
	<p> 
		<%
			out.print ("오늘 날짜와 시간");
		%>
		
		
		<br> <br>
		<%= date %>
	
	</p>

</body>
</html>