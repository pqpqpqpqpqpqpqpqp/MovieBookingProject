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

public class ReserveSeatCheckDAO {

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReserveSeatCheckDAO() {
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

	public List<String> checkReserveSeat() {

		try {

			
			return null;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}