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

<!-- 데이터 한번에 받아오는 빈클래스 -->
<jsp:useBean id="boardbean" class="Model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%
	BoardDAO bdao = new BoardDAO();
	bdao.reWriteBoard(boardbean);
	
	//답변 데이터를 모두 저장 전체 게시글 보기
	response.sendRedirect("BoardList.jsp");
%>

</body>
</html>