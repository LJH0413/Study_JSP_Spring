<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> =====\세션 삭제 전\=======</h4>
	<%
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");
		
		out.println ( "설정한 세션이름  userID : " + user_id + "<br>");
		out.println ( "설정한 세션의 값 userPW : " + user_pw + "<br>");

		session.removeAttribute("userID");		//세션 (속성값 일부를) 삭제 
	%>
	
	
	<h4> =====\세션 삭제 후\=======</h4>
	<%
	 user_id = (String) session.getAttribute("userID");
	 user_pw = (String) session.getAttribute("userPW");
	
	out.println ( "설정한 세션이름  userID : " + user_id + "<br>");
	out.println ( "설정한 세션의 값 userPW : " + user_pw + "<br>");
	%>
	

</body>
</html>