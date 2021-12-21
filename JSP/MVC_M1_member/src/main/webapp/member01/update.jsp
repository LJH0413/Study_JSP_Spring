<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page import="java.sql.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String email = request.getParameter("email");
                             
String sql=null;                              
Connection con=null;                              
Statement st=null;                                  
                             
// jdbc-odbc driver 등록                              
try {                              
     Class.forName("org.gjt.mm.mysql.Driver");             
     } catch (ClassNotFoundException e){                          
     out.println(e.getMessage());                              
     }                              
                             
// db와의 연결                              
try {                              
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/member?useUnicode=true&characterEncoding=euckr","root","multi");
    } catch (SQLException e) {                              
    out.println(e);                              
    }                              
try {                              
    st = con.createStatement();                              
                             
   // sql 질의어를 수행한다                              
    sql = "update woori set " ;                              
    sql = sql + "name ='" + name + "'," + "email ='" + email + "'" ;
    sql = sql + "  where id = '" + id + "'" ;                     
    st.executeUpdate(sql);                                
    con.close();                              
    st.close();                              
     } catch (SQLException e) {                              
       out.println(e);                              
     }                               
%>                              
<jsp:forward page="selectall.jsp" />