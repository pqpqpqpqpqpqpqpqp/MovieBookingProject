package review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseData;

public class ReviewListService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		ResponseData data = null;
		List<ReviewListVO> listDAO = new ArrayList<>();
		
		String command = request.getServletPath();
		ReviewListDAO reviewDAO = new ReviewListDAO();
		if (command.equals("/myReviewList.re")) {
			listDAO = reviewDAO.myReviewList(0);
			data = new ResponseData();
		} else if (command.equals("/movieReviewList.re")) {
			listDAO = reviewDAO.movieReviewList(0);
			data = new ResponseData();
		}
		data.setData(listDAO);
		
		return data;
	}
}