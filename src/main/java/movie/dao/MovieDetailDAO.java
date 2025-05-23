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
				+ "	end as gender "
				+ ", count(*) as count "
				+ "from user u "
				+ "inner join (select * from ticketing where MOVIE_IDX =? AND TICKETING_DEL = 'N' ) t "
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
	
	// 연령별 예매 분포 그래프
		public Map<String, Integer> getAgeGroupTicketCount(int movieIdx){
			Map<String, Integer> result = new HashMap<>();
			String sql = "SELECT "
					+ "  FLOOR( "
					+ "    (YEAR(CURDATE()) - "
					+ "      CASE "
					+ "        WHEN birthYear > RIGHT(YEAR(CURDATE()), 2) "
					+ "          THEN 1900 + birthYear "
					+ "        ELSE 2000 + birthYear "
					+ "      END "
					+ "    ) / 10 ) * 10 AS ageGroup "
					+ ", COUNT(*) as count "
					+ " FROM ( SELECT USER_NUM"
					+ ", CAST(SUBSTRING(USER_NUM, 1, 2) AS UNSIGNED) AS birthYear "
					+ " FROM user u "
					+ " inner join  (select * from ticketing  where MOVIE_IDX =? AND TICKETING_DEL = 'N' ) t "
					+ "on t.USER_IDX = u.USER_IDX) AS sub "
					+ "group by ageGroup;";
					
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, movieIdx); 	
		    	rs = pstmt.executeQuery();
		    	
		    	while(rs.next()) {
		    		String ageGroup = rs.getString("ageGroup");
		    		int count = rs.getInt("count");
		    		
		    		result.put(ageGroup,count);
		    		
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
