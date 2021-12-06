package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//오라클 데이터 베이스 연결 및 select, update, insert, delete 작성
public class MemberDAO {

	//mysql 접속
	String id = "root";
	String pass = "password";
	String url = "jdbc:mysql://localhost:3306/jdbc";
	//	String url = "jdbc:mysql://localhost:3306/jdbc?useUnicode=true&characterEncoding=UTF-8";


	Connection con; //db접근 설정

	PreparedStatement pstmt; //데이터베이스 쿼리 실행시켜주는 객체

	ResultSet rs; //데이터베이스 테이블의 결과를 리턴 해주는 

	//	------------------------------------------------	

	//dml문 작성
	public void getCon() {

		try {
//			Context initctx = new InitialContext();
//			
//			Context envctx = (Context)initctx.lookup("java:comp/env");
//			
//			DataSource ds =  (DataSource)envctx.lookup("jdbc/member");
//			
//			con =ds.getConnection();
			//1. 해당 데이터베이스 사용 선언(클래스를 등록)
			Class.forName("com.mysql.cj.jdbc.Driver");

			//2. 해당 데이터 베이스에 접속
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //getCon	

	//	------------------------------------------------

	//데이터 베이스에 한 사람의 회원 정보 저장 메소드
	public void insertMember(MemberBean mbean) {
		try {
			getCon();

			//접속 후 쿼리 준비하기
			String sql = "insert into member values(?,?,?,?)";

			//쿼리를 사용하기 설정
			pstmt = con.prepareStatement(sql);

			//? 에 맞게 데이터를 맵핑
			pstmt.setString(1, mbean.getId());
			pstmt.setString(2, mbean.getPass1());
			pstmt.setString(3, mbean.getEmail());
			pstmt.setString(4, mbean.getTel());

			//4. 쿼리 실행
			pstmt.executeUpdate(); // insert, update, delete 시 사용

			//5. 자원 반납
			con.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}//insertMember()

	//	------------------------------------------------

	//모든 회원의 정보를 리턴해주는 메소드 호출
	public Vector<MemberBean> allSelectMember() {

		//가변길이로 데이터 저장
		Vector<MemberBean> v = new Vector<>();

		try {
			getCon();

			//접속 후 쿼리 준비하기
			String sql = "select * from Member";

			//쿼리를 사용하기 설정
			pstmt = con.prepareStatement(sql);

			//결과 리턴
			rs = pstmt.executeQuery();

			//반복문으로 rs에 저장된 데이터 추출
			while(rs.next()) {
				MemberBean bean = new MemberBean();
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));

				//패키징 된 클래스 벡터에 저장
				v.add(bean); // 0번지부터 순서대로 저장됨
			}

			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		//저장된 vector 리턴
		return v;
	}//allselectMember()

	//	------------------------------------------------


	//한사람 정보 리턴 매서드
	public MemberBean oneSelectMember(String id) {

		//한사람에 대한 정보만 리턴하기
		MemberBean bean = new MemberBean();


		try {
			getCon();

			//쿼리 준비
			String sql = "select * from Member where id= ?";
			pstmt = con.prepareStatement(sql);

			//?값을 매칭
			pstmt.setString(1, id);
			//쿼리 실행 	
			rs = pstmt.executeQuery();

			if(rs.next()) { //레코드가 존재
				bean.setId(rs.getString(1));
				bean.setPass1(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setTel(rs.getString(4));
			}

			//자원반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bean;
	}//oneSelectMember 

	//	------------------------------------------------
	public String getPass1(String id){
		String pass="";
		try {
			getCon();
		 String SQL = "SELECT pass1 FROM MEMBER WHERE id= ?";
		 pstmt = con.prepareStatement(SQL);		 
		 pstmt.setString(1,id);
		 rs = pstmt.executeQuery();
		 
		 if(rs.next()){
			 pass=rs.getNString(1);	 
		 }
		 
		 con.close();
	    }catch(Exception e){
	    	e.printStackTrace();
	   	}	
		return pass;	
	}
	
//	------------------------------------------------
	public void updateMember(MemberBean bean) {

		getCon();
		try {
			
			//쿼리 준비
			String sql = "UPDATE MEMBER SET email=?,tel=? WHERE id=?";
			pstmt = con.prepareStatement(sql);
			//?값을 매칭
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getTel());
			pstmt.setString(3, bean.getId());
			//쿼리 실행 	
			pstmt.executeUpdate();
			
			//자원반납
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteMember(String id) {
		getCon();

		try {
		 String SQL = "DELETE FROM MEMBER WHERE id=?";
		 //������ ���� �����ִ� ��ü ���� 
		 pstmt = con.prepareStatement(SQL);		 
		 //?�� ���� ���� 
		 pstmt.setString(1,id);
		 //���� ���� 
		 pstmt.executeUpdate();
		 //�ڿ� �ݳ�
		 con.close();
	    }catch(Exception e){
	    	e.printStackTrace();
	   	}	
	}


}
