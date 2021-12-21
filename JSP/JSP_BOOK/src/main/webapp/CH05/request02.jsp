<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.util.Enumeration" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Enumeration en = request.getHeaderNames(); // 클라이언트가 전송한 값을 배열로 받는다.   
		while (en.hasMoreElements()) {
			String headerName = (String) en.nextElement();
			String headerValue = request.getHeader(headerName);
				
	%>
	<%= headerName %> : <%= headerValue %> <br>
	
	<% 
		}
	%>

</body>
</html>