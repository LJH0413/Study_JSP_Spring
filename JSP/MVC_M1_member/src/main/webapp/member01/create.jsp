<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB 연결 설정 --> 
<%@ include file = "dbconn_mysql.jsp" %>

<%
//Connection conn= null;
Statement st =null;
ResultSet rs =null;

// jdbc-odbc driver를 등록한다.

 
// 쿼리를 실행한다.
try {
   st = conn.createStatement();
   st.executeUpdate("create table woori(id char(10) primary key, name char(10))");
   }catch (SQLException e) {
    out.println(e);
  }
try {
   rs=st.executeQuery("select * from woori");
   ResultSetMetaData rsmd = rs.getMetaData();
   out.println("새로운 테이블이 생성되었습니다.<BR>");
   out.println(rsmd.getColumnCount()+"개의 컬럼(필드)을 가지고 있으며<BR>");
   out.println("첫번째 컬럼은 "+ rsmd.getColumnName(1)+"<BR>");
   out.println("두번째 컬럼은 "+ rsmd.getColumnName(2)+"<BR>");
   out.println("첫번째 컬럼은 "+ rsmd.getColumnName(3)+"<BR>");
   out.println("두번째 컬럼은 "+ rsmd.getColumnName(4)+"<BR>");
   rs.close();
   st.close();
   conn.close();
   }catch (SQLException e) {
    out.println(e);
  }
%>
<A href=main.htm>main으로</A>