package model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.vo.ReviewVO;
import util.ResponseData;

public class ReviewWriteService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		int userIdx = Integer.parseInt(request.getParameter("userIdx"));
		int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
		int bookingIdx = Integer.parseInt(request.getParameter("bookingIdx"));
		String movieTitle = request.getParameter("movieTitle");
		String reviewRating  = request.getParameter("Rating");
		String reviewText  = request.getParameter("Text");
		
		ReviewVO review = new ReviewVO();
		review.setUserIdx(userIdx);
		review.setMovieIdx(movieIdx);
		review.setBookingIdx(bookingIdx);
		review.setMovieName(movieTitle);
		review.setReviewRating(reviewRating);
		review.setReviewText(reviewText);
		
		
		
		return null;
	}
}