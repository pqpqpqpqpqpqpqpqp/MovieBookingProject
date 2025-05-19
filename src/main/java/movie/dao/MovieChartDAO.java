package movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie.vo.MovieChartVO;


public class MovieChartDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MovieChartDAO() {
	    try {
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	        conn = ds.getConnection();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
    // 예매 건수 기준 무비차트 리스트 조회
    public List<MovieChartVO> movieChartTicketingList() {
        List<MovieChartVO> chartlist = new ArrayList<>();
        String sql = "SELECT T.MOVIE_IDX, M.MOVIE_AGE_GRADE, M.MOVIE_IMG, M.MOVIE_NAME, COUNT(*), AVG(R.REVIEW_SCORE), M.MOVIE_OPEN_DATE "
        		+ "FROM TICKETING T "
        		+ "INNER JOIN SCREEN_INFO SI ON T.SCREEN_INFO_IDX = SI.SCREEN_INFO_IDX "
        		+ "INNER JOIN MOVIE M ON T.MOVIE_IDX = M.MOVIE_IDX "
        	    + "LEFT JOIN REVIEW R ON R.TICKETING_IDX = T.TICKETING_IDX "
        	    + "WHERE T.TICKETING_DEL = 'N' AND REPLACE(SI.SCREEN_DATE, '-', '') < REPLACE(CURDATE(), '-', '') "
        	    + "GROUP BY T.MOVIE_IDX "
        	    + "ORDER BY COUNT(*) DESC;";

        try {
        	pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            		
            while (rs.next()) {
            	
            	MovieChartVO moviechart = new MovieChartVO();
            	
            	moviechart.setMovieChartAgeGrade(rs.getString("MOVIE_AGE_GRADE"));
            	moviechart.setMovieChartImg(rs.getString("MOVIE_IMG"));
            	moviechart.setMovieChartName(rs.getString("MOVIE_NAME"));
            	moviechart.setMovieChartCount(rs.getString("COUNT(*)"));
            	moviechart.setMovieChartReviewScore(rs.getDouble("AVG(R.REVIEW_SCORE)"));
            	moviechart.setMovieChartOpenDate(rs.getString("MOVIE_OPEN_DATE"));
            	
            	
            	chartlist.add(moviechart);
 
            }
        } catch(Exception e) {
            e.printStackTrace();

        } 
        return chartlist;
    
    }
    
    // 평점순 예매 리스트 조회
    public List<MovieChartVO> movieChartScoreList() {
    	List<MovieChartVO> scorelist = new ArrayList<>();
    	String sql = "SELECT T.MOVIE_IDX, M.MOVIE_AGE_GRADE, M.MOVIE_IMG, M.MOVIE_NAME, COUNT(*), AVG(R.REVIEW_SCORE), M.MOVIE_OPEN_DATE "
        		+ "FROM TICKETING T "
        		+ "INNER JOIN SCREEN_INFO SI ON T.SCREEN_INFO_IDX = SI.SCREEN_INFO_IDX "
        		+ "INNER JOIN MOVIE M ON T.MOVIE_IDX = M.MOVIE_IDX "
        	    + "LEFT JOIN REVIEW R ON R.TICKETING_IDX = T.TICKETING_IDX "
        	    + "WHERE T.TICKETING_DEL = 'N' AND REPLACE(SI.SCREEN_DATE, '-', '') < REPLACE(CURDATE(), '-', '') "
        	    + "GROUP BY T.MOVIE_IDX "
        	    + "ORDER BY AVG(R.REVIEW_SCORE) DESC; ";
    	
    	try {
        	pstmt = conn.prepareStatement(sql);
        	rs = pstmt.executeQuery();
            		
            while (rs.next()) {
            	
            	MovieChartVO moviechart = new MovieChartVO();
            	
            	moviechart.setMovieChartAgeGrade(rs.getString("MOVIE_AGE_GRADE"));
            	moviechart.setMovieChartImg(rs.getString("MOVIE_IMG"));
            	moviechart.setMovieChartName(rs.getString("MOVIE_NAME"));
            	moviechart.setMovieChartCount(rs.getString("COUNT(*)"));
            	moviechart.setMovieChartReviewScore(rs.getDouble("AVG(R.REVIEW_SCORE)"));
            	moviechart.setMovieChartOpenDate(rs.getString("MOVIE_OPEN_DATE"));
            	
            	scorelist.add(moviechart);
 
            }
        } catch(Exception e) {
            e.printStackTrace();

        } 
        return scorelist;
    }
}
