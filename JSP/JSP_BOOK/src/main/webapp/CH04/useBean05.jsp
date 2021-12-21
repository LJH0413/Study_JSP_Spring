<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id = "person" class = "ch04.com.dao.Person" scope = "request" />
	
		<jsp:setProperty property="id" name="person" value = "20211203"/>
		<jsp:setProperty property="name" name = "person" value= "김똘똘" />
		
	  아이디  :  <% out.println (person.getId()); %> <br> <br>
	  이름    : <%= person.getName() %>
	  
	  
	

</body>
</html>