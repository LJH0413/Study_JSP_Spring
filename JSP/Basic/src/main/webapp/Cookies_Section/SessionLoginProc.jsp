<%@page import="javax.websocket.Session"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div align="left">
	
	<h2>세션 로그인 처리1</h2> 
	

<%
	request.setCharacterEncoding("utf-8");

	
	//사용자로부터 데이터를 읽어드림
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	//id와 pass 저장
	session.setAttribute("id", id);
	session.setAttribute("pass", pass);
	
	//세션의 유지 시간
	session.setMaxInactiveInterval(60);
%>

	<h2>당신의 아이디는 <%=id %> 입니다.</h2>
	<h2>당신의 패스워드는 <%=pass %>입니다.</h2>
	<a href="SessionLoginProc2.jsp">다음페이지로 이동</a>
	

</div>

</body>
</html>