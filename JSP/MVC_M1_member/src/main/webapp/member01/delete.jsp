<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB 연결 설정 --> 
<%@ include file = "dbconn_mysql.jsp" %>

<%
String id = request.getParameter("id");
//Connection con=null;
Statement st=null;    
String sql=null;

// jdbc-odbc driver 등록
try {
   Class.forName("org.gjt.mm.mysql.Driver");
   } catch (ClassNotFoundException e){
     out.println(e.getMessage());
   }
// db와의 연결
try {
 
   // Statement 객체 생성
   st = conn.createStatement();
   sql = "delete from woori  where id= '" + id + "'";
   st.executeUpdate(sql);

   conn.close();
   st.close();  
   } catch (SQLException e) {
   }
 %>
<jsp:forward page="selectall.jsp" />