<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id = "bean" class = "ch04.com.dao.Calculator" />
	
	<%
		int m = bean.process(5);
		out.println ( "5의 3제곱근은 : " + m);
	%>
	<br> <br> <hr> <br><br> 
	
	<p> 3의 3 제곱 근은 : <%= bean.process(3) %></p>

</body>
</html>