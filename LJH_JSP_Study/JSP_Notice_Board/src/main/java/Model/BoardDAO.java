package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO{
	    ResultSet rs; //������ ���̽��� ���̺��� ����� ���� �޾� �ڹٿ� ������ �ִ� ��ü
	    Connection conn;//�����ͺ��̽��� �����Ҽ� �ֵ��� ���� 
	    PreparedStatement pstmt;//������ ���̽����� ������ ��������ִ� ��ü 

	 public void getcon() {
		  try {
		   String dbURL = "jdbc:oracle:thin:@192.168.40.124:1522:xe";
		   String dbID = "c##BBC";
		   String dbPassword = "1234";
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		  } catch (Exception e) {
		   e.printStackTrace();
		  }
	 }
	 
	 
	//�ϳ��� ���ο� �Խñ��� �Ѿ�ͼ� ����Ǵ� �޼ҵ�
	public void insertBoard(BoardBean bean){
		getcon();
		//�� Ŭ������ �Ѿ���� �ʾҴ� �����͵��� �ʱ�ȭ ���־�� �մϴ�.
		int ref = 0;// �� �׷��� �ǹ� = ������ ������� ����ū ref ���� �������� +1�� �����ָ� �ȴ� 
		int re_stop = 1;//�����̱⿡ = �θ� ���̱⿡
		int re_level = 1;
		try {
			//����ū ref���� �о���� ���� �غ� 
			String refSQL = "SELECT max(ref) FROM BOARD";
			//�������� ��ü 
			pstmt = conn.prepareStatement(refSQL);
			//������ ������ ����� ����
			 rs = pstmt.executeQuery();	
			if(rs.next()){//��� ���� �ִٸ�
				ref = rs.getInt(1)+1;//�ִ� ���� +1�� ���ؼ� �� �׷��� ����	
			}
			//������ �Խñ� ��ü���� ���̺� ���� 
			String SQL = "INSERT INTO BOARD VALUES(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt = conn.prepareStatement(SQL);
			//?�� ���� ����
			pstmt.setString(1, bean.getWrite());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_stop);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());		
			//������ �����Ͻÿ�
			pstmt.executeUpdate();	
			//�ڿ� �ݳ�
			conn.close();
			}catch(Exception e) {
				e.printStackTrace();	
			}	
	}
	
	
	//��� �Խñ��� ������ �ִ� ���ҽ�
	public Vector<BoardBean> getAllBoard(int start , int end){
		//������ ��ü ���� 
		Vector<BoardBean> v = new Vector<>();
		getcon();
		try {
			//���� �غ� 
			String SQL = "select * from (select A.* ,Rownum Rnum from (select *from board order by ref desc ,re_stop asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
			
			//�������� ��ü 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,start);
			pstmt.setInt(2,end);
			
			//������ ������ ����� ����
			rs = pstmt.executeQuery();	
			
			//������ ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� �����͸� ���� 
			while(rs.next()){
				 //�����͸� ��Ű¡(���� = BoardbeanŬ������ �̿�)����
				 BoardBean bean = new BoardBean();
				 bean.setNum(rs.getInt(1));
				 bean.setWrite(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setSubject(rs.getString(4));
				 bean.setPassword(rs.getString(5));
				 bean.setReg_date(rs.getDate(6).toString());
				 bean.setRef(rs.getInt(7));
				 bean.setRe_stop(rs.getInt(8));
				 bean.setRe_level(rs.getInt(9));
				 bean.setReadcount(rs.getInt(10));
				 bean.setContent(rs.getString(11));
				 
				 //��Ű¡�� �����͸� ���Ϳ� ���� 
				 v.add(bean);
			 }
			
			conn.close();
			
			}catch(Exception e) {
				e.printStackTrace();	
			}	
		
			return v;
	}
	
	//BoardInfo �ϳ��� �Խñ� �����ϴ� �޼ҵ�
	public BoardBean getOneBoard(int num){	
		//���� Ÿ�� ����
		BoardBean bean = new BoardBean();
		getcon();
		try {
			//��ȸ�� ���� ���� 
			String readsql = "update board set readcount = readcount+1 where num=?";
			pstmt = conn.prepareStatement(readsql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();	
			
			//�����غ�
			String SQL = "select * from board where num=?";
			//�������ఴü 
			//�������� ��ü 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,num);
			//���� ������ ����� ����
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				 bean.setNum(rs.getInt(1));
				 bean.setWrite(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setSubject(rs.getString(4));
				 bean.setPassword(rs.getString(5));
				 bean.setReg_date(rs.getDate(6).toString());
				 bean.setRef(rs.getInt(7));
				 bean.setRe_stop(rs.getInt(8));
				 bean.setRe_level(rs.getInt(9));
				 bean.setReadcount(rs.getInt(10));
				 bean.setContent(rs.getString(11));
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return bean;
	}
	
	//�亯���� ����Ǵ� �޼ҵ� 
	public void reWriteBoard(BoardBean bean){
		//�θ�� �׷�� �۷��� �� ������ �о�帲 
		int ref =bean.getRef();
		int re_stop = bean.getRe_stop();
		int re_level = bean.getRe_level();
		
		getcon();
		
		try {
			/////////////////////�ٽ� �ڵ� //////////////////////// 
				//�θ�� ���� ū re_level�� ���� ���� 1�� ���������� 
				String  levelsql = "update board set re_level=re_level+1 where ref=? and re_level > ?";
				//���� ���� ��ü ���� 
				pstmt = conn.prepareStatement(levelsql);
				pstmt.setInt(1 , ref);
				pstmt.setInt(2 , re_level);
				//���� ���� 
				pstmt.executeUpdate();
				//�亯�� �����͸� ����
				String sql ="insert into board values(board_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
				pstmt = conn.prepareStatement(sql);
				//?�� ���� ����
				pstmt.setString(1, bean.getWrite());
				pstmt.setString(2, bean.getEmail());
				pstmt.setString(3, bean.getSubject());
				pstmt.setString(4, bean.getPassword());
				pstmt.setInt(5, ref);//�θ��� ref ���� �־��� 
				pstmt.setInt(6, re_stop+1);//����̱⿡ �θ�� re_stop�� 1�� �־��� 
				pstmt.setInt(7, re_level + 1);
				pstmt.setString(8, bean.getContent());
				
				//������ �����Ͻÿ�
				pstmt.executeUpdate();	
				conn.close();
				
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//Boardupdate�� Delete�� �ϳ��� �Խñ��� ����
	public BoardBean getOneUpdateBoard(int num){	
		//���� Ÿ�� ����
		BoardBean bean = new BoardBean();
		getcon();
		try {
			//�����غ�
			String SQL = "select * from board where num=?";
			//�������ఴü 
			//�������� ��ü 
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,num);
			//���� ������ ����� ����
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				 bean.setNum(rs.getInt(1));
				 bean.setWrite(rs.getString(2));
				 bean.setEmail(rs.getString(3));
				 bean.setSubject(rs.getString(4));
				 bean.setPassword(rs.getString(5));
				 bean.setReg_date(rs.getDate(6).toString());
				 bean.setRef(rs.getInt(7));
				 bean.setRe_stop(rs.getInt(8));
				 bean.setRe_level(rs.getInt(9));
				 bean.setReadcount(rs.getInt(10));
				 bean.setContent(rs.getString(11));
			}
			
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		return bean;
	}
	
	//update �� delete�� �ʿ��� �н����� ���� ������ �ִ� �޼ҵ�
	public String getPass(int num) {
		//������ ���� ��ü ���� 
		String pass = "";
		getcon();
		
		try {		
			//���� �غ� 
			String sql = "select password from board where num=?";
			
			//���� ������ ��ü ����
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			
			//���� ������ ����� ����
			rs= pstmt.executeQuery();
			
			//�н����� ���� ����
			if(rs.next()) {
				pass = rs.getString(1);	
			}
			
			//�ڿ� �ݳ�
			conn.close();
				
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return pass;
	}
	
	//�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
	public void updateBoard(BoardBean bean){
		getcon();
		
		try {		
			//���� �غ� 
			String sql = "update board set subject=? , content= ? where num = ?";
			
			//���� ������ ��ü ����
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,bean.getSubject());
			pstmt.setString(2,bean.getContent());
			pstmt.setInt(3,bean.getNum());
				
			//���� ������ ����� ����
			pstmt.executeUpdate();
			
			//�ڿ� �ݳ�
			conn.close();
				
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//�ϳ��� �Խñ��� �����ϴ� �żҵ�
	public void deleteBoard(int num) {
		getcon();
		
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
	
	
	public int getAllCount(){
		getcon();
		
		//�Խñ� ��ü���� �����ƴ� ���� 
		int count = 0;
		
		try {		
			//���� �غ� 
			String sql = "select count(*) from board";
			
			//���� ������ ��ü ����
			pstmt = conn.prepareStatement(sql);
			
			//���� ������ ����� ���� 
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			//�ڿ� �ݳ�
			conn.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
}