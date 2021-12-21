<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%-- 선언문 테그<%!... %> 내에서 변수 선언 :전역 변수   --%>
	<%! int count =0 ; %>
<body>

	Page Count is : 
	
	<% out.println(++count); %>


</body>
</html>