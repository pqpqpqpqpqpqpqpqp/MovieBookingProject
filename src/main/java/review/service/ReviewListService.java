package review.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import review.dao.ReviewListDAO;
import review.vo.ReviewListVO;
import util.ResponseData;

public class ReviewListService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		ResponseData data = null;
		List<ReviewListVO> listDAO = new ArrayList<>();

		String command = request.getServletPath();
		ReviewListDAO reviewDAO = new ReviewListDAO();
		try {
			if (command.equals("/myReviewList.re")) {
				int userIdx = Integer.parseInt(request.getParameter("userIdx"));
				listDAO = reviewDAO.myReviewList(userIdx);
				data = new ResponseData(200, "리뷰 조회 성공");
			} else if (command.equals("/movieReviewList.re")) {
				int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
				listDAO = reviewDAO.movieReviewList(movieIdx);
				data = new ResponseData(200, "리뷰 조회 성공");
			}
			data.setData(listDAO);
		} catch (NumberFormatException e) {
			// parseInt서 에러 발생시 처리
			return new ResponseData(400, "숫자 형식 파라미터 오류: " + e.getMessage());
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseData(500, "서버 오류: " + e.getMessage());
		}

		return data;
	}
}