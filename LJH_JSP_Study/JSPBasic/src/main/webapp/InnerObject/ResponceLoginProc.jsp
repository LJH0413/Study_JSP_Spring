<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("EUC-KR");

	//임의적으로 id와 pass 설정
	String dbid = "aaaa";
	String dbpass = "1234";
	
	//사용자 데이터 입력
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	
	if(dbid.equals(id) && dbpass.equals(pass)) {
		//아이디와 패스워드가 일치하니까 메인페이지 보여줌
		response.sendRedirect("ResponceMain.jsp?id="+id);
	}else {
%>
	<script>
	alert("아이디와 패스워드가 일치하지 않습니다.");
	history.go(-1);
	</script>
<%
	}
%>

</body>
</html>