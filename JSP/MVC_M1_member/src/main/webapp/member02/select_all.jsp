<%@ page contentType="text/html; charset=EUC-KR" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_mysql.jsp" %>


<%
 //Connection con= null;
 Statement st =null;
 ResultSet rs =null;
 

 try {
  st = conn.createStatement();
  rs = st.executeQuery("select * from member order by userid");
%>
<html>
<head>
<title>�츮 ȸ�� ��������</title>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="StyleSheet" href="style.css" type="text/css">
<table width="500" border="1" bordercolorlight="#999999" bordercolordark="#FFFFFF" cellpadding="3" cellspacing="0" align="center" class=style2>
 <TH background="image/sky_bar.gif">����� ID</TH>
 <TH background="image/sky_bar.gif">�� ��</TH>
 <TH background="image/sky_bar.gif">�� ��</TH>
 <% if (!(rs.next()))  {%>
 <TR><TD colspan=4>��ϵ� ȸ���� �����ϴ�.</TD></TR>
 <%  } else {
   do {
    out.println("<TR>");
    out.println("<TD align='center'>" + rs.getString("userid") + "</TD>");
    out.println("<TD align='center'>" + rs.getString("username") + "</TD>");
    out.println("<TD> " + rs.getString("address1"));
    out.println(rs.getString("address2")+"</TD>");          
    out.println("</TR>");
   }while(rs.next());
  }
  rs.close();
  st.close();
  conn.close();
 } catch (SQLException e) {
  System.out.println(e);
 }
%>
</TABLE>
</CENTER> 
</BODY>
</HTML>