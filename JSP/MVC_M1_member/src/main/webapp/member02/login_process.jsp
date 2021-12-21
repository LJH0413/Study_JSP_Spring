<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*,java.io.*,java.text.*,java.net.*,java.util.*"%>

<!-- DB 연결 설정 --> 
<%@ include file = "dbconn_mysql.jsp" %>


<%
 String userid   = request.getParameter("userid");
 String password = request.getParameter("password");
 //Connection conn = null;
 Statement  stmt = null;
 ResultSet  rs   = null;
 String query    = new String();
 String name	    = new String();
 
  
try {
 stmt = conn.createStatement();
} catch(SQLException e) {
 out.println(e);
}

boolean bLogin = false;
try{
 query = "select * from member where userid = '"+userid+"'";
 query = query + " and password = '"+password+"'";
 rs = stmt.executeQuery(query);
 if(rs.next()){
  name   = rs.getString("username");
  bLogin = true;
 }else{
  bLogin = false;
 }
 rs.close();
} catch(SQLException e) {
 out.println(e);
} finally {
 conn.close();
}
if (bLogin){
 session.setAttribute("member_id",userid); 
 session.setAttribute("member_name",name); 
 response.sendRedirect("left_Frame.jsp");
}else{
 out.println("<script>alert('아이디와 비밀번호를 확인하세요');history.back();</script>");
}
%>