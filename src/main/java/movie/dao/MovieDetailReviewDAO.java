package movie.dao;

import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie.vo.MovieDetailReviewVO;

public class MovieDetailReviewDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MovieDetailReviewDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 영화 상세 페이지 내 리뷰 모달 
	public MovieDetailReviewVO getReviewModal(int user_idx) throws Exception {
		MovieDetailReviewVO modal = new MovieDetailReviewVO();
		String sql = "select user_img "
				+ ", user_nickname "
				+ "from USER "
				+ "where USER_IDX =? ;";
			

		        pstmt = conn.prepareStatement(sql);
		        pstmt.setInt(1, user_idx);
		        rs = pstmt.executeQuery();

		        if (rs.next()) {
		            modal = new MovieDetailReviewVO();
		            modal.setUserImg(rs.getString("user_img"));
		            modal.setUserNick(rs.getString("user_nickname"));
		            
		            
		        }

		    conClose();
		    return modal;	
		
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



}
