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
   
    public ResponseData deleteReview(HttpServletRequest request, HttpServletResponse response) {
        try {
            int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
            int userIdx = Integer.parseInt(request.getParameter("userIdx"));

            ReviewListDAO dao = new ReviewListDAO();
            int result = dao.deleteReview(reviewIdx, userIdx);

            if (result > 0) {
                return new ResponseData(200, "리뷰 삭제 성공");
            } else {
                return new ResponseData(400, "리뷰 삭제 실패: 삭제 대상이 없거나 권한이 없습니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseData(500, "리뷰 삭제 중 오류 발생: " + e.getMessage());
        }
    }
    public ResponseData editReview(HttpServletRequest request, HttpServletResponse response) {
        try {
            int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
            int score = Integer.parseInt(request.getParameter("score"));
            String content = request.getParameter("content");

            ReviewListDAO dao = new ReviewListDAO();
            boolean result = dao.editReview(reviewIdx, score, content);

            if (result) {
                return new ResponseData(200, "리뷰 수정 성공");
            } else {
                return new ResponseData(500, "리뷰 수정 실패");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseData(400, "잘못된 요청: " + e.getMessage());
        }
    }

}
   
    
    

