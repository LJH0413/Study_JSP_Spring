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
	request.setCharacterEncoding("utf-8");

	/* out.write("아이디 저장은 " + request.getParameter("save")); */
	
	//체크박스체크 여부
	String save = request.getParameter("save");
	
	//아이디값을 저장
	String id = request.getParameter("id");
	
	//체크되었는지 비교 판단
	if(save != null) { // 아이디 저장이 눌러져 있다면
		
		Cookie cookie = new Cookie("id", id);
	
		//쿠키 유효시간 설정
		cookie.setMaxAge(60 * 30); //60초 * n번
	
		//쿠키 저장
		response.addCookie(cookie);
		
		out.write("쿠키 설정 완료");
	}

	//쿠키 사용하려면 쿠키 클래스를 생성해야한다
	//Cookie cookies = new Cookie("", ""); // 첫번째 String: key 값, 두번째 String: value 값
%>

</body>
</html>