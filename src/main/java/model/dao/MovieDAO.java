package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.sql.DataSource;

import model.vo.MovieVO;
import model.vo.MovieChartVO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

    // 예매 건수 기준 무비차트 리스트 조회
    public List<MovieChartVO> movieList() {
        List<MovieChartVO> chartlist = new ArrayList<>();
        String sql = "SELECT T.MOVIE_IDX, M.MOVIE_IMG, M.MOVIE_NAME, AVG(R.REVIEW_SCORE), M.MOVIE_OPEN_DATE, COUNT(*)"
        		+ "FROM TICKETING T"
        		+ "INNER JOIN SCREEN_INFO SI ON T.SCREEN_INFO_IDX = SI.SCREEN_INFO_IDX"
        		+ "INNER JOIN MOVIE M ON T.MOVIE_IDX = M.MOVIE_IDX"
        	    + "LEFT JOIN REVIEW R ON R.TICKETING_IDX = T.TICKETING_IDX"
        	    + "WHERE T.TICKETING_DEL = 'N' AND REPLACE(SI.SCREEN_DATE, '-', '') < REPLACE(CURDATE(), '-', '')"
        	    + "GROUP BY T.MOVIE_IDX"
        	    + "ORDER BY COUNT(*) DESC;";

        try {
        	pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            		
            while (rs.next()) {
            	
            	MovieChartVO moviechart = new MovieChartVO();
            	
            	moviechart.setMovieChartImg(rs.getString("MOVIE_IMG"));
            	moviechart.setMovieChartName(rs.getString("MOVIE_NAME"));
            	moviechart.setMovieChartReviewScore(rs.getDouble("AVG(R.REVIEW_SCORE)"));
            	moviechart.setMovieChartOpenDate(rs.getString("MOVIE_OPEN_DATE"));
            	moviechart.setMovieChartCount(rs.getString("COUNT(*)"));
            	
            	chartlist.add(moviechart);
 
            }
        } catch(Exception e) {
            e.printStackTrace();

    } return chartlist;
    
    }
}
