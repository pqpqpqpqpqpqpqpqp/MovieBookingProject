package review.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import review.vo.ReviewListVO;

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
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

		String sql =  "SELECT r.REVIEW_IDX, m.MOVIE_IMG, m.MOVIE_NAME, r.REVIEW_CONTENT, r.REVIEW_SCORE, r.REVIEW_DATE, u.USER_IMG, u.USER_NICKNAME "
		           + "FROM review r "
		           + "JOIN user u ON r.USER_IDX = u.USER_IDX "
		           + "JOIN movie m ON m.MOVIE_IDX = r.MOVIE_IDX "
		           + "WHERE r.USER_IDX = ? AND r.REVIEW_USER_DEL = 'N' "
		           + "ORDER BY r.REVIEW_DATE DESC";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, useridx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewListVO reviewVO = new ReviewListVO();
				reviewVO.setMovieImg(rs.getString("MOVIE_IMG"));
				reviewVO.setMovieName(rs.getString("MOVIE_NAME"));
				reviewVO.setReviewContent(rs.getString("REVIEW_CONTENT"));
				reviewVO.setReviewScore(rs.getInt("REVIEW_SCORE"));
				LocalDateTime reviewdatetime = rs.getObject("REVIEW_DATE", LocalDateTime.class);
				reviewVO.setReviewDate(reviewdatetime.format(formatter));
				reviewVO.setUserImg(rs.getString("USER_IMG"));
				reviewVO.setUserNick(rs.getString("USER_NICKNAME"));
				reviewVO.setReviewIdx(rs.getInt("REVIEW_IDX"));
				
				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			conClose();
			
		}

		return reviewList;
	}
	//리뷰 조회
	public List<ReviewListVO> movieReviewList(int movieidx) {
		List<ReviewListVO> reviewList = new ArrayList<>();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd");

		String sql = "SELECT r.REIVEW_IDX, r.REVIEW_CONTENT, r.REVIEW_SCORE, r.REVIEW_DATE, u.USER_IMG, u.USER_NICKNAME FROM review r "
				+ "JOIN user u ON r.USER_IDX = u.USER_IDX WHERE r.MOVIE_IDX = ? AND r.REVIEW_USER_DEL = 'N' ORDER BY r.REVIEW_DATE DESC;";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieidx);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ReviewListVO reviewVO = new ReviewListVO();
				reviewVO.setReviewContent(rs.getString("REVIEW_CONTENT"));
				reviewVO.setReviewScore(rs.getInt("REVIEW_SCORE"));
				LocalDateTime reviewdatetime = rs.getObject("REVIEW_DATE", LocalDateTime.class);
				reviewVO.setReviewDate(reviewdatetime.format(formatter));
				reviewVO.setUserImg(rs.getString("USER_IMG"));
				reviewVO.setUserNick(rs.getString("USER_NICKNAME"));
				reviewVO.setReviewIdx(rs.getInt("REVIEW_IDX"));

				reviewList.add(reviewVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conClose();			
		}

		return reviewList;
	}
	
	//리뷰 삭제 (r.REVIEW_USER_DEL = 'Y') 처리
	public int deleteReview (int reviewIdx, int userIdx) {
		String sql = "UPDATE review "
		           + "SET REVIEW_USER_DEL = 'Y' "
		           + "WHERE REVIEW_IDX = ? AND USER_IDX = ?;";
		int result =0;
	
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reviewIdx); // 삭제할 리뷰의 ID
			pstmt.setInt(2, userIdx);   // 현재 로그인한 사용자 ID
			result = pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}finally {
			conClose();
		}
		return result;

	}	
	
	//리뷰 수정
			public boolean editReview(int reviewIdx, int score, String content) {
	        String sql = "UPDATE review SET review_score = ?, review_content = ?, review_date = NOW() WHERE review_idx = ?";

	        try {	
        		pstmt = conn.prepareStatement(sql);	        	 
	            pstmt.setInt(1, score);
	            pstmt.setString(2, content);
	            pstmt.setInt(3, reviewIdx);

	            int result = pstmt.executeUpdate();
	            return result == 1;
	        } catch (Exception e) {
	            e.printStackTrace();
	        }finally {
				conClose();
			}
	        return false;
	    }
		


}
		