<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_mysql.jsp" %>

<%
//Connection conn= null;
Statement st =null;
ResultSet rs =null;
//String a=null;


 
// ������ �����Ѵ�.
try {
   st = conn.createStatement();
   st.executeUpdate("alter table woori modify name char(10) not null");
   st.executeUpdate("alter table woori add email char(30)");
   st.executeUpdate("alter table woori add password integer");

   }catch (SQLException e) {
    out.println(e);
}

try {
   rs=st.executeQuery("select * from woori");
   ResultSetMetaData rsmd = rs.getMetaData();
   out.println("���̺��� �����Ǿ����ϴ�.<BR>");
   out.println(rsmd.getColumnCount()+"���� �÷�(�ʵ�)�� ������ ������<BR>");
   for (int i=1;i <=rsmd.getColumnCount();i++) {
     out.println(i +"��° �÷��� "+ rsmd.getColumnName(i));
     out.println("�̰� ������ "+ rsmd.getColumnTypeName(i));
     out.println("�̸� ũ��� " + rsmd.getPrecision(i)+"<BR>");
  }
   rs.close();
   st.close();
   conn.close();
   }catch (SQLException e) {
    out.println(e);
}
%>
<A href=main.htm>main����</A>