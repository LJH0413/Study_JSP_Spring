<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<HTML>
<HEAD><TITLE>�� �����ϱ�</TITLE>
<link href="filegb.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_mysql.jsp" %>


[<a href="databoard_list.jsp?go=<%=request.getParameter("page")%>"> �Խ��� ������� </a>]
<%
 String sql=null;
 //Connection con= null;
 PreparedStatement st =null;
 ResultSet rs =null;
 int cnt=0;

 int id = Integer.parseInt(request.getParameter("id"));

 
 try {
  sql = "select * from databoard where id=? ";
  st = conn.prepareStatement(sql);
  st.setInt(1, id);
 
  rs = st.executeQuery();
 
  if (!(rs.next()))  {
   out.println("�ش� ������ �����ϴ�");
  } else {
   String pwd= rs.getString("password"); 
   if (pwd.equals(request.getParameter("password"))) {
    sql = "delete from databoard where id=?";
    st = conn.prepareStatement(sql);
    st.setInt(1, id);
    cnt = st.executeUpdate(); 
    if (cnt >0) 
     out.println("���������� �����Ǿ����ϴ�.");
    else 
     out.println("�������� �ʾҽ��ϴ�.");
   } else {
    out.println("��й�ȣ�� Ʋ���ϴ�.");
   }
  } 
  rs.close();
  st.close();
  conn.close();
 } catch (SQLException e) {
  out.println(e);
 } 
%>
</BODY>
</HTML>