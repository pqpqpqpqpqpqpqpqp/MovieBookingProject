package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import model.vo.MemberVO;

import javax.naming.Context;
import javax.naming.InitialContext;

public class MemberDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public MemberDAO() {
			
		try {
			
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void conClose() {
		try {if(rs != null) rs.close(); }catch(Exception e) {}
		try {if(pstmt != null) pstmt.close(); }catch(Exception e) {}
		try {if(conn != null) conn.close(); }catch(Exception e) {}
	}
	
	public int regiset(MemberVO memberVO) {

		try {

			String input = "INSERT INTO USER (USER_NAME, USER_TEL, USER_ID, USER_PW, USER_NUM, USER_NICKNAME) VALUES (?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(input);
			pstmt.setString(1, memberVO.getUserName());
			pstmt.setString(2, memberVO.getUserTel());
			pstmt.setString(3, memberVO.getUserId());
			pstmt.setString(4, memberVO.getUserPw());
			pstmt.setString(5, memberVO.getUserNum());
			pstmt.setString(6, memberVO.getUserNickname());
			
			
			int result = pstmt.executeUpdate();

			if (result > 0) {
				// 회원가입 성공
				return 1;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			conClose();
		}

		return 0;
	}
	
	public int idCheck(String inputId) {
		
		try {

			String input = "SELECT COUNT(*) AS CNT FROM USER WHERE USER_ID = ?";
			
			pstmt = conn.prepareStatement(input);
			pstmt.setString(1, inputId);
			
			
			rs = pstmt.executeQuery();
			

			// 결과값은 1개만 있으므로, if만 있어도 가능
			if (rs.next()) {
				
				int idCheck = rs.getInt("CNT");
				
				if(idCheck == 1) {
					return 1;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			conClose();
		}
		
		return 0;
	}
	

}
