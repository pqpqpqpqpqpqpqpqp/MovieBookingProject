package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewListDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReviewListDAO() {
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

	public List<ReviewListVO> myReviewList(int useridx) {
		List<ReviewListVO> reviewList = new ArrayList<>();

		String sql = "SELECT r.REVIEW_CONTENT, r.REVIEW_SCORE, r.REVIEW_DATE, u.USER_IMG, u.USER_NICKNAME FROM review r"
				+ "JOIN user u ON r.USER_IDX = u.USER_IDX WHERE r.USER_IDX = ? AND r.REVIEW_USER_DEL = 'N' ORDER BY r.REVIEW_DATE DESC";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, useridx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewListVO reviewVO = new ReviewListVO();
				reviewVO.setReviewContent(rs.getString("REVIEW_CONTENT"));
				reviewVO.setReviewScore(rs.getInt("REVIEW_SCORE"));
				reviewVO.setReviewDate(rs.getObject("REVIEW_DATE", LocalDateTime.class));
				reviewVO.setUserImg(rs.getString("USER_IMG"));
				reviewVO.setUserNick(rs.getString("USER_NICKNAME"));
				
				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reviewList;
	}

	public List<ReviewListVO> movieReviewList(int movieidx) {
		List<ReviewListVO> reviewList = new ArrayList<>();

		String sql = "SELECT r.REVIEW_CONTENT, r.REVIEW_SCORE, r.REVIEW_DATE, u.USER_IMG, u.USER_NICKNAME FROM review r"
				+ " JOIN user u ON r.USER_IDX = u.USER_IDX WHERE r.MOVIE_IDX = ? AND r.REVIEW_USER_DEL = 'N' ORDER BY r.REVIEW_DATE DESC;";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieidx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewListVO reviewVO = new ReviewListVO();
				reviewVO.setReviewContent(rs.getString("REVIEW_CONTENT"));
				reviewVO.setReviewScore(rs.getInt("REVIEW_SCORE"));
				reviewVO.setReviewDate(rs.getObject("REVIEW_DATE", LocalDateTime.class));
				reviewVO.setUserImg(rs.getString("USER_IMG"));
				reviewVO.setUserNick(rs.getString("USER_NICKNAME"));

				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return reviewList;
	}
}