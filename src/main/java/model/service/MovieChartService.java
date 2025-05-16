package model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.dao.MovieChartDAO;
import model.vo.MovieChartVO;
import util.ResponseData;

public class MovieChartService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		MovieChartDAO moviechartDAO = new MovieChartDAO();

		// 예매율순 차트리스트
		List<MovieChartVO> moviechartlist = moviechartDAO.movieChartTicketingList();

		ResponseData data = new ResponseData();

		data.setData(moviechartlist);
		
		return data;
	}

}
