<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page language="java" import="java.sql.*" %> 
<% request.setCharacterEncoding("euc-kr"); %>

<!-- DB 연결 설정 --> 
<%@ include file = "dbconn_mysql.jsp" %>

<%
String id = request.getParameter("id");
int password = Integer.parseInt(request.getParameter("password"));
String name=request.getParameter("name"); 
String email = request.getParameter("email");
String sql=null;
//Connection conn=null;
Statement st=null; 
ResultSet rs =null;
int cnt=0; 
// jdbc-odbc driver 등록
try {
     Class.forName("org.gjt.mm.mysql.Driver");
    } catch (ClassNotFoundException e){
     out.println(e.getMessage());
    }

// db와의 연결
try {
    
     st=conn.createStatement();
     rs = st.executeQuery("select * from woori where id= '"+ id + "'");
   
     if (!(rs.next())) {
         // Statement 객체 생성
         
          sql="insert into woori(id,password,name,email)";
          sql=sql + " values('"+ id +"',"+ password +"," ;
          sql=sql + "'"+ name +"','"+ email +"')";
      
          // insert 문을 이용하여 데이터를 추가 시킨다.
          cnt = st.executeUpdate(sql); 
          if (cnt >0) 
             out.println("데이터가 성공적으로 입력되었습니다.") ;
          else  
             out.println("데이터가 입력되지 않았습니다. ");
       
      } else 
          out.println("id가 이미 등록되어 있습니다.");
           
     st.close();
     conn.close();
     } catch (SQLException e) {
       out.println(e.getMessage());   
     }
%>
[<A href="main.htm">main으로</A>] 
&nbsp;[<A href="insert.htm">회원 등록 페이지로</A>]