<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_mysql.jsp" %>

<%
String id = request.getParameter("id");
//Connection con=null;
Statement st=null;    
String sql=null;

// jdbc-odbc driver ���
try {
   Class.forName("org.gjt.mm.mysql.Driver");
   } catch (ClassNotFoundException e){
     out.println(e.getMessage());
   }
// db���� ����
try {
 
   // Statement ��ü ����
   st = conn.createStatement();
   sql = "delete from woori  where id= '" + id + "'";
   st.executeUpdate(sql);

   conn.close();
   st.close();  
   } catch (SQLException e) {
   }
 %>
<jsp:forward page="selectall.jsp" />