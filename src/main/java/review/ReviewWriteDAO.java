package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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

	public boolean insertReview(ReviewWriteVO reviewVO) {
		String sql = "INSERT INTO review (user_idx, movie_idx, booking_idx, movie_name, rating, content) VALUES (?, ?, ?, ?, ?, ?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewVO.getUserIdx());
			pstmt.setInt(2, reviewVO.getMovieIdx());
			pstmt.setInt(3, reviewVO.getBookingIdx());
			pstmt.setString(4, reviewVO.getMovieName());
			pstmt.setString(5, reviewVO.getReviewRating());
			pstmt.setString(6, reviewVO.getReviewText());

			int rows = pstmt.executeUpdate();
			return rows > 0;
		} catch (SQLException e) {
			System.err.println("리뷰 삽입 중 SQL 예외 발생: " + e.getMessage());
			e.printStackTrace();
			return false;
		} finally {
			conClose();
		}
	}
}