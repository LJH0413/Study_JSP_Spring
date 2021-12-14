package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class BoardDAO {
	
	String id = "root";
	String pass = "password";
	String url = "jdbc:mysql://localhost:3306/jdbc";
	
	Connection conn; //db접근 설정

	//PreparedStatement pstmt; //데이터베이스 쿼리 실행시켜주는 객체

	ResultSet rs; //데이터베이스 테이블의 결과를 리턴 해주는 
	
	
//	---------------커넥션 메소드 -----------------
	
	public void getCon() {

		try {
			//1. 해당 데이터베이스 사용 선언(클래스를 등록)
			Class.forName("com.mysql.cj.jdbc.Driver");

			//2. 해당 데이터 베이스에 접속
			conn = DriverManager.getConnection(url, id, pass);
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //getCon	
	
	
//	---------------게시판 입력 메소드 -----------------
	
	public void insertBoard(BoardBean bean){
		getCon();
		int ref = 0;
		int re_step = 1;
		int re_level = 1;
		try {
			String refSQL = "SELECT max(ref) FROM BOARD";
			pstmt = conn.prepareStatement(refSQL);
			 rs = pstmt.executeQuery();
			if(rs.next()){
				ref = rs.getInt(1)+1;
			}
			String SQL = "INSERT INTO BOARD VALUES(?,?,?,?,?,now(),?,?,?,0,?)";
			pstmt = conn.prepareStatement(SQL);

			pstmt.setLong(1, bean.getNum());
			pstmt.setString(2, bean.getWrite());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getSubject());
			pstmt.setString(5, bean.getPassword());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, bean.getContent());		
			pstmt.executeUpdate();
			conn.close();
			}catch(Exception e) {
				e.printStackTrace();	
			}	
	}
	
//	---------------모든 게시물 보기 메소드 -----------------
	
	public Vector<BoardBean> getAllBoard(int start, int end){
		//리턴 객체
		Vector<BoardBean> v = new Vector<>();
		
		getCon();
		
		try {
			//쿼리준비
			String sql =
					"select * from (select A.*, num as Rnum from (select * from board order by ref desc ,re_step asc)A)B where Rnum >= ? and Rnum <= ?";;
			//퀴리 실행 객체
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			//쿼리 실행 후 결과 저장
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean bean = new BoardBean();
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				
				v.add(bean);
			}
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	
//	---------------하나의 게시물 보기 메소드 -----------------
	
	//하나의 게시글 리턴
	public BoardBean getOneBoard(int num) {
		//리턴타입 선언
		BoardBean bean = new BoardBean();
		
		getCon();
		
		try {
			//게시글 조회수 증가
			String readsql = "update board set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			
			//쿼리준비
			String sql = "select * from board where num=?";
			//?값 매칭
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			//쿼리 실행후 결과 리턴
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
//	------------- 댓글 기능 메소드 -----------------
	
	public void reWriteBoard(BoardBean bean) {
		//부모 글 그룹과 글레벨 글스텝을 읽어드림
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		
		getCon();
		
		try {
			//핵심코드//
			
			//부모글보다 큰 re_level의 값을 1씩 증가
			String levelsql = "update board set re_level = re_level+1 where ref=? and re_level > ?";
			pstmt = conn.prepareStatement(levelsql);
			
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			
			pstmt.executeUpdate();
			
			//답변글 데이터를 저장
			String SQL = "INSERT INTO BOARD VALUES(?,?,?,?,?,now(),?,?,?,0,?)";
			
			pstmt = conn.prepareStatement(SQL);

			pstmt.setLong(1, bean.getNum());
			pstmt.setString(2, bean.getWrite());
			pstmt.setString(3, bean.getEmail());
			pstmt.setString(4, bean.getSubject());
			pstmt.setString(5, bean.getPassword());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step+1); //답글이기에 부모글에 1더하기
			pstmt.setInt(8, re_level+1); // 답글에 +1	
			pstmt.setString(9, bean.getContent());	
		
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

//	---------------하나 수정  메소드 -----------------
	public BoardBean getOneUpdateBoard(int num)	{
		//리턴 객체 생성
		BoardBean bean = new BoardBean();
		
		getCon();
		
		try {
			String sql = "select * from board where num= ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWrite(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}
			
			conn.close();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}
	
//	---------------비밀번호 가져오기  메소드 -----------------
	public String getPass(int num) {
		String pass = "";
		getCon();
		
		try {
			String sql = "select password from board where num=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass = rs.getString(1);
			}
			
			conn.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pass;
	}
	
//	---------------비밀번호 가져오기  메소드 -----------------
	public void updateBoard(BoardBean bean) {
		getCon();

		try {		
			String sql = "update board set subject=? , content= ? where num = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,bean.getSubject());
			pstmt.setString(2,bean.getContent());
			pstmt.setInt(3,bean.getNum());

			pstmt.executeUpdate();

			conn.close();

		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
//	---------------삭제 메소드 -----------------
	public void deleteBoard(int num) {
		getCon();
		
		try {		
			//���� �غ� 
			String sql = "delete from board where num=?";
			
			//���� ������ ��ü ����
			pstmt = conn.prepareStatement(sql);
			//?
			pstmt.setInt(1,num);
			
			//���� ����
			pstmt.executeUpdate();
			
			//�ڿ� �ݳ�
			conn.close();
				
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}
	
//	--------------- 페이지 카운트 메소드 -----------------
	public int getAllCount(){
		getCon();
		
		int count = 0;
		
		try {		
			String sql = "select count(*) from board";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	
	

}
