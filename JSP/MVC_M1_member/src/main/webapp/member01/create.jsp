<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_mysql.jsp" %>

<%
//Connection conn= null;
Statement st =null;
ResultSet rs =null;

// jdbc-odbc driver�� ����Ѵ�.

 
// ������ �����Ѵ�.
try {
   st = conn.createStatement();
   st.executeUpdate("create table woori(id char(10) primary key, name char(10))");
   }catch (SQLException e) {
    out.println(e);
  }
try {
   rs=st.executeQuery("select * from woori");
   ResultSetMetaData rsmd = rs.getMetaData();
   out.println("���ο� ���̺��� �����Ǿ����ϴ�.<BR>");
   out.println(rsmd.getColumnCount()+"���� �÷�(�ʵ�)�� ������ ������<BR>");
   out.println("ù��° �÷��� "+ rsmd.getColumnName(1)+"<BR>");
   out.println("�ι�° �÷��� "+ rsmd.getColumnName(2)+"<BR>");
   out.println("ù��° �÷��� "+ rsmd.getColumnName(3)+"<BR>");
   out.println("�ι�° �÷��� "+ rsmd.getColumnName(4)+"<BR>");
   rs.close();
   st.close();
   conn.close();
   }catch (SQLException e) {
    out.println(e);
  }
%>
<A href=main.htm>main����</A>