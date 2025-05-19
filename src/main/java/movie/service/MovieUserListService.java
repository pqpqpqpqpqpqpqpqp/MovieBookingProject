package movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieUserDAO;
import movie.vo.MovieUserListRes;
import util.ResponseData;

public class MovieUserListService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		// chartOption 값
		String chartOption = request.getParameter("chartType");
	
		
		MovieUserDAO movieUserDAO = new MovieUserDAO();
		

		List<MovieUserListRes> movieUserLists = null;
		
		
		if ("review".equals(chartOption)) {
			movieUserLists = movieUserDAO.movieChartScoreList();
		}
		else {
			movieUserLists = movieUserDAO.movieChartTicketingList();
		}

		
		ResponseData data = new ResponseData();


		data.setData(movieUserLists);

		return data;
	}

}
