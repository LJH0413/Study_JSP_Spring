<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB 연결 설정 --> 
<%@ include file = "dbconn_mysql.jsp" %>


<%
 Object mem_id = session.getAttribute("member_id"); 
 session.putValue(session.getId(), mem_id);
 String userid = (String)session.getValue(session.getId());
 if(userid == null)
  session.putValue(session.getId(), mem_id);
 
  //Connection con=null;
  Statement st=null;    
  String sql=null;

  try {
   st = conn.createStatement();
   sql = "delete from member  where userid= '" + userid + "'";
   st.executeUpdate(sql);
   conn.close();
   st.close();  
  } catch (SQLException e) {
   out.println(e);
  }
 %>
<jsp:forward page="right_Frame.htm" />