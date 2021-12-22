<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page language="java" import="java.sql.*, java.text.*,java.util.*,java.io.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<% request.setCharacterEncoding("euc-kr"); %>

<!-- DB 연결 설정 --> 
<%@ include file = "dbconn_mysql.jsp" %>



<%

 String fileurl= "C:/eclipse-workspace/MVC_M_1/src/main/webapp/databoard/upload/"; 
 String saveFolder="upload";
 String encType="euc-kr";
 int Maxsize = 5*1024*1024; 
 ServletContext context = getServletContext();
 try{
  MultipartRequest multi = null;
 
  DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
  multi = new MultipartRequest(request,fileurl,Maxsize,encType,policy);
  String na = multi.getParameter("name");
  String em = multi.getParameter("email");
  String sub= multi.getParameter("subject"); 
  String cont = multi.getParameter("content");
  String pw = multi.getParameter("password");
 
  int id =1;
  int pos=0;
  if (cont.length()==1) {
   cont = cont+ " ";
  } else { 
   while ((pos=cont.indexOf("\'", pos)) != -1) {
    String left=cont.substring(0, pos);
    String right=cont.substring(pos, cont.length());
    cont = left + "\'" + right;
    pos += 2;
   }
  }
 
  java.util.Date yymmdd = new java.util.Date() ;
  SimpleDateFormat myformat = new SimpleDateFormat("yy-MM-d h:mm a");
 
  String ymd=myformat.format(yymmdd);
  String sql=null;
  //Connection conn=null;
  Statement st=null; 
  ResultSet rs=null;  
  int cnt=0; 
 
 
  try {

  st = conn.createStatement();
  sql = "select max(id) from databoard";
  rs = st.executeQuery(sql);
  if (!(rs.next())) {
   id=1;
  } else {
  id= rs.getInt(1) + 1 ;
  rs.close();
  }     
 
  Enumeration files = multi.getFileNames();
  String filename = "";
  String name = (String)files.nextElement();
  filename = (String)multi.getFilesystemName(name);
 
  File file = multi.getFile(name);
  if(filename!=null){
   String original = multi.getOriginalFileName(name);
   String type = multi.getContentType(name);
 
   sql = "insert into databoard(id,name,password,email,subject," +   
   "content,inputdate,masterid,readcount,replynum,step,filename,"+
   " filesize) values(" +id + ", '" +  na + "','" + pw + "','"+ em 
   + "','" + sub + "','" + cont + "','" + ymd + "'," +id+","  
   + "0,0,0,'"+filename+"',"+file.length()+")";
 
   } else 
    sql = "insert into databoard(id,name,password,email,subject," +   
    "content,inputdate,masterid,readcount,replynum,step,filename,"+
    " filesize) values(" +id + ", '" +  na + "','" + pw + "','"+ em 
    + "','" + sub + "','" + cont + "','" + ymd + "'," +id+","  
    + "0,0,0,'',0)";

   cnt = st.executeUpdate(sql); 
   if (cnt >0) {
    if(filename!=null) 
     out.println("데이터가 성공적으로 입력되었습니다.");
    else
     out.println("업로드된 파일은 없지만 글은 올렸습니다.");
   } else { 
    out.println("글을 올리지 못했습니다.");
   } 
   
   st.close();
   conn.close();

  } catch (SQLException e) {
   out.println(e);
  }
 } catch (IOException ioe) {
  out.println(ioe);
 }
%>
<A href="databoard_list.jsp">[게시판 목록으로]</A> &nbsp;
<A href="databoard_write.htm">[글 올리는 곳으로]</A>