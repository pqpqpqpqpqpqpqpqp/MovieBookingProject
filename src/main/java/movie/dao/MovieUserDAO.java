package movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie.vo.MovieDetailRes;
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
        String sql = "WITH YES_TICKET as ("
        		+ "select * from TICKETING "
        		+ "where SCREEN_INFO_IDX IN (select SCREEN_INFO_IDX from SCREEN_INFO where SCREEN_DATE = SUBDATE(CURDATE(), 11)) "
        		+ "and TICKETING_DEL = 'N') "
        		+ "SELECT M.MOVIE_IDX "
        		+ ", M.MOVIE_AGE_GRADE "
        		+ ", M.MOVIE_IMG "
        		+ ", M.MOVIE_NAME "
        		+ ", ROUND((select (COUNT(*)/(select COUNT(*) from YES_TICKET)*100) from YES_TICKET T where M.MOVIE_IDX = T.MOVIE_IDX), 2) as TICKETING_CNT "
        		+ ", IFNULL(ROUND((select AVG(REVIEW_SCORE) from REVIEW R where R.MOVIE_IDX = M.MOVIE_IDX), 2), '0') as REVIEW_AVG "
        		+ ", M.MOVIE_OPEN_DATE "
        		+ "from MOVIE M "
        		+ "order by TICKETING_CNT desc; ";
        		

        try {
        	pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            		
            while (rs.next()) {
            	
            	MovieUserListRes moviechart = new MovieUserListRes();
            	
            	moviechart.setMovieIdx(rs.getLong("MOVIE_IDX"));
            	moviechart.setMovieChartAgeGrade(rs.getString("MOVIE_AGE_GRADE"));
            	moviechart.setMovieChartImg(rs.getString("MOVIE_IMG"));
            	moviechart.setMovieChartName(rs.getString("MOVIE_NAME"));
            	moviechart.setMovieChartCount(rs.getString("TICKETING_CNT"));
            	moviechart.setMovieChartReviewScore(rs.getString("REVIEW_AVG"));
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
    	String sql = "WITH YES_TICKET AS ( "
    			+ "SELECT * FROM TICKETING WHERE SCREEN_INFO_IDX IN (SELECT SCREEN_INFO_IDX FROM SCREEN_INFO WHERE SCREEN_DATE = SUBDATE(CURDATE(), 11)) "
    			+ "AND TICKETING_DEL = 'N' "
    			+ "), YES_REVIEW as (  "
    			+ "SELECT FLOOR(REVIEW_SCORE/2) as SCORE "
    			+ ",MOVIE_IDX "
    			+ "FROM REVIEW) "
    			+ "SELECT M.MOVIE_IDX "
    			+ ", M.MOVIE_AGE_GRADE "
    			+ ", M.MOVIE_IMG "
    			+ ", M.MOVIE_NAME "
    			+ ", M.MOVIE_OPEN_DATE "
    			+ ", IFNULL(ROUND((SELECT SUM(SCORE) / COUNT(*)*100 FROM YES_REVIEW R WHERE R.MOVIE_IDX = M.MOVIE_IDX),2), '0') AS REVIEW_AVG "
    			+ ", ROUND(( SELECT COUNT(*) / (SELECT COUNT(*) FROM YES_TICKET) * 100 FROM YES_TICKET T WHERE M.MOVIE_IDX = T.MOVIE_IDX), 2) AS TICKETING_CNT "
    			+ "FROM MOVIE M "
    			+ "ORDER BY REVIEW_AVG desc;";
    	
    	try {
        	pstmt = conn.prepareStatement(sql);
        	rs = pstmt.executeQuery();
            		
            while (rs.next()) {
            	
            	MovieUserListRes moviechart = new MovieUserListRes();
            	
            	moviechart.setMovieIdx(rs.getLong("MOVIE_IDX"));
            	moviechart.setMovieChartAgeGrade(rs.getString("MOVIE_AGE_GRADE"));
            	moviechart.setMovieChartImg(rs.getString("MOVIE_IMG"));
            	moviechart.setMovieChartName(rs.getString("MOVIE_NAME"));
            	moviechart.setMovieChartCount(rs.getString("TICKETING_CNT"));
            	moviechart.setMovieChartReviewScore(rs.getString("REVIEW_AVG"));
            	moviechart.setMovieChartOpenDate(rs.getString("MOVIE_OPEN_DATE"));
            	
            	scorelist.add(moviechart);
 
            }
        } catch(Exception e) {
            e.printStackTrace();

        } 
        return scorelist;
    }
    
    /**
     * 영화 상세 보기 기능 
     * @param movieIdx: 영화 정보 pk
     * @return MovieDeatailRes 영화 상세 정보 ResVO
     * @throws Exception
     */
    public MovieDetailRes movieDetail(int movieIdx) throws Exception{

    	
    	MovieDetailRes detail = null;
    	
    	// movieIdx에 따라 내용이 바껴야 하니까 영화 상세 정보 불러오기
    	String sql = "WITH YES_TICKET as ( " 
    				+ "select * from TICKETING " 
    				+ "where SCREEN_INFO_IDX IN (select SCREEN_INFO_IDX from SCREEN_INFO where SCREEN_DATE = SUBDATE(CURDATE(), 13)) "
    				+ "and TICKETING_DEL = 'N' ) "
    				+ "select M.MOVIE_IMG "
    				+ ", M.MOVIE_NAME "
    				+ ", M.MOVIE_CREATOR "
    				+ ", M.MOVIE_AGE_GRADE "
    				+ ", M.MOVIE_OPEN_DATE "
    				+ ", M.MOVIE_DSEC "
    				+ ", M.MOVIE_PLAY_TIME"
    				+ ",IFNULL(ROUND((select AVG(REVIEW_SCORE) from REVIEW R where R.MOVIE_IDX = M.MOVIE_IDX), 2), '0') as REVIEW_AVG "
    				+ ",ROUND((select (COUNT(*)/(select COUNT(*) from YES_TICKET)*100) from YES_TICKET T where M.MOVIE_IDX = T.MOVIE_IDX), 2) as TICKETING_CNT "
    				+ "from MOVIE M "
    				+ "where M.MOVIE_IDX = ?";
    			
    	
    	
    	
    	pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, movieIdx); 	
    	rs = pstmt.executeQuery();

    	
    	if (rs.next()) {
    		
    		detail = new MovieDetailRes();
    		detail.setMovieImg(rs.getString("MOVIE_IMG"));
    		detail.setMovieName(rs.getString("MOVIE_NAME"));
    		detail.setMovieCreator(rs.getString("MOVIE_CREATOR"));
    		detail.setMovieAgeGrade(rs.getString("MOVIE_AGE_GRADE"));
    		detail.setMovieOpenDate(rs.getString("MOVIE_OPEN_DATE"));
    		detail.setMovieDsec(rs.getString("MOVIE_DSEC"));
    		detail.setMoviePlayTime(rs.getString("MOVIE_PLAY_TIME"));
    		detail.setPreviewAvg(rs.getString("REVIEW_AVG"));
    		detail.setTicketingCnt(rs.getString("TICKETING_CNT"));
    		
    	}
    	
    	// detail 값 반환
    	return detail;
    }
    
	public void conClose() {
		try {if(rs != null) rs.close(); }catch(Exception e) {}
		try {if(pstmt != null) pstmt.close(); }catch(Exception e) {}
		try {if(conn != null) conn.close(); }catch(Exception e) {}
	}
}
