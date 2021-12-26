package com.springbook.biz.board.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import com.springbook.biz.board.BoardVO;
import com.springbook.biz.common.JDBCUtil;

//DAO (data access object
@Repository
public class BoardDAOSpring extends JdbcDaoSupport {

	//jdbc 관련 변수 = 커낵션 초기화
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;

	/*--------------------------------------------------------------------------------------------------------*/

	//sql 명령어
	private final String BOARD_INSERT = 
			"insert into board(seq, title, writer, content) values((select nvl(max(seq), 0)+1 from board), ?, ?, ?)";

	private final String BOARD_UPDATE = 
			"update board set title = ?, content = ?, where seq = ?";

	private final String BOARD_DELETE =
			"delete board where seq = ?";

	private final String BOARD_GET = 
			"select * from board where seq = ?";

	private final String BOARD_LIST = 
			"select * from board order by seq desc";

	/*--------------------------------------------------------------------------------------------------------*/
	
	@Autowired
	private JdbcTemplate jdbcTemplate;

	//crud (create read update delete)
	// 글 등록	
	public void inserBoard(BoardVO vo) {
		System.out.println("===> Spring JDBC process insertBoard() ");
		jdbcTemplate.update(BOARD_INSERT, vo.getTitle(), vo.getContent(), vo.getSeq());
		
//		System.out.println("===> JDBC process insertBoard() ");
//		try {
//			//db 커넥션			
//			conn = JDBCUtil.getConnection();
//			stmt = conn.prepareStatement(BOARD_INSERT);
//			stmt.setString(1, vo.getTitle());
//			stmt.setString(2, vo.getWriter());
//			stmt.setString(3, vo.getContent());
//
//			//쿼리 저장 (update delete insert ) 필요
//			stmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			//쿼리 종료
//			JDBCUtil.close(stmt, conn);
//		}
		
	}

	/*--------------------------------------------------------------------------------------------------------*/

	//글 수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Spring JDBC process updateBoard() ");
		jdbcTemplate.update(BOARD_UPDATE, vo.getTitle(), vo.getContent(), vo.getSeq());
//		System.out.println("===> JDBC updateBoard()");
//
//		try {
//			conn = JDBCUtil.getConnection();
//
//			stmt = conn.prepareStatement(BOARD_UPDATE);
//			stmt.setString(1, vo.getTitle());
//			stmt.setString(2, vo.getContent());
//			stmt.setInt(3, vo.getSeq());
//
//			stmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(stmt, conn);
//
//		}
	}

	/*--------------------------------------------------------------------------------------------------------*/

	//글 삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Spring JDBC process deleteBoard() ");
		jdbcTemplate.update(BOARD_DELETE, vo.getSeq());
		
//		System.out.println("===> JDBC deleteBoard()");
//
//		try {
//			conn = JDBCUtil.getConnection();
//
//			stmt = conn.prepareStatement(BOARD_DELETE);
//			stmt.setInt(1, vo.getSeq());
//
//			stmt.executeUpdate();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(stmt, conn);
//		}
	}

	/*--------------------------------------------------------------------------------------------------------*/

	//글 상세 조회

	public BoardVO getBoard(BoardVO vo) {
		
		System.out.println("===> Spring JDBC process getBoard() ");
		Object[] args = {vo.getSeq()};
		return jdbcTemplate.queryForObject(BOARD_GET, args, new BoardRowMapper());

//		System.out.println("===> JDBC getBoard()");
//
//		BoardVO board = null;
//
//		try {
//			conn = JDBCUtil.getConnection();
//
//			stmt = conn.prepareStatement(BOARD_GET);
//
//			stmt.setInt(1, vo.getSeq());
//
//			if(rs.next()) {
//				board = new BoardVO();
//				board.setSeq(rs.getInt("SEQ"));
//				board.setTitle(rs.getString("TITLE"));
//				board.setWriter(rs.getString("WRITER"));
//				board.setContent(rs.getString("CONTENT"));
//				board.setRegDate(rs.getDate("REGDATE"));
//				board.setCnt(rs.getInt("CNT"));
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(rs, stmt, conn);
//		}
//		return board;
	}
	
	/*--------------------------------------------------------------------------------------------------------*/
	
	// 글 목록 조회
	public List<BoardVO> getBoardList(BoardVO vo) {
		
		System.out.println("===> Spring JDBC process getBoardList() ");
		return jdbcTemplate.query(BOARD_LIST, new BoardRowMapper());
	}
		
//		System.out.println("===> JDBC getBoard()");
//		List<BoardVO> boardList = new ArrayList<BoardVO>();
//		
//		try {
//			conn = JDBCUtil.getConnection();
//			
//			stmt = conn.prepareStatement(BOARD_LIST);
//			
//			rs = stmt.executeQuery();
//			
//			while(rs.next()) {
//				//객체 생성
//				BoardVO board = new BoardVO();
//				board.setSeq(rs.getInt("SEQ"));
//				board.setTitle(rs.getString("TITLE"));
//				board.setWriter(rs.getString("WRITER"));
//				board.setContent(rs.getString("CONTENT"));
//				board.setRegDate(rs.getDate("REGDATE"));
//				board.setCnt(rs.getInt("CNT"));
//				boardList.add(board);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			JDBCUtil.close(stmt, conn);
//		}
//		return boardList;
//		
//	}
}

class BoardRowMapper implements RowMapper<BoardVO> {
	
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException	{
		BoardVO board = new BoardVO();
		board.setSeq(rs.getInt("SEQ"));
		board.setTitle(rs.getString("TITLE"));
		board.setWriter(rs.getString("WRITER"));
		board.setContent(rs.getString("CONTENT"));
		board.setRegDate(rs.getDate("REGDATE"));
		board.setCnt(rs.getInt("CNT"));
		return board;
		
	}
	
}