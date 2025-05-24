package ticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import ticket.vo.ReserveVO;

import javax.naming.Context;
import javax.naming.InitialContext;

public class ReserveDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReserveDAO() {

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

	public List<ReserveVO> readScreenInfo() {
		List<ReserveVO> reserveArr = new ArrayList<>();
		ReserveVO reserveVO = null;
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
				reserveVO = new ReserveVO();
				reserveVO.setMovieName(rs.getString("MOVIE_NAME"));
				reserveVO.setTheaterName(rs.getString("THEATER_NAME"));
				reserveVO.setScreenDate(rs.getString("SCREEN_DATE"));
				reserveVO.setCinemaName(rs.getString("CINEMA_NAME"));
				reserveVO.setCinemaSpecialName(rs.getString("CINEMA_SPECIAL_NAME"));
				reserveVO.setScreenStartTime(rs.getString("SCREEN_START_TIME"));
				reserveVO.setCinemaSeat(rs.getString("CINEMA_SEAT"));
				reserveVO.setMovieAgeGrade(rs.getString("MOVIE_AGE_GRADE"));

				reserveArr.add(reserveVO);

			}
			return reserveArr;

		} catch (Exception e) {
			e.printStackTrace();
			return reserveArr;
		} finally {
			conClose();
		}

	}

}