package review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseData;

public class ReviewWriteService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		ResponseData data = null;

		try {
			int userIdx = Integer.parseInt(request.getParameter("userIdx"));
			int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
			int bookingIdx = Integer.parseInt(request.getParameter("bookingIdx"));
			String movieTitle = request.getParameter("movieTitle");
			int reviewRating = Integer.parseInt(request.getParameter("Rating"));
			String reviewText = request.getParameter("Text");
			
			if (movieTitle == null || reviewText == null) {
	            return new ResponseData(400, "필수 파라미터 누락");
	        }
			
			ReviewWriteVO reviewVO = new ReviewWriteVO();
			reviewVO.setUserIdx(userIdx);
			reviewVO.setMovieIdx(movieIdx);
			reviewVO.setBookingIdx(bookingIdx);
			reviewVO.setMovieName(movieTitle);
			reviewVO.setReviewRating(reviewRating);
			reviewVO.setReviewText(reviewText);

			ReviewWriteDAO reviewDAO = new ReviewWriteDAO();
			if (reviewDAO.insertReview(reviewVO)) {
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