<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
		function checkLogin(){
			var form = document.loginForm;
			if (form.id.value.length < 4 || form.id.value.length >12){
				alert("아이디는 4자 이상 12자 이하로 입력하세요. ");
				form.id.select();
				return;
			}
			if (form.passwd.value.length < 4){
				alert("비밀번호는 4자 이상으로 넣으세요");
				form.passwd.select();
				return;
			}
			form.submit();
		}
	
	</script>
</head>
<body>

	<form name = "loginForm" action = "validation02_process.jsp" method = "post">
		<p> 아 이 디 : <input type= "text" name = "id">
		<p> 패스워드 : <input type= "password" name = "passwd">
		<p> <input type= "button" value = "전송" onclick = "checkLogin()">
	</form>

</body>
</html>