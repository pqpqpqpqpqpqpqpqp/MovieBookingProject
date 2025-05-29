package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import member.vo.MemberVO;
import member.vo.UserInfoVO;

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
	
	
	public MemberVO login(String userId) {
		MemberVO memberVO = null;
		try {
			
			String input = "SELECT USER_IDX, USER_PW, USER_DEL FROM USER WHERE USER_ID = ?";
			pstmt = conn.prepareStatement(input);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				memberVO = new MemberVO();
				memberVO.setUserIdx(rs.getInt("USER_IDX"));
				memberVO.setUserPw(rs.getString("USER_PW"));
				memberVO.setUserDel(rs.getString("USER_DEL"));

				return memberVO;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return memberVO;
		} finally {
			conClose();
		}
		memberVO = new MemberVO();
		memberVO.setUserPw("아이디를 못찾음");
		
		return memberVO;
	}
	
	public MemberVO myPageLoad(int userIdx) {
		MemberVO memberVO = null;
		try {
			
			String input = "SELECT USER_NAME, USER_ID, USER_NICKNAME, USER_IMG FROM USER WHERE USER_IDX = ?";
			pstmt = conn.prepareStatement(input);
			pstmt.setInt(1, userIdx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				memberVO = new MemberVO();
				
				memberVO.setUserName(rs.getString("USER_NAME"));
				memberVO.setUserId(rs.getString("USER_ID"));
				memberVO.setUserNickname(rs.getString("USER_NICKNAME"));
				memberVO.setUserImg(rs.getString("USER_IMG"));

				return memberVO;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return memberVO;
		} finally {
			conClose();
		}
		memberVO = new MemberVO();
		memberVO.setUserPw("아이디를 못찾음");
		
		return memberVO;
	}
	
	
	public UserInfoVO userInfoLoad(int userIdx) {
		UserInfoVO userInfoVO = null;
		try {
			
			String input = "SELECT \r\n"
			        + "  USER_NAME, \r\n"
			        + "  USER_NICKNAME, \r\n"
			        + "  USER_ID, \r\n"
			        + "  CASE \r\n"
			        + "    WHEN SUBSTR(USER_NUM, 8, 1) IN ('1', '2') THEN "
			        + "      CONCAT('19', SUBSTR(USER_NUM, 1, 2), '-', SUBSTR(USER_NUM, 3, 2), '-', SUBSTR(USER_NUM, 5, 2))\r\n"
			        + "    WHEN SUBSTR(USER_NUM, 8, 1) IN ('3', '4') THEN "
			        + "      CONCAT('20', SUBSTR(USER_NUM, 1, 2), '-', SUBSTR(USER_NUM, 3, 2), '-', SUBSTR(USER_NUM, 5, 2))\r\n"
			        + "    ELSE NULL \r\n"
			        + "  END AS BIRTHDAY, \r\n"
			        + "  USER_TEL, \r\n"
			        + "	 USER_PW \r\n"
			        + "FROM USER \r\n"
			        + "WHERE USER_IDX = ?";
			
			pstmt = conn.prepareStatement(input);
			pstmt.setInt(1, userIdx);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				userInfoVO = new UserInfoVO();
				
				userInfoVO.setUserName(rs.getString("USER_NAME"));
				userInfoVO.setUserNickname(rs.getString("USER_NICKNAME"));
				userInfoVO.setUserId(rs.getString("USER_ID"));
				userInfoVO.setBirthday(rs.getString("BIRTHDAY"));
				userInfoVO.setUserTel(rs.getString("USER_TEL"));
				userInfoVO.setUserPw(rs.getString("USER_PW"));
				return userInfoVO;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return userInfoVO;
		} finally {
			conClose();
		}
		
		return userInfoVO;
	}
	
	public int update(MemberVO memberVO) {

		try {

			String input = "UPDATE USER\r\n"
					+ "SET USER_NAME = ?, USER_NICKNAME = ?, USER_TEL = ?, USER_PW = ?\r\n"
					+ "WHERE USER_IDX = ?;";
			
			pstmt = conn.prepareStatement(input);
			pstmt.setString(1, memberVO.getUserName());
			pstmt.setString(2, memberVO.getUserNickname());
			pstmt.setString(3, memberVO.getUserTel());
			pstmt.setString(4, memberVO.getUserPw());
			pstmt.setInt(5, memberVO.getUserIdx());
			
			
			int result = pstmt.executeUpdate();

			if (result > 0) {
				// 수정 성공
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
	
	public int delete(int userIdx) {

		try {

			String input = "UPDATE USER SET USER_DEL = 'Y' WHERE USER_IDX = ?";
			
			pstmt = conn.prepareStatement(input);
			pstmt.setInt(1, userIdx);
			
			
			
			int result = pstmt.executeUpdate();

			if (result > 0) {
				// 수정 성공
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

}
