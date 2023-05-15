package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.MemberVo;

public class MemberDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static MemberDao instance;

	
	private MemberDao() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			System.out.println("MemberDao() 생성자 에러 : " + e.getMessage());
		}
	}
	
	public static MemberDao getInstance() {
		if(instance == null) {
			instance = new MemberDao();
		}
		return instance;
	}
	
	
	// 회원 데이터에 ID와 PASSWORD가 일치하는 데이터가 있으면 데이터를 반환하는 함수
	public MemberVo getMember(MemberVo inputData) {
		MemberVo member = null;
		StringBuffer sb = new StringBuffer();
		
		String username = inputData.getUser_id();
		String password = inputData.getPassword();
		
		
		sb.append("SELECT * FROM TBL_MEMBER WHERE USER_ID = ? AND PASSWORD = ?");
		try {
			con = dataSource.getConnection();
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, username);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVo(
						rs.getString("user_id"), rs.getString("password"),
						rs.getString("name"), rs.getString("phone"), 
						rs.getString("email")
						);
			}
			
		} catch (SQLException e) {
			System.out.println("getMember SQLException : " + e.getMessage());
			
		} finally {
			close();
		}
		
		return member;
		
	}
	
	// DB 자원해제
		private void close()
		{
			try {
				if ( pstmt != null ){ 
					pstmt.close(); 
				}
				if ( con != null ){ 
					con.close(); 
				}
				if( rs != null ) {
					rs.close();
				}
			} catch (Exception e) {
				throw new RuntimeException(e.getMessage());
			}
		} // end close()	
}
