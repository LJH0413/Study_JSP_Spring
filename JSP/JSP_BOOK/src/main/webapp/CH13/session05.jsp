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
	<h4> =========/세션 삭제 전/=================</h4>
	<%
		String name;
		String value;
		Enumeration en = session.getAttributeNames();
		int i = 0;
		while (en.hasMoreElements()){
			i++;
			name = en.nextElement().toString();
			value = session.getAttribute(name).toString();
			out.println ("설정된 세션 이름 [ " + i + " ] : " + name + "<br>");
			out.println ( "설정된 세션 값 [ " + i + " ] : " + value + "<br>");
			out.println ( "============================================== <br>");			
		}
	
		session.removeAttribute("userID");
		
	%>
	
	
	<h4> =========/세션 삭제 후/=================</h4>
	
	<%
	 en = session.getAttributeNames();
	 i = 0;
	while (en.hasMoreElements()){
		i++;
		name = en.nextElement().toString();
		value = session.getAttribute(name).toString();
		out.println ("설정된 세션 이름 [ " + i + " ] : " + name + "<br>");
		out.println ( "설정된 세션 값 [ " + i + " ] : " + value + "<br>");
		out.println ( "============================================== <br>");			
	}
	
	
	%>

</body>
</html>