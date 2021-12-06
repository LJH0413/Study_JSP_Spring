<%@page import="model.MemberBean"%>
<%@page import="java.util.Vector"%>
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

	<!-- 1. 데이터 가져오기   -->

	<%
		MemberDAO mdao = new MemberDAO();
	
		/* //회원들의 정보가 얼마나 저장되어 있는지 모름 -> vector 사용 */
		Vector<MemberBean> vec = mdao.allSelectMember(); 
		
	%>

	<div align="center">

		<table width="800" border="1">
			<tr height="50">
				<td align="center" width="150">아이디</td>
				<td align="center" width="150">이메일</td>
				<td align="center" width="150">전화번호</td>
			</tr>

			<%
					for(int i=0; i<vec.size(); i++) {
						MemberBean bean = vec.get(i);					 	
				%>

			<tr height="50">
				<td align="center" width="150"><a
					href="MemberInfo.jsp?id=<%=bean.getId()%>"> <%=bean.getId() %></a></td>
				<td align="center" width="150"><%=bean.getEmail() %></td>
				<td align="center" width="150"><%=bean.getTel() %></td>
			</tr>
			<%} %>

		</table>
	</div>

</body>
</html>