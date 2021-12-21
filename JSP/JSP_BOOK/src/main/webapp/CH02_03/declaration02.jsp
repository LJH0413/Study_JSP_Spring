<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 선어문 테그에서 메소드 선언 : 전역 메소드  --%>
	<%! int sum(int a , int b){
		return a + b ;		
	}
		%>
	<%
		out.println ( "2 + 3 : " + sum(2,3));
	%>	

</body>
</html>