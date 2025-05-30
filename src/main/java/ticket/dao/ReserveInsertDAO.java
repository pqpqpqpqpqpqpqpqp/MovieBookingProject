package ticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import ticket.vo.ReserveInsertVO;

import javax.naming.Context;
import javax.naming.InitialContext;

public class ReserveInsertDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;

	public ReserveInsertDAO() {
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

	public void insertReserve(ReserveInsertVO reserve) {
		try {
			String sql = "INSERT INTO TICKETING (SEAT_NAME, MOVIE_IDX, SCREEN_INFO_IDX, USER_IDX) "
					+ "SELECT ?, ?, s.SCREEN_INFO_IDX, ? " + "FROM SCREEN_INFO s " + "WHERE s.CINEMA_IDX = ? "
					+ "AND s.SCREEN_DATE = ? " + "AND s.SCREEN_START_TIME = ?";

			PreparedStatement pstmt = conn.prepareStatement(sql);

			for (String seat : reserve.getSeatName().split(",")) {
				pstmt.setString(1, seat.trim());
				pstmt.setInt(2, reserve.getMovieIdx());
				pstmt.setInt(3, reserve.getUserIdx());
				pstmt.setInt(4, reserve.getCinemaIdx());
				pstmt.setString(5, reserve.getScreeningDate());
				pstmt.setString(6, reserve.getStartTime());

				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}