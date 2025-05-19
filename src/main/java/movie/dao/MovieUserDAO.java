package movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie.vo.MovieDeatailRes;
import movie.vo.MovieUserListRes;
import movie.vo.MovieVO;


public class MovieUserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public MovieUserDAO() {
	    try {
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	        conn = ds.getConnection();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

	
    // 예매 건수 기준 무비차트 리스트 조회
    public List<MovieUserListRes> movieChartTicketingList() {
        List<MovieUserListRes> chartlist = new ArrayList<>();
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
            	
            	MovieUserListRes moviechart = new MovieUserListRes();
            	
            	moviechart.setMovieIdx(rs.getLong("MOVIE_IDX"));
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
    public List<MovieUserListRes> movieChartScoreList() {
    	List<MovieUserListRes> scorelist = new ArrayList<>();
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
            	
            	MovieUserListRes moviechart = new MovieUserListRes();
            	
            	moviechart.setMovieIdx(rs.getLong("MOVIE_IDX"));
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
    
    // movieIdx를 갖고 옴
    public MovieDeatailRes movieDetail(int movieIdx) throws Exception{
    	
    	MovieDeatailRes detail = null;
    	
    	// movieIdx에 따라 내용이 바껴야 하니까
    	String sql = "select MOVIE_IMG, MOVIE_NAME, MOVIE_CREATOR, MOVIE_AGE_GRADE, MOVIE_PLAY_TIME, MOVIE_DSEC " + 
    				 "from MOVIE M " +
    				 "where M.MOVIE_IDX = ? ";
    	
    	pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, movieIdx); 	
    	rs = pstmt.executeQuery();
    	
    	if (rs.next()) {
    		
    		detail = new MovieDeatailRes();
    		detail.setMovieImg(rs.getString("MOVIE_IMG"));
    		detail.setMovieName(rs.getString("MOVIE_NAME"));
    		detail.setMovieCreator(rs.getString("MOVIE_CREATOR"));
    		detail.setMovieAgeGrade(rs.getString("MOVIE_AGE_GRADE"));
    		detail.setMoviePlayTime(rs.getString("MOVIE_PLAY_TIME"));
    		detail.setMovieDsec(rs.getString("MOVIE_DSEC"));
    		
    	}
    	return detail;
    }
    
	public void conClose() {
		try {if(rs != null) rs.close(); }catch(Exception e) {}
		try {if(pstmt != null) pstmt.close(); }catch(Exception e) {}
		try {if(conn != null) conn.close(); }catch(Exception e) {}
	}
}
