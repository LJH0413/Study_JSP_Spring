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
	<%@ 
	
	 include file = "dbconn_oracle.jsp" 	
	%>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		
		Statement stmt = null ; //Statement 객체 생성 : DB에 값을 생성, 수정, 삭제 검색
		
		try{
			String sql = "INSERT INTO Member (id, passwd, name) Values ('"+ 
			id +"','"+ passwd +"','"+ name +"')";
		
			stmt = conn.createStatement(); // connection 객체를 통해서 Statement 객체 생성 
			stmt.executeUpdate(sql);	// SQL 문을 실행 
					//stmt.executeQuery(sql) : sql <== Select 한 결과를 Resultset 객체로 반환
					//stmt.executeUpdate(sql) : sql <== insert, update, delete 문이 온다. 
					
			out.println("Member 테이블 삽입에 성공 했습니다. ");
			
		} catch (SQLException ex){
			out.println ("Member 테이블 삽입에 실패 했습니다");
			out.println ("SQLException : " + ex.getMessage());
			
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
	
	%>
	

	
	
	

</body>
</html>