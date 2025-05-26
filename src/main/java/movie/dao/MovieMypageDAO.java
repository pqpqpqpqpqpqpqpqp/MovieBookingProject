package movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie.vo.MovieWatchedList;

public class MovieMypageDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MovieMypageDAO() {
	    try {
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	        conn = ds.getConnection();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	public List<MovieWatchedList> movieMypageList(){
		List<MovieWatchedList> mymovie = new ArrayList<>();
		String sql = 
			    "SELECT " +
			    "    u.USER_ID, " +
			    "    u.USER_NICKNAME, " +
			    "    m.MOVIE_NAME, " +
			    "    m.MOVIE_AGE_GRADE, " +
			    "    m.MOVIE_PLAY_TIME, " +
			    "    t.SEAT_NAME, " +
			    "    s.SCREEN_DATE, " +
			    "    r.REVIEW_SCORE, " +
			    "    CASE DAYOFWEEK(s.SCREEN_DATE) " +
			    "        WHEN 1 THEN '일요일' " +
			    "        WHEN 2 THEN '월요일' " +
			    "        WHEN 3 THEN '화요일' " +
			    "        WHEN 4 THEN '수요일' " +
			    "        WHEN 5 THEN '목요일' " +
			    "        WHEN 6 THEN '금요일' " +
			    "        WHEN 7 THEN '토요일' " +
			    "    END AS SCREEN_DAY, " +
			    "    s.SCREEN_START_TIME, " +
			    "    ADDTIME(s.SCREEN_START_TIME, SEC_TO_TIME(m.MOVIE_PLAY_TIME * 60)) AS SCREEN_END_TIME, " +
			    "    c.CINEMA_NAME, " +
			    "    c.CINEMA_SPECIAL_NAME, " +
			    "    th.THEATER_NAME, " +
			    "    ( " +
			    "        SELECT COUNT(*) " +
			    "        FROM ticketing t2 " +
			    "        JOIN screen_info s2 ON t2.SCREEN_INFO_IDX = s2.SCREEN_INFO_IDX " +
			    "        JOIN user u2 ON t2.USER_IDX = u2.USER_IDX " +
			    "        WHERE " +
			    "            t2.MOVIE_IDX = t.MOVIE_IDX " +
			    "            AND s2.SCREEN_DATE = s.SCREEN_DATE " +
			    "            AND s2.SCREEN_START_TIME = s.SCREEN_START_TIME " +
			    "            AND u2.USER_ID = u.USER_ID " +
			    "    ) AS BOOKED_COUNT " +
			    "FROM ticketing t " +
			    "JOIN user u ON t.USER_IDX = u.USER_IDX " +
			    "JOIN movie m ON t.MOVIE_IDX = m.MOVIE_IDX " +
			    "JOIN screen_info s ON t.SCREEN_INFO_IDX = s.SCREEN_INFO_IDX " +
			    "JOIN cinema c ON s.CINEMA_IDX = c.CINEMA_IDX " +
			    "JOIN theater th ON c.THEATER_IDX = th.THEATER_IDX " +
			    "JOIN review r ON r.USER_IDX = u.USER_IDX " +
			    "WHERE u.USER_ID = ?";

		
		 try {
	        	pstmt = conn.prepareStatement(sql);
	            rs = pstmt.executeQuery();
	            String startTime = rs.getString("SCREEN_START_TIME");
	            String endTime = rs.getString("SCREEN_END_TIME");
	            String theaterName = rs.getString("THEATER_NAME");
	            String cinemaName = rs.getString("CINEMA_SPECIAL_NAME");
	            		
	            while (rs.next()) {
	            	MovieWatchedList myMovieList = new MovieWatchedList();
	            	myMovieList.setMovieName(rs.getString("MOVIE_NAME"));
	            	myMovieList.setCinemaSpecialName(rs.getString("CINEMA_SPECIAL_NAME"));
	            	myMovieList.setWatchDate(rs.getString("SCREEN_DATE"));
	            	myMovieList.setWeekday(rs.getString("SCREEN_DAY"));
	            	myMovieList.setScreenTime(startTime + " ~ " + endTime);
	            	myMovieList.setTheaterName(theaterName + "[ " + cinemaName + " ]");
	            	myMovieList.setScreenNum(rs.getInt("MY_BOOKED_COUNT"));
	            	myMovieList.setReviewScore(rs.getInt("REVIEW_SCORE"));
	            }
		
		
	
		
	
	}catch(Exception e) {
        e.printStackTrace();

    }
		return mymovie; 
		
}
}
