<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> <h3>JSTL을 사용해서 넘오는 숫자가 홀수 인지 짝수인지 판단. </h3>
	
	<form action = "core02_process.jsp" mothod = "post">
		<p> 숫자 <input type="text" name = "number"> 
		<p> <input type="submit" value = "전송"> 
	
	</form>

</body>
</html>