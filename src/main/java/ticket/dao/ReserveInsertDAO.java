package ticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

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
		try { if (pstmt != null) pstmt.close();
		} catch (Exception e) {}
		try { if (conn != null) conn.close();
		} catch (Exception e) {}
	}

	public void insertReserve() {
		try {
			String sql = 
					"INSERT INTO TICKETING (SEAT_NAME, MOVIE_IDX, SCREEN_INFO_IDX, USER_IDX)" +
					"VALUES (?, (SELECT MOVIE_IDX FROM MOVIE WHERE MOVIE_NAME = ?)," +
					" (SELECT SCREEN_INFO_IDX FROM SCREEN_INFO WHERE SCREEN_START_TIME = ?), ?);";
			pstmt = conn.prepareStatement(sql);
			pstmt.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}