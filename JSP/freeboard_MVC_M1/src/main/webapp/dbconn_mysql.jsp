
    
<%@ page import = "java.sql.*" %>

<%

	Connection con = null;
	String driver = "com.mysql.jdbc.Driver";	
	String url = "jdbc:mysql://localhost:3306/fboard?useUnicode=true&characterEncoding=UTF-8";

	
	Class.forName(driver);
	con = DriverManager.getConnection (url, "root", "password");

%>
