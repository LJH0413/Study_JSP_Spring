<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>

<!-- DB 연결 설정 --> 
<%@ include file = "dbconn_mysql.jsp" %>


<%
//Connection con= null;
Statement st =null;
ResultSet rs =null;
 
// 쿼리를 실행한다.
try {
   st = conn.createStatement();
   rs = st.executeQuery("select * from woori order by id");
%>

<HTML>
<BODY>
<CENTER> <H3>우리 회원 정보 보기</H3>
<TABLE border=1>
   <TR>
    <TH>사용자 ID</TH>
    <TH>이름</TH>
    <TH>E-mail</TH>
   </TR>
  <% if (!(rs.next()))  {%>

      <TR><TD colspan=4>등록된 회원이 없습니다.</TD></TR>

  <%  } else {
       do {
          out.println("<TR>");
          out.println("<TD>" + rs.getString("id") + "</TD>");
          out.println("<TD>" + rs.getString("name") + "</TD>");
          out.println("<TD>" + rs.getString("email") + "</TD>");
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
  [<A href="main.htm">main으로</A>]&nbsp;[<A href="insert.htm">회원 등록 페이지로</A>]
</CENTER> 
</BODY>
</HTML>