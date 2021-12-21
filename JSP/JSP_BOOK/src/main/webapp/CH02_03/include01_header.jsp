<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%! 
	int pageCount = 0;
	void addCount() {
		pageCount++ ;
	}

%>
<%
	addCount();
%>

이 사이트 방분은 <%= pageCount %> 번째 방문 입니다. 
<h2> =======여기는 Header 입니다. ============</h2>


</body>
</html>