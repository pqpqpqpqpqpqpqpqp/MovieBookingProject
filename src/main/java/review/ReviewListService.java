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
				String userIdxstr = request.getParameter("userIdx");
				if (userIdxstr == null) {
                    return new ResponseData(400, "userIdx 파라미터가 필요합니다.");
                }
				int userIdx = Integer.parseInt(userIdxstr);
				listDAO = reviewDAO.myReviewList(userIdx);
				data = new ResponseData();

			} else if (command.equals("/movieReviewList.re")) {
				String movieIdxstr = request.getParameter("movieIdx");
				if (movieIdxstr == null) {
                    return new ResponseData(400, "userIdx 파라미터가 필요합니다.");
                }
				int movieIdx = Integer.parseInt(movieIdxstr);
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