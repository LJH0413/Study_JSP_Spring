<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.MemberDAO"%>
<%@ page import="model.MemberBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");	
	%>
		
		<jsp:useBean id = "mbean1" class= "model.MemberBean">
		<jsp:setProperty name="mbean1" property="*" /><!--맵핑 시키시오  -->
	</jsp:useBean>


	<% 
		String id =request.getParameter("id");
		MemberDAO mdao = new MemberDAO();
		
		String pass = mdao.getPass1(id);
		if(mdao.getPass1(id).equals(mbean1.getPass1())){
			mdao.updateMember(mbean1);
			response.sendRedirect("MemberList.jsp");
		}else{
	%> 
		<script type="text/javascript">
			alert("패스워드가 맞지 않습니다. 다시 확인해 주세요");
			history.go(-1);
		</script>
	<% 		
		}
	%>
</body>
</html>