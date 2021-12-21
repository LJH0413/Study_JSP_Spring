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

<%
	//변수 초기화
	Connection conn = null;
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";	// MSSQL 드라이버 
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myDB";
		//MSDB : 접속할 DB 명 
	
		
	Boolean connect = false;
	
	try{
		Class.forName (driver);	// 동적 로딩 : 작동될때 이름 확인
		conn = DriverManager.getConnection(url,"sa","1234");  //접속 서버<DB>,계정, 비밀번호
		connect=true;
		conn.close();
	} catch (Exception e){
		connect = false;
		e.printStackTrace();
	}
	
%>
<%
	if (connect == true){
		out.println("MSSQL DB에 잘 연결되었습니다. ");
	}else {
		out.println("MSSQL DB 연결에 실패 하였습니다. ");
	}

%>


</body>
</html>