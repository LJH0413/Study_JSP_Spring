
<%@ page import = "java.sql.*" %>

<%

	Connection conn = null;
	String driver = "com.mysql.jdbc.Driver";	
	String urll = "jdbc:mysql://localhost:3306/member?characterEncoding=UTF-8&serverTimezone=UTC&useSSL=false";
	
	Class.forName(driver);
	conn = DriverManager.getConnection (urll, "root", "password");

%>
