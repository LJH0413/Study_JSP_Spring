<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<h2>스크립틀릿 태그 = <% %></h2>

<!-- 선언문 태그 -->
<%! int count = 0; %>

<body>

	Page Count is :
	
	<!-- 스크립트릿 태그  -->
	<%
		out.println(myMethod(0));
	%>
	
	<!-- 선언문 태그 -->
	
	<%! public int myMethod(int count) {
		return ++count;
		}
	%>
	
	<br>
	
	<!-- 스크립틀릿 태그 지역 변수 -->
	<%
		int a = 2;
		int b = 3;
		int sum = a + b;
		out.println("2 + 3 = " + sum);
	%>
	

</body>
</html>