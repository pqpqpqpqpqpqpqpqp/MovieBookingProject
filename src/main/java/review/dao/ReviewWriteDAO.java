package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import review.vo.ReviewWriteVO;

public class ReviewWriteDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReviewWriteDAO() {
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
	
	public Boolean checkReviewed(int userIdx, int movieIdx) {
		String sql = "Select count(*) from review where user_idx = ? and movie_idx = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			pstmt.setInt(2, movieIdx);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
	            return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conClose();
		}
		return false;
	}

	public boolean insertReview(ReviewWriteVO reviewVO) {
		String sql = "INSERT INTO review (user_idx, movie_idx, REVIEW_SCORE, REVIEW_CONTENT) VALUES (?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewVO.getUserIdx());
			pstmt.setInt(2, reviewVO.getMovieIdx());
			pstmt.setString(3, reviewVO.getReviewScore());
			pstmt.setString(4, reviewVO.getReviewContent());

			int rows = pstmt.executeUpdate();
			return rows > 0;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conClose();
		}
		return false;
	}
}