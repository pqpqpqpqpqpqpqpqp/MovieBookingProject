package review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseData;

public class ReviewWriteService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		ResponseData data = null;

		try {
			ReviewWriteDAO reviewDAO = new ReviewWriteDAO();

			int userIdx = Integer.parseInt(request.getParameter("userIdx"));
			int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
			
			int check = reviewDAO.checkReviewed(userIdx, movieIdx);
			if (check > 0) {
				return new ResponseData(409, "리뷰를 이미 작성하셨습니다");
			} else if (check == -1) {
				return new ResponseData(500, "리뷰 확인 중 오류가 발생했습니다");
			}

			String reviewScore = request.getParameter("score");
			String reviewText = request.getParameter("content");

			if (reviewText == null) {
				return new ResponseData(400, "필수 파라미터 누락");
			}

			ReviewWriteDAO writeDAO = new ReviewWriteDAO();
			ReviewWriteVO reviewVO = new ReviewWriteVO();
			reviewVO.setUserIdx(userIdx);
			reviewVO.setMovieIdx(movieIdx);
			reviewVO.setReviewScore(reviewScore);
			reviewVO.setReviewContent(reviewText);
			boolean result = writeDAO.insertReview(reviewVO);
			if (result) {
				data = new ResponseData(200, "리뷰 등록 완료");
			} else {
				data = new ResponseData(500, "리뷰 등록 실패");
			}
		} catch (NumberFormatException e) {
			data = new ResponseData(400, "숫자 형식 파라미터 오류: " + e.getMessage());
		} catch (Exception e) {
			data = new ResponseData(500, "서버 오류: " + e.getMessage());
		}

		return data;
	}
}