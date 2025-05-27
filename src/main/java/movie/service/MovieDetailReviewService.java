package movie.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieDetailReviewDAO;
import movie.vo.MovieDetailReviewVO;


import util.ResponseData;

public class MovieDetailReviewService {

	/**
	 * @param request: 요청된 movieIdx 파라미터 값을 가져오기 위함
	 * @param response
	 * @return : 서버 상태를 알려줌
	 */
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {

		
		String userIdx = request.getParameter("user_idx");
		MovieDetailReviewDAO reviewDAO = new MovieDetailReviewDAO();
		
		MovieDetailReviewVO reviewVO = null;
		ResponseData data = new ResponseData();
		

		try {
			
			reviewVO = reviewDAO.getReviewModal(Integer.parseInt(userIdx));
			if(reviewVO == null) {
				data.setCode(500);
			}
			
			data.setData(reviewVO);
			
			
		} catch (Exception e) {
			data.setCode(500);
			e.printStackTrace();
		} finally {
			reviewDAO.conClose();

		}



		return data;
	}

}
