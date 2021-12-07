<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		<h2>회원 정보 보기</h2>
		<!-- request로 넘어온 데이터를 자바 빈즈랑 매핑  -->
		<jsp:useBean id="mbean" class="bean.MemberBean1">
			<%-- <jsp:setProperty name="mbean" property="id"/> --%>
			
			<jsp:setProperty name="mbean" property="*"/> 
			
			<!-- * =  자동으로 모두 매핑시켜주세요 --%>
			<!-- 빈클래스와 jsp id가 같아야 자동 매핑  -->
		</jsp:useBean>
		
		<!-- jsp 내용을 자바빈클래스에 데이터를 매핑  -->
		<!-- set/getProperty>  -->
		<!--객체생성 -> MemberBean mbean = new MemberBean();  -->
		
		
		<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
		<h2>당신의 비밀번호는 <jsp:getProperty property="pass1" name="mbean"/></h2>
		<h2>당신의 이메일는 <jsp:getProperty property="email" name="mbean"/></h2>
		<h2>당신의 이메일는 
			<%mbean.getTel(); %>
		</h2>
		

	</div>

</body>
</html>