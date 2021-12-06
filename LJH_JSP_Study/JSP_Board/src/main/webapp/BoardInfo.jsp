<%@page import="Model.BoardBean"%>
<%@page import="Model.BoardDAO"%>
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
	int num = Integer.parseInt(request.getParameter("num").trim());
	
	System.out.println(request.getParameter("num"));
	
	
	//데이터베이스 접근
	BoardDAO bdao = new BoardDAO();
	
	//boardbean 타입으로 하나의 게시글 리턴
	BoardBean bean = bdao.getOneBoard(num);
	
	%>

	<div align="center">
		<h2>게시글 보기</h2>

		<table width="600" border="1">
			<tr height="40">
				<td align="center" width="120">글번호</td>
				<td align="center" width="180"><%=bean.getNum() %></td>
				<td align="center" width="100">조회수</td>
				<td align="center" width="180"><%=bean.getReadcount()%></td>
				<td align="center" width="120">이메일</td>
				<td align="center" width="180"><%=bean.getEmail()%></td>
			</tr>


			<tr height="40">
				<td align="center" width="120" colspan="1">제목</td>
				<td align="center" width="180" colspan="5"><%=bean.getSubject() %></td>
			</tr>

			<tr height="80">
				<td align="center" width="120">글내용</td>
				<td align="center" width="180" colspan="5"><%=bean.getContent() %></td>
			</tr>

			<tr height="40">
				<td align="center" colspan="6"><input type="button" value="댓글"
					onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum()%>&ref=<%=bean.getRef()%>&re_step=<%=bean.getRe_step()%>&re_level=<%=bean.getRe_level()%>'">
					<input type="button" value="수정"
					onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" value="삭제"
					onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum()%>'">
					<input type="button" value="목록"
					onclick="location.href='BoardList.jsp"></td>
			</tr>

		</table>
	</div>

</body>
</html>