package model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.dao.MovieChartDAO;
import model.vo.MovieChartVO;
import util.ResponseData;

public class MovieChartService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		// chartOption 값
		String chartOption = request.getParameter("chartOption");
	
		
		MovieChartDAO moviechartDAO = new MovieChartDAO();
		

		List<MovieChartVO> moviechartlist = null;
		
		
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
