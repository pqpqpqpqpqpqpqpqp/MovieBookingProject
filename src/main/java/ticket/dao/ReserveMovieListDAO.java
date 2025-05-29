package ticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import ticket.vo.ReserveMovieListVO;

import javax.naming.Context;
import javax.naming.InitialContext;

public class ReserveMovieListDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReserveMovieListDAO() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void conClose() {
		try { if (rs != null) rs.close();
		} catch (Exception e) {}
		try { if (pstmt != null) pstmt.close();
		} catch (Exception e) {}
		try { if (conn != null) conn.close();
		} catch (Exception e) {}
	}

	public List<ReserveMovieListVO> readReserveMovieList() {
		List<ReserveMovieListVO> movieReserveList = new ArrayList<>();
		ReserveMovieListVO movieReserveListVO = null;
		try {

			String input = "SELECT M.MOVIE_NAME, T.THEATER_NAME, SI.SCREEN_DATE, "
					+ "C.CINEMA_NAME, C.CINEMA_SPECIAL_NAME, SI.SCREEN_START_TIME, C.CINEMA_SEAT, M.MOVIE_AGE_GRADE "
					+ "FROM SCREEN_INFO SI " + "INNER JOIN MOVIE M ON M.MOVIE_IDX = SI.MOVIE_IDX "
					+ "INNER JOIN CINEMA C ON C.CINEMA_IDX = SI.CINEMA_IDX "
					+ "INNER JOIN THEATER T ON C.THEATER_IDX = T.THEATER_IDX "
					+ "ORDER BY SI.SCREEN_DATE ASC, SI.SCREEN_START_TIME ASC";

			pstmt = conn.prepareStatement(input);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				movieReserveListVO = new ReserveMovieListVO();
				movieReserveListVO.setMovieName(rs.getString("MOVIE_NAME"));
				movieReserveListVO.setTheaterName(rs.getString("THEATER_NAME"));
				movieReserveListVO.setScreenDate(rs.getString("SCREEN_DATE"));
				movieReserveListVO.setCinemaName(rs.getString("CINEMA_NAME"));
				movieReserveListVO.setCinemaSpecialName(rs.getString("CINEMA_SPECIAL_NAME"));
				movieReserveListVO.setScreenStartTime(rs.getString("SCREEN_START_TIME"));
				movieReserveListVO.setCinemaSeat(rs.getString("CINEMA_SEAT"));
				movieReserveListVO.setMovieAgeGrade(rs.getString("MOVIE_AGE_GRADE"));

				movieReserveList.add(movieReserveListVO);

			}
			return movieReserveList;

		} catch (Exception e) {
			e.printStackTrace();
			return movieReserveList;
		}
	}
}