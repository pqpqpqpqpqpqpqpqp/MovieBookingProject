package ticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import ticket.vo.ReserveSeatCheckVO;

public class ReserveSeatCheckDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReserveSeatCheckDAO() {
		try {
			InitialContext init = new InitialContext();
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

	public List<String> checkReserveSeat(ReserveSeatCheckVO reserveSeatCheckVO) {
	    List<String> reservedSeats = new ArrayList<>();

	    String sql = "SELECT T.SEAT_NAME " +
	                 "FROM TICKETING T " +
	                 "JOIN SCREEN_INFO S ON T.SCREEN_INFO_IDX = S.SCREEN_INFO_IDX " +
	                 "JOIN MOVIE M ON S.MOVIE_IDX = M.MOVIE_IDX " +
	                 "JOIN CINEMA C ON S.CINEMA_IDX = C.CINEMA_IDX " +
	                 "JOIN THEATER TH ON C.THEATER_IDX = TH.THEATER_IDX " +
	                 "WHERE M.MOVIE_NAME = ? " +
	                 "AND C.CINEMA_NAME = ? " +
	                 "AND TH.THEATER_NAME = ? " +
	                 "AND S.SCREEN_DATE = ? " +
	                 "AND S.SCREEN_START_TIME = ? " +
	                 "AND T.TICKETING_DEL = 'N'";

	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, reserveSeatCheckVO.getMovieName());
	        pstmt.setString(2, reserveSeatCheckVO.getCinemaName());
	        pstmt.setString(3, reserveSeatCheckVO.getTheaterName());
	        pstmt.setString(4, reserveSeatCheckVO.getDate());
	        pstmt.setString(5, reserveSeatCheckVO.getStartTime());

	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	            reservedSeats.add(rs.getString("SEAT_NAME"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        conClose();
	    }

	    return reservedSeats;
	}
}