<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 

<!-- DB ���� ���� --> 
<%@ include file = "dbconn_mysql.jsp" %>

<%
String id = request.getParameter("id");
String password = request.getParameter("password").trim();
String sql="select * from woori where id=?" ;
//Connection con=null;
PreparedStatement pst=null;    
ResultSet rs=null;

try {
    pst = conn.prepareStatement(sql);
    pst.setString(1,id);

    // sql ���Ǿ �����ϰ�, ResultSet �� ���Ѵ�
    rs = pst.executeQuery();  
         
    if (!(rs.next())) {%>
      �ش�Ǵ� ȸ���� �����ϴ�.
    <% } else 
         {
         if (password.equals(rs.getString("password"))) { %>
           ����� ID�� <%= id %> �� ȸ���� ������ ������ �����ϴ�. 
           ������ �����Ϸ��� ������ �Է��� ���� <�����ϱ�>��ư�� ��������.
           <FORM  name=form1 method=post action=update.jsp> 
           <INPUT type=hidden name=id value="<%=id%>">  
           <BR> �̸�   : 
           <INPUT type=text name=name value="<%=rs.getString("name")%>">
           <BR>E-mail   :  
           <INPUT type=text name=email value="<%=rs.getString("email")%>">
           <INPUT type=submit  name=change value="�����ϱ�" >
           <A href="delete.jsp?id=<%=id%>"> �����ϱ� </A>
           </FORM>
    
         <% } else {  %>
           ��й�ȣ�� Ʋ���ϴ�.
         <% } 
         }
     rs.close();
     conn.close();
     pst.close();
     } catch (SQLException e) {
       out.println(e);
     }
%>
<A href="main.htm"> �������� </A>&nbsp;
<A href="select.htm"> ��ȸ�������� </A>