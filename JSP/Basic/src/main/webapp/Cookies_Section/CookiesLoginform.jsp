<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	//사용자 쿠키 저장소로부터 쿠키값 불러오기- 몇개인지 모르기에 배열 사용 저장
	Cookie[] cookies = request.getCookies();
	String id = "";
	
	//쿠키값이 없을 수 있기에 null 처리 해야함
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("id")) {
				id = cookies[i].getName();
				break; //원하는 데이터를 찾았기에 반복문 종료
			}
			
		}
	}

%>

	<div align="center">
		<h2>쿠키 로그인</h2>
		<form action="CookiesLoginProc.jsp" method="post">
		<table width="400" border="1">
		<tr height="50">
			<td width="150">아이디</td>
			<td width="250"> <input type="text" name="id" value="<%=id %>"> </td>
		</tr>
		
		<tr height="50">
			<td width="150">패스워드</td>
			<td width="250"> <input type="password" name="pass"> </td>
		</tr>
		
		<tr height="50">
			<td colspan="2" align="center"> <input type="checkbox" name="save" value="1"> 아이디 저장 </td>
		</tr>
		
		<tr height="50">
			<td colspan="2" align="center"> <input type="submit" name="login" value="로그인"></td>
		</tr>
		
		</table>
		</form>
	</div>

</body>
</html>