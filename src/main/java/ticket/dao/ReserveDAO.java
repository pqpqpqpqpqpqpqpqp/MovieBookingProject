package ticket.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void conClose() {
		try {if(rs != null) rs.close(); }catch(Exception e) {}
		try {if(pstmt != null) pstmt.close(); }catch(Exception e) {}
		try {if(conn != null) conn.close(); }catch(Exception e) {}
	}
	
	public int fastReserve(ReserveVO reserveVO) {

		try {

			String input = "";

			
			
			int result = pstmt.executeUpdate();

		
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		} finally {
			conClose();
		}

		return 0;
	}
	
	

}
