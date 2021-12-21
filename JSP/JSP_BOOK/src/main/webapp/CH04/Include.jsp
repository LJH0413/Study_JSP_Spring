<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> Include 액션 태그 </h2>
	
	<%-- flush : 메모리의 버퍼의 내용을 출력후 삭제 할때 사용.  --%>
	<jsp:include page = "include_date.jsp" flush = "true" />
	
	<p> -------------------------------</p>

</body>
</html>