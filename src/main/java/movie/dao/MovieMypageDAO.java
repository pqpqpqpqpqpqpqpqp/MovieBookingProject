package movie.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import movie.vo.MovieWatchedVO;

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

	// 내정보 페이지 내가본영화 조회
	public List<MovieWatchedVO> movieMypageList(int userIdx) {
		List<MovieWatchedVO> mymovie = new ArrayList<>();
		String sql =  
			      "WITH RankedTickets AS ("
			    		    + " SELECT "
			    		    + "    u.USER_ID, "
			    		    + "	   m.MOVIE_IDX, "
			    		    + "    u.USER_NICKNAME, "
			    		    + "    m.MOVIE_NAME, "
			    		    + "    m.MOVIE_AGE_GRADE, "
			    		    + "    m.MOVIE_PLAY_TIME, "
			    		    + "    t.SEAT_NAME, "
			    		    + "    s.SCREEN_DATE, "
			    		    + "    r.REVIEW_SCORE, "
			    		    + "    m.MOVIE_IMG, "
			    		    + "    CASE DAYOFWEEK(s.SCREEN_DATE) "
			    		    + "        WHEN 1 THEN '일요일' "
			    		    + "        WHEN 2 THEN '월요일' "
			    		    + "        WHEN 3 THEN '화요일' "
			    		    + "        WHEN 4 THEN '수요일' "
			    		    + "        WHEN 5 THEN '목요일' "
			    		    + "        WHEN 6 THEN '금요일' "
			    		    + "        WHEN 7 THEN '토요일' "
			    		    + "    END AS SCREEN_DAY, "
			    		    + "    s.SCREEN_START_TIME, "
			    		    + "    ADDTIME(s.SCREEN_START_TIME, SEC_TO_TIME(m.MOVIE_PLAY_TIME * 60)) AS SCREEN_END_TIME, "
			    		    + "    c.CINEMA_NAME, "
			    		    + "    c.CINEMA_SPECIAL_NAME, "
			    		    + "    th.THEATER_NAME, "
			    		    + "    (SELECT COUNT(*) "
			    		    + "     FROM TICKETING t2 "
			    		    + "     JOIN SCREEN_INFO s2 ON t2.SCREEN_INFO_IDX = s2.SCREEN_INFO_IDX "
			    		    + "     JOIN USER u2 ON t2.USER_IDX = u2.USER_IDX "
			    		    + "     WHERE t2.MOVIE_IDX = t.MOVIE_IDX "
			    		    + "       AND s2.SCREEN_DATE = s.SCREEN_DATE "
			    		    + "       AND s2.SCREEN_START_TIME = s.SCREEN_START_TIME "
			    		    + "       AND u2.USER_ID = u.USER_ID"
			    		    + "    ) AS BOOKED_COUNT, "
			    		    + "    ROW_NUMBER() OVER ( "
			    		    + "        PARTITION BY m.MOVIE_NAME, s.SCREEN_DATE, s.SCREEN_START_TIME "
			    		    + "        ORDER BY t.TICKETING_IDX "
			    		    + "    ) AS rn "
			    		    + " FROM TICKETING t "
			    		    + " JOIN USER u ON t.USER_IDX = u.USER_IDX "
			    		    + " JOIN MOVIE m ON t.MOVIE_IDX = m.MOVIE_IDX "
			    		    + " JOIN SCREEN_INFO s ON t.SCREEN_INFO_IDX = s.SCREEN_INFO_IDX "
			    		    + " JOIN CINEMA c ON s.CINEMA_IDX = c.CINEMA_IDX "
			    		    + " JOIN THEATER th ON c.THEATER_IDX = th.THEATER_IDX "
			    		    + " LEFT JOIN REVIEW r ON r.USER_IDX = u.USER_IDX AND r.MOVIE_IDX = m.MOVIE_IDX "
			    		    + " WHERE u.USER_IDX = ? "
			    		    + ") "
			    		    + "SELECT * FROM RankedTickets "
			    		    + "WHERE rn = 1";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx); // 꼭 필요!
			rs = pstmt.executeQuery();

			while (rs.next()) {
				String startTime = rs.getString("SCREEN_START_TIME");
				String endTime = rs.getString("SCREEN_END_TIME");
				String thName = rs.getString("THEATER_NAME");
				String ciName = rs.getString("CINEMA_SPECIAL_NAME");
				String thciName = thName +"["+ ciName +"]";

				MovieWatchedVO myMovieList = new MovieWatchedVO();
				myMovieList.setMovieIdx(rs.getInt("MOVIE_IDX"));
				myMovieList.setMovieImg(rs.getString("MOVIE_IMG"));
				myMovieList.setMovieName(rs.getString("MOVIE_NAME"));
				myMovieList.setCinemaSpecialName(rs.getString("CINEMA_SPECIAL_NAME"));
				myMovieList.setWatchDate(rs.getString("SCREEN_DATE"));
				myMovieList.setWeekday(rs.getString("SCREEN_DAY"));
				myMovieList.setScreenTime(startTime + " ~ " + endTime);
				myMovieList.setThciName(thciName);
				
				myMovieList.setScreenNum(rs.getInt("BOOKED_COUNT"));
				myMovieList.setReviewScore(rs.getInt("REVIEW_SCORE"));

				mymovie.add(myMovieList);
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			conClose();
		}
		return mymovie;
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
