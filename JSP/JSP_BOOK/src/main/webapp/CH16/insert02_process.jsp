<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file = "dbconn_mysql.jsp" %>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		PreparedStatement pstmt = null ; 
		
	try{
		String sql = "insert into member (id, passwd, name) values (?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, passwd);
		pstmt.setString(3, name);
		
		pstmt.executeUpdate();	// insert, update, delete 문을 실행 
			//pstmt.excuteQuery(); // select 문을 실행해서 ResultSet 객체로 반환 
		out.println ( "Member 테이블 삽입에 성공 했습니다. ");
			
	} catch (SQLException ex) {
		out.println ("Member 테이블 삽입에 실패 했습니다. ");
		out.println ("SQLException : " + ex.getMessage());
		
	}finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
	
	%>
	

</body>
</html>