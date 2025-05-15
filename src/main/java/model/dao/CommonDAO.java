package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;

public class CommonDAO {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public CommonDAO() {
		
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

	
	
	
	
}
