package com.springbook.biz.user.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.springframework.stereotype.Repository;

import com.springbook.biz.common.JDBCUtil;
import com.springbook.biz.user.UserVO;

@Repository("userDAO")
public class UserDAO{

	//jdbc 관련 변수 = 커낵션 초기화
	private Connection conn = null;
	private PreparedStatement stmt = null;
	private ResultSet rs = null;
	
	/*--------------------------------------------------------------------------------------------------------*/
	
	//SQL 명령어
	private final String USER_GET = "select * from users where id = ? and password = ?";
	
	/*--------------------------------------------------------------------------------------------------------*/
	
	//crud 기능구현
	
	//회원 등록
	public UserVO getUser(UserVO vo) {
		
		UserVO user = null;
		
		try {
			System.out.println("===>JDBC getUser()");
			
			conn = JDBCUtil.getConnection();
			
			stmt = conn.prepareStatement(USER_GET);
			stmt.setString(1, vo.getId());
			stmt.setString(2, vo.getPassword());
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPassword(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setRole(rs.getString("ROLE"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(rs, stmt, conn);
		}
		return user;
	}



}