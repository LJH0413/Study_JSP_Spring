<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import = "java.util.Enumeration" %>  
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String name;
		String value;
		
		Enumeration en = session.getAttributeNames(); 	//세션 객체에 저장된 모든 변수를 반환 
		int i = 0 ; 
		while (en.hasMoreElements()){
			i++;
			name = en.nextElement().toString();	//변수명을 가져온다. (string형)
			value = session.getAttribute(name).toString(); // 변수에 할당된 값을 가져온다. ()
			
			out.println ( "설정한 세션의 속성이름 : [ " + i + " ]  : " + name + "<br>" );
			out.println ( "설정한 세션의 속성 값 : [ " + i + " ] : " + value + "<br>" );
			out.println ("======================================================= <br>");
			
		}
	
	%>

</body>
</html>