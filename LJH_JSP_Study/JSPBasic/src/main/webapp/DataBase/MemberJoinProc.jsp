<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.MemberDAO"%>
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
	request.setCharacterEncoding("UTF-8");

	/* <!-- 취미 부분은 별도록 읽어드려 다시 빈클래스에 저장  --> */
	String[] hobby = request.getParameterValues("hobby");
	String texthobby = "";
	
	for(int i=0; i<hobby.length; i++) {
		texthobby += hobby[i] + " ";
	}
	
%>

	<!-- useBean 으로 한번에 데이터 받아오기  -->
	<jsp:useBean id="mbean" class="model.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>

	<%

	mbean.setHobby(texthobby);

	//데이터 베이스 클래스 객체 생성
	MemberDAO mdao = new MemberDAO();
	mdao.insertMember(mbean);
	
	//회원가입 후 회원정보 보여주는 페이지로 이동
	response.sendRedirect("MemberList.jsp");
	
%>

	<h2>회원 정보 데이터 베이스에 저장 완료</h2>


</body>
</html>