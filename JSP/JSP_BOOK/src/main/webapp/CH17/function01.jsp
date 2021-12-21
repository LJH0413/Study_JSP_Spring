<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p> <h3> java 문자열 검색 </h3>
	<p> Hello, Java Server Page! ==> ${fn:contains("Hello Java Server Pages!", "java") }
	<p> hello, java server pages! ==> ${fn:containsIgnoreCase("hello, java server pages!","JAVA" ) }
	

</body>
</html>