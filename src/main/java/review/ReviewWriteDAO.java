package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewWriteDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void MemberDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void conClose() {
		try { if (rs != null) rs.close(); } catch (Exception e) {}
		try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
		try { if (conn != null) conn.close(); } catch (Exception e) {}
	}
	
	public boolean CheckReviewed(int userIdx, int movieIdx) {
		String sql = "Select count(*) from review where user_idx = ? and movie_idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			pstmt.setInt(2, movieIdx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int count = rs.getInt(1);
	            return count > 0;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			conClose();
		}
	}

	public boolean insertReview(ReviewWriteVO reviewVO) {
		String sql = "INSERT INTO review (user_idx, movie_idx, movie_name, rating, content) VALUES (?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewVO.getUserIdx());
			pstmt.setInt(2, reviewVO.getMovieIdx());
			pstmt.setString(3, reviewVO.getMovieName());
			pstmt.setInt(4, reviewVO.getReviewScore());
			pstmt.setString(5, reviewVO.getReviewContent());

			int rows = pstmt.executeUpdate();
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			conClose();
		}
	}
}