<%@page import="model.MemberBean"%>
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

	<!-- 1.데이터 베이스에서 한 회원 정보 가져옴 2. table 태그 이용하여 화면에 회원의 정보 출력  -->

	<%
		String id = request.getParameter("id");
		
		MemberDAO mdao = new MemberDAO();
		MemberBean mbean = mdao.oneSelectMember(id); //해당하는 아이디의 회원정보 리턴
	
	%>

	<div align="center">
		<h2>회원 정보 보기</h2>

		<table width="400" border="1">

			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td width="250"><%=mbean.getId() %></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">이메일</td>
				<td width="250"><%=mbean.getEmail() %></td>
			</tr>

			<tr height="50">
				<td align="center" width="150">전화</td>
				<td width="250"><%=mbean.getTel() %></td>
			</tr>

			<tr height="50">
				<td align="center" colspan="2">
					<button
						onclick="location.href='MemberUpdateForm.jsp?id=<%=mbean.getId()%>'">수정</button>
					<button
						onclick="location.href='MemberDeleteForm.jsp?id=<%=mbean.getId()%>'">삭제</button>
					<button onclick="location.href='MemberList.jsp'">목록</button>
					<button onclick="location.href='MemberJoin.jsp'">회원가입</button>
				</td>
			</tr>





		</table>
	</div>

</body>
</html>