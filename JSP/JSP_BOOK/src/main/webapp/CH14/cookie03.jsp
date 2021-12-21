<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		Cookie[] cookies = request.getCookies();
		
		for ( int i = 0 ; i < cookies.length ; i++) {
			cookies[i].setMaxAge(0); 	// 쿠키삭제
			response.addCookie(cookies[i]); //client HDD 적용
			
		}
		response.sendRedirect("cookie02.jsp"); 		// 페이지 이동 
	
	%>

</body>
</html>