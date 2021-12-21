<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%		// 지역 변수 : 스크립트릿 테그에서 선언 _jspService 메소드 내에서 선언
		int a = 2;
		int b = 3;
		
		int sum = a + b;
	
		out.println (" 2 + 3 : " + sum);
	
	%>
	
	<br> <br> 
	<hr> <br><br>
	
	<% 		// 2의 배수만 출력
		for (int i = 0 ; i <= 10 ; i++){
			if (i % 2 == 0 ){
				out.println (i + "<br>");
			}
		}
		
	%>
	
		<br> <br> <hr> <br><br>
	
	<%		// 지역 변수 : _jspService 메소드 내에서만 사용 가능
		int aa = 10;
		int bb = 20;
		int cc = 30;	
	%>
	
	<%= aa + bb + cc %>
	
	
	
	

</body>
</html>