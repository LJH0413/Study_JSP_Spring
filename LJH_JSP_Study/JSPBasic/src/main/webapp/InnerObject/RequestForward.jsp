<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- request 해당 범위는 다음 페이지까지  -->
<%
	//사용자의 정보가 저장되어 있는 객체의 request와 getparameter() 사용자의 정보를 추출
	String id = request.getParameter("id"); //사용자의 아이디를 읽어서 변수에 저장
	String pass = request.getParameter("password");
%>

	<h2>
	RequestForward 페이지 입니다. <br>
	당신의 아이디는 <%= id %> 이고 패스워드는 <%= pass %>입니다.
	</h2>
</body>
</html>