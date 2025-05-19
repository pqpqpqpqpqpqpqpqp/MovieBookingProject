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
	
		
		MovieUserDAO moviechartDAO = new MovieUserDAO();
		

		List<MovieUserListRes> moviechartlist = null;
		
		
		if ("review".equals(chartOption)) {
			moviechartlist = moviechartDAO.movieChartScoreList();
		}
		else {
			moviechartlist = moviechartDAO.movieChartTicketingList();
		}

		
		ResponseData data = new ResponseData();


		data.setData(moviechartlist);

		return data;
	}

}
