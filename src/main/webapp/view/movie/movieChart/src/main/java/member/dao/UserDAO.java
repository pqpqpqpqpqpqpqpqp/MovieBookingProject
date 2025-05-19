package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import member.vo.UserVO;

public class UserDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public UserDAO() {

		try {

			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void conClose() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
		try {
			if (pstmt != null)
				pstmt.close();
		} catch (Exception e) {
		}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	// 회원가입
	public int regiset(UserVO userVO) {

		try {

			String input = "INSERT INTO member (user_id, nickname, password) VALUES (?,?,?)";
			pstmt = conn.prepareStatement(input);
			pstmt.setString(1, userVO.getUserId());
			pstmt.setString(2, userVO.getNickname());
			pstmt.setString(3, userVO.getPassword());

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

	public UserVO login(String userID) {
		UserVO userVO = null;
		try {

			String sql = "select password, nickname from member where USER_ID = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userID);
			// SELECT 할 경우, ResultSet 필요
			rs = pstmt.executeQuery();

			// 결과값은 1개만 있으므로, if만 있어도 가능
			if (rs.next()) {
				userVO = new UserVO();
				String pw = rs.getString("password");
				String nickname = rs.getString("nickname");
				
				userVO.setPassword(pw);
				userVO.setNickname(nickname);
				
				return userVO;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conClose();
		}

		return null;
	}

}
