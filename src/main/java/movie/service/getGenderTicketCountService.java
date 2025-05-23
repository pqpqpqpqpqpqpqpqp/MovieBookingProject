package movie.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import movie.dao.MovieDetailDAO;
import movie.vo.MovieDetailGenderVO;
import util.ResponseData;

public class getGenderTicketCountService {

	public ResponseData execute(HttpServletRequest request, HttpServletResponse response) {
		int movieIdx = Integer.parseInt(request.getParameter("movieIdx"));

		MovieDetailDAO dao = new MovieDetailDAO();

		MovieDetailGenderVO genderVO = null;
		ResponseData data = null;

		try {
			genderVO = dao.getGenderTicketCount(movieIdx);

			data = new ResponseData(genderVO);

		} catch (Exception e) {
			data = new ResponseData(500, "error");
			e.printStackTrace();
		} finally {
			dao.conClose();

		}


		return data;
	}
}
