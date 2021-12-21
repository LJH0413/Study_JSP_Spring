<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> =========/세션 유효 시간 변경 전 /============</h4>
	<%
		int time = session.getMaxInactiveInterval() / 60 ; //세션의 최대 시간 (분)
	
		out.println ("세션 유효 시간(톰켓의 기본 설정) : " + time + " 분 <br>");
	%>


	<h4> =========/세션 유효 시간 변경 후 /============</h4>
	<%
		session.setMaxInactiveInterval( 60 * 60 );
		time = session.getMaxInactiveInterval() / 60 ;
		
		out.println("세션의 유효시간 : "  + time + " 분 <br> ");
	
	%>
</body>
</html>