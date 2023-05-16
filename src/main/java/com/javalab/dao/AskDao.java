package com.javalab.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.javalab.vo.AskVo;

public class AskDao {
	
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource dataSource;
	private static AskDao instance;

	// 기본 생성자에서 환경변수를 통한 데이터베이스 관련 DataSource얻어옴
	// Server / contex.xml에 Resource로 세팅해놓은 정보
	public AskDao() {
		System.out.println("여기는 AskDao 생성자");
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataSource = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	// 싱글톤 팬턴으로 생성
	public static AskDao getInstance() {
		if (instance == null)
			instance = new AskDao();
		return instance;
	}	

	// 회원 저장 메소드
	public void addAsk(AskVo ask) {
		StringBuffer sb = new StringBuffer();
		try {
			con = dataSource.getConnection();
			sb.append("INSERT INTO ASK(ASK_NO, ASK_NAME, ASK_TITLE, ASK_CONTENT, ASK_PHONE, ASK_EMAIL, ASK_DATE) ");
			sb.append("VALUES(ASK_NO_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?)");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, ask.getAsk_name());
			pstmt.setString(2, ask.getAsk_title());
			pstmt.setString(3, ask.getAsk_content());
			pstmt.setString(4, ask.getAsk_phone());
			pstmt.setString(5, ask.getAsk_email());
			pstmt.setString(6, ask.getAsk_date());
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			System.out.println("addAsk SQLException: " + e.getMessage());
		} finally {
			close();
		}
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
