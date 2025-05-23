package movie.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import movie.dao.MovieDetailDAO;
import movie.dao.MovieUserDAO;
import movie.vo.MovieDetailGenderVO;
import util.ResponseData;


public class getGenderTicketCountService {

	
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
		
		MovieUserDAO dao = new MovieUserDAO();
		
		
		
		
		
		return data;
	}
}
