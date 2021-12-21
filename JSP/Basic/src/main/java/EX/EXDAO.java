package EX;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EXDAO {

	//db 아이디
	String id = "root";
	//db 패스워드
	String pass = "password";
	//주소
	String url = "jdbc:mysql://localhost:3306/mbTbl";

	//db접근 설정
	Connection con;

	//쿼리 실행
	PreparedStatement pstmt;

	//테이블 결과 리턴
	ResultSet rs;

	//----------database connection method-----------//
	public void getCon() {

		try {
			//1. 해당 데이터베이스 사용 선언(클래스를 등록)
			Class.forName("com.mysql.cj.jdbc.Driver");

			//2. 해당 데이터 베이스에 접속
			con = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //getCon	

	//----------insert method-----------//
	public void insertMethod(EXBean eb) {
		//db connection
		getCon();

		try {
			//쿼리문
			String SQL = "INSERT INTO mbTbl VALUES(?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(SQL);

			//쿼리 맵핑
			pstmt.setInt(1, eb.getIdx());
			pstmt.setString(2, eb.getId());
			pstmt.setString(3, eb.getPass());
			pstmt.setString(4, eb.getEmail());
			pstmt.setString(5, eb.getCity());
			pstmt.setString(6, eb.getPhone());
			
			pstmt.executeUpdate();

			//자원 반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	//----------Update method-----------//
	public void updateMethod(EXBean eb) {
		//db connection
		getCon();

		try {
			//쿼리문
			String SQL = "UPDATE SET mbTbl where idx = ?";
			pstmt = con.prepareStatement(SQL);

			//쿼리 맵핑
			pstmt.setInt(1, eb.getIdx());
			
			pstmt.executeUpdate();

			//자원 반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	//----------delete method-----------//
	public void deleteMethod(EXBean eb) {
		//db connection
		getCon();

		try {
			//쿼리문
			String SQL = "delete from mbTbl where idx = ?";
			pstmt = con.prepareStatement(SQL);

			//쿼리 맵핑
			pstmt.setInt(1, eb.getIdx());
			
			pstmt.executeUpdate();

			//자원 반납
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//----------select method-----------//
		public void selectMethod(EXBean eb) {
			//db connection
			getCon();

			try {
				//쿼리문
				String SQL = "select * from mbTbl";
				//or
				//String SQL = "Select * from mbTbl where = ?";
				// pstmt.set (1. get () )
				pstmt = con.prepareStatement(SQL);

				//쿼리 맵핑
				pstmt.setInt(1, eb.getIdx());
				
				pstmt.executeUpdate();

				//자원 반납
				con.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}



}
