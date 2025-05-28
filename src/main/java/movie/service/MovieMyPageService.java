package movie.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import movie.dao.MovieMypageDAO;
import movie.vo.MovieWatchedVO;
import util.ResponseData;

public class MovieMyPageService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		ResponseData data = null;
		List<MovieWatchedVO> listDAO = new ArrayList<>();
	
		MovieMypageDAO movieMyPageDAO = new MovieMypageDAO();
		try {	
			int userIdx = Integer.parseInt(request.getParameter("userIdx"));
			listDAO = movieMyPageDAO.movieMypageList(userIdx);
			data = new ResponseData(200, "내가 본 영화 조회 성공");
			data.setData(listDAO);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return new ResponseData(400, "숫자 형식 파라미터 오류: " + e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseData(500, "서버 오류: " + e.getMessage());
		}
	
		return data;
	}
}