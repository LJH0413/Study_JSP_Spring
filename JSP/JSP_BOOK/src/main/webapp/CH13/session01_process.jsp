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
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		
		if ( user_id.equals("admin") && user_pw.equals("1234")){
			
			session.setAttribute("userID", user_id);	//세션 생성 (로그인시에)
			session.setAttribute("userPW", user_pw);	//세션 생성 (로그인시에)
			
			out.println("세션 설정이 성공 하였습니다. <br> ");
			out.println(user_id + " 님 환영 합니다. ");
		}else {
			
			out.println ("세션 설정이 실패 했습니다. ");
		}
		
	%>

</body>
</html>