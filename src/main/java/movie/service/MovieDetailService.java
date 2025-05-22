package movie.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieUserDAO;
import movie.vo.MovieDetailRes;


import util.ResponseData;

public class MovieDetailService {

	/**
	 * @param request: 요청된 movieIdx 파라미터 값을 가져오기 위함
	 * @param response
	 * @return : 서버 상태를 알려줌
	 */
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		
		String movieIdx = request.getParameter("movieIdx");
		MovieUserDAO movieUserDAO = new MovieUserDAO();
		
		MovieDetailRes detailRes = null;
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
