package review;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.ResponseData;

public class ReviewListService {
	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		ResponseData data = new ResponseData();
		List<ReviewListVO> listDAO = new ArrayList<>();

		String command = request.getServletPath();
		ReviewListDAO reviewDAO = new ReviewListDAO();
		try {
			if (command.equals("/myReviewList.re")) {
				int userIdx = Integer.parseInt(request.getParameter("userIdx"));
				listDAO = reviewDAO.myReviewList(userIdx);
				data = new ResponseData();
			} else if (command.equals("/movieReviewList.re")) {
				int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));
				listDAO = reviewDAO.movieReviewList(movieIdx);
				data = new ResponseData();
			}
			data.setData(listDAO);
		} catch (NumberFormatException e) {
			return new ResponseData(400, "파라미터가 올바른 숫자가 아닙니다.");
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseData(500, "서버 오류가 발생했습니다.");
		}

		return data;
	}
}