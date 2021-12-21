<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function checkform (){
			alert("아이디 : " + document.loginform.id.value + "\n"					
					+ "비밀번호 :" + document.loginform.passwd.value);			
		}	
	</script>

</head>
<body>
	<form name = "loginform" >
		<p> 아이디 : <input type= "text" name = "id">
		<p> 비밀번호 : <input type= "password" name = "passwd">
		<p> <input type="submit" value = "전송" onclick = "checkform()">	
	</form>
</body>
</html>