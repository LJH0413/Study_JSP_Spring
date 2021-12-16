<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL 사용 쿼리/title>
</head>
<body>

	<sql:setDataSource var="rs" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/mbTbl" user="root"
		password="password" />

	<!-- insert  -->

	<!-- update  -->
	<sql:update var="rs" dataSource="ds">
    update mdTbl set name='LJH' where idx='1'
    </sql:update>

	<!-- delete  -->
	<sql:query var="rs" dataSource="ds">
    delete from mbTbl where idx='2'
	</sql:query>
	
	<!-- select  -->
	<sql:query var="rs" dataSource="ds">
    select * from mbTbl
	</sql:query>





</body>
</html>