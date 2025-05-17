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

		// 예매건수순 차트리스트
		List<MovieChartVO> moviechartlist = moviechartDAO.movieChartTicketingList();

		// 평점순 차트리스트
		List<MovieChartVO> moviescorelist = moviechartDAO.movieChartScoreList();
		
		
		ResponseData data = new ResponseData();

		// 예매건수순 차트 설정
		data.setData(moviechartlist);
		
		// 평점순 차트 설정
		data.setData(moviescorelist);
		
		return data;
	}

}
