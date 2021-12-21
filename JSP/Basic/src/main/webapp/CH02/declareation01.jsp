<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>declaration tag <%! %> </h2>


<%! int data = 50; %>
<%
	out.println("value of the variable is : " + data);
%>

<br> <br>

<h3>선언문 태그에 전역 매소드 사용하기 1</h3>
<!-- 선언문 태그에 전역 매소드 사용하기1	  -->

<%! int sum(int a, int b) {
	return a + b;	
} %>

<%
	out.println("2 + 3 = " + sum(2,3));
%>

<br> <br>

<h3>선언문 태그에 전역 매소드 사용하기 2</h3>
<!-- 선언문 태그에 전역 메소드 사용하기2  -->

<%! String makeItLower(String data) {
	return data.toLowerCase();	
}	%>

<%
	out.println(makeItLower("Hello World"));
%>
</body>
</html>