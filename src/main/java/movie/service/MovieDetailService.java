package movie.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieUserDAO;
import movie.vo.MovieDeatailRes;
import movie.vo.MovieUserListRes;

import util.ResponseData;

public class MovieDetailService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		
		
		// chartOption 값
		String movieIdx = request.getParameter("movieIdx");
		MovieUserDAO movieUserDAO = new MovieUserDAO();
		
		MovieDeatailRes detailRes = null;
		ResponseData data = new ResponseData();
		

		try {
			
			detailRes = movieUserDAO.movieDetail(Integer.parseInt(movieIdx));
			if(detailRes == null) {
				data.setCode(500);
			}
			
			data.setData(detailRes);
			
			
		} catch (Exception e) {
			data.setCode(500);
			e.printStackTrace();
		} finally {
			movieUserDAO.conClose();

		}



		return data;
	}

}
