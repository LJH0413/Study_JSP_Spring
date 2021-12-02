<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<$@ taglib uri="http://java.sum.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:forEach var = "k" begin = "1" end = "10" step = "1">
<c:out value = "${k}" />

</c:forEach>

</body>
</html>