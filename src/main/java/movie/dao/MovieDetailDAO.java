package movie.dao;


import java.util.*;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MovieDetailDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MovieDetailDAO() {
	    try {
	        Context init = new InitialContext();
	        DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	        conn = ds.getConnection();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
	
	// 성별 예매 분포 그래프
	public Map<String, Integer> getGenderTicketCount(int movieIdx){
		Map<String, Integer> result = new HashMap<>();
		String sql = "select "
				+ "case SUBSTRING(u.USER_NUM, 7, 1) "
				+ "	when '1' then '남성' "
				+ "	when '3' then '남성' "
				+ "	when '2' then '여성' "
				+ "	when '4' then '여성' "
				+ "	end as 성별 "
				+ ", count(*) as 예매수 "
				+ "from user u "
				+ "inner join (select * from ticketing where MOVIE_IDX ='?' AND TICKETING_DEL = 'N' ) t "
				+ "on t.USER_IDX = u.USER_IDX "
				+ "group by 성별;";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, movieIdx); 	
	    	rs = pstmt.executeQuery();
	    	
	    	while(rs.next()) {
	    		String gender = rs.getString("gender");
	    		int count = rs.getInt("count");
	    		
	    		result.put(gender,count);
	    		
	    		}
		}
		catch(Exception e)  {
			e.printStackTrace();
		}
		finally {
			conClose();
		}
		
		
		return result;
		
	}
	
	
	public void conClose() {
		try {if(rs != null) rs.close(); }catch(Exception e) {}
		try {if(pstmt != null) pstmt.close(); }catch(Exception e) {}
		try {if(conn != null) conn.close(); }catch(Exception e) {}
	}
	
}
