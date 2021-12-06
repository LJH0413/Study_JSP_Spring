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
	request.setCharacterEncoding("utf-8");
	%>

	<!-- 데이터를 한번에 받아오는 빈 클래스 -->
	<jsp:useBean id="boardbean" class="Model.BoardBean">
		<jsp:setProperty name="boardbean" property="*" />
	</jsp:useBean>

	<%
	BoardDAO bdao = new BoardDAO();

	//해당 게시글의 패스워드 값 가져옴
	String pass = bdao.getPass(boardbean.getNum());

	//기존 값과 update에 작성한 값 비교
	if (pass.equals(boardbean.getPassword())) {
		bdao.updateBoard(boardbean);

		//수정이 완료되면 전체 글보기
		response.sendRedirect("BoardList.jsp");
	} else {
	%>
	<script type="text/javascript">
		alert("패스워드가 일치하지 않습니다. 다시 확인해주세요")
		history.go(-1);
	</script>
	<%
	}
	%>

</body>
</html>