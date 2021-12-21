<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>이 페이지는 ResponseRedirect.jsp 페이지입니다.</h2>

	<%
		request.setCharacterEncoding("EUC-KR");
	
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
	%>
	
	<h3> id :  <%= id %> 입니다</h3>


</body>
</html>